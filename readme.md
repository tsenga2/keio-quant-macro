# Keio Quantitative Macroeconomics

## Spring 2025

Welcome to the GitHub repository for Keio Quantitative Macroeconomics. This course explores quantitative approaches to understanding macroeconomic phenomena, with a focus on computational methods and empirical analysis.

## Course Overview

This course introduces students to quantitative methods in macroeconomics, combining theoretical foundations with practical computational skills. Students will learn to analyze economic data, build and simulate models, and evaluate macroeconomic policies.

## Weekly Schedule

### Week 1: Introduction
- Course overview and expectations
- Introduction to quantitative approaches in macroeconomics
- Overview of computational tools used in the course

### Week 2: Setting up your computing ecosystem
- Operating systems, shell commands, and version control with Git
- Text editors and development environments
- Introduction to Google Colab and Jupyter notebooks

### Week 3: Business Cycles
- Quantitative patterns in economic fluctuations
- HP Filter: Distinguishing trends from cycles
- Comparing GDP standard deviation to consumption
- Correlation between GDP and investment
- Comparative analysis of investment volatility in Japan vs. the US

### Week 4: Growth Accounting
- Quantitative decomposition of factors in economic growth
- To what extent does productivity growth contribute to economic growth?
- How much does capital accumulation contribute to economic growth?
- Is Japan's economic growth unique compared to other countries?

### Week 5: Investment (Decision Theoretic)
- How do financial constraints affect corporate investment?
- How do firms implement capital investment when facing uncertainty?

### Week 6: Productivity (Aggregation)
- Measuring macroeconomic productivity by aggregating individual firm behavior
- How do monetary policy and uncertainty affect economic productivity?

### Week 7: Midterm Project
- Application of methods and concepts covered in weeks 1-6
- Data analysis and model implementation

## Course Materials

Course materials, including lecture notes, code examples, and assignments, will be updated weekly in this repository.

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
- Python and Jupyter notebooks
- Git version control
- A text editor of your choice (VSCode recommended)

## Environment Setup

This course requires setting up specific tools on your computer. For detailed instructions for both Windows and macOS, please see the [Setup Guide](SETUP.md).

## Archived Materials

Previous offerings of this course are available in the following branches:
- [Spring 2023](https://github.com/tsenga2/keio-quant-macro/tree/spring2023)
- [Spring 2024](https://github.com/tsenga2/keio-quant-macro/tree/spring2024)

## Contact

For questions related to the course, please use the official course platform for communication.