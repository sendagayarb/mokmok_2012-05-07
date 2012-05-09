5/7(月) @iR3のもくもく内容
#【テーマ】
「たてがき言葉」 4/29(日)に行われた 第2回 デザイナー x エンジニアハッカソン（ハッシュタグ #p4d #p4hack） https://github.com/prog4designer/hackathon2nd/wiki にて実装しようとした「たてがき言葉」http://tate.herokuapp.com の文言が英語になって居る部分を 
i18n を使って日本語化する。

##【具体的な実装】
https://github.com/ir3/tategaki

参照

##【遭遇した問題・課題など】
■ 現象 下記エラー発生

```
ArgumentError (A secret is required to generate an integrity hash for cookie session data. Use config.secret_token = "some secret phrase of at least 30 characters"in config/initializers/secret_token.rb):
```

◇　状況
config/locales/attributes.ja.yml ファイルを作成し、作動させてみた。

◇　原因
secret_token.rb の secret_token

```
Tategaki::Application.config.secret_token = 'xxxxxxx..xxx'
```

が30桁に足りていないのが疑われたが、問題なく３０桁以上あり。

◇　対策
結局、再表示要求でエラーは再発せず。

■ タイトルの変換
app/views/posts/new.html.erb のタイトルを　t() を使って
変数での動的編集可能にし

```
<h1><%= t('title.new') %></h1>

```

変換辞書として helpers.ja.yml を編集して、タイトルの
変数newを 日本語変換定義する。

```
ja:
  title:
    new: '新規投稿'
```

##【まとめ】
i18n での表示文字の日本語置き換えは、まだ未対応の箇所は残っていますが、一応動きました。
http://tate.herokuapp.com で　自分のが入力した言葉がWebにて縦書き表示される「たてがき言葉」の日本文化の風味を味わって見てください。

