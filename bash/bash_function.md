# bash 自作関数基本知識

- 関数の記載方法は「 function 関数名() 」
- 関数名直後のカッコの中に引数変数名を宣言することはできない。
- 関数の引数は、「$1」「$2」「$3」...で取得する
- 戻り値(return)で返せるのは整数のみ
- 関数呼び出し元で戻り値を取得する際には「$?」を使用する。  
但し、「$?」に格納されている値は、直ぐに変化するので注意


# bash 関数基本系

```bash
function sample_method(){
  if [ $1 = 'foo' ];
  then
    return 1;
  else 
    return 0;
  fi 
}

sample_method 'foo' 
func_result=$?
echo ${func_result}    # 1と出力する
sample_method 'hoge'
func_result=$?
echo ${func_result}    # 0と出力する
```


# bash関数から数字以外の戻り値を取得する時

bashでは戻り値に数字しか指定できないため、文字列を返す時には、工夫が必要。

具体的には、関数の呼出元で、呼出箇所をバッククォートで挟む。  
そして、バッククォートの直前にイコールを置き、
関数先のechoで出力した文字列をそのまま変数に格納するように処理を組む

```bash
function sample_method(){
  echo 'aiueo' $1 $2
  return 0;
}

hoge=`sample_method 'foo' 'hoge'`
func_result=$?
echo $hoge          # "aiueo foo hoge"と出力
echo $func_result   # 0 と出力
```
