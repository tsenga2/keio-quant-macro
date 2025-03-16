# Development Environment Setup Guide

This guide will help you set up the necessary tools and environment for the Keio Quantitative Macroeconomics course. Follow the instructions specific to your operating system.

## Required Software

- **Python** (3.8 or newer)
- **Git** (version control)
- **Jupyter Notebooks**
- **Text editor** (VSCode recommended)
- **Command-line tools**

## Setup Instructions for Windows

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

## Setup Instructions for macOS

1. **Create a Course Directory**
   - Open Terminal
   - Navigate to your home directory: `cd ~`
   - Create a dedicated folder: `mkdir keio-macro`
   - Navigate to it: `cd keio-macro`

2. **Install Homebrew (Package Manager)**
   - In Terminal: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
   - Follow terminal prompts to complete installation

3. **Install Python**
   - In Terminal: `brew install python`
   - Verify installation: `python3 --version`

4. **Install Git**
   - In Terminal: `brew install git`
   - Verify installation: `git --version`

5. **Install VSCode**
   - Download and install from [Visual Studio Code](https://code.visualstudio.com/)
   - Install the Python extension from the Extensions marketplace

6. **Setup Jupyter and Required Packages**
   - In Terminal:
     ```
     pip3 install jupyter numpy pandas matplotlib scipy statsmodels plotly
     ```

7. **Clone the Course Repository**
   - In Terminal, navigate to your course directory: `cd ~/keio-macro`
   - Clone the repository: `git clone https://github.com/tsenga2/keio-quant-macro.git`
   - Navigate into the repository: `cd keio-quant-macro`

## GitHub Account Setup

To fully participate in the course, you'll need a GitHub account to store your code and collaborate:

1. **Create a GitHub Account**
   - Go to [GitHub](https://github.com/)
   - Click "Sign up" and follow the registration process
   - Choose a username that you're comfortable using professionally
   - Verify your email address when prompted

2. **Configure Git with Your Identity**
   - Open Terminal (macOS) or Git Bash (Windows)
   - Set your name:
     ```
     git config --global user.name "Your Name"
     ```
   - Set your email (use the same email as your GitHub account):
     ```
     git config --global user.email "your.email@example.com"
     ```

## Create Your Own Project Repository

There are two easy ways to create and manage your GitHub repositories:

### Option 1: Using VS Code's Built-in Git Features (Recommended for beginners)

1. **Create a Repository on GitHub**
   - Go to [GitHub](https://github.com/) and log in
   - Click the "+" icon in the top right, then "New repository"
   - Name it (e.g., "my-macro-project")
   - Add a short description (optional)
   - Make it private if you prefer
   - Check "Add a README file" to initialize the repository
   - Click "Create repository"

2. **Clone the Repository Using VS Code**
   - Open VS Code
   - If you're on the welcome page, click on "Clone Git Repository..."
   - If you're not on the welcome page, go to View → Command Palette (or press Ctrl+Shift+P / Cmd+Shift+P)
   - Type "Git: Clone" and select it
   - Paste the URL of your GitHub repository (e.g., https://github.com/your-username/my-macro-project.git)
   - Select the `keio-macro` folder as the destination
   - When prompted, sign in to your GitHub account
   - VS Code will clone the repository and ask if you want to open it - click "Open"

3. **Make Changes and Push to GitHub**
   - Create or modify files in VS Code
   - Open the Terminal in VS Code: Terminal → New Terminal
   - Check which files have been changed:
     ```
     git status
     ```
   - Stage specific files (better practice than adding everything):
     ```
     git add README.md
     ```
   - Commit your changes with a descriptive message:
     ```
     git commit -m "Update README with project description"
     ```
   - Push your changes to GitHub:
     ```
     git push
     ```

### Option 2: Using Command Line

1. **Create a Repository on GitHub**
   - Go to [GitHub](https://github.com/) and log in
   - Click the "+" icon in the top right, then "New repository"
   - Name it (e.g., "my-macro-project")
   - Make it private if you prefer
   - Check "Add a README file" to initialize the repository
   - Click "Create repository"

2. **Clone the Repository to Your Computer**
   - On your repository page, click the green "Code" button
   - Copy the HTTPS URL (e.g., `https://github.com/your-username/my-macro-project.git`)
   - In Terminal (macOS) or Git Bash (Windows), navigate to your course folder:
     ```
     cd ~/keio-macro
     ```
   - Clone the repository:
     ```
     git clone https://github.com/your-username/my-macro-project.git
     ```

3. **Make and Push Changes**
   - Make changes to the files in your repository
   - Check which files have been changed:
     ```
     git status
     ```
   - Stage specific files:
     ```
     git add README.md
     ```
   - Commit changes:
     ```
     git commit -m "Update README with project description"
     ```
   - Push to GitHub:
     ```
     git push
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