繰り返し処理構文

# for文

## for文基本形

```bash
for 変数 in 値リスト 
do
  処理
done
```


## 一定回数のループ処理を作成

seq コマンドで連番を作成することにより、一定回数のループ処理を作成する。

```bash
for i in `seq 1 N` 
do 
  処理
done 
```

# while文

## 条件を用いたwhile構文

```bash
while [ 条件式 ]
do
  処理
done
```

## テキストの内容を一行ずつ処理

```bash
cat 対象ファイル | while read line
do
  処理(${line}にファイル一行分の文字列が格納されている)
done
```

## 無限ループ処理

```bash
while :
do
  if [ break条件 ];
  then 
    break
  fi
done
```



# ループを制御する
for文やwhile文ともに、
C言語と同じ「continue」と「break」が使用可能である。

|処理|内容|
| --- | --- |
| continue |ループの次のステップへ進む。 |
| break |ループを終了する。 |