import pandas as pd
import pandas_datareader.data as web
import matplotlib.pyplot as plt
import statsmodels.api as sm
import numpy as np
from datetime import datetime
from statsmodels.tsa.stattools import acf, ccf
from matplotlib.gridspec import GridSpec

# Set the style for all plots
plt.style.use('ggplot')
plt.rcParams['axes.prop_cycle'] = plt.cycler(color=['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728', 
                                                    '#9467bd', '#8c564b', '#e377c2', '#7f7f7f'])

# Set the start and end dates for the data
start_date = '1980-01-01'  # Starting from 1980 for better data availability for Japan
end_date = '2022-01-01'

def get_macro_data(country_code, start_date, end_date):
    """
    Fetch macroeconomic data for a specific country from FRED
    
    Parameters:
    country_code (str): 'US' for United States, 'JP' for Japan
    
    Returns:
    dict: Dictionary containing DataFrames for GDP, consumption, and investment
    """
    data = {}
    
    # Dictionary of FRED series IDs for each country and variable
    series_ids = {
        'US': {
            'gdp': 'GDPC1',              # Real GDP (Quarterly)
            'consumption': 'PCECC96',     # Real Personal Consumption Expenditures
            'investment': 'GPDIC1',       # Real Gross Private Domestic Investment
        },
        'JP': {
            'gdp': 'JPNRGDPEXP',         # Japan Real GDP
            'consumption': 'JPNPFCEADSMEI', # Japan Private Final Consumption Expenditure
            'investment': 'JPNGFCFADSMEI', # Japan Gross Fixed Capital Formation
        }
    }
    
    # Fetch data for each variable
    for var, series_id in series_ids[country_code].items():
        try:
            data[var] = web.DataReader(series_id, 'fred', start_date, end_date)
        except Exception as e:
            print(f"Error fetching {var} data for {country_code}: {e}")
            data[var] = None
    
    return data

def process_cycle_data(data):
    """
    Process raw data: take logs and extract cyclical components
    
    Parameters:
    data (dict): Dictionary of DataFrames for each variable
    
    Returns:
    dict: Dictionary containing cyclical components for each variable
    """
    cycles = {}
    trends = {}
    
    for var, df in data.items():
        if df is not None and not df.empty:
            # Take natural log of the data
            log_data = np.log(df)
            
            # Apply HP filter to extract cyclical component (lambda=1600 for quarterly data)
            cycle, trend = sm.tsa.filters.hpfilter(log_data, lamb=1600)
            
            # Store the cycle and trend components
            cycles[var] = cycle
            trends[var] = trend
    
    return cycles, trends

def calculate_statistics(cycles):
    """
    Calculate standard moments and correlations of cyclical components
    
    Parameters:
    cycles (dict): Dictionary of cyclical components for each variable
    
    Returns:
    tuple: (std_dev, autocorr, corr_with_gdp)
    """
    # Convert all cycles to a single DataFrame
    cycle_df = pd.DataFrame({var: cycle for var, cycle in cycles.items()})
    
    # Calculate standard deviations (volatility)
    std_dev = cycle_df.std() * 100  # Multiply by 100 to express as percentage
    
    # Calculate first-order autocorrelation
    autocorr = pd.Series({var: acf(cycle_df[var].dropna(), nlags=1)[1] for var in cycle_df.columns})
    
    # Calculate correlation with GDP
    corr_with_gdp = cycle_df.corr()['gdp']
    
    return std_dev, autocorr, corr_with_gdp

