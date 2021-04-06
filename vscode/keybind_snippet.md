VSCodeに関するスニペット設定

# htmlのスニペット

## 改行スニペット
htmlを記載する際に「Shift + Enter」で改行タグを入力可能にする。<br />

HTMLのスニペットファイル「html.json」へ以下の記載を追加する。

````json
  "new_line": {
    "prefix": "bbr",
    "body": "<br />",
    "description": "htmlの改行タグを入力"
  }
````

キーボードキーバインド設定ファイル「keybindings.json」に以下の記載を追加する。
````json
{
    "key": "shift+enter",
    "command": "editor.action.insertSnippet",
    "args": {
        "langId": "html",
        "name": "new_line"
    },
    "when": "editorTextFocus && editorLangId == html"
}
````


# Grep用キーバインド
 ````json
{
    "key": "ctrl+k ctrl+g",
    "command": "search.action.openNewEditor"
}
 ````

# 表示中のエディタ一覧

````json
{
    "key": "ctrl+e",
    "command": "workbench.action.showAllEditors"
},
{
    "key": "ctrl+e",
    "command": "-workbench.action.quickOpen"
}
````

# ファイル内で定義しているシンボル一覧

````json
{
    "key": "ctrl+o",
    "command": "workbench.action.gotoSymbol"
},
{
    "key": "ctrl+o",
    "command": "-workbench.action.files.openFile"
},
{
    "key": "ctrl+o",
    "command": "-workbench.action.files.openLocalFile",
    "when": "remoteFileDialogVisible"
}
````



