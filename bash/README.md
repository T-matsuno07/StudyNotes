# bash コマンド備忘録

Linuxの標準CUI環境である「bash」の各種コマンドについて記載する。

- [bash基本構文(if)](./bash_if.md)
- [bash基本構文(loop)](./bash_loop.md)
- [bash検索コマンド(find/grep)](./find_grep.md)
- [bash 自作関数(function)](./bash_function.md)


# 過去の自作物

## テキストファイル/バイナリファイル判定

```bash
# 第1引数で受け取ったパスのファイルがテキストファイルか否かを判定する
# 引　数: 判定対象ファイルへのパス
# 戻り値: 「1:テキストファイル」「0:バイナリファイル」
function judge_test_file(){
  if [ "`file $1 | grep 'text'`" ];
  then 
   return 1
  fi
  return 0
}
```

## ゼロ埋め
数字を4桁にしたい場合は以下のコマンド
```bash
printf %04d 数字
seq -f %04g 1 10   # 0001から0010の文字列を作成する
```