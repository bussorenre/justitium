概要
------
この問題では、配列が扱えるかを測る

### 必要な知識
* 配列
* フォーマット指定子

問題
------
※ ここでは、入力は「標準入力 stdin」から受け取り、出力は「標準出力 stdout」へ出力するものとする。

整数Nをが入力から与えられる。  
2行目にはベクトルXの内容が  
3行目にはベクトルYの内容がそれぞれ与えられる。  

ベクトルXとベクトルYの内積を求めて、出力せよ


入力
-----------
N (1 <= N <= 1000)  
X(N次元)  
Y(N次元)  


出力
-----------
XとYの内積  
（小数点以下6桁まで表示）  
小数点以下の数を指定するには以下のようなコードを記述する。

    printf("%0.6f\n", answer);


※ 必ず最後に改行コードを入れること。  

入力例1
-----------
    3
    0.1 0.2 0.3
    0.1 0.2 0.3


出力例1
-----------
    0.140000