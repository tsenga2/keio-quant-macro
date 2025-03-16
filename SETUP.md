# Development Environment Setup Guide

This guide will help you set up the necessary tools and environment for the Keio Quantitative Macroeconomics course. Follow the instructions specific to your operating system.

## Required Software

- **Python** (3.8 or newer)
- **Git** (version control)
- **Jupyter Notebooks**
- **Text editor** (VSCode recommended)
- **Command-line tools**

## Setup Instructions

### Windows

1. **Install Python**
   - Download and install from [Python.org](https://www.python.org/downloads/windows/)
   - During installation, check "Add Python to PATH"
   - Verify installation by opening Command Prompt and typing: `python --version`

2. **Install Git**
   - Download and install from [Git-SCM](https://git-scm.com/download/win)
   - Accept default options during installation
   - Verify installation: `git --version`

3. **Install VSCode**
   - Download and install from [Visual Studio Code](https://code.visualstudio.com/)
   - Install the Python extension from the Extensions marketplace

4. **Setup Jupyter and Required Packages**
   - Open Command Prompt and run:
     ```
     pip install jupyter numpy pandas matplotlib scipy statsmodels plotly
     ```

5. **Clone the Course Repository**
   - Open Command Prompt
   - Navigate to where you want to store course materials: `cd Documents`
   - Clone the repository: `git clone https://github.com/tsenga2/keio-quant-macro.git`
   - Navigate into the repository: `cd keio-quant-macro`

### macOS

1. **Install Homebrew (Package Manager)**
   - Open Terminal
   - Run: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
   - Follow terminal prompts to complete installation

2. **Install Python**
   - In Terminal: `brew install python`
   - Verify installation: `python3 --version`

3. **Install Git**
   - In Terminal: `brew install git`
   - Verify installation: `git --version`

4. **Install VSCode**
   - Download and install from [Visual Studio Code](https://code.visualstudio.com/)
   - Install the Python extension from the Extensions marketplace

5. **Setup Jupyter and Required Packages**
   - In Terminal:
     ```
     pip3 install jupyter numpy pandas matplotlib scipy statsmodels plotly
     ```

6. **Clone the Course Repository**
   - Open Terminal
   - Navigate to where you want to store course materials: `cd Documents`
   - Clone the repository: `git clone https://github.com/tsenga2/keio-quant-macro.git`
   - Navigate into the repository: `cd keio-quant-macro`

## Verification and Testing

After installation, test your environment:

1. **Test Python and Required Packages**
   - Open Terminal/Command Prompt
   - Run Python: `python` (Windows) or `python3` (macOS)
   - Try importing key packages:
     ```python
     import numpy as np
     import pandas as pd
     import matplotlib.pyplot as plt
     print("Setup successful!")
     exit()
     ```

2. **Launch Jupyter Notebook**
   - In Terminal/Command Prompt: `jupyter notebook`
   - This should open Jupyter in your default web browser

## Alternative: Google Colab

If you encounter persistent issues with local setup:

1. Go to [Google Colab](https://colab.research.google.com/)
2. Sign in with your Google account
3. File → Open notebook → GitHub → paste the course repository URL

## Troubleshooting Common Issues

### Windows
- **Python not recognized**: Ensure Python is added to PATH during installation
- **Permission errors**: Run Command Prompt as Administrator
- **Module import errors**: Try `pip install --upgrade [package-name]`

### macOS
- **Command not found**: Ensure your PATH includes Python and Homebrew
- **Permission errors**: Use `sudo pip3 install [package-name]`
- **Xcode error**: Run `xcode-select --install` if prompted

## Getting Help

If you encounter issues with setup:
1. Check the troubleshooting section
2. Search for the specific error message online
3. Ask for help during the Week 2 session
4. Post your issue (with error details) on the course platform

Remember: Setting up your environment correctly is crucial for the course, but it often takes time and troubleshooting!