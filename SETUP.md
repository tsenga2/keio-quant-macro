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

1. **Install Git with Git Bash**
   - Download and install Git from [Git-SCM](https://git-scm.com/download/win)
   - During installation:
     - Accept default options
     - Make sure "Git Bash Here" is enabled
     - Choose "Use Git and optional Unix tools from the Command Prompt"
   - This installs both Git and Git Bash (a Unix-like shell)

2. **Create a Course Directory (Two options)**

   **Option A: Using Windows Explorer (Simple)**
   - Open File Explorer
   - Navigate to your user directory (`C:\Users\your-username`)
   - Create a new folder named `keio-macro`
   - Right-click this folder and select "Pin to Quick access" in File Explorer
   - This will be your main working directory for all course materials

   **Option B: Using Git Bash (Learning Command Line)**
   - Open Git Bash from the Start menu
   - Check your current location: `pwd` (print working directory)
   - Navigate to your home directory: `cd ~` (this is typically C:\Users\your-username)
   - Create a course directory: `mkdir keio-macro`
   - Navigate into it: `cd keio-macro`
   - Verify you're in the right place: `pwd`
   - You can list the contents of the directory with: `ls`

3. **Install Python**
   - Download and install from [Python.org](https://www.python.org/downloads/windows/)
   - During installation, check "Add Python to PATH"
   - Verify installation by opening Git Bash and typing: `python --version`

3. **Install VSCode**
   - Download and install from [Visual Studio Code](https://code.visualstudio.com/)
   - Install the Python extension from the Extensions marketplace

4. **Setup Jupyter and Required Packages**
   - Open Git Bash and run:
     ```
     pip install jupyter numpy pandas matplotlib scipy statsmodels plotly
     ```

5. **Clone the Course Repository (Two options)**

   **Option A: Using Windows Explorer and Git Bash**
   - Open File Explorer and navigate to your `keio-macro` folder
   - Right-click in the folder and select "Git Bash Here"
   - Clone the course repository: 
     ```
     git clone https://github.com/tsenga2/keio-quant-macro.git
     ```
   - Navigate into the repository: `cd keio-quant-macro`

   **Option B: Using Git Bash Only**
   - Navigate to your course directory (if you're not already there):
     ```
     cd ~/keio-macro
     ```
   - Clone the course repository: 
     ```
     git clone https://github.com/tsenga2/keio-quant-macro.git
     ```
   - Navigate into the repository:
     ```
     cd keio-quant-macro
     ```
   - List the contents to verify it was cloned successfully:
     ```
     ls
     ```

6. **Create Your Own Project Repository**
   - Navigate back to your course directory:
     ```
     cd ~/keio-macro
     ```
   - Create a folder for your personal work:
     ```
     mkdir my-macro-project
     cd my-macro-project
     ```
   - Initialize it as a Git repository:
     ```
     git init
     ```
   - Create a README file:
     ```
     echo "# My Quantitative Macroeconomics Project" > README.md
     ```
   - Check the status of your repository:
     ```
     git status
     ```
   - Add and commit your README:
     ```
     git add README.md
     git commit -m "Initial commit"
     ```
   - To push to your own GitHub, create a repository on GitHub.com first, then:
     ```
     git remote add origin https://github.com/your-username/my-macro-project.git
     git push -u origin main
     ```

### macOS

1. **Create a Course Directory**
   - Open Terminal
   - Navigate to your home directory: `cd ~`
   - Create a dedicated folder: `mkdir keio-macro`
   - Navigate to it: `cd keio-macro`

2. **Install Homebrew (Package Manager)**
   - In Terminal: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
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
   - In Terminal, navigate to your course directory: `cd ~/keio-macro`
   - Clone the repository: `git clone https://github.com/tsenga2/keio-quant-macro.git`
   - Navigate into the repository: `cd keio-quant-macro`

7. **Create Your Own Project Repository**
   - Inside your `keio-macro` folder, create a folder for your personal work:
     ```
     mkdir my-macro-project
     cd my-macro-project
     ```
   - Initialize it as a Git repository:
     ```
     git init
     ```
   - Create a README file:
     ```
     echo "# My Quantitative Macroeconomics Project" > README.md
     git add README.md
     git commit -m "Initial commit"
     ```
   - To push to your own GitHub, create a repository on GitHub.com first, then:
     ```
     git remote add origin https://github.com/your-username/my-macro-project.git
     git push -u origin main
     ```

## Verification and Testing

After installation, test your environment:

1. **Test Python and Required Packages**
   - Open Terminal (macOS) or Git Bash (Windows)
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
   - In Terminal/Git Bash: `jupyter notebook`
   - This should open Jupyter in your default web browser

## Alternative: Google Colab

If you encounter persistent issues with local setup:

1. Go to [Google Colab](https://colab.research.google.com/)
2. Sign in with your Google account
3. File → Open notebook → GitHub → paste the course repository URL

## Troubleshooting Common Issues

### Windows
- **Python not recognized**: Ensure Python is added to PATH during installation
- **Git Bash not found**: Reinstall Git and ensure "Git Bash" is selected during installation
- **Permission errors**: Right-click on Git Bash and select "Run as administrator"
- **Module import errors**: Try `pip install --upgrade [package-name]`
- **Command not found**: Verify you typed the command correctly (Unix commands are case-sensitive)
- **Path issues**: If you encounter problems with spaces in paths, use quotes: `cd "My Documents"`
- **Lost? Check where you are**: Use `pwd` to see your current directory and `ls` to see its contents

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