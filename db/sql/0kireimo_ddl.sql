-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- ホスト: mysql-kireimo-db
-- 生成日時: 2019 年 8 月 15 日 01:26
-- サーバのバージョン： 5.6.39
-- PHP のバージョン: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `kireimo`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `kireimo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `kireimo`;

-- --------------------------------------------------------

--
-- テーブルの構造 `accesslog`
--

CREATE TABLE `accesslog` (
  `access_date` date NOT NULL DEFAULT '0000-00-00',
  `page_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mo_agent` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `adcode` varchar(63) NOT NULL DEFAULT '0',
  `count` int(10) UNSIGNED DEFAULT '0',
  `job_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `adcode`
--

CREATE TABLE `adcode` (
  `id` int(11) NOT NULL,
  `agent_id` varchar(63) NOT NULL,
  `adcode` varchar(63) NOT NULL,
  `name` varchar(255) NOT NULL,
  `request_id` int(11) NOT NULL,
  `site` tinyint(4) NOT NULL COMMENT 'サイト名',
  `page_id` int(11) NOT NULL,
  `page_name` varchar(63) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `ad_group` tinyint(4) NOT NULL COMMENT '1.アフィリエイト2.リスティング3.ブログ4.その他',
  `free_dial` varchar(31) NOT NULL,
  `flyer_no` varchar(31) NOT NULL COMMENT 'チラシ広告番号',
  `cost1` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `release_date` varchar(63) NOT NULL,
  `maximum` int(11) NOT NULL,
  `hide_flg` int(11) NOT NULL,
  `job_flg` tinyint(4) NOT NULL,
  `form_type` tinyint(1) NOT NULL,
  `memo` varchar(255) NOT NULL COMMENT '店舗表示文章',
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `del_flg` int(1) NOT NULL,
  `del_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `ad_address`
--

CREATE TABLE `ad_address` (
  `id` int(9) NOT NULL DEFAULT '0',
  `ken_id` int(2) DEFAULT NULL,
  `city_id` int(5) DEFAULT NULL,
  `town_id` int(9) DEFAULT NULL,
  `zip` varchar(8) DEFAULT NULL,
  `office_flg` tinyint(1) DEFAULT NULL,
  `delete_flg` tinyint(1) DEFAULT NULL,
  `ken_name` varchar(8) DEFAULT NULL,
  `ken_furi` varchar(8) DEFAULT NULL,
  `city_name` varchar(24) DEFAULT NULL,
  `city_furi` varchar(24) DEFAULT NULL,
  `town_name` varchar(32) DEFAULT NULL,
  `town_furi` varchar(32) DEFAULT NULL,
  `town_memo` varchar(16) DEFAULT NULL,
  `kyoto_street` varchar(32) DEFAULT NULL,
  `block_name` varchar(64) DEFAULT NULL,
  `block_furi` varchar(64) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `office_name` varchar(255) DEFAULT NULL,
  `office_furi` varchar(255) DEFAULT NULL,
  `office_address` varchar(255) DEFAULT NULL,
  `new_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `ad_cost`
--

CREATE TABLE `ad_cost` (
  `id` int(11) NOT NULL,
  `ad_month` varchar(15) NOT NULL,
  `request_id` int(11) NOT NULL,
  `ad_group` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `cost` int(11) NOT NULL,
  `edit_date` datetime NOT NULL,
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `agent`
--

CREATE TABLE `agent` (
  `id` varchar(63) NOT NULL,
  `pid` varchar(63) NOT NULL,
  `password` varchar(63) NOT NULL,
  `name` varchar(63) NOT NULL,
  `mail` varchar(63) NOT NULL,
  `tantou` varchar(63) NOT NULL,
  `show_flg` int(1) NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `allowance`
--

CREATE TABLE `allowance` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `ym` varchar(15) NOT NULL COMMENT '手当発生年月',
  `work_location` tinyint(4) NOT NULL COMMENT '出勤形態',
  `base_salary` int(11) NOT NULL COMMENT '基本給',
  `type` tinyint(4) NOT NULL COMMENT '役職',
  `coun_allowance` int(11) NOT NULL COMMENT 'ｶｳﾝｾﾘﾝｸﾞ手当',
  `trea_allowance` int(11) NOT NULL COMMENT '施術手当',
  `train_allowance` int(11) NOT NULL COMMENT '研修手当',
  `trav_allowance` int(11) NOT NULL COMMENT '出張手当',
  `intro_allowance` int(11) NOT NULL COMMENT '紹介手当',
  `president_award` int(11) NOT NULL COMMENT '社長賞',
  `achi_allowance` int(11) NOT NULL COMMENT '目標達成手当',
  `sales` int(11) NOT NULL COMMENT '社販分',
  `del_flg` tinyint(4) NOT NULL,
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `authority`
--

CREATE TABLE `authority` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `login_id` varchar(63) NOT NULL,
  `password` varchar(63) NOT NULL,
  `authority` smallint(4) NOT NULL DEFAULT '1',
  `group` varchar(8) NOT NULL,
  `memo` varchar(255) NOT NULL,
  `del_flg` smallint(4) NOT NULL,
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `bank`
--

CREATE TABLE `bank` (
  `id` int(11) NOT NULL COMMENT '口座情報ID',
  `customer_id` int(11) NOT NULL COMMENT '会員ID',
  `bank_name` varchar(128) DEFAULT NULL COMMENT '銀行名',
  `bank_branch` varchar(128) DEFAULT NULL COMMENT '支店名',
  `bank_account_type` tinyint(4) DEFAULT NULL COMMENT '口座種別	 1-普通, 2-当座, 3-貯蓄',
  `bank_account_no` varchar(7) DEFAULT NULL COMMENT '口座番号	 7桁番号	 通常は頭を0埋めする',
  `bank_account_name` varchar(128) DEFAULT NULL COMMENT '口座名義',
  `reg_date` datetime NOT NULL COMMENT '登録日時',
  `edit_date` datetime NOT NULL COMMENT '更新日時',
  `del_flg` tinyint(4) NOT NULL COMMENT '削除フラグ	 1-削除',
  `ng_flg` tinyint(4) NOT NULL COMMENT 'NGフラグ	 1-NG',
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='口座情報';

-- --------------------------------------------------------

--
-- テーブルの構造 `basic`
--

CREATE TABLE `basic` (
  `id` int(11) NOT NULL,
  `name` varchar(63) NOT NULL,
  `value` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `blog_date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `url_nofollow` tinyint(4) NOT NULL,
  `url_blank` tinyint(4) NOT NULL,
  `img_name` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '999',
  `del_flg` tinyint(4) NOT NULL,
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `contact_answer`
--

CREATE TABLE `contact_answer` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL COMMENT '顧客ID',
  `no` varchar(15) NOT NULL COMMENT '会員番号',
  `content` text NOT NULL COMMENT '連絡内容',
  `answer` text NOT NULL COMMENT '回答内容',
  `del_flg` tinyint(4) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='連絡板回答';

-- --------------------------------------------------------

--
-- テーブルの構造 `contact_info`
--

CREATE TABLE `contact_info` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT '顧客ID',
  `no` varchar(15) NOT NULL COMMENT '会員番号',
  `type` tinyint(4) NOT NULL,
  `content` text NOT NULL COMMENT '連絡内容',
  `del_flg` tinyint(4) NOT NULL DEFAULT '0',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='連絡板';

-- --------------------------------------------------------

--
-- テーブルの構造 `contract`
--

CREATE TABLE `contract` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0.契約中、1.契約終了、2.クーリングオフ、3.中途解約、4.プラン変更、5.ローン取消、6.自動解約、7.契約待ち、8.返金保証回数終了',
  `new_contract_id` int(11) NOT NULL COMMENT '変更後の契約ID',
  `new_course_id` int(11) NOT NULL,
  `old_contract_id` int(11) NOT NULL,
  `old_course_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL COMMENT '解約時売上ID',
  `customer_id` int(11) NOT NULL COMMENT '会員ID',
  `shop_id` int(11) NOT NULL COMMENT '店舗ID',
  `staff_id` int(11) NOT NULL COMMENT 'カウンセリング担当ID',
  `option_name` tinyint(4) NOT NULL COMMENT 'オプション',
  `course_id` int(11) NOT NULL COMMENT 'コースID',
  `times` tinyint(4) NOT NULL COMMENT 'コース回数',
  `pay_type` tinyint(4) NOT NULL COMMENT '支払方法',
  `pay_shop` int(11) NOT NULL COMMENT '月額引き落としの登録店舗',
  `pay_reg_date` date NOT NULL COMMENT '引落手続日',
  `payinfo_del_flg` tinyint(4) NOT NULL COMMENT 'カード情報削除フラグ',
  `pay_complete_date` date NOT NULL COMMENT '支払完了日',
  `fixed_price` int(11) NOT NULL COMMENT '商品金額',
  `discount` int(11) NOT NULL COMMENT '値引き',
  `dis_type` tinyint(4) NOT NULL COMMENT '割引タイプ',
  `price` int(11) NOT NULL COMMENT '値引後金額',
  `payment` int(11) NOT NULL COMMENT '入金',
  `payment_cash` int(11) NOT NULL,
  `payment_transfer` int(11) NOT NULL COMMENT '銀行振込',
  `payment_card` int(11) NOT NULL,
  `card_type` tinyint(4) NOT NULL COMMENT 'JCB、VISA、MASTER、AMEX、DINERS、デビット',
  `payment_loan` int(11) NOT NULL,
  `payment_loan_kari` int(11) NOT NULL COMMENT '承認中ローン(保留）',
  `loan_status` tinyint(4) NOT NULL DEFAULT '3' COMMENT '1.承認済2.非承認3.承認中4.取消5.クレピコ6.承認中(OK)7.立替済8.完済',
  `loan_application_date` date NOT NULL COMMENT 'ローン申込日',
  `loan_date` date NOT NULL COMMENT 'ローン処理日',
  `loan_sid` int(11) NOT NULL COMMENT '承認計上売上ID',
  `loan_company_id` int(11) NOT NULL COMMENT 'ローン会社ID',
  `loan_recept_no` varchar(15) NOT NULL COMMENT 'ローン受付番号',
  `payment_coupon` int(11) NOT NULL,
  `balance` int(11) NOT NULL COMMENT '売掛金',
  `latest_date` date NOT NULL COMMENT '最終消化日(施術のみ)',
  `r_times` tinyint(4) NOT NULL COMMENT '消化回数or来店回数（月額）',
  `part_flg` tinyint(4) NOT NULL COMMENT '0.月額下半身から、1.上半身に切替。未使用',
  `contract_date` date NOT NULL COMMENT '契約日',
  `end_date` date NOT NULL COMMENT '契約期間',
  `cancel_type` tinyint(4) NOT NULL,
  `cancel_date` date NOT NULL COMMENT '解約日(変更日)',
  `if_cancel_date` tinyint(4) NOT NULL COMMENT 'プラン変更適応日',
  `start_ym` int(6) NOT NULL COMMENT '施術開始予定年月(月額)',
  `repay` int(11) NOT NULL COMMENT '契約返金額',
  `memo` varchar(255) NOT NULL,
  `reg_date` datetime NOT NULL COMMENT '登録日時',
  `edit_date` datetime NOT NULL,
  `del_flg` tinyint(4) NOT NULL,
  `extension_flg` tinyint(4) DEFAULT NULL COMMENT '施術保証期間延長Flag',
  `extension_edit_date` date DEFAULT NULL COMMENT '保証期間延長登録日',
  `wait_flg` tinyint(4) NOT NULL COMMENT '契約待ちよりFlag',
  `chk_flg` tinyint(4) NOT NULL,
  `conversion_flg` tinyint(4) NOT NULL COMMENT 'プラン組替フラグ',
  `bad_debt_flg` tinyint(1) DEFAULT NULL COMMENT '貸し倒れフラグ',
  `terminate_day` date DEFAULT NULL COMMENT '解約日'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0.回数制、1.月額制',
  `group_id` tinyint(4) DEFAULT NULL,
  `length` tinyint(4) NOT NULL COMMENT '所要時間',
  `price` int(11) DEFAULT NULL,
  `times` tinyint(4) NOT NULL COMMENT '回数',
  `period` tinyint(4) DEFAULT NULL,
  `memo` text NOT NULL,
  `zero_flg` tinyint(4) DEFAULT NULL COMMENT '通いホーダイフラグ 1.あり',
  `new_flg` tinyint(4) NOT NULL COMMENT '新月額フラグ 0.新月額以外、1.新月額',
  `old_flg` tinyint(4) NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `login_id` varchar(127) NOT NULL COMMENT 'ログインID',
  `password` varchar(127) NOT NULL COMMENT 'パスワード',
  `pw_sent_flg` tinyint(4) NOT NULL,
  `pw_sent_date` date NOT NULL,
  `shop_id` int(11) NOT NULL COMMENT '店舗ID',
  `cstaff_id` int(11) NOT NULL COMMENT 'カウンセリング担当',
  `no` varchar(11) NOT NULL COMMENT '会員番号',
  `sn_shop` int(11) NOT NULL COMMENT '同店舗会員番号',
  `status` tinyint(1) NOT NULL DEFAULT '2',
  `agree_status` tinyint(4) NOT NULL COMMENT '親権同意書の有無',
  `attorney_status` tinyint(4) NOT NULL COMMENT '委任状の有無',
  `contract_send` tinyint(4) NOT NULL COMMENT '原本郵送',
  `ctype` tinyint(4) NOT NULL DEFAULT '1' COMMENT '会員タイプ',
  `name` varchar(63) NOT NULL COMMENT '名前',
  `name_kana` varchar(63) NOT NULL COMMENT 'ナマエ(カナ)',
  `smartpit_id_old` int(11) NOT NULL COMMENT 'スマートピットID(旧)',
  `smartpit_id` int(11) NOT NULL COMMENT 'スマートピットID(使用中)',
  `bank_account_name` varchar(63) NOT NULL COMMENT '銀行口座名義',
  `pair_name_kana` varchar(63) NOT NULL,
  `cbs_no` varchar(63) NOT NULL,
  `card_no` varchar(7) DEFAULT NULL COMMENT 'カード下4桁',
  `card_name` varchar(63) NOT NULL COMMENT 'カード名義',
  `card_name_kana` varchar(31) NOT NULL,
  `card_limit_month` varchar(5) NOT NULL COMMENT 'カード有効期限(月)',
  `card_limit_year` varchar(10) NOT NULL COMMENT 'カード有効期限(年)',
  `zip` varchar(11) NOT NULL COMMENT '郵便番号',
  `pref` tinyint(4) NOT NULL COMMENT '都道府県',
  `address` varchar(255) NOT NULL COMMENT '住所',
  `mail` varchar(63) NOT NULL COMMENT 'メールアドレス',
  `mobile` varchar(63) NOT NULL COMMENT '携帯アドレス',
  `tel` varchar(63) NOT NULL COMMENT '電話',
  `pair_tel` varchar(63) NOT NULL,
  `sex` varchar(63) NOT NULL DEFAULT '2' COMMENT '性別(default:女性)',
  `birthday0` varchar(31) NOT NULL COMMENT '誕生日(yyyy/mm/dd)',
  `birthday` date NOT NULL COMMENT '誕生日(yyyy-mm-dd)',
  `age` varchar(11) NOT NULL COMMENT '年齢',
  `big_flg` tinyint(4) NOT NULL COMMENT '1.BIGの方',
  `change_flg` tinyint(4) NOT NULL COMMENT '1.プラン変更予定有り',
  `job` varchar(63) NOT NULL COMMENT 'ご職業',
  `job_sub` varchar(63) NOT NULL COMMENT 'ご職業(中分類)',
  `job_other` varchar(63) NOT NULL COMMENT 'ご職業(その他)',
  `marriage` tinyint(4) NOT NULL COMMENT '結婚',
  `height` varchar(31) NOT NULL COMMENT '身長',
  `weight` varchar(31) NOT NULL COMMENT '体重',
  `ad_name` varchar(63) NOT NULL,
  `introducer` varchar(31) NOT NULL COMMENT '紹介者',
  `introducer_type` tinyint(4) NOT NULL COMMENT '紹介者タイプ',
  `partner` tinyint(4) NOT NULL,
  `special` tinyint(4) NOT NULL COMMENT '特別紹介者',
  `route` tinyint(4) NOT NULL DEFAULT '1' COMMENT '経由:1.WEB2.電話6.店舗3.飛込4.クーポンランド5.Mypage7.HotPepper,8.チラシ',
  `echo` varchar(255) NOT NULL COMMENT '反響',
  `mag` varchar(255) NOT NULL COMMENT '申し込み広告',
  `prize` tinyint(4) NOT NULL COMMENT '当選賞品',
  `hope_campaign` varchar(31) NOT NULL,
  `hope_time_range` varchar(255) NOT NULL,
  `hopes_discount` tinyint(4) NOT NULL COMMENT '学割希望',
  `student_id` tinyint(4) NOT NULL,
  `times` tinyint(4) NOT NULL COMMENT '来店回数',
  `comment` text NOT NULL,
  `memo` text NOT NULL COMMENT '備考',
  `lat` varchar(255) NOT NULL,
  `lng` varchar(255) NOT NULL,
  `mo_agent` tinyint(4) NOT NULL COMMENT '端末キャリア',
  `adcode` varchar(127) NOT NULL COMMENT '広告ID',
  `flyer_no` int(11) NOT NULL COMMENT 'チラシ番号',
  `mo_id` tinyint(4) NOT NULL COMMENT '端末ID',
  `session_id` varchar(255) NOT NULL COMMENT 'セッションID',
  `url` varchar(255) NOT NULL COMMENT 'URL',
  `referer_url` text NOT NULL COMMENT '参照URL',
  `user_agent` text NOT NULL COMMENT 'ユーザーエージェント',
  `reg_flg` tinyint(4) NOT NULL COMMENT '登録フラグ',
  `rebook_flg` tinyint(4) NOT NULL COMMENT '１．一般再申込２．ID付（梅木）再申込',
  `reg_date` datetime NOT NULL COMMENT '登録日時',
  `edit_date` datetime NOT NULL,
  `del_flg` tinyint(4) NOT NULL,
  `sv_flg` tinyint(4) NOT NULL,
  `loan_delay_flg` tinyint(4) NOT NULL,
  `digicat_ng_flg` tinyint(4) NOT NULL,
  `nextpay_end_ng_flg` tinyint(4) NOT NULL,
  `nextpay_op_ng_flg` tinyint(4) NOT NULL,
  `bank_ng_flg` tinyint(4) NOT NULL,
  `pair_flg` varchar(4) NOT NULL COMMENT 'サロンでの脱毛経験の有無',
  `chk_name_flg` tinyint(4) NOT NULL COMMENT '名前曖昧フラグ',
  `chk_tel_flg` tinyint(4) NOT NULL,
  `chk_mail_flg` tinyint(4) NOT NULL,
  `chk_addr_flg` tinyint(4) NOT NULL,
  `chk_flg` tinyint(4) NOT NULL,
  `mail_status` tinyint(4) NOT NULL COMMENT '0.正常1.存在しない2.存在しないか一時拒否3.MailBox利用不可4.一時拒否5.受信拒否6.受信側エラー7.配信不可依頼',
  `onelife_flg` tinyint(4) NOT NULL COMMENT 'ローン会社ワンライフのフラグ',
  `kireimo_plus_flg` tinyint(1) DEFAULT NULL COMMENT 'kireimoプラスフラグ',
  `line_mid` varchar(33) DEFAULT NULL COMMENT 'LINE mid',
  `old_id` int(11) DEFAULT NULL COMMENT '前回会員ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `goal`
--

CREATE TABLE `goal` (
  `id` int(11) NOT NULL,
  `ym2` varchar(11) NOT NULL COMMENT '目標年月',
  `shop_id` text NOT NULL COMMENT '売上達成店舗',
  `shop_id2` text NOT NULL COMMENT '消化達成店舗',
  `shop_id3` text NOT NULL COMMENT '3%解約率店舗',
  `shop_id4` text NOT NULL COMMENT '5%解約率店舗',
  `shop_id5` text NOT NULL COMMENT '7%解約率店舗',
  `shop_id6` text NOT NULL COMMENT '80%成約率店舗',
  `shop_id7` text NOT NULL COMMENT '75%成約率店舗',
  `churn_all` tinyint(4) NOT NULL COMMENT '全店舗解約率:1-3%,2-5%,3-7%',
  `contract_all` tinyint(4) NOT NULL COMMENT '全店舗成約率:1-80%,2-75%',
  `sales_all` tinyint(4) NOT NULL COMMENT '全店舗売上:0.未達成1.達成',
  `del_flg` tinyint(4) NOT NULL,
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `goods`
--

CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `name3` varchar(255) NOT NULL,
  `name4` varchar(255) NOT NULL,
  `name5` varchar(255) NOT NULL,
  `name6` varchar(255) NOT NULL,
  `contents1` text NOT NULL,
  `contents2` text NOT NULL,
  `contents3` text NOT NULL,
  `contents4` text NOT NULL,
  `contents5` text NOT NULL,
  `contents6` text NOT NULL,
  `price1` varchar(63) NOT NULL,
  `price2` varchar(63) NOT NULL,
  `price3` varchar(63) NOT NULL,
  `price4` varchar(63) NOT NULL,
  `price5` varchar(63) NOT NULL,
  `price6` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `introducer`
--

CREATE TABLE `introducer` (
  `id` int(11) NOT NULL COMMENT '紹介者情報ID',
  `customer_id` int(11) NOT NULL COMMENT '顧客ID（紹介元）',
  `introducer_customer_id` int(11) NOT NULL COMMENT '顧客ID（紹介先）',
  `refund_request` date NOT NULL DEFAULT '0000-00-00' COMMENT '申請受付連絡日',
  `refund_contact` date NOT NULL DEFAULT '0000-00-00' COMMENT '返金連絡日',
  `refund_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '返金日',
  `reg_date` datetime NOT NULL COMMENT '登録日時',
  `edit_date` datetime NOT NULL COMMENT '更新日時',
  `del_flg` tinyint(4) NOT NULL COMMENT '削除フラグ	 削除:1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='紹介者情報';

-- --------------------------------------------------------

--
-- テーブルの構造 `ips_bank_info`
--

CREATE TABLE `ips_bank_info` (
  `id` int(11) NOT NULL COMMENT '自動採番',
  `ips_account_no` int(11) NOT NULL COMMENT '口座データNo',
  `ips_customer_no` int(11) NOT NULL COMMENT 'IPS会員番号',
  `bank_code` int(11) NOT NULL COMMENT '銀行コード',
  `bank_name` varchar(128) NOT NULL COMMENT '銀行名',
  `bank_branch_code` int(11) NOT NULL COMMENT '支店コード',
  `bank_account_type` tinyint(4) NOT NULL COMMENT '預金種別''0-普通、1-当座、2-貯蓄',
  `bank_account_no` int(11) NOT NULL COMMENT '口座番号',
  `bank_account_name` varchar(128) NOT NULL COMMENT '口座名義',
  `price` int(11) NOT NULL COMMENT '金額',
  `course_id` int(11) NOT NULL COMMENT 'コース名',
  `customer_no` varchar(128) NOT NULL COMMENT '会員番号',
  `customer_id` int(11) NOT NULL COMMENT '会員ID',
  `sys_price` int(11) NOT NULL COMMENT 'コースTBLの金額',
  `reg_date` datetime DEFAULT NULL COMMENT '登録日時',
  `edit_date` datetime DEFAULT NULL COMMENT '更新日時',
  `del_flg` tinyint(4) NOT NULL COMMENT '削除フラグ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `item_coupon`
--

CREATE TABLE `item_coupon` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '種類1:フリーチケット',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `del_flg` tinyint(4) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `item_landing`
--

CREATE TABLE `item_landing` (
  `id` int(11) NOT NULL,
  `name` varchar(63) NOT NULL,
  `ldp_name` varchar(63) NOT NULL,
  `site` tinyint(4) NOT NULL,
  `reurl` tinyint(4) NOT NULL,
  `del_flg` tinyint(4) NOT NULL,
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `item_prize`
--

CREATE TABLE `item_prize` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `del_flg` tinyint(4) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `entry_name` varchar(63) NOT NULL,
  `entry_name_2` varchar(63) NOT NULL,
  `entry_name_kana` varchar(63) NOT NULL,
  `entry_name_kana_2` varchar(63) NOT NULL,
  `school_name` varchar(40) NOT NULL COMMENT '学校名',
  `sex` varchar(15) NOT NULL,
  `age` text NOT NULL,
  `birthday` date NOT NULL,
  `zip` varchar(10) NOT NULL,
  `pref` tinyint(4) NOT NULL COMMENT '都道府県',
  `now_address_1` text NOT NULL,
  `now_address_2` varchar(255) NOT NULL COMMENT '市区町村',
  `now_address_3` varchar(255) NOT NULL COMMENT '番地、ビル、マンション名',
  `now_tel_1` varchar(15) NOT NULL,
  `now_tel_2` varchar(15) NOT NULL,
  `now_email` varchar(63) NOT NULL,
  `line` varchar(63) NOT NULL,
  `station` varchar(31) NOT NULL COMMENT '最寄り駅',
  `shop` varchar(15) NOT NULL COMMENT '希望店舗 ',
  `shop_num` tinyint(4) DEFAULT NULL COMMENT '希望店舗番号',
  `type` tinyint(4) NOT NULL COMMENT '採用対象',
  `exeperience_c` tinyint(4) NOT NULL COMMENT '脱毛サロン勤務経験',
  `exeperience_y` varchar(15) NOT NULL,
  `graduation_ym` int(6) NOT NULL COMMENT '卒業予定年月',
  `opportunity` varchar(63) NOT NULL COMMENT '経験年数',
  `job_media_id` int(11) NOT NULL COMMENT '※ご応募のきっかけ選択肢',
  `input_form_title_tab_self_pr` text NOT NULL,
  `comment` text NOT NULL COMMENT '応募のきっかけ',
  `mo_agent` tinyint(4) NOT NULL COMMENT '質問',
  `adcode` varchar(127) NOT NULL,
  `mo_id` tinyint(4) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `referer_url` text NOT NULL,
  `user_agent` text NOT NULL,
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `reg_flg` tinyint(4) NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `job_media`
--

CREATE TABLE `job_media` (
  `id` int(11) NOT NULL COMMENT '求人媒体ID',
  `name` varchar(255) NOT NULL COMMENT '求人媒体名',
  `status` tinyint(1) NOT NULL COMMENT '公開/非公開',
  `type` tinyint(4) NOT NULL COMMENT '種類',
  `rank` tinyint(4) NOT NULL COMMENT '表示順位',
  `start_date` date NOT NULL COMMENT '求人媒体利用開始日',
  `end_date` date NOT NULL COMMENT '求人媒体利用終了日',
  `reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
  `edit_date` datetime NOT NULL COMMENT '編集日時',
  `del_flg` int(1) NOT NULL COMMENT '削除フラグ',
  `del_date` datetime DEFAULT NULL COMMENT '削除日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `karte`
--

CREATE TABLE `karte` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL COMMENT '顧客ID',
  `reservation_id` int(11) NOT NULL COMMENT '契約ID',
  `course_id` int(11) NOT NULL COMMENT 'コースID',
  `r_times` tinyint(4) NOT NULL COMMENT '役務消化回数',
  `shop_id` int(11) NOT NULL COMMENT '店舗ID',
  `name` varchar(63) NOT NULL COMMENT '名前',
  `hope_date` date NOT NULL COMMENT '予約希望日',
  `hope_time` tinyint(4) NOT NULL COMMENT '予約希望時間ID',
  `tstaff_id` int(11) NOT NULL COMMENT '施術主担当',
  `tstaff_sub1_id` int(11) NOT NULL COMMENT '施術サブ担当1',
  `tstaff_sub2_id` int(11) NOT NULL COMMENT '施術サブ担当2',
  `foot` varchar(63) NOT NULL COMMENT '脚の甲・指',
  `skin_status` varchar(63) NOT NULL COMMENT 'トリートメント後の肌状態',
  `allergy` varchar(63) NOT NULL COMMENT 'アレルギー',
  `shaving` tinyint(4) NOT NULL COMMENT '剃毛',
  `finger` varchar(31) NOT NULL COMMENT '手の指',
  `drug1` tinyint(4) NOT NULL COMMENT '薬服用1',
  `drug2` tinyint(4) NOT NULL COMMENT '薬服用2',
  `datumo_v` varchar(63) NOT NULL COMMENT 'V',
  `datumo_io` varchar(63) NOT NULL COMMENT 'IO',
  `neck` varchar(63) NOT NULL COMMENT 'うなじ',
  `skin` varchar(31) NOT NULL COMMENT '皮膚',
  `sunburn` tinyint(4) NOT NULL COMMENT '日焼け',
  `tattoo` varchar(31) NOT NULL COMMENT 'タトゥー',
  `effect` tinyint(4) NOT NULL COMMENT '効果実感',
  `report` text NOT NULL COMMENT '特記事項',
  `repeat_part` varchar(63) NOT NULL COMMENT '繰り越し部位',
  `hair_quality` tinyint(4) NOT NULL COMMENT '毛質',
  `hair_amount` tinyint(4) NOT NULL COMMENT '毛量',
  `memo` text NOT NULL COMMENT '備考',
  `shaving_stat` varchar(63) NOT NULL COMMENT 'シェービングの状態',
  `skin_color` tinyint(4) NOT NULL COMMENT '肌色_v2',
  `skin_type` tinyint(4) NOT NULL COMMENT '肌質_v2',
  `face` tinyint(4) NOT NULL COMMENT 'お顔_v2',
  `machine_main` varchar(63) NOT NULL COMMENT '施術機械（メイン）',
  `machine_sub` varchar(63) NOT NULL COMMENT '施術機械（サブ）',
  `neck_j` int(11) NOT NULL COMMENT 'うなじ_J_v2',
  `neck_p` int(11) NOT NULL,
  `neck_stat` varchar(63) NOT NULL,
  `vio_j` int(11) NOT NULL,
  `vio_p` int(11) NOT NULL,
  `vio_v_stat` varchar(63) NOT NULL,
  `vio_v_height` int(11) NOT NULL,
  `vio_v_width` int(11) NOT NULL,
  `vio_i_stat` varchar(31) NOT NULL,
  `vio_i_width` int(11) NOT NULL,
  `vio_o_stat` varchar(31) NOT NULL,
  `foot_j` int(11) NOT NULL,
  `foot_p` int(11) NOT NULL,
  `foot_stat` varchar(63) NOT NULL,
  `foot_toe` varchar(63) NOT NULL,
  `foot_nevus` varchar(63) NOT NULL,
  `foot_scar` varchar(63) NOT NULL,
  `foot_tattoo` varchar(63) NOT NULL,
  `arm_j` int(11) NOT NULL,
  `arm_p` int(11) NOT NULL,
  `arm_stat` varchar(63) NOT NULL,
  `arm_nevus` varchar(63) NOT NULL,
  `arm_scar` varchar(63) NOT NULL,
  `arm_tattoo` varchar(63) NOT NULL,
  `back_j` int(11) NOT NULL,
  `back_p` int(11) NOT NULL,
  `back_stat` varchar(63) NOT NULL,
  `back_nevus` varchar(63) NOT NULL,
  `back_scar` varchar(63) NOT NULL,
  `back_tattoo` varchar(63) NOT NULL,
  `stomach_j` int(11) NOT NULL,
  `stomach_p` int(11) NOT NULL,
  `stomach_stat` varchar(63) NOT NULL,
  `stomach_nevus` varchar(63) NOT NULL,
  `stomach_scar` varchar(63) NOT NULL,
  `stomach_tattoo` varchar(63) NOT NULL,
  `face_j` int(11) NOT NULL,
  `face_p` int(11) NOT NULL,
  `face_stat` varchar(63) NOT NULL,
  `buttocks_j` int(11) NOT NULL COMMENT 'ヒップ_J_v1',
  `buttocks_p` int(11) NOT NULL COMMENT 'ヒップ_plus_v1',
  `buttocks_stat` varchar(63) NOT NULL COMMENT 'ヒップ_状態_v1',
  `buttocks_nevus` varchar(63) NOT NULL COMMENT 'ヒップ 部位(アザ)',
  `buttocks_scar` varchar(63) NOT NULL COMMENT 'ヒップ 部位(傷)',
  `buttocks_tattoo` varchar(63) NOT NULL COMMENT 'ヒップ 部位(タトゥー)',
  `notice` text NOT NULL,
  `gel_type` tinyint(4) NOT NULL COMMENT 'ジェルの種類 1.スリム、2.美白',
  `repeat_part_chk` tinyint(4) NOT NULL,
  `repeat_part_memo` text NOT NULL,
  `communication` text NOT NULL,
  `karte_ver` tinyint(4) NOT NULL,
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `karte_c`
--

CREATE TABLE `karte_c` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `input_date` date NOT NULL,
  `name` varchar(63) NOT NULL,
  `feature` text NOT NULL,
  `need` text NOT NULL,
  `closing` text NOT NULL,
  `inspired` text NOT NULL COMMENT '脱毛しようと思ったきっかけ',
  `part_bothers` varchar(255) NOT NULL COMMENT '一番気になるパーツ',
  `hope_period` varchar(255) NOT NULL COMMENT '要望期間',
  `hope_budget` varchar(255) NOT NULL COMMENT '要望予算',
  `ideal_form` text NOT NULL COMMENT '理想・目標',
  `worry` text NOT NULL COMMENT 'お悩み',
  `memo` text NOT NULL,
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `k_cookie`
--

CREATE TABLE `k_cookie` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL COMMENT '顧客ID',
  `referer_url` text NOT NULL COMMENT '参照元',
  `adcode` int(11) NOT NULL COMMENT '広告ID',
  `first_date` datetime NOT NULL COMMENT '最初アクセス日',
  `edit_date` datetime NOT NULL COMMENT '最終アクセス日時',
  `reg_date` datetime NOT NULL COMMENT '登録日時',
  `cnt` int(11) NOT NULL COMMENT '回数',
  `cv_flg` tinyint(4) NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `k_organic_cookie`
--

CREATE TABLE `k_organic_cookie` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `referer_url` text NOT NULL COMMENT 'リファラーURL',
  `entrance_url` text NOT NULL COMMENT '入口URL',
  `adcode` int(11) NOT NULL,
  `first_date` datetime NOT NULL COMMENT '最初アクセス日時',
  `edit_date` datetime NOT NULL COMMENT '最後アクセス日時',
  `reg_date` datetime NOT NULL COMMENT '申込日時',
  `cnt` int(11) NOT NULL COMMENT 'アクセス回数',
  `lp_flg` tinyint(4) NOT NULL COMMENT 'LPフラグ',
  `cv_flg` tinyint(4) NOT NULL COMMENT '申込フラグ',
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `loan_bank`
--

CREATE TABLE `loan_bank` (
  `id` int(11) NOT NULL COMMENT '口座情報ID',
  `loan_info_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL COMMENT '会員ID',
  `bank_name` varchar(128) DEFAULT NULL COMMENT '銀行名 半角カナのみ',
  `bank_code` varchar(128) DEFAULT NULL COMMENT '銀行コード 半角数字のみ',
  `bank_branch` varchar(128) DEFAULT NULL COMMENT '支店名 半角カナのみ',
  `bank_branch_code` varchar(128) DEFAULT NULL COMMENT '支店コード 半角数字のみ',
  `bank_account_type` tinyint(4) DEFAULT '1' COMMENT '口座種別	 1-普通, 2-当座, 3-貯蓄',
  `bank_account_no` varchar(7) DEFAULT NULL COMMENT '口座番号	 半角数字のみ 7桁番号 通常は頭を0埋めする',
  `bank_account_name` varchar(128) DEFAULT NULL COMMENT '口座名義 半角カナのみ',
  `reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
  `edit_date` datetime NOT NULL COMMENT '更新日時',
  `del_flg` tinyint(4) NOT NULL COMMENT '削除フラグ	 1-削除',
  `ng_flg` tinyint(4) NOT NULL COMMENT 'NGフラグ	 1-NG',
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ローン支払用口座情報';

-- --------------------------------------------------------

--
-- テーブルの構造 `loan_company`
--

CREATE TABLE `loan_company` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL COMMENT 'ローン会社名',
  `status` tinyint(4) NOT NULL COMMENT '1.無効2.有効',
  `rank` tinyint(4) NOT NULL DEFAULT '99' COMMENT '表示順位',
  `del_flg` tinyint(4) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `loan_contact`
--

CREATE TABLE `loan_contact` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT '顧客ID',
  `temp_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'テンプレートID',
  `content` text NOT NULL COMMENT '連絡内容',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '表示On・Off',
  `del_flg` tinyint(4) NOT NULL DEFAULT '0',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ローン用連絡板';

-- --------------------------------------------------------

--
-- テーブルの構造 `loan_info`
--

CREATE TABLE `loan_info` (
  `id` int(11) NOT NULL,
  `recept_no` int(11) DEFAULT NULL COMMENT '受付番号',
  `loan_contract_no` varchar(15) NOT NULL COMMENT '契約番号',
  `loan_contract_date` date DEFAULT NULL COMMENT 'ローン契約日',
  `contract_date` date NOT NULL COMMENT 'エステ契約日',
  `end_date` date NOT NULL COMMENT 'エステ契約終了日',
  `return_date` date NOT NULL COMMENT '自動解約復帰日',
  `loan_end_date` date DEFAULT NULL COMMENT '契約終了日',
  `customer_id` int(11) NOT NULL COMMENT '顧客ID',
  `pw` varchar(127) NOT NULL,
  `no` varchar(31) NOT NULL COMMENT '会員番号',
  `contract_id` int(11) NOT NULL COMMENT '契約ID',
  `contract_status` tinyint(4) NOT NULL COMMENT 'ステータス',
  `accept_category` tinyint(4) NOT NULL COMMENT '承認区分',
  `process_category` tinyint(4) NOT NULL COMMENT '契約終了区分',
  `regist_category` tinyint(4) NOT NULL COMMENT '受付終了区分',
  `consent_or_income` tinyint(4) NOT NULL COMMENT '同意書or年収変更',
  `consent_recovery` tinyint(4) NOT NULL COMMENT '同意書リカバー',
  `special_rating` tinyint(4) NOT NULL COMMENT '特別承認評価',
  `support_status` tinyint(4) NOT NULL COMMENT '督促',
  `application_date` date DEFAULT NULL COMMENT '申込日',
  `name` varchar(63) NOT NULL COMMENT '氏名',
  `name_kana` varchar(11) NOT NULL COMMENT 'フリガナ',
  `sex` tinyint(4) NOT NULL COMMENT '性別',
  `birthday` date DEFAULT NULL COMMENT '生年月日',
  `tel` varchar(63) NOT NULL COMMENT '電話番号',
  `home_tel` varchar(31) NOT NULL COMMENT '自宅電話番号',
  `mail` varchar(63) NOT NULL COMMENT 'メールアドレス',
  `zip` varchar(11) NOT NULL COMMENT '郵便番号',
  `pref` tinyint(4) DEFAULT NULL COMMENT '都道府県',
  `address` varchar(255) NOT NULL COMMENT '住所',
  `course_id` mediumint(11) NOT NULL COMMENT 'コースID',
  `shop_id` int(11) NOT NULL COMMENT '店舗ID',
  `staff_id` int(11) NOT NULL COMMENT '担当者ID',
  `loan_company_id` int(11) NOT NULL COMMENT 'ローン会社ID',
  `product` varchar(31) NOT NULL COMMENT '申込商品',
  `product_times` varchar(15) NOT NULL COMMENT 'コース回数',
  `price` int(11) NOT NULL COMMENT '商品金額(値引後)',
  `initial_payment` int(11) NOT NULL COMMENT '頭金(売掛含)',
  `amount` int(11) NOT NULL COMMENT '申込金額',
  `number_of_payments` tinyint(4) NOT NULL COMMENT '支払回数',
  `total_installment_commission` int(11) NOT NULL COMMENT '分割手数料合計',
  `amount_of_installments` int(11) NOT NULL COMMENT '分割支払金合計',
  `installment_amount_1st` int(11) NOT NULL COMMENT '第１回支払額',
  `installment_amount_2nd` int(11) NOT NULL COMMENT '第２回支払額',
  `annual_amount` int(11) NOT NULL COMMENT '年間請求予定額',
  `installment_commission` int(11) NOT NULL COMMENT '手数料/回',
  `appropriation_principal_1st` int(11) NOT NULL COMMENT '第1回充当元金',
  `appropriation_principal_2nd` int(11) NOT NULL COMMENT '第2回充当元金',
  `first_payment_year` int(4) DEFAULT NULL COMMENT '支払初月(年)',
  `first_payment_month` int(2) DEFAULT NULL COMMENT '支払初月(月)',
  `expected_end_year` varchar(4) NOT NULL COMMENT '支払終了予定年月(年)',
  `expected_end_month` varchar(2) NOT NULL COMMENT '支払終了予定年月(月)',
  `expected_end_date` date DEFAULT NULL COMMENT '契約終了予定日(未使用)',
  `asp_start_year` int(4) DEFAULT NULL COMMENT 'ASP開始月(年)',
  `asp_start_month` int(2) DEFAULT NULL COMMENT 'ASP開始月(月)',
  `identification_type` tinyint(4) NOT NULL COMMENT '本人確認書類',
  `identification_number` varchar(63) NOT NULL COMMENT '運転免許証番号',
  `payment_lent` tinyint(4) NOT NULL COMMENT '家賃負担',
  `same_living_count` tinyint(4) NOT NULL COMMENT '同一生計人数',
  `annual_income` int(4) NOT NULL COMMENT '年収',
  `claim_irregular` varchar(255) NOT NULL COMMENT '請求･入金ｲﾚｷﾞｭﾗｰ',
  `memo` text NOT NULL COMMENT '備考',
  `history` text NOT NULL COMMENT '架電・対応履歴・内容',
  `transfer_mailing_date` date DEFAULT NULL COMMENT '口振依頼書 みずほへの発送済日',
  `transfer_status` varchar(4) NOT NULL COMMENT '支払方法',
  `withdrawal_status` tinyint(4) NOT NULL COMMENT '自動引落属性',
  `transfer_attribute` tinyint(4) NOT NULL COMMENT '振込属性',
  `unable_appointment_status` tinyint(4) NOT NULL COMMENT '予約不可状況',
  `datetime` datetime DEFAULT NULL COMMENT '年月日・時間',
  `accepted_date` date DEFAULT NULL COMMENT '本承認年月日',
  `house_type` tinyint(4) NOT NULL COMMENT 'お住まい',
  `living_grant` tinyint(4) NOT NULL COMMENT '生活費の援助',
  `cor_request` tinyint(4) NOT NULL COMMENT '対応依頼',
  `debt` int(11) NOT NULL COMMENT '借入金',
  `credit_app_agree` tinyint(4) NOT NULL,
  `privacy_agree` int(11) NOT NULL,
  `call_timezone` tinyint(4) NOT NULL COMMENT '電話連絡可能時間帯',
  `verify_datetime_date1` date DEFAULT NULL COMMENT 'ベリファイ日時1_日',
  `verify_datetime_time1` varchar(7) NOT NULL COMMENT 'ベリファイ日時1_時',
  `verify_datetime_date2` date DEFAULT NULL COMMENT 'ベリファイ日時2_日',
  `verify_datetime_time2` varchar(7) NOT NULL COMMENT 'ベリファイ日時2_時',
  `verify_datetime_date3` date DEFAULT NULL COMMENT 'ベリファイ日時3_日',
  `verify_datetime_time3` varchar(7) NOT NULL COMMENT 'ベリファイ日時3_時',
  `verify_status` tinyint(4) NOT NULL COMMENT 'ベリファイ確認状況1.確認中2.確認済',
  `verify_complete_datetime` datetime DEFAULT NULL COMMENT 'ベリファイ確認済日時',
  `prepaid` int(11) NOT NULL COMMENT '既払金',
  `cancel_process_status` tinyint(4) NOT NULL COMMENT '解約処理ｽﾃｰﾀｽ',
  `cancel_process_date` datetime NOT NULL COMMENT '解約処理日時',
  `auto_cancle_date` date NOT NULL COMMENT '自動解約日１',
  `auto_cancle_date2` date NOT NULL COMMENT '自動解約日２',
  `complete_flg` tinyint(4) NOT NULL COMMENT '完全完了フラグ',
  `eva_flg` tinyint(4) NOT NULL COMMENT '優良評価フラグ',
  `apl_flg` tinyint(4) NOT NULL COMMENT '申込完了フラグ',
  `del_flg` int(11) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='サクシード申込';

-- --------------------------------------------------------

--
-- テーブルの構造 `loan_info2`
--

CREATE TABLE `loan_info2` (
  `id` int(11) NOT NULL,
  `apl_id` int(32) NOT NULL COMMENT '申込ID',
  `customer_id` int(11) NOT NULL COMMENT '顧客ID',
  `contract_id` int(11) NOT NULL COMMENT '契約ID',
  `course_id` varchar(63) NOT NULL,
  `name` varchar(63) NOT NULL COMMENT '名前',
  `name_kana` varchar(11) NOT NULL COMMENT 'ナマエ(カナ)',
  `zip` varchar(11) NOT NULL COMMENT '郵便番号',
  `pref` tinyint(4) DEFAULT NULL COMMENT '都道府県',
  `address` varchar(255) NOT NULL COMMENT '住所',
  `mail` varchar(63) NOT NULL COMMENT 'メールアドレス',
  `home_tel` int(31) NOT NULL COMMENT '自宅電話番号',
  `tel` varchar(63) NOT NULL COMMENT '電話番号',
  `birthday` date DEFAULT NULL COMMENT '生年月日',
  `sex` tinyint(4) NOT NULL COMMENT '0.Lady1.Mens',
  `spouse` tinyint(4) NOT NULL COMMENT '配偶者の有無',
  `main_prvd` tinyint(4) NOT NULL COMMENT '生計費負担者:1.申込者2.配偶者3.親(同居)4.親(別居)5.子(同居)6.他',
  `housing` tinyint(4) NOT NULL COMMENT '住居:1.自己所有2.家族所有3.賃貸4.社宅・寮・その他',
  `veri_occasion` int(11) NOT NULL COMMENT '仕事:1.103万以上2.103万以下3.学生',
  `loan_company_id` int(11) NOT NULL COMMENT 'ローン会社ID',
  `loan_contract_no` varchar(15) NOT NULL COMMENT 'ローン契約番号',
  `loan_contract_date` date DEFAULT NULL COMMENT 'ローン契約日',
  `loan_end_date` date DEFAULT NULL COMMENT '契約終了日',
  `shop_id` int(11) NOT NULL COMMENT '申込店舗ID',
  `staff_id` int(11) NOT NULL COMMENT '担当者ID',
  `application_date` date DEFAULT NULL COMMENT '申込日',
  `product` varchar(127) NOT NULL COMMENT '商品名',
  `initial_payment` int(11) NOT NULL COMMENT '頭金',
  `amount` int(11) NOT NULL COMMENT '申込金額',
  `number_of_payments` tinyint(4) NOT NULL COMMENT '支払回数',
  `first_payment_year` int(4) DEFAULT NULL COMMENT '支払開始年',
  `first_payment_month` int(2) DEFAULT NULL COMMENT '支払開始月',
  `expected_end_year` varchar(4) NOT NULL COMMENT '支払終了予定年',
  `expected_end_month` varchar(2) NOT NULL COMMENT '支払終了予定月',
  `transfer_status` varchar(4) NOT NULL COMMENT '支払方法',
  `total_installment_commission` int(11) NOT NULL COMMENT '分割払手数料',
  `amount_of_installments` int(11) NOT NULL COMMENT '分割支払金合計',
  `installment_amount_1st` int(11) NOT NULL COMMENT '第１回支払額',
  `installment_amount_2nd` int(11) NOT NULL COMMENT '第２回支払額',
  `total_payments` int(11) NOT NULL COMMENT '支払総額',
  `annual_amount` int(11) NOT NULL COMMENT '年間請求予定額',
  `contract_status` tinyint(4) NOT NULL COMMENT 'ローン契約ステータス',
  `support_status` tinyint(4) NOT NULL COMMENT '督促',
  `accept_category` tinyint(4) NOT NULL COMMENT '承認区分',
  `special_rating` tinyint(4) NOT NULL COMMENT '特別承認評価',
  `debt` int(11) NOT NULL COMMENT '借入金',
  `process_category` tinyint(4) NOT NULL COMMENT '契約終了区分',
  `regist_category` tinyint(4) NOT NULL COMMENT '受付終了区分：1.申込2.受付3.決済処理中4.完了5.SMBC->NG6.案内メール済7.再メール送信済8.再々メール送信済',
  `eval_status` tinyint(4) NOT NULL COMMENT '審査ステータス：1.未処理2.審査中3.本人確認中4.承認済5.否決',
  `sum_up` tinyint(4) NOT NULL COMMENT '集計フラグ：1.集計済',
  `re_mail_date` datetime DEFAULT NULL COMMENT 'メール再送信日時',
  `re_re_mail_date` datetime DEFAULT NULL COMMENT 'メール再々送信日時',
  `deal_date` datetime DEFAULT NULL COMMENT '処理日時',
  `addm_no` varchar(31) NOT NULL COMMENT '承認番号',
  `addm_date` date DEFAULT NULL COMMENT '承認日',
  `shop_cancel` tinyint(4) NOT NULL COMMENT '店舗キャンセル：1.キャンセル',
  `own_cancel` tinyint(4) NOT NULL COMMENT '信販会社キャンセル',
  `last_update` datetime DEFAULT NULL COMMENT '最終更新日時',
  `update_name` varchar(63) NOT NULL COMMENT '最終更新者名',
  `memo` text NOT NULL COMMENT '備考',
  `history` text NOT NULL COMMENT '架電・対応履歴・内容',
  `service_start` date DEFAULT NULL COMMENT '役務期間（自）',
  `service_end` date DEFAULT NULL COMMENT '役務期間（至）',
  `save_amount` int(11) NOT NULL COMMENT '預貯金額',
  `side_job` tinyint(4) NOT NULL COMMENT '副収入種別',
  `side_income` int(11) NOT NULL COMMENT '副収入の年額 ',
  `payment_lent` tinyint(4) NOT NULL COMMENT '家賃負担',
  `update_end_flg` tinyint(4) NOT NULL COMMENT 'データ更新終了フラグ',
  `apl_flg` tinyint(4) NOT NULL COMMENT 'ローン申込み完了フラグ',
  `del_flg` int(11) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ライフティ申込';

-- --------------------------------------------------------

--
-- テーブルの構造 `loan_info3`
--

CREATE TABLE `loan_info3` (
  `id` int(11) NOT NULL,
  `apl_id` int(32) NOT NULL COMMENT '申込ID',
  `customer_id` int(11) NOT NULL COMMENT '顧客ID',
  `contract_id` int(11) NOT NULL COMMENT '契約ID',
  `course_id` varchar(63) NOT NULL,
  `name` varchar(63) NOT NULL COMMENT '名前',
  `name_kana` varchar(11) NOT NULL COMMENT 'ナマエ(カナ)',
  `zip` varchar(11) NOT NULL COMMENT '郵便番号',
  `pref` tinyint(4) DEFAULT NULL COMMENT '都道府県',
  `address` varchar(255) NOT NULL COMMENT '住所',
  `mail` varchar(63) NOT NULL COMMENT 'メールアドレス',
  `home_tel` int(31) NOT NULL COMMENT '自宅電話番号',
  `tel` varchar(63) NOT NULL COMMENT '電話番号',
  `birthday` date DEFAULT NULL COMMENT '生年月日',
  `sex` tinyint(4) NOT NULL COMMENT '0.Lady1.Mens',
  `spouse` tinyint(4) NOT NULL COMMENT '配偶者の有無',
  `main_prvd` tinyint(4) NOT NULL COMMENT '生計費負担者:1.申込者2.配偶者3.親(同居)4.親(別居)5.子(同居)6.他',
  `housing` tinyint(4) NOT NULL COMMENT '住居:1.自己所有2.家族所有3.賃貸4.社宅・寮・その他',
  `veri_occasion` int(11) NOT NULL COMMENT '仕事:1.103万以上2.103万以下3.学生',
  `loan_company_id` int(11) NOT NULL COMMENT 'ローン会社ID',
  `loan_contract_no` varchar(15) NOT NULL COMMENT 'ローン契約番号',
  `loan_contract_date` date DEFAULT NULL COMMENT 'ローン契約日',
  `loan_end_date` date DEFAULT NULL COMMENT '契約終了日',
  `shop_id` int(11) NOT NULL COMMENT '申込店舗ID',
  `staff_id` int(11) NOT NULL COMMENT '担当者ID',
  `application_date` date DEFAULT NULL COMMENT '申込日',
  `product` varchar(127) NOT NULL COMMENT '商品名',
  `initial_payment` int(11) NOT NULL COMMENT '頭金',
  `amount` int(11) NOT NULL COMMENT '申込金額',
  `number_of_payments` tinyint(4) NOT NULL COMMENT '支払回数',
  `first_payment_year` int(4) DEFAULT NULL COMMENT '支払開始年',
  `first_payment_month` int(2) DEFAULT NULL COMMENT '支払開始月',
  `expected_end_year` varchar(4) NOT NULL COMMENT '支払終了予定年',
  `expected_end_month` varchar(2) NOT NULL COMMENT '支払終了予定月',
  `transfer_status` varchar(4) NOT NULL COMMENT '支払方法',
  `total_installment_commission` int(11) NOT NULL COMMENT '分割払手数料',
  `amount_of_installments` int(11) NOT NULL COMMENT '分割支払金合計',
  `installment_amount_1st` int(11) NOT NULL COMMENT '第１回支払額',
  `installment_amount_2nd` int(11) NOT NULL COMMENT '第２回支払額',
  `total_payments` int(11) NOT NULL COMMENT '支払総額',
  `annual_amount` int(11) NOT NULL COMMENT '年間請求予定額',
  `contract_status` tinyint(4) NOT NULL COMMENT 'ローン契約ステータス',
  `support_status` tinyint(4) NOT NULL COMMENT '督促',
  `accept_category` tinyint(4) NOT NULL COMMENT '承認区分',
  `special_rating` tinyint(4) NOT NULL COMMENT '特別承認評価',
  `debt` int(11) NOT NULL COMMENT '借入金',
  `process_category` tinyint(4) NOT NULL COMMENT '契約終了区分',
  `regist_category` tinyint(4) NOT NULL COMMENT '受付ステータス：1.申込2.受付3.決済処理中4.完了5.SMBC->NG6.案内メール済7.再メール送信済8.再々メール送信済',
  `eval_status` tinyint(4) NOT NULL COMMENT '審査ステータス：1.未処理2.審査中3.本人確認中4.承認済5.否決',
  `sum_up` tinyint(4) NOT NULL COMMENT '集計フラグ：1.集計済',
  `re_mail_date` datetime DEFAULT NULL COMMENT 'メール再送信日時',
  `re_re_mail_date` datetime DEFAULT NULL COMMENT 'メール再々送信日時',
  `deal_date` datetime DEFAULT NULL COMMENT '処理日時',
  `addm_no` varchar(31) NOT NULL COMMENT '承認番号',
  `addm_date` date DEFAULT NULL COMMENT '承認日',
  `shop_cancel` tinyint(4) NOT NULL COMMENT '店舗キャンセル：1.キャンセル',
  `own_cancel` tinyint(4) NOT NULL COMMENT '信販会社キャンセル',
  `last_update` datetime DEFAULT NULL COMMENT '最終更新日時',
  `update_name` varchar(63) NOT NULL COMMENT '最終更新者名',
  `memo` text NOT NULL COMMENT '備考',
  `history` text NOT NULL COMMENT '架電・対応履歴・内容',
  `service_start` date DEFAULT NULL COMMENT '役務期間（自）',
  `service_end` date DEFAULT NULL COMMENT '役務期間（至）',
  `save_amount` int(11) NOT NULL COMMENT '預貯金額',
  `side_job` tinyint(4) NOT NULL COMMENT '副収入種別',
  `side_income` int(11) NOT NULL COMMENT '副収入の年額 ',
  `payment_lent` tinyint(4) NOT NULL COMMENT '家賃負担',
  `update_end_flg` tinyint(4) NOT NULL COMMENT 'データ更新終了フラグ',
  `del_flg` int(11) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ライフティ申込';

-- --------------------------------------------------------

--
-- テーブルの構造 `loan_info_old`
--

CREATE TABLE `loan_info_old` (
  `id` int(11) NOT NULL,
  `recept_no` int(11) DEFAULT NULL COMMENT '受付番号',
  `loan_contract_no` varchar(15) NOT NULL COMMENT '契約番号',
  `loan_contract_date` date DEFAULT NULL COMMENT '契約日',
  `loan_end_date` date DEFAULT NULL COMMENT '契約終了日',
  `customer_id` int(11) NOT NULL COMMENT '顧客ID',
  `contract_id` int(11) NOT NULL COMMENT '契約ID',
  `contract_status` tinyint(4) NOT NULL COMMENT 'ステータス',
  `accept_category` tinyint(4) NOT NULL COMMENT '承認区分',
  `process_category` tinyint(4) NOT NULL COMMENT '契約終了区分',
  `regist_category` tinyint(4) NOT NULL COMMENT '受付終了区分',
  `consent_or_income` tinyint(4) NOT NULL COMMENT '同意書or年収変更',
  `consent_recovery` tinyint(4) NOT NULL COMMENT '同意書リカバー',
  `special_rating` tinyint(4) NOT NULL COMMENT '特別承認評価',
  `support_status` tinyint(4) NOT NULL COMMENT '督促',
  `application_date` date DEFAULT NULL COMMENT '申込日',
  `name` varchar(63) NOT NULL COMMENT '氏名',
  `name_kana` varchar(11) NOT NULL COMMENT 'フリガナ',
  `sex` tinyint(4) NOT NULL COMMENT '性別',
  `birthday` date DEFAULT NULL COMMENT '生年月日',
  `tel` varchar(63) NOT NULL COMMENT '電話番号',
  `mail` varchar(63) NOT NULL COMMENT 'メールアドレス',
  `zip` varchar(11) NOT NULL COMMENT '郵便番号',
  `pref` tinyint(4) DEFAULT NULL COMMENT '都道府県',
  `address` varchar(255) NOT NULL COMMENT '住所',
  `course_id` mediumint(11) NOT NULL COMMENT 'コースID',
  `shop_id` int(11) NOT NULL COMMENT '店舗ID',
  `staff_id` int(11) NOT NULL COMMENT '担当者ID',
  `loan_company_id` int(11) NOT NULL COMMENT 'ローン会社ID',
  `product` varchar(31) NOT NULL COMMENT '申込商品',
  `product_times` varchar(15) NOT NULL COMMENT 'コース回数',
  `amount` int(11) NOT NULL COMMENT '申込金額',
  `number_of_payments` tinyint(4) NOT NULL COMMENT '支払回数',
  `total_installment_commission` int(11) NOT NULL COMMENT '分割手数料合計',
  `amount_of_installments` int(11) NOT NULL COMMENT '分割支払金合計',
  `installment_amount_1st` int(11) NOT NULL COMMENT '第１回支払額',
  `installment_amount_2nd` int(11) NOT NULL COMMENT '第２回支払額',
  `annual_amount` int(11) NOT NULL COMMENT '年間請求予定額',
  `installment_commission` int(11) NOT NULL COMMENT '手数料/回',
  `appropriation_principal_1st` int(11) NOT NULL COMMENT '第1回充当元金',
  `appropriation_principal_2nd` int(11) NOT NULL COMMENT '第2回充当元金',
  `expected_end_date` date DEFAULT NULL COMMENT '契約終了予定日',
  `expected_end_year` varchar(4) NOT NULL COMMENT '契約終了予定日(年)',
  `expected_end_month` varchar(2) NOT NULL COMMENT '契約終了予定日(月)',
  `first_payment_year` int(4) DEFAULT NULL COMMENT '支払開始年',
  `first_payment_month` int(2) DEFAULT NULL COMMENT '支払開始月',
  `asp_start_year` int(4) DEFAULT NULL COMMENT 'ＡＳＰ開始月年',
  `asp_start_month` int(2) DEFAULT NULL COMMENT '契約終了予定日(月)',
  `identification_type` tinyint(4) NOT NULL COMMENT '本人確認書類',
  `identification_number` varchar(63) NOT NULL COMMENT '運転免許証番号',
  `payment_lent` tinyint(4) NOT NULL COMMENT '家賃負担',
  `same_living_count` tinyint(4) NOT NULL COMMENT '同一生計人数',
  `annual_income` int(4) NOT NULL COMMENT '年収',
  `claim_irregular` varchar(255) NOT NULL COMMENT '請求･入金ｲﾚｷﾞｭﾗｰ',
  `memo` text NOT NULL COMMENT '備考',
  `history` text NOT NULL COMMENT '架電・対応履歴・内容',
  `transfer_mailing_date` date DEFAULT NULL COMMENT '口振依頼書 みずほへの発送済日',
  `transfer_status` varchar(4) NOT NULL COMMENT '支払方法',
  `withdrawal_status` tinyint(4) NOT NULL COMMENT '自動引落属性',
  `transfer_attribute` tinyint(4) NOT NULL COMMENT '振込属性',
  `unable_appointment_status` tinyint(4) NOT NULL COMMENT '予約不可状況',
  `datetime` datetime DEFAULT NULL COMMENT '年月日・時間',
  `accepted_date` date DEFAULT NULL COMMENT '本承認年月日',
  `house_type` tinyint(4) NOT NULL COMMENT 'お住まい',
  `living_grant` tinyint(4) NOT NULL COMMENT '生活費の援助',
  `cor_request` tinyint(4) NOT NULL COMMENT '対応依頼',
  `debt` int(11) NOT NULL COMMENT '借入金',
  `credit_app_agree` tinyint(4) NOT NULL,
  `privacy_agree` int(11) NOT NULL,
  `call_timezone` tinyint(4) NOT NULL COMMENT '電話連絡可能時間帯',
  `verify_datetime_date1` date DEFAULT NULL COMMENT 'ベリファイ日時1_日',
  `verify_datetime_time1` varchar(7) NOT NULL COMMENT 'ベリファイ日時1_時',
  `verify_datetime_date2` date DEFAULT NULL COMMENT 'ベリファイ日時2_日',
  `verify_datetime_time2` varchar(7) NOT NULL COMMENT 'ベリファイ日時2_時',
  `verify_datetime_date3` date DEFAULT NULL COMMENT 'ベリファイ日時3_日',
  `verify_datetime_time3` varchar(7) NOT NULL COMMENT 'ベリファイ日時3_時',
  `verify_status` tinyint(4) NOT NULL COMMENT 'ベリファイ確認状況1.確認中2.確認済',
  `verify_complete_datetime` datetime DEFAULT NULL COMMENT 'ベリファイ確認済日時',
  `del_flg` int(11) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='サクシードローン(旧)';

-- --------------------------------------------------------

--
-- テーブルの構造 `loan_log`
--

CREATE TABLE `loan_log` (
  `id` int(11) NOT NULL,
  `login_id` varchar(63) NOT NULL,
  `login_pw` varchar(63) NOT NULL,
  `result` varchar(63) NOT NULL,
  `ip_addr` varchar(31) NOT NULL,
  `mo_agent` tinyint(4) NOT NULL,
  `user_agent` text NOT NULL,
  `access_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `loan_pay_date`
--

CREATE TABLE `loan_pay_date` (
  `id` int(11) NOT NULL,
  `payment_year` int(4) NOT NULL COMMENT '支払予定年',
  `payment_month` int(2) NOT NULL COMMENT '支払予定月',
  `payment_day` int(2) NOT NULL COMMENT '支払予定日'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `loan_template`
--

CREATE TABLE `loan_template` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `del_flg` tinyint(4) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `lock_customer`
--

CREATE TABLE `lock_customer` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL COMMENT '顧客ID',
  `count` tinyint(4) NOT NULL COMMENT 'ログイン失敗回数',
  `last_fail_time` datetime NOT NULL COMMENT '最終ログイン失敗日時',
  `reg_date` datetime NOT NULL COMMENT '登録日時',
  `edit_date` datetime NOT NULL COMMENT '更新日時',
  `del_flg` tinyint(4) NOT NULL COMMENT '削除フラグ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `loginlog`
--

CREATE TABLE `loginlog` (
  `customer_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'customerテーブルのID',
  `login_datetime` datetime NOT NULL,
  `user_agent` text NOT NULL,
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `del_flg` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1.論理削除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `log_export`
--

CREATE TABLE `log_export` (
  `id` int(11) NOT NULL,
  `login_id` varchar(63) NOT NULL,
  `login_pw` varchar(63) NOT NULL,
  `csv_pw` varchar(63) NOT NULL,
  `file_name` varchar(63) NOT NULL,
  `ip_addr` varchar(31) NOT NULL,
  `mo_agent` tinyint(4) NOT NULL,
  `mo_id` tinyint(4) NOT NULL,
  `user_agent` text NOT NULL,
  `access_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `lotteries`
--

CREATE TABLE `lotteries` (
  `id` int(11) NOT NULL,
  `lottery_list` varchar(30) DEFAULT NULL,
  `lottery_flg` int(11) NOT NULL,
  `delete_flg` int(19) DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `lottery_prizes`
--

CREATE TABLE `lottery_prizes` (
  `id` int(11) NOT NULL,
  `prize_list` varchar(30) DEFAULT NULL,
  `lottery_id` int(11) NOT NULL,
  `item_stock` int(11) NOT NULL,
  `result_url` varchar(30) DEFAULT NULL,
  `prize_rank` int(11) NOT NULL,
  `mail_send_flg` int(11) NOT NULL,
  `unlimited_item_flg` int(11) NOT NULL,
  `delete_flg` int(19) DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `lottery_results`
--

CREATE TABLE `lottery_results` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `global_ip` varchar(16) DEFAULT NULL,
  `lottery_date` datetime DEFAULT '0000-00-00 00:00:00',
  `delete_flg` int(19) DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `lottery_urls`
--

CREATE TABLE `lottery_urls` (
  `id` int(11) NOT NULL,
  `lottery_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `delete_flg` int(19) DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `mail_history`
--

CREATE TABLE `mail_history` (
  `id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `scenario_id` int(11) NOT NULL,
  `sender` varchar(63) NOT NULL,
  `title` varchar(255) NOT NULL,
  `header` text NOT NULL,
  `body` text NOT NULL,
  `footer` text NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `plan_date` datetime NOT NULL,
  `status` varchar(63) NOT NULL,
  `mo_agent` varchar(63) NOT NULL,
  `format` tinyint(1) NOT NULL,
  `total` int(11) NOT NULL,
  `success_cnt` int(11) NOT NULL,
  `err_cnt` int(11) NOT NULL,
  `sent_flg` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `mail_member`
--

CREATE TABLE `mail_member` (
  `id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `mail` varchar(127) NOT NULL,
  `mo_agent` tinyint(4) NOT NULL,
  `adcode` varchar(127) NOT NULL,
  `mo_id` tinyint(4) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `referer_url` text NOT NULL,
  `user_agent` text NOT NULL,
  `reg_date` datetime NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `mail_scenario_data`
--

CREATE TABLE `mail_scenario_data` (
  `id` int(11) NOT NULL,
  `scenario_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `mo_agent` tinyint(1) NOT NULL,
  `date` datetime NOT NULL,
  `err_flg` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `mail_scenario_info`
--

CREATE TABLE `mail_scenario_info` (
  `id` int(11) NOT NULL,
  `name` varchar(63) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `genre` tinyint(1) NOT NULL,
  `total` tinyint(1) NOT NULL,
  `memo` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `mail_template`
--

CREATE TABLE `mail_template` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `header` text NOT NULL,
  `body` text NOT NULL,
  `footer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `pid` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `authority` tinyint(1) NOT NULL,
  `onclick` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '99'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- ビュー用の代替構造 `moto`
-- (実際のビューを参照するには下にあります)
--
CREATE TABLE `moto` (
`moto_id` int(11)
,`moto_no` varchar(11)
,`moto_name` varchar(63)
,`moto_name_kana` varchar(63)
,`moto_tel` varchar(63)
,`moto_mail` varchar(63)
,`moto_contract_status` int(11)
,`moto_contract_shop_id` int(11)
,`moto_contract_course_id` int(11)
,`moto_contract_latest_date` date
,`moto_contract_r_times` tinyint(4)
,`moto_contract_date` date
,`moto_bank_name` varchar(128)
,`moto_bank_branch` varchar(128)
,`moto_bank_account_type` tinyint(4)
,`moto_bank_account_no` varchar(7)
,`moto_bank_account_name` varchar(128)
,`moto_bank_status` tinyint(4)
);

-- --------------------------------------------------------

--
-- テーブルの構造 `muryou_customer`
--

CREATE TABLE `muryou_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(63) NOT NULL,
  `name_kana` varchar(63) NOT NULL,
  `birthday` date NOT NULL,
  `age` varchar(11) NOT NULL,
  `sex` tinyint(4) NOT NULL,
  `zip` varchar(11) NOT NULL,
  `pref` tinyint(4) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mail` varchar(63) NOT NULL,
  `tel` varchar(63) NOT NULL,
  `facebook` varchar(127) NOT NULL,
  `present` varchar(127) NOT NULL,
  `mo_agent` tinyint(4) NOT NULL,
  `adcode` varchar(127) NOT NULL,
  `mo_id` tinyint(4) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `referer_url` text NOT NULL,
  `user_agent` text NOT NULL,
  `reg_flg` tinyint(4) NOT NULL,
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `m_ad`
--

CREATE TABLE `m_ad` (
  `request_id` int(11) NOT NULL,
  `ad_group` tinyint(4) NOT NULL COMMENT '1.アフィリエイト2.リスティング3.ブログ99その他',
  `name` varchar(63) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1.予約2.来店3.固定',
  `edit_date` datetime NOT NULL,
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `ngtelnum`
--

CREATE TABLE `ngtelnum` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `ngword`
--

CREATE TABLE `ngword` (
  `id` int(11) NOT NULL,
  `name` varchar(63) NOT NULL COMMENT 'NGキーワード',
  `status` tinyint(1) NOT NULL COMMENT '0.稼働1.非稼働',
  `type` tinyint(1) NOT NULL COMMENT '1.名前2.名前かな3.メール4.電話'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `partner`
--

CREATE TABLE `partner` (
  `id` int(11) NOT NULL,
  `code` varchar(11) NOT NULL COMMENT '企業コード',
  `name` varchar(63) NOT NULL COMMENT '企業名',
  `status` tinyint(4) NOT NULL COMMENT '表示状態',
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `pay_monthly`
--

CREATE TABLE `pay_monthly` (
  `id` int(11) NOT NULL,
  `title` varchar(127) NOT NULL,
  `option_date` date NOT NULL,
  `pay_date` date NOT NULL,
  `pay_type` tinyint(4) NOT NULL,
  `no` varchar(63) NOT NULL,
  `name` varchar(63) NOT NULL,
  `card_name` varchar(31) NOT NULL,
  `card_no` varchar(7) NOT NULL,
  `payment` int(11) NOT NULL,
  `result` tinyint(4) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(63) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `existed_flg` tinyint(4) NOT NULL,
  `success_flg` tinyint(4) NOT NULL,
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `posi_salary`
--

CREATE TABLE `posi_salary` (
  `id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '2',
  `position` tinyint(4) NOT NULL COMMENT '役職',
  `name` varchar(31) NOT NULL COMMENT '役職名',
  `base_salary` int(11) NOT NULL COMMENT '基本給',
  `allowance` int(11) NOT NULL COMMENT '手当',
  `del_flg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `prefectures`
--

CREATE TABLE `prefectures` (
  `id` int(2) NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL COMMENT '商品ID',
  `name` varchar(255) NOT NULL COMMENT '商品名',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '公開・非公開1.非公開、2.公開',
  `rank` tinyint(4) NOT NULL COMMENT '表示順位',
  `base_price` int(11) NOT NULL COMMENT '本体価格（税抜）',
  `main_category` tinyint(4) NOT NULL COMMENT '大カテゴリ1.化粧品',
  `sub_category` tinyint(4) NOT NULL COMMENT '中カテゴリ1.スキンケア・基礎化粧品、2.ボディケア',
  `child_sub_category` tinyint(4) NOT NULL COMMENT '小カテゴリcategory2=(1.化粧水) category2=2(1..ボディクリーム)',
  `start_date` datetime NOT NULL COMMENT '発売日',
  `end_date` datetime DEFAULT NULL COMMENT '終了日',
  `reg_date` datetime NOT NULL COMMENT '登録日時',
  `edit_date` datetime NOT NULL COMMENT '編集日時',
  `del_flg` tinyint(4) NOT NULL DEFAULT '0' COMMENT '削除フラグ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物販商品';

-- --------------------------------------------------------

--
-- テーブルの構造 `product_stock`
--

CREATE TABLE `product_stock` (
  `id` int(11) NOT NULL COMMENT '物販在庫ID',
  `sales_id` int(11) NOT NULL COMMENT '売上ID',
  `shop_id` int(11) NOT NULL COMMENT '店舗ID',
  `product_no` int(11) NOT NULL COMMENT '選択商品',
  `product_count` int(11) NOT NULL COMMENT '商品個数',
  `customer_id` int(11) NOT NULL COMMENT '会員ID',
  `staff_id` int(11) NOT NULL COMMENT '物販担当',
  `rstaff_id` int(11) NOT NULL COMMENT 'レジ担当',
  `price` int(11) NOT NULL COMMENT '商品定価',
  `use_status` int(11) NOT NULL COMMENT '用途1.販売（有料）、2.販売（無料）、3.譲渡（有料）、4.譲渡（無料）、5.社販、10..店舗使用',
  `pay_date` date NOT NULL COMMENT '支払日（来店日）',
  `reg_date` datetime NOT NULL COMMENT '登録日時',
  `edit_date` datetime NOT NULL COMMENT '編集日時',
  `status` int(11) NOT NULL COMMENT '出入庫',
  `del_flg` tinyint(4) NOT NULL COMMENT '削除フラグ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `q_answer`
--

CREATE TABLE `q_answer` (
  `id` int(11) NOT NULL,
  `q_id` tinyint(4) NOT NULL COMMENT 'アンケートID',
  `reservation_id` int(11) NOT NULL COMMENT '予約ID',
  `reg_date` datetime NOT NULL COMMENT '登録日時',
  `edit_date` datetime NOT NULL COMMENT '編集日時',
  `del_flg` tinyint(4) NOT NULL COMMENT '削除フラグ',
  `q1_1` text NOT NULL,
  `q1_2` text NOT NULL,
  `q1_3` text NOT NULL,
  `q1_4` text NOT NULL,
  `q1_5` text NOT NULL,
  `q1_6` text NOT NULL,
  `q1_7` text NOT NULL,
  `q1_8` text NOT NULL,
  `q1_9` text NOT NULL,
  `q1_10` text NOT NULL,
  `q2_1` text NOT NULL,
  `q2_2` text NOT NULL,
  `q2_3` text NOT NULL,
  `q2_4` text NOT NULL,
  `q2_5` text NOT NULL,
  `q2_6` text NOT NULL,
  `q2_7` text NOT NULL,
  `q2_8` text NOT NULL,
  `q2_9` text NOT NULL,
  `q2_10` text NOT NULL,
  `q3_1` text NOT NULL,
  `q3_2` text NOT NULL,
  `q3_3` text NOT NULL,
  `q3_4` text NOT NULL,
  `q3_5` text NOT NULL,
  `q3_6` text NOT NULL,
  `q3_7` text NOT NULL,
  `q3_8` text NOT NULL,
  `q3_9` text NOT NULL,
  `q3_10` text NOT NULL,
  `q4_1` text NOT NULL,
  `q4_2` text NOT NULL,
  `q4_3` text NOT NULL,
  `q4_4` text NOT NULL,
  `q4_5` text NOT NULL,
  `q4_6` text NOT NULL,
  `q4_7` text NOT NULL,
  `q4_8` text NOT NULL,
  `q4_9` text NOT NULL,
  `q4_10` text NOT NULL,
  `q5_1` text NOT NULL,
  `q5_2` text NOT NULL,
  `q5_3` text NOT NULL,
  `q5_4` text NOT NULL,
  `q5_5` text NOT NULL,
  `q5_6` text NOT NULL,
  `q5_7` text NOT NULL,
  `q5_8` text NOT NULL,
  `q5_9` text NOT NULL,
  `q5_10` text NOT NULL,
  `q6_1` text NOT NULL,
  `q6_2` text NOT NULL,
  `q6_3` text NOT NULL,
  `q6_4` text NOT NULL,
  `q6_5` text NOT NULL,
  `q6_6` text NOT NULL,
  `q6_7` text NOT NULL,
  `q6_8` text NOT NULL,
  `q6_9` text NOT NULL,
  `q6_10` text NOT NULL,
  `q7_1` text NOT NULL,
  `q7_2` text NOT NULL,
  `q7_3` text NOT NULL,
  `q7_4` text NOT NULL,
  `q7_5` text NOT NULL,
  `q7_6` text NOT NULL,
  `q7_7` text NOT NULL,
  `q7_8` text NOT NULL,
  `q7_9` text NOT NULL,
  `q7_10` text NOT NULL,
  `q8_1` text NOT NULL,
  `q8_2` text NOT NULL,
  `q8_3` text NOT NULL,
  `q8_4` text NOT NULL,
  `q8_5` text NOT NULL,
  `q8_6` text NOT NULL,
  `q8_7` text NOT NULL,
  `q8_8` text NOT NULL,
  `q8_9` text NOT NULL,
  `q8_10` text NOT NULL,
  `q9_1` text NOT NULL,
  `q9_2` text NOT NULL,
  `q9_3` text NOT NULL,
  `q9_4` text NOT NULL,
  `q9_5` text NOT NULL,
  `q9_6` text NOT NULL,
  `q9_7` text NOT NULL,
  `q9_8` text NOT NULL,
  `q9_9` text NOT NULL,
  `q9_10` text NOT NULL,
  `q10_1` text NOT NULL,
  `q10_2` text NOT NULL,
  `q10_3` text NOT NULL,
  `q10_4` text NOT NULL,
  `q10_5` text NOT NULL,
  `q10_6` text NOT NULL,
  `q10_7` text NOT NULL,
  `q10_8` text NOT NULL,
  `q10_9` text NOT NULL,
  `q10_10` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `q_detail`
--

CREATE TABLE `q_detail` (
  `id` int(11) NOT NULL,
  `q_id` tinyint(4) NOT NULL COMMENT 'アンケートID',
  `group_id` tinyint(4) NOT NULL COMMENT 'グループID',
  `parent_flg` tinyint(4) NOT NULL COMMENT '親フラグ',
  `items_name` varchar(255) NOT NULL COMMENT '設問名',
  `items_max` tinyint(4) NOT NULL COMMENT '設問数',
  `input_id` tinyint(4) NOT NULL COMMENT '質問ID',
  `required_flg` tinyint(4) NOT NULL COMMENT '必須フラグ',
  `reg_date` datetime NOT NULL COMMENT '登録日時',
  `edit_date` datetime NOT NULL COMMENT '編集日時',
  `del_flg` tinyint(4) NOT NULL COMMENT '削除フラグ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `q_input`
--

CREATE TABLE `q_input` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '質問タイプ',
  `reg_date` datetime NOT NULL COMMENT '登録日時',
  `edit_date` datetime NOT NULL COMMENT '編集日時',
  `del_flg` tinyint(4) NOT NULL COMMENT '削除フラグ',
  `choices1` varchar(63) NOT NULL COMMENT '選択肢1',
  `choices2` varchar(63) NOT NULL COMMENT '選択肢2',
  `choices3` varchar(63) NOT NULL COMMENT '選択肢3',
  `choices4` varchar(63) NOT NULL COMMENT '選択肢4',
  `choices5` varchar(63) NOT NULL COMMENT '選択肢5',
  `choices6` varchar(63) NOT NULL COMMENT '選択肢6',
  `choices7` varchar(63) NOT NULL COMMENT '選択肢7',
  `choices8` varchar(63) NOT NULL COMMENT '選択肢8',
  `choices9` varchar(63) NOT NULL COMMENT '選択肢9',
  `choices10` varchar(63) NOT NULL COMMENT '選択肢10',
  `choices11` varchar(63) NOT NULL COMMENT '選択肢11',
  `choices12` varchar(63) NOT NULL COMMENT '選択肢12',
  `choices13` varchar(63) NOT NULL COMMENT '選択肢13',
  `choices14` varchar(63) NOT NULL COMMENT '選択肢14',
  `choices15` varchar(63) NOT NULL COMMENT '選択肢15',
  `choices16` varchar(63) NOT NULL COMMENT '選択肢16',
  `choices17` varchar(63) NOT NULL COMMENT '選択肢17',
  `choices18` varchar(63) NOT NULL COMMENT '選択肢18',
  `choices19` varchar(63) NOT NULL COMMENT '選択肢19',
  `choices20` varchar(63) NOT NULL COMMENT '選択肢20'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `q_pattern`
--

CREATE TABLE `q_pattern` (
  `id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '公開・非公開',
  `name` varchar(63) NOT NULL COMMENT 'アンケート名',
  `start_date` date NOT NULL COMMENT '開始日',
  `end_date` date NOT NULL COMMENT '終了日',
  `reg_date` datetime NOT NULL COMMENT '登録日時',
  `edit_date` datetime NOT NULL COMMENT '編集日時',
  `del_flg` tinyint(4) NOT NULL COMMENT '削除フラグ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `refund`
--

CREATE TABLE `refund` (
  `id` int(11) NOT NULL,
  `cource_id` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `request_items`
--

CREATE TABLE `request_items` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL COMMENT '顧客ID',
  `contract_id` int(11) NOT NULL COMMENT '契約ID',
  `shop_id` int(11) NOT NULL COMMENT '店舗ID',
  `reservation_id` int(11) NOT NULL COMMENT '予約ID',
  `type` tinyint(4) NOT NULL COMMENT '1.CC依頼2.店舗依頼',
  `status` tinyint(4) NOT NULL COMMENT '連絡事項1.月額退会(返金)2.クーオフ3.解約4.残高照会5.友人紹介6.返金(プラン変更差額等)7.プラン変更引落ストップ99.その他',
  `pay_back` int(11) NOT NULL COMMENT '返金額(店舗依頼)',
  `pay_back_cc` int(11) NOT NULL COMMENT '返金額(CC)',
  `last_visit_ym` varchar(7) NOT NULL COMMENT '月額最終来店月',
  `stop_request_date` date DEFAULT NULL COMMENT '引落ストップ依頼日',
  `transfer_date` date NOT NULL COMMENT '返金日・入金日',
  `process_approval` tinyint(4) NOT NULL COMMENT '経理処理（承認）',
  `process_detail` text NOT NULL COMMENT '経理処理（承認）',
  `process_status` tinyint(4) NOT NULL COMMENT '処理状況1.確認中2.対応中3.完了',
  `process_memo` text NOT NULL COMMENT '引き継ぎ内容記載',
  `transfer_commission` int(11) NOT NULL COMMENT '振込手数料',
  `amount` int(11) NOT NULL COMMENT '対応金額',
  `loan_respond` tinyint(4) NOT NULL COMMENT 'ローン部署対応',
  `loan_request_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ローン会社依頼状況',
  `end_flg` tinyint(4) NOT NULL COMMENT '終了フラグ',
  `del_flg` tinyint(4) NOT NULL COMMENT '削除フラグ',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
  `end_date` datetime DEFAULT NULL COMMENT '終了日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='依頼事項';

-- --------------------------------------------------------

--
-- テーブルの構造 `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `r_times` tinyint(4) NOT NULL COMMENT '施術回数',
  `staff_id` int(11) NOT NULL COMMENT '受付担当ID',
  `cstaff_id` int(11) NOT NULL COMMENT 'カウンセリング担当',
  `tstaff_id` int(11) NOT NULL COMMENT '施術主担当',
  `tstaff_sub1_id` int(11) NOT NULL COMMENT '施術サブ担当1',
  `tstaff_sub2_id` int(11) NOT NULL COMMENT '施術サブ担当2',
  `rstaff_id` int(11) NOT NULL COMMENT 'レジ担当',
  `ccstaff_id` int(11) NOT NULL COMMENT 'CC担当',
  `sales_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1.カウンセリング2.トリートメント3.キャンセル7.売掛回収8.月額支払10.プラン変更（レジ）11.その他',
  `rsv_status` tinyint(4) NOT NULL COMMENT '予約状況(13カウンセリング戻り,14当日キャンセル)',
  `hope_date` date NOT NULL,
  `hope_time` tinyint(4) NOT NULL,
  `part` text NOT NULL COMMENT '1.上半身2.下半身',
  `length` tinyint(4) NOT NULL COMMENT '実際所要時間',
  `persons` tinyint(4) NOT NULL,
  `route` tinyint(4) NOT NULL DEFAULT '1' COMMENT '経由',
  `point` int(11) NOT NULL,
  `hp_flg` tinyint(4) NOT NULL COMMENT 'ホットペッパー月額フラグ',
  `coupon` tinyint(4) NOT NULL COMMENT 'HP利用クーポン',
  `prize` tinyint(4) NOT NULL COMMENT '当選賞品',
  `echo` varchar(255) NOT NULL,
  `mag` varchar(255) NOT NULL,
  `hope_campaign` varchar(31) NOT NULL,
  `hope_time_range` varchar(255) NOT NULL,
  `hopes_discount` tinyint(4) NOT NULL,
  `introducer` varchar(63) NOT NULL,
  `introducer_type` tinyint(4) NOT NULL,
  `special` tinyint(4) NOT NULL,
  `pay` tinyint(4) NOT NULL,
  `count` varchar(11) NOT NULL,
  `balance` varchar(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '来店状況 0:-,11:来店,1:来店なし,2:未契約,3:契約月額,4:契約6回,5:契約10回,6:契約12回,7:契約15回,8:契約18回,9:カスタマイズ月額,10:カスタマイズパック,13:契約3回,14:体験,15:通い放題',
  `con_status` tinyint(4) NOT NULL,
  `3dmail_status` tinyint(4) NOT NULL COMMENT '確認状況(3日前mail)',
  `premail_status` tinyint(4) NOT NULL COMMENT '確認状況(前日mail)',
  `preday_status` tinyint(4) NOT NULL COMMENT '確認状況(前日tel)',
  `preday_staff_id` int(11) NOT NULL COMMENT '前日確認担当',
  `preday_cnt` tinyint(4) NOT NULL COMMENT '前日架電回数',
  `today_status` tinyint(4) NOT NULL COMMENT '確認状況(予約時tel)',
  `today_staff_id` int(11) NOT NULL COMMENT '予約時確認担当',
  `today_cnt` tinyint(4) NOT NULL COMMENT '予約時架電回数',
  `comment` text NOT NULL,
  `shop_request` tinyint(4) NOT NULL COMMENT '店舗依頼事項',
  `cc_request` tinyint(4) NOT NULL COMMENT 'CC依頼事項',
  `stop_request_date` date DEFAULT NULL COMMENT '引落ストップ依頼日',
  `memo` text NOT NULL,
  `memo2` text NOT NULL COMMENT '予約表に記載',
  `memo3` text NOT NULL COMMENT '本社用',
  `memo4` text NOT NULL COMMENT '備考（CC用）',
  `memo5` text NOT NULL COMMENT '備考(ローン関連)',
  `reg_flg` tinyint(4) NOT NULL COMMENT '1：レジ精算有り',
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `del_flg` tinyint(4) NOT NULL,
  `rebook_flg` tinyint(4) NOT NULL,
  `act_flg` tinyint(4) NOT NULL COMMENT '1.予約変更2.予約キャンセル',
  `adcode` varchar(127) NOT NULL,
  `flyer_no` int(11) NOT NULL COMMENT 'チラシ番号',
  `new_flg` tinyint(4) NOT NULL COMMENT '新規契約フラッグ',
  `cancel_flg` tinyint(4) NOT NULL COMMENT '0:カウンセリング,1:施術（パック）2:施術（月額）,3:その他-add by 140715',
  `chk_flg` tinyint(4) NOT NULL,
  `move_flg` tinyint(4) NOT NULL COMMENT '店舗移動フラグ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- ビュー用の代替構造 `reservation_view`
-- (実際のビューを参照するには下にあります)
--
CREATE TABLE `reservation_view` (
`id` int(11)
,`customer_id` int(11)
,`type` tinyint(4)
,`status` tinyint(4)
,`shop_id` int(11)
,`room_id` int(11)
,`hope_date` date
,`hope_time` tinyint(4)
,`length` tinyint(4)
,`part` text
,`del_flg` tinyint(4)
);

-- --------------------------------------------------------

--
-- テーブルの構造 `rest`
--

CREATE TABLE `rest` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `hope_date` date NOT NULL,
  `hope_time` tinyint(4) NOT NULL,
  `length` tinyint(4) NOT NULL DEFAULT '2',
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- ビュー用の代替構造 `saki`
-- (実際のビューを参照するには下にあります)
--
CREATE TABLE `saki` (
`saki_id` int(11)
,`saki_no` varchar(11)
,`saki_name` varchar(63)
,`saki_name_kana` varchar(63)
,`saki_tel` varchar(63)
,`saki_mail` varchar(63)
,`saki_contract_status` int(11)
,`saki_contract_shop_id` int(11)
,`saki_contract_course_id` int(11)
,`saki_contract_latest_date` date
,`saki_contract_r_times` tinyint(4)
,`saki_contract_date` date
);

-- --------------------------------------------------------

--
-- テーブルの構造 `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1.カウンセリング2.トリートメント3.キャンセル4.クーリングオフ5.中途解約(月額退会)6.プラン変更7.売掛回収8.月額支払9.ローン取消10.プラン変更（レジ）11.その他12.自動解約13.カウンセリング戻り14.当日キャンセル51.物販',
  `contract_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL COMMENT 'カウンセリングor施術担当',
  `rstaff_id` int(11) NOT NULL COMMENT 'レジ担当',
  `course_id` int(11) NOT NULL,
  `times` tinyint(4) NOT NULL COMMENT 'コース回数',
  `r_times` int(11) NOT NULL COMMENT '消化回数',
  `fixed_price` int(11) NOT NULL COMMENT 'コース金額',
  `discount` int(11) NOT NULL COMMENT '値引き',
  `dis_type` tinyint(4) NOT NULL COMMENT '割引タイプ',
  `point` int(11) NOT NULL COMMENT 'ポイント',
  `option_name` varchar(63) NOT NULL COMMENT 'オプション名:1.シェービング2.店舗移動費3.解約手数料4.月額支払5.延滞手数料6.中途解約手数料7.DigiCatキャンセル手数料8.お顔脱毛体験料51.物販',
  `option_price` int(11) NOT NULL COMMENT 'オプション金額(現金)',
  `option_transfer` int(11) NOT NULL COMMENT 'オプション金額（振込）',
  `option_card` int(11) NOT NULL COMMENT 'オプション金額（カード）',
  `option_year` varchar(63) NOT NULL COMMENT '何年支払代金',
  `option_month` varchar(63) NOT NULL COMMENT '月額の何月分記載',
  `option_date` date NOT NULL COMMENT '金融機関の取引日',
  `option_name2` tinyint(4) NOT NULL,
  `option_price2` int(11) NOT NULL,
  `option_transfer2` int(11) NOT NULL,
  `option_card2` int(11) NOT NULL,
  `price` int(11) NOT NULL COMMENT '請求金額（残り）',
  `pay_type` tinyint(4) NOT NULL COMMENT '支払方法',
  `payment` int(11) NOT NULL COMMENT '商品（残金）支払金額',
  `payment_cash` int(11) NOT NULL,
  `payment_transfer` int(11) NOT NULL COMMENT '銀行振込',
  `payment_card` int(11) NOT NULL,
  `payment_loan` int(11) NOT NULL,
  `payment_coupon` int(11) NOT NULL,
  `charge` int(11) NOT NULL,
  `charge2` int(11) NOT NULL COMMENT 'ローン分割手数料',
  `charge3` int(11) NOT NULL COMMENT 'ローンキャンセル料',
  `balance` int(11) NOT NULL COMMENT '売掛金',
  `stock_id` varchar(63) NOT NULL COMMENT '物販在庫ID',
  `product_no` varchar(63) NOT NULL COMMENT '商品番号:1.モイスチャーローション',
  `product_count` int(11) NOT NULL COMMENT '商品個数',
  `memo` text NOT NULL,
  `pay_date` date NOT NULL COMMENT '支払日（来店日）',
  `cancel_date` date NOT NULL,
  `reg_date` datetime NOT NULL COMMENT '登録日',
  `edit_date` datetime NOT NULL COMMENT '編集日',
  `del_flg` tinyint(4) NOT NULL,
  `chk_flg` tinyint(4) NOT NULL,
  `terminate_day` date DEFAULT NULL COMMENT '解約日'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `sales_report`
--

CREATE TABLE `sales_report` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `sales_month` varchar(31) NOT NULL COMMENT '売上月',
  `sales_day` varchar(31) NOT NULL COMMENT '売上日',
  `cnt_rsv` int(11) NOT NULL COMMENT '予約件数',
  `cnt_comein` int(11) NOT NULL COMMENT '来店件数',
  `cnt_contract` int(11) NOT NULL COMMENT '契約件数',
  `cnt_nocontract` int(11) NOT NULL COMMENT '未契約件数',
  `cnt_monthly` int(11) NOT NULL COMMENT '月額件数',
  `cnt_pack` int(11) NOT NULL COMMENT 'パック件数',
  `total_cash` int(15) NOT NULL COMMENT '現金',
  `total_card` int(15) NOT NULL COMMENT 'カード',
  `total_transfer` int(15) NOT NULL COMMENT '銀行振込',
  `total_loan` int(15) NOT NULL COMMENT 'ローン',
  `total_without_balance` int(15) NOT NULL COMMENT '売上（売掛金を含まれず）',
  `total_balance` int(15) NOT NULL COMMENT '売掛金',
  `total_payment` int(15) NOT NULL COMMENT '売掛回収金（残金支払）',
  `reg_date` datetime NOT NULL COMMENT '最新登録日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- ビュー用の代替構造 `sales_view`
-- (実際のビューを参照するには下にあります)
--
CREATE TABLE `sales_view` (
`id` int(11)
,`type` tinyint(4)
,`shop_id` int(11)
,`pay_date` date
,`customer_id` int(11)
,`no` varchar(11)
,`name` varchar(63)
,`name_kana` varchar(63)
,`tel` varchar(63)
,`mail` varchar(63)
,`course_id` int(11)
,`r_times` int(11)
,`fixed_price` int(11)
,`discount` int(11)
,`price` int(11)
,`balance` int(11)
,`payment_cash` int(11)
,`payment_card` int(11)
,`payment_transfer` int(11)
,`payment_loan` int(11)
,`payment_coupon` int(11)
,`option_price` int(11)
,`option_transfer` int(11)
,`option_card` int(11)
,`reg_date` datetime
,`loan_status` tinyint(4)
,`conversion_flg` tinyint(4)
);

-- --------------------------------------------------------

--
-- テーブルの構造 `salon_infos`
--

CREATE TABLE `salon_infos` (
  `id` int(11) NOT NULL,
  `salon_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'サロン名',
  `salon_type` int(11) NOT NULL COMMENT '1:光脱毛,2:医療脱毛,99:不明',
  `view_bit` tinyint(4) NOT NULL COMMENT '表示用ランク',
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `send_mail`
--

CREATE TABLE `send_mail` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL COMMENT '顧客ID',
  `category` tinyint(4) NOT NULL COMMENT '1.来店なし2.未契約',
  `type` tinyint(4) NOT NULL COMMENT '3.3日後5.5日後10.10日後15.15日後20.20日後25.25日後30.30日後',
  `status` tinyint(4) NOT NULL COMMENT '来店状況0.キャンセル1.来店なし2.未契約',
  `hope_date` date DEFAULT NULL COMMENT '予約日',
  `del_flg` tinyint(4) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '配信日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `session`
--

CREATE TABLE `session` (
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `share_count`
--

CREATE TABLE `share_count` (
  `id` int(11) NOT NULL COMMENT 'シェアカウントID',
  `customer_id` int(11) NOT NULL COMMENT '会員ID',
  `share_type` tinyint(8) DEFAULT NULL COMMENT 'シェア種別	 1-Facebook, 2-Twitter, 3-LINE, 4-MAIL, 5-URLをコピー',
  `reg_date` datetime DEFAULT NULL COMMENT '登録日時',
  `edit_date` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='シェアカウント';

-- --------------------------------------------------------

--
-- テーブルの構造 `sheet`
--

CREATE TABLE `sheet` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shop_id` tinyint(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `input_date` date NOT NULL COMMENT '記入日',
  `name` varchar(63) NOT NULL COMMENT '名前',
  `name_kana` varchar(63) NOT NULL COMMENT 'ナマエ(カナ)',
  `birthday` date NOT NULL COMMENT '誕生日(yyyy-mm-dd)',
  `age` varchar(11) NOT NULL COMMENT '年齢',
  `tel` varchar(63) NOT NULL COMMENT '電話',
  `mail` varchar(63) NOT NULL COMMENT 'メールアドレス',
  `job` varchar(63) NOT NULL COMMENT 'ご職業',
  `job_sub` varchar(63) NOT NULL COMMENT 'ご職業(中分類)',
  `job_other` varchar(63) NOT NULL COMMENT 'ご職業(その他)',
  `zip` varchar(11) NOT NULL COMMENT '郵便番号',
  `pref` tinyint(4) NOT NULL COMMENT '都道府県',
  `address` varchar(127) NOT NULL COMMENT '住所',
  `height` varchar(15) NOT NULL COMMENT '身長',
  `weight` varchar(15) NOT NULL COMMENT '体重',
  `parent_name` varchar(63) NOT NULL COMMENT '護者の名前',
  `parent_tel` varchar(63) NOT NULL COMMENT '保護者の電話',
  `parent_address_check` tinyint(4) NOT NULL COMMENT '保護者の住所(本人と同居)',
  `parent_zip` varchar(11) NOT NULL COMMENT '保護者の郵便番号',
  `parent_pref` tinyint(4) NOT NULL COMMENT '保護者の都道府県',
  `parent_address` varchar(127) NOT NULL COMMENT '保護者の住所',
  `work_tel` varchar(63) NOT NULL COMMENT '勤務先の電話',
  `work_zip` varchar(11) NOT NULL COMMENT '勤務先の郵便番号',
  `work_pref` tinyint(4) NOT NULL COMMENT '勤務先の都道府県''',
  `work_address` varchar(127) NOT NULL COMMENT '勤務先の住所',
  `work_annual_income` int(11) NOT NULL COMMENT '勤務先の年収',
  `skin_type` tinyint(4) NOT NULL COMMENT '肌質',
  `self` varchar(63) NOT NULL COMMENT '自己処理方法',
  `self_other` varchar(255) NOT NULL COMMENT '自己処理方法(その他)',
  `experience` varchar(63) NOT NULL COMMENT '脱毛経験',
  `ex_history` varchar(31) NOT NULL COMMENT '脱毛（いつ頃）',
  `ex_period` varchar(31) NOT NULL COMMENT '脱毛期間',
  `experience_facility` varchar(255) NOT NULL COMMENT '脱毛経験あり',
  `experience_other` varchar(255) NOT NULL COMMENT '脱毛経験あり(その他)',
  `cm` tinyint(4) NOT NULL COMMENT '過去病歴',
  `cm_name` varchar(63) NOT NULL COMMENT '過去病名',
  `oc` tinyint(4) NOT NULL COMMENT '現治療',
  `oc_name` varchar(63) NOT NULL COMMENT '現病名',
  `drug` tinyint(4) NOT NULL COMMENT '薬服用',
  `drug_name` varchar(63) NOT NULL COMMENT '薬名',
  `allergie` tinyint(4) NOT NULL COMMENT 'アレルギー',
  `allergie_name` varchar(63) NOT NULL COMMENT 'アレルギー名',
  `pregnancy` tinyint(4) NOT NULL COMMENT '妊娠',
  `keloid` tinyint(4) NOT NULL COMMENT 'ケロイド',
  `keloid_check` varchar(255) NOT NULL COMMENT 'ケロイド、白斑',
  `keloid_type` tinyint(4) NOT NULL COMMENT 'ケロイド体質、または白斑',
  `kabure` tinyint(4) NOT NULL COMMENT 'カブレ',
  `cosme_name` varchar(31) NOT NULL COMMENT '化粧品名',
  `alien` tinyint(4) NOT NULL COMMENT '異物',
  `alien_palce` varchar(31) NOT NULL COMMENT '異物場所',
  `menstruation` tinyint(4) NOT NULL COMMENT '月経',
  `m_period` varchar(31) NOT NULL COMMENT '月経周期',
  `tattoo` varchar(255) NOT NULL COMMENT 'タトゥー',
  `tattoo_place` varchar(255) NOT NULL COMMENT 'タトゥーの場所',
  `tattoo_size` varchar(255) NOT NULL COMMENT 'タトゥーの大きさ',
  `knowledge` varchar(255) NOT NULL COMMENT '何で知ったのか',
  `knowledge_magazine` varchar(255) NOT NULL COMMENT '何で知ったのか(雑誌名)',
  `knowledge_freepaper` varchar(255) NOT NULL COMMENT '何で知ったのか(フリーペーパー名)',
  `knowledge_event` varchar(255) NOT NULL COMMENT '何で知ったのか(イベント名)',
  `knowledge_news` varchar(255) NOT NULL COMMENT '何で知ったのか(ニュース名)',
  `knowledge_blog` varchar(255) NOT NULL COMMENT '何で知ったのか(ブログ名)',
  `knowledge_other` varchar(255) NOT NULL COMMENT '何で知ったのか(その他)',
  `seeing` varchar(255) NOT NULL COMMENT '何を見て来たのか',
  `seeing_intro` varchar(255) NOT NULL COMMENT '何を見て来たのか(誰の紹介か)',
  `seeing_blog` varchar(255) NOT NULL COMMENT '何を見て来たのか(ブログ名)',
  `seeing_magazine` varchar(255) NOT NULL COMMENT '何を見て来たのか(雑誌名)',
  `seeing_freepaper` varchar(255) NOT NULL COMMENT '何を見て来たのか(フリーペーパー名)',
  `seeing_other` varchar(255) NOT NULL COMMENT '何を見て来たのか(その他)',
  `beginning` varchar(255) NOT NULL COMMENT '始めるきっかけ',
  `beginning_place` varchar(255) NOT NULL COMMENT '始めるきっかけ(通いやすい・近い方の利用場所)',
  `beginning_other` varchar(255) NOT NULL COMMENT '始めるきっかけ(その他)',
  `anxiety` varchar(255) NOT NULL COMMENT 'わからないこと・不安なこと',
  `anxiety_other` varchar(255) NOT NULL COMMENT 'わからないこと・不安なこと(その他)',
  `point` varchar(255) NOT NULL COMMENT '脱毛サロンを選ぶポイント',
  `point_other` varchar(255) NOT NULL COMMENT '脱毛サロンを選ぶポイント(その他)',
  `externalshop` varchar(255) NOT NULL COMMENT 'KIREIMO以外の状況',
  `externalshop_other` varchar(255) NOT NULL COMMENT 'KIREIMO以外の状況(その他)',
  `skincare` varchar(255) NOT NULL COMMENT 'スキンケア用品',
  `skincare_other` varchar(255) NOT NULL COMMENT 'スキンケア用品名',
  `care` varchar(255) NOT NULL COMMENT 'ケア用品',
  `money` varchar(255) NOT NULL COMMENT 'スキンケアにかける月の平均金額',
  `buy` varchar(255) NOT NULL COMMENT 'スキンケア用品を購入した理由（効果）',
  `soapbar` varchar(255) NOT NULL COMMENT '石鹸',
  `stress` tinyint(4) NOT NULL COMMENT 'ストレス',
  `s_cause` varchar(63) NOT NULL COMMENT 'ストレス原因',
  `sunburn` tinyint(4) NOT NULL COMMENT '日焼け',
  `s_place` varchar(63) NOT NULL COMMENT '日焼け部位',
  `s_history` varchar(63) NOT NULL COMMENT '日焼けいつ頃',
  `infection` tinyint(4) NOT NULL COMMENT '感染症',
  `media` varchar(63) NOT NULL,
  `intro` varchar(63) NOT NULL COMMENT '紹介',
  `blog` varchar(63) NOT NULL COMMENT 'ブログ',
  `mag` varchar(63) NOT NULL COMMENT '雑誌',
  `homepage` varchar(63) NOT NULL COMMENT 'ホームページ',
  `free_paper` varchar(63) NOT NULL COMMENT 'フリーペーパー',
  `other` varchar(63) NOT NULL COMMENT 'その他',
  `memo` text NOT NULL,
  `reg_date` datetime DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `shift`
--

CREATE TABLE `shift` (
  `id` int(11) NOT NULL,
  `no` tinyint(4) NOT NULL,
  `shop_id` int(11) NOT NULL COMMENT '本社：1001,本社研修センター:1002,大阪研修センター:1003,コールセンター:999',
  `staff_id` int(11) NOT NULL,
  `shift_month` varchar(11) NOT NULL,
  `day1` int(11) NOT NULL,
  `day2` int(11) NOT NULL,
  `day3` int(11) NOT NULL,
  `day4` int(11) NOT NULL,
  `day5` int(11) NOT NULL,
  `day6` int(11) NOT NULL,
  `day7` int(11) NOT NULL,
  `day8` int(11) NOT NULL,
  `day9` int(11) NOT NULL,
  `day10` int(11) NOT NULL,
  `day11` int(11) NOT NULL,
  `day12` int(11) NOT NULL,
  `day13` int(11) NOT NULL,
  `day14` int(11) NOT NULL,
  `day15` int(11) NOT NULL,
  `day16` int(11) NOT NULL,
  `day17` int(11) NOT NULL,
  `day18` int(11) NOT NULL,
  `day19` int(11) NOT NULL,
  `day20` int(11) NOT NULL,
  `day21` int(11) NOT NULL,
  `day22` int(11) NOT NULL,
  `day23` int(11) NOT NULL,
  `day24` int(11) NOT NULL,
  `day25` int(11) NOT NULL,
  `day26` int(11) NOT NULL,
  `day27` int(11) NOT NULL,
  `day28` int(11) NOT NULL,
  `day29` int(11) NOT NULL,
  `day30` int(11) NOT NULL,
  `day31` int(11) NOT NULL,
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `memo` varchar(255) NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `shop`
--

CREATE TABLE `shop` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `assign` tinyint(4) NOT NULL,
  `name` varchar(63) NOT NULL,
  `name_kana` varchar(63) NOT NULL,
  `name_alias` varchar(11) NOT NULL COMMENT '略名',
  `old_name` varchar(63) NOT NULL COMMENT '旧店舗名',
  `old_name_kana` varchar(63) NOT NULL COMMENT 'キュウテンポメイ（カナ）',
  `code` varchar(11) NOT NULL,
  `open_date` varchar(63) NOT NULL,
  `rsv_date` varchar(63) NOT NULL,
  `area` tinyint(4) NOT NULL,
  `zip` varchar(127) NOT NULL,
  `pref` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mail` varchar(127) NOT NULL,
  `tel` varchar(63) NOT NULL,
  `rank` tinyint(1) NOT NULL,
  `open_time` varchar(127) NOT NULL,
  `day_off` varchar(255) NOT NULL,
  `counseling_rooms` varchar(4) NOT NULL COMMENT 'カウンセリングルーム数',
  `current_c_rooms` varchar(4) NOT NULL COMMENT '実際カウンセリングルーム数',
  `medical_rooms` varchar(4) NOT NULL COMMENT '施術ルーム数',
  `current_m_rooms` varchar(4) NOT NULL COMMENT '実際施術ルーム数',
  `pack_rooms` varchar(4) NOT NULL COMMENT 'パックルーム数',
  `vip_rooms` varchar(4) NOT NULL COMMENT 'VIPルーム数',
  `current_vip_rooms` varchar(4) NOT NULL COMMENT '実際VIPルーム数',
  `machines` tinyint(4) NOT NULL COMMENT '機械台数',
  `access` text NOT NULL,
  `card` tinyint(4) NOT NULL,
  `park` tinyint(4) NOT NULL,
  `icon1` tinyint(4) NOT NULL,
  `icon2` tinyint(4) NOT NULL,
  `icon3` tinyint(4) NOT NULL,
  `shop_img` varchar(127) NOT NULL,
  `shop_img2` varchar(127) NOT NULL,
  `shop_img3` varchar(127) NOT NULL,
  `notice` text NOT NULL,
  `memo` varchar(255) NOT NULL,
  `url` varchar(122) DEFAULT NULL,
  `ryfety_id` varchar(255) NOT NULL COMMENT 'ライフティ加盟店支店ID',
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `del_flg` tinyint(4) NOT NULL,
  `detail_area` tinyint(4) DEFAULT NULL COMMENT '都道府県内エリアコード',
  `detail_area_name` varchar(63) DEFAULT NULL COMMENT '都道府県内エリア名',
  `rsv_date_treatment` date DEFAULT NULL COMMENT 'トリートメント予約開始日',
  `latitude` double(10,7) DEFAULT NULL COMMENT '緯度',
  `longitude` double(10,7) DEFAULT NULL COMMENT '経度',
  `block_code` tinyint(4) DEFAULT NULL COMMENT 'ブロックコード'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `smartpit`
--

CREATE TABLE `smartpit` (
  `id` int(11) NOT NULL,
  `conveni_no` varchar(15) NOT NULL COMMENT 'コンビニ識別番号',
  `smartpit_no` varchar(15) NOT NULL COMMENT 'スマートピット番号',
  `customer_id` int(11) NOT NULL,
  `give_flg` tinyint(4) NOT NULL,
  `give_date` datetime DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `del_flg` tinyint(4) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `special`
--

CREATE TABLE `special` (
  `id` int(11) NOT NULL,
  `name` varchar(63) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `code` varchar(127) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `name` varchar(127) NOT NULL,
  `name_kana` varchar(127) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `class` tinyint(4) NOT NULL,
  `new_face` tinyint(4) NOT NULL,
  `treat_only` tinyint(4) NOT NULL,
  `auth_id` int(11) NOT NULL,
  `login_id` varchar(127) NOT NULL,
  `password` varchar(127) NOT NULL,
  `sex` tinyint(4) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel` varchar(63) NOT NULL,
  `address` varchar(127) NOT NULL,
  `parent_name` varchar(63) NOT NULL COMMENT '身元保証人名前',
  `parent_tel` varchar(63) NOT NULL COMMENT '身元保証人電話',
  `parent_address` varchar(127) NOT NULL COMMENT '身元保証人住所',
  `birthday` date NOT NULL,
  `begin_day` date NOT NULL,
  `end_day` date NOT NULL,
  `photo` varchar(255) NOT NULL,
  `memo` text NOT NULL,
  `del_flg` tinyint(4) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_date` datetime NOT NULL,
  `employment_type` tinyint(4) DEFAULT NULL COMMENT '雇用形態',
  `job_type` tinyint(4) DEFAULT NULL COMMENT '職種',
  `position` tinyint(4) DEFAULT NULL COMMENT '役職'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `str_kana`
--

CREATE TABLE `str_kana` (
  `id` int(11) NOT NULL,
  `str` varchar(20) NOT NULL COMMENT '対応文字',
  `kana` varchar(20) NOT NULL COMMENT '読み方(カナ)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(63) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `coverage` tinyint(4) NOT NULL,
  `location` tinyint(4) NOT NULL,
  `adcode` int(11) NOT NULL,
  `tag` text NOT NULL,
  `memo` text NOT NULL,
  `del_flg` tinyint(4) NOT NULL,
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `target`
--

CREATE TABLE `target` (
  `tg_month` int(6) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `new_reserve` int(11) NOT NULL,
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `terminate_reasons`
--

CREATE TABLE `terminate_reasons` (
  `id` int(11) NOT NULL,
  `terminate_reason_name` varchar(255) NOT NULL DEFAULT '' COMMENT '解約理由名',
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `terminate_reason_answers`
--

CREATE TABLE `terminate_reason_answers` (
  `id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL COMMENT '契約ID',
  `terminate_trigger_id` int(11) NOT NULL COMMENT '解約理由項目ID',
  `other_salon` int(11) NOT NULL COMMENT '他社契約(サロンID)',
  `location_pref` int(11) NOT NULL COMMENT '立地都道府県コード',
  `location_city` varchar(255) NOT NULL DEFAULT '' COMMENT '立地市区町村名',
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `terminate_triggers`
--

CREATE TABLE `terminate_triggers` (
  `id` int(11) NOT NULL,
  `terminate_reason_id` tinyint(4) NOT NULL COMMENT '解約理由ID',
  `terminate_trigger_name` varchar(255) NOT NULL DEFAULT '' COMMENT '解約理由項目',
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `del_flg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `token_mng`
--

CREATE TABLE `token_mng` (
  `id` int(11) NOT NULL,
  `token` varchar(16) CHARACTER SET armscii8 NOT NULL COMMENT 'KEY情報',
  `no` varchar(11) CHARACTER SET armscii8 NOT NULL COMMENT '会員番号',
  `limit_time` int(12) DEFAULT NULL COMMENT '保存期間',
  `del_flg` int(1) NOT NULL,
  `reg_date` timestamp NULL DEFAULT NULL,
  `edit_date` timestamp NULL DEFAULT NULL,
  `del_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='トークン管理';

-- --------------------------------------------------------

--
-- テーブルの構造 `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date` date NOT NULL,
  `comment` text NOT NULL,
  `memo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `virtual_bank`
--

CREATE TABLE `virtual_bank` (
  `id` int(11) NOT NULL,
  `branch_name` varchar(127) NOT NULL DEFAULT 'ぼたん支店' COMMENT '支店名',
  `branch_no` varchar(15) NOT NULL DEFAULT '884' COMMENT '支店番号',
  `virtual_no` varchar(15) NOT NULL COMMENT 'バーチャル口座番号',
  `customer_id` int(11) NOT NULL COMMENT '顧客ID',
  `give_flg` tinyint(4) NOT NULL COMMENT '付与フラグ',
  `give_date` datetime DEFAULT NULL COMMENT '付与日時',
  `memo` varchar(255) NOT NULL COMMENT '備考',
  `del_flg` tinyint(4) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='バーチャル口座';

-- --------------------------------------------------------

--
-- テーブルの構造 `voice`
--

CREATE TABLE `voice` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `name` varchar(63) NOT NULL,
  `comment` text NOT NULL,
  `reg_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `whats_new`
--

CREATE TABLE `whats_new` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date` date NOT NULL,
  `comment` varchar(255) NOT NULL,
  `memo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- ビュー用の構造 `moto`
--
DROP TABLE IF EXISTS `moto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `moto`  AS  select `t1`.`id` AS `moto_id`,`t1`.`no` AS `moto_no`,`t1`.`name` AS `moto_name`,`t1`.`name_kana` AS `moto_name_kana`,`t1`.`tel` AS `moto_tel`,`t1`.`mail` AS `moto_mail`,`t2`.`status` AS `moto_contract_status`,`t2`.`shop_id` AS `moto_contract_shop_id`,`t2`.`course_id` AS `moto_contract_course_id`,`t2`.`latest_date` AS `moto_contract_latest_date`,`t2`.`r_times` AS `moto_contract_r_times`,`t2`.`contract_date` AS `moto_contract_date`,`t3`.`bank_name` AS `moto_bank_name`,`t3`.`bank_branch` AS `moto_bank_branch`,`t3`.`bank_account_type` AS `moto_bank_account_type`,`t3`.`bank_account_no` AS `moto_bank_account_no`,`t3`.`bank_account_name` AS `moto_bank_account_name`,`t3`.`status` AS `moto_bank_status` from ((`customer` `t1` left join `contract` `t2` on(((`t1`.`id` = `t2`.`customer_id`) and (`t2`.`del_flg` = 0) and ((`t2`.`status` = 0) or (`t2`.`status` = 8))))) left join `bank` `t3` on(((`t1`.`id` = `t3`.`customer_id`) and (`t3`.`del_flg` = 0)))) order by `t2`.`contract_date` desc ;

-- --------------------------------------------------------

--
-- ビュー用の構造 `reservation_view`
--
DROP TABLE IF EXISTS `reservation_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `reservation_view`  AS  select `reservation`.`id` AS `id`,`reservation`.`customer_id` AS `customer_id`,`reservation`.`type` AS `type`,`reservation`.`status` AS `status`,`reservation`.`shop_id` AS `shop_id`,`reservation`.`room_id` AS `room_id`,`reservation`.`hope_date` AS `hope_date`,`reservation`.`hope_time` AS `hope_time`,`reservation`.`length` AS `length`,`reservation`.`part` AS `part`,`reservation`.`del_flg` AS `del_flg` from `reservation` where ((`reservation`.`del_flg` = 0) and (`reservation`.`type` <> 3) and (`reservation`.`hope_date` >= curdate())) ;

-- --------------------------------------------------------

--
-- ビュー用の構造 `saki`
--
DROP TABLE IF EXISTS `saki`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `saki`  AS  select `t4`.`id` AS `saki_id`,`t4`.`no` AS `saki_no`,`t4`.`name` AS `saki_name`,`t4`.`name_kana` AS `saki_name_kana`,`t4`.`tel` AS `saki_tel`,`t4`.`mail` AS `saki_mail`,`t5`.`status` AS `saki_contract_status`,`t5`.`shop_id` AS `saki_contract_shop_id`,`t5`.`course_id` AS `saki_contract_course_id`,`t5`.`latest_date` AS `saki_contract_latest_date`,`t5`.`r_times` AS `saki_contract_r_times`,`t5`.`contract_date` AS `saki_contract_date` from (`customer` `t4` left join `contract` `t5` on(((`t4`.`id` = `t5`.`customer_id`) and (`t5`.`del_flg` = 0) and (`t5`.`status` = 0)))) order by `t5`.`contract_date` desc ;

-- --------------------------------------------------------

--
-- ビュー用の構造 `sales_view`
--
DROP TABLE IF EXISTS `sales_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `sales_view`  AS  select `s`.`id` AS `id`,`s`.`type` AS `type`,`s`.`shop_id` AS `shop_id`,`s`.`pay_date` AS `pay_date`,`s`.`customer_id` AS `customer_id`,`c`.`no` AS `no`,`c`.`name` AS `name`,`c`.`name_kana` AS `name_kana`,`c`.`tel` AS `tel`,`c`.`mail` AS `mail`,`s`.`course_id` AS `course_id`,`s`.`r_times` AS `r_times`,`s`.`fixed_price` AS `fixed_price`,`s`.`discount` AS `discount`,`s`.`price` AS `price`,`s`.`balance` AS `balance`,`s`.`payment_cash` AS `payment_cash`,`s`.`payment_card` AS `payment_card`,`s`.`payment_transfer` AS `payment_transfer`,`s`.`payment_loan` AS `payment_loan`,`s`.`payment_coupon` AS `payment_coupon`,`s`.`option_price` AS `option_price`,`s`.`option_transfer` AS `option_transfer`,`s`.`option_card` AS `option_card`,`s`.`reg_date` AS `reg_date`,`t`.`loan_status` AS `loan_status`,`t`.`conversion_flg` AS `conversion_flg` from (`customer` `c` join (`sales` `s` left join `contract` `t` on(((`t`.`id` = `s`.`contract_id`) and (`t`.`del_flg` = 0))))) where ((`s`.`customer_id` = `c`.`id`) and (`c`.`del_flg` = 0) and (`s`.`del_flg` = 0) and ((not(`s`.`r_times`)) or `s`.`payment_cash` or `s`.`payment_card` or `s`.`payment_transfer` or `s`.`payment_loan` or `s`.`payment_coupon` or `s`.`option_price` or `s`.`option_price` or `s`.`option_transfer` or `s`.`option_card`)) order by `s`.`pay_date`,`s`.`reg_date` ;

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `accesslog`
--
ALTER TABLE `accesslog`
  ADD PRIMARY KEY (`access_date`,`page_id`,`mo_agent`,`adcode`),
  ADD KEY `job_flg` (`job_flg`);

--
-- テーブルのインデックス `adcode`
--
ALTER TABLE `adcode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `adcode` (`adcode`),
  ADD KEY `flyer_no` (`flyer_no`),
  ADD KEY `name` (`name`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `ad_address`
--
ALTER TABLE `ad_address`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `ad_cost`
--
ALTER TABLE `ad_cost`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `allowance`
--
ALTER TABLE `allowance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `ym` (`ym`);

--
-- テーブルのインデックス `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login_id` (`login_id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- テーブルのインデックス `basic`
--
ALTER TABLE `basic`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `contact_answer`
--
ALTER TABLE `contact_answer`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `contact_info`
--
ALTER TABLE `contact_info`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `status` (`status`),
  ADD KEY `del_flg` (`del_flg`),
  ADD KEY `contract_date` (`contract_date`),
  ADD KEY `pay_complete_date` (`pay_complete_date`),
  ADD KEY `payment_loan` (`payment_loan`),
  ADD KEY `loan_status` (`loan_status`);

--
-- テーブルのインデックス `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `status` (`status`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reg_date` (`reg_date`),
  ADD KEY `name` (`name`),
  ADD KEY `del_flg` (`del_flg`),
  ADD KEY `ctype` (`ctype`),
  ADD KEY `route` (`route`),
  ADD KEY `adcode` (`adcode`),
  ADD KEY `no` (`no`),
  ADD KEY `tel` (`tel`),
  ADD KEY `name_kana` (`name_kana`),
  ADD KEY `mail` (`mail`),
  ADD KEY `card_no` (`card_no`);

--
-- テーブルのインデックス `goal`
--
ALTER TABLE `goal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ym2` (`ym2`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `introducer`
--
ALTER TABLE `introducer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `introducer_customer_id` (`introducer_customer_id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `ips_bank_info`
--
ALTER TABLE `ips_bank_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `item_coupon`
--
ALTER TABLE `item_coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `item_landing`
--
ALTER TABLE `item_landing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `item_prize`
--
ALTER TABLE `item_prize`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `job_media`
--
ALTER TABLE `job_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `karte`
--
ALTER TABLE `karte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `karte_c`
--
ALTER TABLE `karte_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `k_cookie`
--
ALTER TABLE `k_cookie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `k_organic_cookie`
--
ALTER TABLE `k_organic_cookie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `loan_bank`
--
ALTER TABLE `loan_bank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- テーブルのインデックス `loan_company`
--
ALTER TABLE `loan_company`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `loan_contact`
--
ALTER TABLE `loan_contact`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `loan_info`
--
ALTER TABLE `loan_info`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `loan_info2`
--
ALTER TABLE `loan_info2`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `loan_info3`
--
ALTER TABLE `loan_info3`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `loan_info_old`
--
ALTER TABLE `loan_info_old`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `loan_log`
--
ALTER TABLE `loan_log`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `loan_pay_date`
--
ALTER TABLE `loan_pay_date`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `loan_template`
--
ALTER TABLE `loan_template`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `lock_customer`
--
ALTER TABLE `lock_customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- テーブルのインデックス `loginlog`
--
ALTER TABLE `loginlog`
  ADD KEY `del_flg` (`del_flg`),
  ADD KEY `customer_id` (`customer_id`);

--
-- テーブルのインデックス `log_export`
--
ALTER TABLE `log_export`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `lotteries`
--
ALTER TABLE `lotteries`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `lottery_prizes`
--
ALTER TABLE `lottery_prizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_lotterys_lottery_id_products` (`lottery_id`);

--
-- テーブルのインデックス `lottery_results`
--
ALTER TABLE `lottery_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id_transaction_id_products` (`product_id`);

--
-- テーブルのインデックス `lottery_urls`
--
ALTER TABLE `lottery_urls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_lotterys_lottery_id_url` (`lottery_id`);

--
-- テーブルのインデックス `mail_history`
--
ALTER TABLE `mail_history`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `mail_member`
--
ALTER TABLE `mail_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `mail_scenario_data`
--
ALTER TABLE `mail_scenario_data`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `mail_scenario_info`
--
ALTER TABLE `mail_scenario_info`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `mail_template`
--
ALTER TABLE `mail_template`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- テーブルのインデックス `muryou_customer`
--
ALTER TABLE `muryou_customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `m_ad`
--
ALTER TABLE `m_ad`
  ADD PRIMARY KEY (`request_id`);

--
-- テーブルのインデックス `ngtelnum`
--
ALTER TABLE `ngtelnum`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `ngword`
--
ALTER TABLE `ngword`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- テーブルのインデックス `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `pay_monthly`
--
ALTER TABLE `pay_monthly`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `posi_salary`
--
ALTER TABLE `posi_salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `prefectures`
--
ALTER TABLE `prefectures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- テーブルのインデックス `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`,`name`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `product_stock`
--
ALTER TABLE `product_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `q_answer`
--
ALTER TABLE `q_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`),
  ADD KEY `q_id` (`q_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- テーブルのインデックス `q_detail`
--
ALTER TABLE `q_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `q_id` (`q_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `parent_flg` (`parent_flg`);

--
-- テーブルのインデックス `q_input`
--
ALTER TABLE `q_input`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `q_pattern`
--
ALTER TABLE `q_pattern`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `refund`
--
ALTER TABLE `refund`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cource_id` (`cource_id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `request_items`
--
ALTER TABLE `request_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `type` (`type`),
  ADD KEY `end_flg` (`end_flg`),
  ADD KEY `del_flg` (`del_flg`),
  ADD KEY `reg_date` (`reg_date`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `process_status` (`process_status`);

--
-- テーブルのインデックス `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `hope_date` (`hope_date`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `reg_date` (`reg_date`),
  ADD KEY `type` (`type`),
  ADD KEY `cc_request` (`cc_request`),
  ADD KEY `del_flg` (`del_flg`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `hope_time` (`hope_time`),
  ADD KEY `length` (`length`),
  ADD KEY `sales_id` (`sales_id`);

--
-- テーブルのインデックス `rest`
--
ALTER TABLE `rest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `del_flg` (`del_flg`),
  ADD KEY `pay_date` (`pay_date`),
  ADD KEY `reg_date` (`reg_date`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `type` (`type`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `payment_loan` (`payment_loan`);

--
-- テーブルのインデックス `sales_report`
--
ALTER TABLE `sales_report`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `salon_infos`
--
ALTER TABLE `salon_infos`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `send_mail`
--
ALTER TABLE `send_mail`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `share_count`
--
ALTER TABLE `share_count`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- テーブルのインデックス `sheet`
--
ALTER TABLE `sheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`),
  ADD KEY `customer_id` (`customer_id`);

--
-- テーブルのインデックス `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`),
  ADD KEY `status` (`status`);

--
-- テーブルのインデックス `smartpit`
--
ALTER TABLE `smartpit`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `special`
--
ALTER TABLE `special`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `del_flg` (`del_flg`),
  ADD KEY `status` (`status`),
  ADD KEY `end_day` (`end_day`);

--
-- テーブルのインデックス `str_kana`
--
ALTER TABLE `str_kana`
  ADD PRIMARY KEY (`id`),
  ADD KEY `str` (`str`);

--
-- テーブルのインデックス `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `target`
--
ALTER TABLE `target`
  ADD PRIMARY KEY (`tg_month`,`shop_id`);

--
-- テーブルのインデックス `terminate_reasons`
--
ALTER TABLE `terminate_reasons`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `terminate_reason_answers`
--
ALTER TABLE `terminate_reason_answers`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `terminate_triggers`
--
ALTER TABLE `terminate_triggers`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `token_mng`
--
ALTER TABLE `token_mng`
  ADD KEY `id` (`id`),
  ADD KEY `del_flg` (`del_flg`);

--
-- テーブルのインデックス `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `virtual_bank`
--
ALTER TABLE `virtual_bank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `give_date` (`give_date`);

--
-- テーブルのインデックス `voice`
--
ALTER TABLE `voice`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `whats_new`
--
ALTER TABLE `whats_new`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルのAUTO_INCREMENT
--

--
-- テーブルのAUTO_INCREMENT `adcode`
--
ALTER TABLE `adcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `ad_cost`
--
ALTER TABLE `ad_cost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `allowance`
--
ALTER TABLE `allowance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `authority`
--
ALTER TABLE `authority`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '口座情報ID';

--
-- テーブルのAUTO_INCREMENT `basic`
--
ALTER TABLE `basic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `contact_answer`
--
ALTER TABLE `contact_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `contact_info`
--
ALTER TABLE `contact_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `contract`
--
ALTER TABLE `contract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `goal`
--
ALTER TABLE `goal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `introducer`
--
ALTER TABLE `introducer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '紹介者情報ID';

--
-- テーブルのAUTO_INCREMENT `ips_bank_info`
--
ALTER TABLE `ips_bank_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自動採番';

--
-- テーブルのAUTO_INCREMENT `item_coupon`
--
ALTER TABLE `item_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `item_landing`
--
ALTER TABLE `item_landing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `item_prize`
--
ALTER TABLE `item_prize`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `job_media`
--
ALTER TABLE `job_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '求人媒体ID';

--
-- テーブルのAUTO_INCREMENT `karte`
--
ALTER TABLE `karte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `karte_c`
--
ALTER TABLE `karte_c`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `k_cookie`
--
ALTER TABLE `k_cookie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `k_organic_cookie`
--
ALTER TABLE `k_organic_cookie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `loan_bank`
--
ALTER TABLE `loan_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '口座情報ID';

--
-- テーブルのAUTO_INCREMENT `loan_company`
--
ALTER TABLE `loan_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `loan_contact`
--
ALTER TABLE `loan_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `loan_info`
--
ALTER TABLE `loan_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `loan_info2`
--
ALTER TABLE `loan_info2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `loan_info3`
--
ALTER TABLE `loan_info3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `loan_info_old`
--
ALTER TABLE `loan_info_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `loan_log`
--
ALTER TABLE `loan_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `loan_pay_date`
--
ALTER TABLE `loan_pay_date`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `loan_template`
--
ALTER TABLE `loan_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `lock_customer`
--
ALTER TABLE `lock_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `log_export`
--
ALTER TABLE `log_export`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `lotteries`
--
ALTER TABLE `lotteries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `lottery_prizes`
--
ALTER TABLE `lottery_prizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `lottery_results`
--
ALTER TABLE `lottery_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `lottery_urls`
--
ALTER TABLE `lottery_urls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `mail_history`
--
ALTER TABLE `mail_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `mail_member`
--
ALTER TABLE `mail_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `mail_scenario_data`
--
ALTER TABLE `mail_scenario_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `mail_scenario_info`
--
ALTER TABLE `mail_scenario_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `mail_template`
--
ALTER TABLE `mail_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `muryou_customer`
--
ALTER TABLE `muryou_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `m_ad`
--
ALTER TABLE `m_ad`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `ngtelnum`
--
ALTER TABLE `ngtelnum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `ngword`
--
ALTER TABLE `ngword`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `partner`
--
ALTER TABLE `partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `pay_monthly`
--
ALTER TABLE `pay_monthly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `posi_salary`
--
ALTER TABLE `posi_salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID';

--
-- テーブルのAUTO_INCREMENT `product_stock`
--
ALTER TABLE `product_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物販在庫ID';

--
-- テーブルのAUTO_INCREMENT `q_answer`
--
ALTER TABLE `q_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `q_detail`
--
ALTER TABLE `q_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `q_input`
--
ALTER TABLE `q_input`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `q_pattern`
--
ALTER TABLE `q_pattern`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `refund`
--
ALTER TABLE `refund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `request_items`
--
ALTER TABLE `request_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `rest`
--
ALTER TABLE `rest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `sales_report`
--
ALTER TABLE `sales_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `salon_infos`
--
ALTER TABLE `salon_infos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `send_mail`
--
ALTER TABLE `send_mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `share_count`
--
ALTER TABLE `share_count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'シェアカウントID';

--
-- テーブルのAUTO_INCREMENT `sheet`
--
ALTER TABLE `sheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `shift`
--
ALTER TABLE `shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `shop`
--
ALTER TABLE `shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `smartpit`
--
ALTER TABLE `smartpit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `special`
--
ALTER TABLE `special`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `str_kana`
--
ALTER TABLE `str_kana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `terminate_reasons`
--
ALTER TABLE `terminate_reasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `terminate_reason_answers`
--
ALTER TABLE `terminate_reason_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `terminate_triggers`
--
ALTER TABLE `terminate_triggers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `virtual_bank`
--
ALTER TABLE `virtual_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `voice`
--
ALTER TABLE `voice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `whats_new`
--
ALTER TABLE `whats_new`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `lottery_prizes`
--
ALTER TABLE `lottery_prizes`
  ADD CONSTRAINT `id_lotterys_lottery_id_products` FOREIGN KEY (`lottery_id`) REFERENCES `lotteries` (`id`) ON UPDATE CASCADE;

--
-- テーブルの制約 `lottery_results`
--
ALTER TABLE `lottery_results`
  ADD CONSTRAINT `product_id_transaction_id_products` FOREIGN KEY (`product_id`) REFERENCES `lottery_prizes` (`id`) ON UPDATE CASCADE;

--
-- テーブルの制約 `lottery_urls`
--
ALTER TABLE `lottery_urls`
  ADD CONSTRAINT `id_lotterys_lottery_id_url` FOREIGN KEY (`lottery_id`) REFERENCES `lotteries` (`id`) ON UPDATE CASCADE;

--
-- テーブルの制約 `refund`
--
ALTER TABLE `refund`
  ADD CONSTRAINT `refund_ibfk_1` FOREIGN KEY (`cource_id`) REFERENCES `course` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
