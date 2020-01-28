# NAME

chapter5 - アプリ実装

```
(perl 準備)
$ cd ~/.plenv/ && git pull
$ cd ~/.plenv/plugins/perl-build/ && git pull
$ plenv install 5.30.1
$ plenv rehash
$ plenv global 5.30.1
$ plenv install-cpanm
$ cpanm Carton
$ cpanm Perl::Tidy

(mojo ほか、準備)
$ cd ~/github/monetizing_apps/chapter5
$ echo '5.30.1' > .perl-version; echo "requires 'Mojolicious', '8.32';" >> cpanfile; echo "requires 'Teng', '0.31';" >> cpanfile; echo "requires 'DBD::SQLite', '1.64';" >> cpanfile; echo "requires 'HTML::FillInForm::Lite', '1.15';" >> cpanfile; echo "requires 'Imager::QRCode', '0.035';" >> cpanfile;
$ carton install

(雛形作成)
$ carton exec -- mojo generate app QRSelf
$ mv * qrself/
$ mv .perl-version qrself/
$ mv qrself/README.md .
$ cd qrself

(git設定)
$ echo 'local/' >> .gitignore; echo 'log/' >> .gitignore; echo 'db/*.db' >> .gitignore; echo '.DS_Store' >> .gitignore;

(mojo 拡張コマンド)
$ git clone git@github.com:ykHakata/Mojolicious-Command-Author-generate-doc.git
$ git clone git@github.com:ykHakata/Mojolicious-Command-Author-generate-mvc.git
$ git clone git@github.com:ykHakata/Mojolicious-Command-Author-generate-sqlitedb.git
$ git clone git@github.com:ykHakata/Mojolicious-Command-Author-generate-etc.git
$ mv Mojolicious-Command-Author-generate-doc/lib/* lib/
$ mv Mojolicious-Command-Author-generate-mvc/lib/Mojolicious/Command/Author/generate/* lib/Mojolicious/Command/Author/generate/
$ mv Mojolicious-Command-Author-generate-sqlitedb/lib/Mojolicious/Command/Author/generate/* lib/Mojolicious/Command/Author/generate/
$ mv Mojolicious-Command-Author-generate-etc/lib/Mojolicious/Command/Author/generate/* lib/Mojolicious/Command/Author/generate/

(不要なファイルはゴミ箱に)
mv Mojolicious-Command-Author-generate-doc ~/.Trash
mv Mojolicious-Command-Author-generate-mvc ~/.Trash
mv Mojolicious-Command-Author-generate-sqlitedb ~/.Trash
mv Mojolicious-Command-Author-generate-etc ~/.Trash

(１回目テンプレ自動作成)
$ carton exec -- script/qrself generate mvc

(基本認証機能テンプレ自動作成)
$ carton exec -- script/qrself generate mvc Auth

(試しテスト)
$ carton exec -- prove --lib -r

(開発用のテンプレ配置完成)
```

- url
    - GET - `/` - index サイトの説明、各機能へのリンク
    - GET - `/qr/create` - create QRコードの条件を入力する画面
    - GET - `/qr/:numbering/edit` - edit QRコードの条件を修正する画面
    - POST - `/qr/:numbering/update` - update QRコードの条件の修正実行
    - POST - `/qr` - store QRコードを作成実行
    - GET - `/qr/:numbering` - show 作成されたQRコードを表示
    - GET - `/qr/download` - download 作成されたQRコードのダウンロード実行

```
embed ads -> (ad)

standard
+--------+  +-----------------+  +-----------+  +---------------------+  +-------------------+
| get: / |->| get: /qr/create |->| post: /qr |->| get: /qr/:numbering |->| get: /qr/download |
+--------+  +-----------------+  +-----------+  +---------------------+  +-------------------+
(ad)        (ad)                                (ad)

update
+---------------------+  +--------------------------+  +-----------------------------+  +---------------------+
| get: /qr/:numbering |->| get: /qr/:numbering/edit |->| post: /qr/:numbering/update |->| get: /qr/:numbering |
+---------------------+  +--------------------------+  +-----------------------------+  +---------------------+
(ad)                     (ad)                                                           (ad)

download only
+--------+  +-------------------+
| get: / |->| get: /qr/download |
+--------+  +-------------------+
(ad)

show again
+--------+  +---------------------+
| get: / |->| get: /qr/:numbering |
+--------+  +---------------------+
(ad)        (ad)
```

```sql
DROP TABLE IF EXISTS qr_card;
CREATE TABLE qr_card (                                  -- 作成されたQRコードカード
    id              INTEGER PRIMARY KEY AUTOINCREMENT,  -- ID (例: 5)
    numbering       TEXT,                               -- qr_card のユニークなナンバー (例: 'qr20200128')
    name            TEXT,                               -- QRコードカードの名前 (例: '自分のサイトURL')
    qrcode          TEXT,                               -- QRコード画像ファイル名 (例: 'qrcode.png')
    content         TEXT,                               -- QRコードにしたい内容 (例: 'https://www.becom.co.jp')
    option          TEXT,                               -- 変換する詳細設定json形式 (例: '{"option": {"size": "50"}}')
    deleted         INTEGER,                            -- 削除フラグ (例: 0: 削除していない, 1: 削除済み)
    created_ts      TEXT,                               -- 登録日時 (例: '2020-01-28 09:47:28')
    modified_ts     TEXT                                -- 修正日時 (例: '2020-01-28 09:47:28')
);
```

## SECTION1

## SECTION2

## SECTION3

# SUMMARY

# SEE ALSO
