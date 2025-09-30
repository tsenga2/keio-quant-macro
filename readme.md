# Keio Quantitative Macroeconomics

## Autumn 2025 - Deep Learning Edition

Welcome to the GitHub repository for Keio Quantitative Macroeconomics - Deep Learning Edition. This course introduces neural networks as a powerful computational tool for solving differential equations—a fundamental challenge in modern macroeconomics.

## Course Overview

This 4-week module focuses on **Neural Networks for Differential Equations** with applications to computational methods in macroeconomics. Students will learn to solve complex economic models using physics-informed neural networks, preparing them for advanced topics like optimal growth, investment with frictions, and sovereign default models.

**Course Duration**: 4 weeks  
**Focus**: Neural networks for solving differential equations in economics  
**Prerequisites**: Some students will have completed the Spring 2025 course (traditional quantitative macro), while others will be new to the program.

## Weekly Schedule

### Week 1: From Brains to Perceptrons - The Origins of AI
- Course overview and motivation for differential equations in economics
- Two paths to AI: Logic-based vs. Brain-inspired approaches
- Biological inspiration: neurons and neural networks
- Early mathematical models: McCulloch-Pitts, Rosenblatt's Perceptron
- The XOR problem and the first AI winter
- Japanese contributions: Amari Shun-ichi's pioneering work
- **Materials**: Lecture notes (Macro2b_notes.pdf)

### Week 2: The Learning Engine
- The learning framework: loss functions, gradients, parameter updates
- Mean squared error (regression) and cross-entropy (classification)
- Gradient descent: the optimization workhorse
- Variants: batch, stochastic, mini-batch gradient descent
- Backpropagation: computing gradients efficiently using chain rule
- Historical note: Amari's contributions to learning theory
- **Materials**: Detailed backpropagation notes (BackPropagation.pdf)

### Week 3: Building an ODE Solver
- Motivation: why neural networks for differential equations?
- Traditional methods vs. neural networks comparison
- The model problem: solving first-order ODEs
- Key innovation: the trial solution method
- Physics-informed loss function
- Network architecture and implementation in MATLAB
- Results analysis and common pitfalls
- **Materials**: Beamer slides (to be added)

### Week 4: Extension to PDEs
- From ODEs to partial differential equations
- Network architecture for PDEs
- Application: Black-Scholes equation for option pricing
- Time transformation for terminal conditions
- High-dimensional PDEs and the curse of dimensionality
- Economic applications: heterogeneous agents, multi-asset portfolios
- Summary and future directions for advanced macroeconomics
- **Materials**: Beamer slides (to be added)

## Course Materials

Course materials are organized in the `A-DeepLearning/` directory:

- **Macro2b_notes.pdf**: Complete 4-week lecture notes covering neural networks for differential equations
- **BackPropagation.pdf**: Detailed mathematical treatment of backpropagation algorithm (Week 2)
- **Beamer slides**: Will be added for Weeks 3-4 (ODE/PDE solving and applications)
- **MATLAB code**: Implementation examples for ODE and PDE solving
- **Python notebooks**: Data analysis and visualization examples

All materials will be updated weekly throughout the course.

## UnixとGit チートシート (初心者向け)

### Unix コマンド

#### 基本操作

* `pwd`: 現在の場所を表示。
* `cd "ディレクトリ名"`: 指定したディレクトリに移動。
    * 例: `cd documents`
* `cd ..`: 一つ上の階層へ移動。
* `ls`: ファイルやディレクトリを一覧表示。
    * `ls -l`: 詳細表示。
* `cp "ファイル名" "コピー先"`: ファイルをコピー。
    * 例: `cp my_file.txt /home/user/backup/`
* `mkdir "ディレクトリ名"`: 新しいディレクトリを作成。
    * 例: `mkdir new_folder`
* `rm "ファイル名"`: ファイルを削除。**注意！**
    * 例: `rm unwanted_file.txt`
* `rm -r "ディレクトリ名"`: ディレクトリを削除。**注意！**
    * 例: `rm -r old_folder`
* `mv "古い名前" "新しい名前"`: ファイル名を変更。
    * 例: `mv old_file.txt new_file.txt`
