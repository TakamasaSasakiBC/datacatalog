CREATE DATABASE group6;

USE group6;

CREATE TABLE members (
    member_id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '会員ID',
    member_name VARCHAR(255) NOT NULL COMMENT '氏名',
    mailaddress VARCHAR(255) NOT NULL COMMENT 'メールアドレス',
    password VARCHAR(255) NOT NULL COMMENT 'パスワード',
    member_status TINYINT NOT NULL COMMENT '会員ステータス',
    created_at DATETIME NOT NULL COMMENT '入会日',
    updated_at DATETIME NOT NULL COMMENT '更新日',
    PRIMARY KEY (member_id)
);
 
CREATE TABLE products (
    product_id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
    product_name VARCHAR(255) NOT NULL COMMENT '商品名',
    product_description TEXT NOT NULL COMMENT '説明',
    price SMALLINT NOT NULL COMMENT '価格',
    stock INT NOT NULL COMMENT '在庫',
    created_at DATETIME NOT NULL COMMENT '登録日',
    updated_at DATETIME NOT NULL COMMENT '更新日',
    PRIMARY KEY (product_id)
);
 
CREATE TABLE shopping_cart (
    cart_id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'カートID',
    member_id BIGINT(20) NOT NULL COMMENT '会員ID',
    product_id BIGINT(20) NOT NULL COMMENT '商品ID',
    qty SMALLINT NOT NULL COMMENT '数量',
    created_at DATETIME NOT NULL COMMENT '登録日',
    updated_at DATETIME NOT NULL COMMENT '更新日',
    PRIMARY KEY (cart_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
 
CREATE TABLE orders (
    order_id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '注文ID',
    member_id BIGINT(20) NOT NULL COMMENT '会員ID',
    sending_name VARCHAR(255) NULL COMMENT '送付先名',
    zipcode MEDIUMINT NOT NULL COMMENT '郵便番号',
    prefecture VARCHAR(20) NOT NULL COMMENT '都道府県',
    address1 VARCHAR(255) NOT NULL COMMENT '住所１',
    address2 VARCHAR(255) NULL COMMENT '住所２',
    shipping_fee INT NOT NULL COMMENT '送料',
    charge INT NOT NULL COMMENT '請求金額',
    order_status TINYINT NOT NULL COMMENT '注文ステータス',
    created_at DATETIME NOT NULL COMMENT '登録日',
    updated_at DATETIME NOT NULL COMMENT '更新日',
    PRIMARY KEY (order_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);
 
CREATE TABLE order_detail (
    order_detail_id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '注文詳細ID',
    product_id BIGINT(20) NOT NULL COMMENT '商品ID',
    order_id BIGINT(20) NOT NULL COMMENT '注文ID',
    ordered_price SMALLINT NOT NULL COMMENT '価格',
    ordered_qty SMALLINT NOT NULL COMMENT '数量',
    created_at DATETIME NOT NULL COMMENT '登録日',
    updated_at DATETIME NOT NULL COMMENT '更新日',
    PRIMARY KEY (order_detail_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);