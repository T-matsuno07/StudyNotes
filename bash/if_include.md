対象のファイルに指定した文字列が含まれているかを判定する

```bash
grep -q "文字列"  対象ファイル

if [ $? = 0 ]; then
  echo "含んでいる"
else
  echo "ない"
fi
```


```bash
if grep -q "文字列" 対象ファイル ; then 含む時の処理; else ないときの処理; fi
```