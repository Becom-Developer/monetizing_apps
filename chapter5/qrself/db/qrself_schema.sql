DROP TABLE IF EXISTS user;
CREATE TABLE user (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    login_id        TEXT,
    password        TEXT,
    approved        INTEGER,
    deleted         INTEGER,
    created_ts      TEXT,
    modified_ts     TEXT
);
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
