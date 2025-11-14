# 修士論文 LaTeX テンプレート (Dev Container + xelatex)

これは、`xelatex` と `VS Code Dev Containers` を使用して修士論文を執筆するための LaTeX テンプレートです。

このリポジトリをテンプレートとして使用することで、ローカル PC の環境を汚すことなく、誰でも数分で同一の執筆環境を構築できます。

---

## 🚀 特徴

- **環境構築が不要:** Docker と VS Code さえあれば、TeX Live やフォントのインストールは一切不要です。
- **VS Code に完全統合:** Dev Container 機能により、VS Code 内ですべての作業（編集、コンパイル、Git 管理）が完結します。
- **`xelatex` を使用:** `Noto`フォントや`TeX Gyre`フォントを使用し、和文・欧文ともに美しい組版が可能です。
- **`latexmk` 対応:** `.latexmkrc` により、`latexmk` コマンドひとつで `xelatex` のコンパイルと参考文献の処理が自動で行われます。
- **ファイル分割:** `subfiles` パッケージを使用し、章ごとにファイルを分割して管理できます。

---

## 🔧 必要な環境

- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- VS Code 拡張機能: [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

---

## 💡 使い方 (自分の論文を書き始める)

### 1. テンプレートからリポジトリを作成

1.  この GitHub リポジトリのページで、緑色の **[Use this template]** ボタンをクリックします。
2.  自分の新しいリポジトリ名（例: `my-master-thesis`）を入力して、リポジトリを作成します。

### 2. ローカルにクローン

作成した**新しいリポジトリ**をローカル PC に `git clone` します。

```bash
git clone [https://github.com/YOUR_USERNAME/my-master-thesis.git](https://github.com/YOUR_USERNAME/my-master-thesis.git)
cd my-master-thesis
```

### 3\. Dev Container で開く

1.  クローンしたフォルダを VS Code で開きます。
2.  VS Code が `.devcontainer` フォルダを検知し、右下に「**コンテナーで再度開きますか？ (Reopen in Container)**」という通知が表示されます。
3.  そのボタンをクリックします。 \* （初回は Docker イメージの構築と、\`postCreateCommand\`によるパッケージインストールが実行されるため、数分かかります）

### 4\. 執筆とコンパイル

1.  コンテナが起動したら、VS Code のターミナルを開きます。
2.  以下のコマンドを実行するだけで、`Thesis.tex` がコンパイルされ、`Thesis.pdf` が生成されます。
    ```bash
    latexmk Thesis.tex
    ```
3.  `chapter/1_intro.tex` などを編集しては保存し、`latexmk` を実行するサイクルで執筆を進めます。

#### 🧹 古いファイルのクリーンアップ

コンパイル時に生成された中間ファイル（`.aux`, `.log`など）を削除したい場合は、以下のコマンドを実行します。

```bash
latexmk -C
```

---

## 📂 ファイル構成

```
.
├── .devcontainer/    # Dev Containerの環境定義
│   ├── devcontainer.json
│   └── docker-compose.yml
├── .git/
├── .gitignore        # Gitの無視リスト (pdfやlogは除外)
├── .latexmkrc        # latexmkの設定 (xelatexを使用)
├── Thesis.tex        # 論文のメインファイル (ここで章を読み込む)
├── MyRef.bib         # 参考文献ファイル
├── README.md         # (このファイル)
└── chapter/          # 各章のサブファイル
    ├── 1_intro.tex
    ├── 2_methods.tex
    ├── 3_experiment.tex
    └── 4_conclusion.tex
```

---

## 🛠️ カスタマイズ

### フォントの変更

フォントの指定は `Thesis.tex` のプリアンブル（`\documentclass` の直後あたり）にあります。
`devcontainer.json` の `postCreateCommand` でインストールするフォントを変更し、`Thesis.tex` のフォント名を書き換えることでカスタマイズできます。

```latex
\usepackage{fontspec}
\setCJKmainfont{Noto Serif CJK JP}  % 日本語 明朝体
\setmainfont{TeX Gyre Schola}      % 欧文 Serif体
\setsansfont{Noto Sans CJK JP}      % 欧文 Sans-serif体
% \setCJKsansfont{...}             % (必要なら日本語ゴシック体も指定)
```

### TeX パッケージの追加

1.  `.devcontainer/devcontainer.json` の `postCreateCommand` 内にある `tlmgr install ...` の行に、追加したいパッケージ名（または `collection-`）を追加します。
2.  `F1`キー → 「**Rebuild Container**」を実行して、コンテナを再構築します。

<!-- end list -->
