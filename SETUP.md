# Development Environment Setup Guide

This guide will help you set up the necessary tools and environment for the Keio Quantitative Macroeconomics course. Follow the instructions specific to your operating system.

## Required Software

For both Windows and macOS:
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
   - Set your name (use the same format on both platforms):
     ```
     git config --global user.name "Your Name"
     ```
   - Set your email (use the same email as your GitHub account):
     ```
     git config --global user.email "your.email@example.com"
     ```

## Create Your Own Project Repository

The easiest way to create and manage your GitHub repositories is using VS Code:

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
   - If you're not on the welcome page:
     - On Windows: Press Ctrl+Shift+P to open the command palette
     - On macOS: Press Command+Shift+P to open the command palette
     - Type "Git: Clone" and select it
   - Paste the URL of your GitHub repository (e.g., https://github.com/your-username/my-macro-project.git)
   - Select the `keio-macro` folder as the destination
   - When prompted, sign in to your GitHub account (this will open in your browser)
   - VS Code will clone the repository and ask if you want to open it - click "Open"

3. **Make Changes and Push to GitHub**
   - Open the repository in VS Code if it's not already open
   - Open README.md by clicking on it in the file explorer (left side of VS Code)
   - Edit the README.md file to add information about yourself and the course
   - For example, add the following lines:
     ```
     # My Quantitative Macroeconomics Project

     This repository contains my work for the Keio Quantitative Macroeconomics course.

     ## About Me
     [Write a brief introduction about yourself]

     ## Course Topics
     - Business Cycles
     - Growth Accounting
     - Investment
     - Productivity
     ```
   - Save the file (Ctrl+S on Windows or Command+S on macOS)
   - Open the Terminal in VS Code: Terminal → New Terminal
   - Check which files have been changed:
     ```
     git status
     ```
   - Stage the README.md file:
     ```
     git add README.md
     ```
   - Commit your changes with a descriptive message:
     ```
     git commit -m "Update README with personal information"
     ```
   - Push your changes to GitHub:
     ```
     git push
     ```
   - Visit your GitHub repository page in a browser to verify your changes appear online

## Verification and Testing

After installation, test your environment:

1. **Test Python and Required Packages**
   - Open Terminal (macOS) or Git Bash (Windows)
   - Run Python:
     - On Windows: `python`
     - On macOS: `python3`
   - Try importing key packages:
     ```python
     import numpy as np
     import pandas as pd
     import matplotlib.pyplot as plt
     print("Setup successful!")
     exit()
     ```

2. **Launch Jupyter Notebook**
   - Open Terminal (macOS) or Git Bash (Windows)
   - Run:
     - On Windows: `jupyter notebook`
     - On macOS: `jupyter notebook`
   - This should open Jupyter in your default web browser