def plot_trends_and_cycles(country, raw_data, cycles, trends):
    """
    Plot the original data, trend, and cycle for each variable
    
    Parameters:
    country (str): Country name for the title
    raw_data (dict): Dictionary of raw data for each variable
    cycles (dict): Dictionary of cyclical components
    trends (dict): Dictionary of trend components
    """
    variables = ['gdp', 'consumption', 'investment']
    fig = plt.figure(figsize=(16, 12))
    gs = GridSpec(3, 2, figure=fig)
    
    for i, var in enumerate(variables):
        if var in raw_data and raw_data[var] is not None:
            # Left column: Original data and trend
            ax1 = fig.add_subplot(gs[i, 0])
            log_data = np.log(raw_data[var])
            log_data.plot(ax=ax1, label=f"Log {var.capitalize()}")
            trends[var].plot(ax=ax1, label="Trend", linewidth=2, color='red')
            ax1.set_title(f"{var.capitalize()} and Trend for {country}")
            ax1.legend()
            
            # Right column: Cyclical component
            ax2 = fig.add_subplot(gs[i, 1])
            cycles[var].plot(ax=ax2, label=f"Cyclical Component", color='green')
            ax2.set_title(f"{var.capitalize()} Cycle for {country}")
            ax2.axhline(y=0, color='black', linestyle='-', alpha=0.3)
            ax2.legend()
    
    plt.tight_layout()
    plt.savefig(f"{country.lower().replace(' ', '_')}_trends_and_cycles.png", dpi=300, bbox_inches='tight')
    plt.show()

def create_statistics_table(us_stats, jp_stats):
    """
    Create a table comparing business cycle statistics between US and Japan
    
    Parameters:
    us_stats (tuple): (std_dev, autocorr, corr_with_gdp) for US
    jp_stats (tuple): (std_dev, autocorr, corr_with_gdp) for Japan
    """
    us_std, us_auto, us_corr = us_stats
    jp_std, jp_auto, jp_corr = jp_stats
    
    # Combine statistics into a multi-index DataFrame
    stats_data = {
        ('Volatility (%)', 'US'): us_std,
        ('Volatility (%)', 'Japan'): jp_std,
        ('Persistence', 'US'): us_auto,
        ('Persistence', 'Japan'): jp_auto,
        ('Corr. with GDP', 'US'): us_corr,
        ('Corr. with GDP', 'Japan'): jp_corr
    }
    
    # Create DataFrame with multi-level columns
    columns = pd.MultiIndex.from_tuples(stats_data.keys())
    stats_df = pd.DataFrame(stats_data, index=['gdp', 'consumption', 'investment'])
    
    return stats_df

def analyze_business_cycles():
    """
    Main function to analyze business cycles between US and Japan
    """
    print("Fetching US macroeconomic data...")
    us_data = get_macro_data('US', start_date, end_date)
    
    print("Fetching Japan macroeconomic data...")
    jp_data = get_macro_data('JP', start_date, end_date)
    
    print("Processing US data...")
    us_cycles, us_trends = process_cycle_data(us_data)
    
    print("Processing Japan data...")
    jp_cycles, jp_trends = process_cycle_data(jp_data)
    
    print("Calculating statistics...")
    us_stats = calculate_statistics(us_cycles)
    jp_stats = calculate_statistics(jp_cycles)
    
    print("Creating comparison table...")
    stats_table = create_statistics_table(us_stats, jp_stats)
    print("\nBusiness Cycle Statistics:\n")
    print(stats_table.round(3))
    
    print("\nPlotting trends and cycles for US...")
    plot_trends_and_cycles("United States", us_data, us_cycles, us_trends)
    
    print("Plotting trends and cycles for Japan...")
    plot_trends_and_cycles("Japan", jp_data, jp_cycles, jp_trends)
    
    # Plot all cycles together for direct comparison
    fig, axes = plt.subplots(1, 3, figsize=(18, 5))
    axes = axes.flatten()
    variables = ['gdp', 'consumption', 'investment']
    
    for i, var in enumerate(variables):
        if var in us_cycles and var in jp_cycles:
            us_cycle = us_cycles[var]
            jp_cycle = jp_cycles[var]
            us_cycle.plot(ax=axes[i], label=f"US {var.capitalize()}", linewidth=1.5)
            jp_cycle.plot(ax=axes[i], label=f"Japan {var.capitalize()}", linewidth=1.5)
            axes[i].set_title(f"{var.capitalize()} Cycle: US vs Japan")
            axes[i].axhline(y=0, color='black', linestyle='-', alpha=0.3)
            axes[i].legend()
            axes[i].grid(True, alpha=0.3)
    
    plt.tight_layout()
    plt.savefig("us_japan_cycle_comparison.png", dpi=300, bbox_inches='tight')
    plt.show()

# Execute business cycle analysis when script is run directly (not imported as module)
if __name__ == "__main__":
    analyze_business_cycles()