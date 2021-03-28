bashの検索系コマンド「find」や「grep」について記載する


# find-grep 汎用構文

findとgrepに関するコマンドで最も使用するパターンを記載する

## 信用頻度の高いgrepオプション

| オプション | 効果 | 
| --- | --- | 
| E | 検索に拡張正規表現を使用する | 
| n | 文字列がヒットした行番号を表示する | 
| s | エラーメッセージを表示しない | 
| i | 大文字と小文字を区別しない | 
| I | バイナリファイルは無視する | 


## find-grepコマンド基本形

```bash
find . -type f | xargs grep -E "grep対処文字列"
find . -type f ! -wholename "*.git/*" ! -wholename "*.svn/*" | xargs grep -E "grep対処文字列"
```

## 特定の拡張子のファイルを検索する
拡張子が「.c」「.h」「.java」のファイルを検索する

```bash
find . -type f ! -wholename "*.git/*" ! -wholename "*.svn/*" | grep -E "\.(c|h|java)$"
```

## 特定の拡張子のファイル内からgrep検索

拡張子が「.c」「.h」「.java」のファイルの中から対象の文字列をgrepする

```bash
find . -type f ! -wholename "*.git/*" ! -wholename "*.svn/*" | grep -E "\.(c|h|java)$" | xargs grep -EnsiI "grep対象文字列"
```

# grep コマンド

## grep基本オプション
| 短いオプション | 意味 | 長いオプション |
| --- | --- | --- |
| -e 検索パターン | 検索パターンを指定する | --regexp=パターン |
| -G | 検索に基本正規表現を使う | --basic-regexp |
| -E | 検索に拡張正規表現を使う | --extended-regexp |
| -P | 検索にPerl正規表現を使う | --perl-regexp |
| -f ファイル | ファイルに書かれているパターンを検索する | --file=ファイル |
| -i | 大文字と小文字を区別しない | --ignore-case |
| -I | バイナリファイルは無視。 | --binary-files=without-match |
| -w | 単語全体でパターンと一致するものを検索する（「単語単位で検索する」を参照） | --word-regexp |
| -x | 行全体がパターンと一致するものを検索する | --line-regexp |

## grep 検索パターン関連のオプション

| 短いオプション | 意味 | 長いオプション | 
| --- | --- | --- |
| -v | パターンに一致しない行を表示する | --invert-match | 
| -s | エラーメッセージを表示しない | --no-messages | 
| -q | 結果を表示しない（主にシェルスクリプトなどで判定用に使う） | --quiet <br> --silent  | 
| -L | 一致するものが含まれていないファイルのファイル名のみ表示する | --files-without-match | 
| -l | 一致するものが含まれているファイルのファイル名のみ表示する | --files-with-matches | 
| -c | 一致するものが含まれている回数のみ表示 | --count | 
| -m 回数 | パターンが指定した回数に達したら処理を終了する | --max-count=回数 | 
| -o | 一致した箇所だけを表示する（通常は行単位で表示） | --only-matching | 
| -n | 行番号を併せて表示する（「行番号付きで表示する」を参照） | --line-number | 
| -b | パターンが何文字目にあるかを併せて表示する | --byte-offset | 
| -H | ファイル名を併せて表示する | --with-filename | 
| -h | ファイル名を表示しない（複数ファイル指定時） | --no-filename <br> 見つかったパターンを目立たせる<br>(WHEN部分にはalways、never、autoを指定) | --color=WHEN | 
| -B 行数 | 一致した行の前の行も表示する（「前後の行も表示する」を参照） | --before-context=行数 | 
| -A 行数 | 一致した行の後の行も表示する（「前後の行も表示する」を参照） | --after-context=行数 | 
| -C 行数,-行数 | 一致した行の前後の行も表示する | --context=行数 | 




# find コマンド
ファイル名でファイルを検索するコマンドがfindコマンドである。

## 基本構文

引数で指定した検索対処ディレクトリ内に存在する全てのファイルとディレクトリを指定する

```bash
find 検索対象ディレクトリ
```

検索対象を「ファイルのみに限定する」時や「ディレクトリのみに限定する」時は「-type」オプションを使う
```bash
find 検索対象ディレクトリ -type f    # ファイルのみ検索
find 検索対象ディレクトリ -type d    # ディレクトリのみ検索
```

# GitやSubversionのファイルを検索対象に含めない

```bash
find . -type f ! -wholename "*.git/*" ! -wholename "*.svn/*" 
```