* `mv "ファイル名" "移動先"`: ファイルを移動
    * 例: `mv my_file.txt /home/user/documents/`
* `cat "ファイル名"`: ファイルの内容を表示。
* `less "ファイル名"`: ファイルの内容をページごとに表示。
* `head "ファイル名"`: ファイルの最初の部分を表示。
* `tail "ファイル名"`: ファイルの最後の部分を表示。

#### ファイル処理

* `cut -d"区切り文字" -fフィールド番号 "ファイル名"`: ファイルから指定したフィールドを抽出。
    * 例: `cut -d"," -f1,3 data.csv`  (カンマ区切りで 1 番目と 3 番目のフィールドを抽出)

#### 検索

* `grep "パターン" "ファイル名"`: ファイル内で検索。
    * 例: `grep "エラー" error.log`
* `find "パス" -name "ファイル名"`: ファイルを名前で検索。
    * 例: `find . -name "my_file.txt"`

### Git コマンド

#### 基本操作

* `git clone "リポジトリ URL"`: リポジトリをコピー。
    * 例: `git clone https://github.com/user/my_repo.git`
* `git init`: 新しいリポジトリを作成。

#### 変更の扱い

* `git status`: 変更状況を確認。
* `git add "ファイル名"`: ファイルをステージング。
    * `git add .`: すべての変更をステージング。
* `git commit -m "コミットメッセージ"`: 変更を記録。
    * 例: `git commit -m "バグ修正"`
* `git diff "ファイル名"`: ファイルの変更箇所を表示。
    * `git diff`: まだステージングしていない変更を表示
    * `git diff --staged`: ステージング済みの変更を表示

#### リモートリポジトリ

* `git remote add origin "リポジトリ URL"`: リモートリポジトリを追加。
* `git push`: リモートリポジトリにアップロード。
    * `git push origin "ブランチ名"`: 特定のブランチをプッシュ。
* `git pull`: リモートリポジトリからダウンロード。
    * `git pull origin "ブランチ名"`: 特定のブランチをプル。
* `git fetch`: リモートリポジトリからダウンロード (マージはしない)。

#### 変更の取り消し

* `git reset HEAD "ファイル名"`: ステージングを取り消し。
* `git checkout -- "ファイル名"`: ファイルの変更を破棄。
* `git reset --soft "コミットハッシュ"`: コミットを巻き戻す (変更は保持)。
* `git reset --hard "コミットハッシュ"`: コミットを巻き戻す (変更は破棄)。 **注意！**
* `git revert "コミットハッシュ"`: コミットを取り消す新しいコミットを作成。

#### 情報

* `git log`: コミット履歴を表示。
    * `git log --oneline`: コミット履歴を一行で表示。

#### 設定

* `git config --global user.name "あなたの名前"`: Git に名前を設定。
* `git config --global user.email "メールアドレス"`: Git にメールアドレスを設定。

プレースホルダーを実際の値に置き換えてください。

## Prerequisites

- Basic knowledge of macroeconomics
- Familiarity with calculus and statistics
- No prior programming experience is required, but it would be beneficial

## Software Requirements

Students will need to install or have access to:
- **MATLAB** (basic installation - no special toolboxes required)
- **Git version control**
- **LaTeX** (for document preparation)
- A text editor of your choice (VSCode recommended)
- **Python** (optional, for data analysis and visualization)

## Environment Setup

This course requires setting up specific tools on your computer. For detailed instructions for both Windows and macOS, please see the [Setup Guide](SETUP.md).

## Archived Materials

Previous offerings of this course are available in the following branches:
- [Spring 2023](https://github.com/tsenga2/keio-quant-macro/tree/spring2023) - Traditional Quantitative Macroeconomics
- [Spring 2024](https://github.com/tsenga2/keio-quant-macro/tree/spring2024) - Traditional Quantitative Macroeconomics  
- [Spring 2025](https://github.com/tsenga2/keio-quant-macro/tree/spring2025) - Traditional Quantitative Macroeconomics

**Note for Spring 2025 students continuing to Autumn 2025**: You can reference your previous work in the Spring 2025 branch while learning deep learning approaches in this current branch.

## Contact

For questions related to the course, please use the official course platform for communication.