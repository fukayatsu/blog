---
title: "esa API v1をβ公開しました"
category: release_note/2015/05/27
tags: 
created_at: 2015-05-24 22:35:27 +0900
updated_at: 2015-06-16 17:08:29 +0900
published: true
---



![api.jpg (42.4 kB)](https://img.esa.io/uploads/production/attachments/105/2015/05/27/2/e1754af1-06e7-4229-b9c6-1d3ae5344e2d.jpg)


# 今回のリリース内容

本日 esa API v1をβ公開しました。
大変長らくお待たせしました。

まずは記事APIとチームAPIを公開しましたが、今後もAPIで操作可能な対象を増やしていくつもりです。

![ss 2015-05-24 at 23.06.28.png (374.8 kB)](https://img.esa.io/uploads/production/attachments/105/2015/05/24/1/879ec85c-1fd6-4a0c-940f-b9c44c11adb4.png)


APIについて、詳しくはこちらのドキュメントを御覧ください

> [dev/api/v1 - docs.esa.io](/posts/102) 

「ぜひこのAPIを追加してくれ！」や「このパラメータも欲しいんだけど」みたいなことがありましたら、ぜひ右下のFeedback formからお知らせ下さい。

また、Rubyのesa API clientも先日から公開していますのでissueやpull-requestをお待ちしております。
> [esaio/esa-ruby](https://github.com/esaio/esa-ruby)

このgemの使い方はこんな感じです。

```ruby
require 'esa'

client = Esa::Client.new(access_token: "<access_token>", current_team: 'foo')
client.teams
#=> GET /v1/teams

client.team('bar')
#=> GET /v1/teams/bar

client.posts
#=> GET /v1/teams/foo/posts

client.posts(q: 'in:help')
#=> GET /v1/teams/foo/posts?q=in%3Ahelp

client.current_team = 'foobar'
client.post(1)
#=> GET /v1/teams/foobar/posts/1

client.create_post(name: 'foo')
#=> POST /v1/teams/foobar/posts

client.update_post(1, name: 'bar')
#=> PATCH /v1/teams/foobar/posts/1

client.delete_post(1)
#=> DELETE /v1/teams/foobar/posts/1
```

# 所感
APIを公開することで、esaの使い方の可能性が広がるのが楽しみです。
「うちのチームではこういうの作ったぜ！」という事例を是非お知らせください。

APIのprivate βにご協力して頂いた皆様ありがとうございました。

---
[ProTip] [Webhookでdocs.esa.ioの更新通知を受け取れるようになりました!](/posts/73) 

Enjoy "(\\( ⁰⊖⁰)/)"
https://esa.io
