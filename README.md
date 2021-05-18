# 基礎編

注意：Dockerのインストールについては触れません

## 環境の作成

gitからクローンします  
複数の環境を作りたい場合はクローン先のフォルダ名を変えれば大丈夫です  
※今の所問題はありませんが、どうやらハイフンは入れないほうが良いらしいです

```
git clone https://vielis.backlog.com/git/KIREIMO/kireimo-docker.git kireimo
```

## とりあえず立ち上げます

```
cd kireimo #クローンしたフォルダ名
docker-compose up -d
```

初回起動時に各コンテナのダウンロードがありますので少し時間がかかります  
DBの初期化もこのタイミングでおこなれます

```
docker ps
```

dockerのプロセスを確認してください

WEB  
<http://localhost:81/>

SYS  
<http://localhost:82/>

設定していないので、Docker(web)またはDocker(sys)と表示されます

## とりあえず終了させます

```
docker-compose down
```

## webまたはsysのソースを紐付けます

docker-compose.ymlを編集します

```
    volumes:
      - ./app/web_public_html/:/var/www/html
```

2行目のコロンより左側がホストマシンの設定です  
フルパス ```/Users/yu-yoshimura/IdeaProjects/kireimo/sys_public_html/``` の様に記述してください(Macだと```~/IdeaProjects/kireimo/sys_public_html/```での記述も可能でした)  
Windowsの場合は(Cドライブの場合)```/host_mnt/c/``` から始まるフルパスで指定してください(¥は/へ置換すること)

### 設定ファイルを変更する

config/base.phpのホスト名、ユーザ名、パスワードを変更します

```
define("HOST_NAME",                             "db");
define("DB_UESR",                       "root");
define("DB_PW",                                 "root");
```

### ログイン確認を行う

間違えて本番環境やステージング環境を汚さないように設定後は必ずこの確認を行ってください

#### webの場合

1. <http://localhost:81/member/> にアクセス
1. お客様コード、パスワードをともに **docker** と入力してログインする
1. ログインできることまで確認する

#### sysの場合

1. <http://localhost:82/admin/> にアクセス
1. ユーザ名、パスワードをともに **docker** と入力してログインする
1. 「ドッカーテスト　予約」でログインできることまで確認する

# 応用編

## phpMyAdminに関して

<http://localhost:18080/> で使えます

## テストデータに関して

クローンした作業フォルダ内のdb/sqlの中にあるDDL,DMLはデータベース初期化時に実行されます  
ファイル名順に実行されるため意図的に制御したい場合はファイル名の先頭を数字などにしてください

いま扱っているテストデータ

- DDL
    - kireimo DB
    - phpmyadmin
- DML
    - 一部マスターデータ
        - authority
        - basic
        - course
        - menu
        - prefectures
        - shop
    - ログイン確認用のユーザ

db/dataを削除するとデータベースをリセットできます

## デバッグに関して

### VS Code

1. PHP Debugをインストールします  
2019年8月時点で1.13.0のものをインストールしてください  
名前が同じで怪しい拡張機能があるので気をつけてください
![extension](https://vielis.backlog.com/git/KIREIMO/kireimo-docker/raw/master/readme_img/extension.png)
1. (おすすめ) 新しいウィンドウを開いて、Open Folderにて開発中のソースを指定します
![welcome](https://vielis.backlog.com/git/KIREIMO/kireimo-docker/raw/master/readme_img/welcome.png)
1. 設定を追加します
![debug1](https://vielis.backlog.com/git/KIREIMO/kireimo-docker/raw/master/readme_img/debug1.png)
![debug2](https://vielis.backlog.com/git/KIREIMO/kireimo-docker/raw/master/readme_img/debug2.png)
![debug3](https://vielis.backlog.com/git/KIREIMO/kireimo-docker/raw/master/readme_img/debug3.png)
設定は下記に記載
1. 再生ボタン押します
![debug4](https://vielis.backlog.com/git/KIREIMO/kireimo-docker/raw/master/readme_img/debug4.png)

```
// 前行に追加するので,を忘れずに
        {
            "name": "XDebug on docker",
            "type": "php",
            "request": "launch",
            "port": 9002,//web:9001,sys:9002
            "pathMappings": {
                // {docker上のdocument root}:{ローカルのdocument root}
                "/var/www/html":"/Users/yu-yoshimura/docker-demo/kireimo/app/sys_public_html"
            }
        }
```


参考

<https://qiita.com/yKanazawa/items/21881b060215c01243d6>

### IntelliJ

参考

<https://www.tam-tam.co.jp/tipsnote/program/post13770.html>


