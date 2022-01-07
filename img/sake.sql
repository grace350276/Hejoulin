-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-01-04 17:15:58
-- 伺服器版本： 10.4.22-MariaDB
-- PHP 版本： 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `sake`
--

-- --------------------------------------------------------

--
-- 資料表結構 `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(20) NOT NULL,
  `admin_pass` varchar(100) NOT NULL,
  `user_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `cart_gift`
--

CREATE TABLE `cart_gift` (
  `cart_gift_id` varchar(14) NOT NULL COMMENT '訂單S開頭 不勾選A_I',
  `member_id` int(11) NOT NULL,
  `cart_quantity` int(2) NOT NULL,
  `gift_id` int(11) NOT NULL,
  `box_color` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `cart_gift_d_d`
--

CREATE TABLE `cart_gift_d_d` (
  `cart_g_pro_id` int(11) NOT NULL,
  `cart_gift_id` varchar(14) NOT NULL,
  `pro_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `cart_mark`
--

CREATE TABLE `cart_mark` (
  `cart_mark_id` int(11) NOT NULL,
  `mark_id` int(11) NOT NULL,
  `cart_sake_id` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `cart_sake`
--

CREATE TABLE `cart_sake` (
  `cart_sake_id` varchar(14) NOT NULL COMMENT '訂單S開頭 不勾選A_I',
  `member_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `cart_quantity` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `discount`
--

CREATE TABLE `discount` (
  `discount_id` int(11) NOT NULL,
  `discount_code` varchar(8) NOT NULL COMMENT 'ex:2022XMAS',
  `discount_info` varchar(20) NOT NULL COMMENT 'ex:2022聖誕節優惠',
  `perscent` float NOT NULL,
  `discount_time_start` datetime NOT NULL,
  `discount_time_end` datetime NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT 'true,false',
  `create_at` datetime NOT NULL COMMENT '自然產生',
  `modified_at` datetime NOT NULL COMMENT '自然產生'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `event`
--

CREATE TABLE `event` (
  `event_id` int(4) NOT NULL,
  `event_cat_id` int(1) NOT NULL COMMENT 'event_cat.event_cat_id',
  `event_name` varchar(100) NOT NULL,
  `event_time_start` datetime NOT NULL,
  `event_time_end` datetime NOT NULL,
  `event_brief` varchar(255) NOT NULL,
  `event_location` varchar(255) NOT NULL,
  `event_intro` varchar(9999) NOT NULL COMMENT '活動介紹為HTML，含細節圖片',
  `event_cost` int(10) NOT NULL,
  `event_cover` varchar(255) NOT NULL COMMENT '儲存圖片檔名在資料庫',
  `event_condition` varchar(20) NOT NULL COMMENT '可報名、已截止、已報名',
  `event_due` datetime NOT NULL COMMENT '使用DATEADD()將活動開始時間減七天',
  `event_create_date` datetime NOT NULL COMMENT '自然產生',
  `event_update_date` datetime NOT NULL COMMENT '自然產生'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `event_cat`
--

CREATE TABLE `event_cat` (
  `event_cat_id` int(1) NOT NULL COMMENT '1、2、3',
  `event_cat_name` varchar(20) NOT NULL COMMENT '餐酒會、品酒會、講座'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `favorite`
--

CREATE TABLE `favorite` (
  `fav_id` int(8) NOT NULL,
  `member_id` int(8) NOT NULL COMMENT 'FK：member.member_id',
  `pro_id` int(11) NOT NULL COMMENT 'FK:清酒.商品編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `guide_a`
--

CREATE TABLE `guide_a` (
  `a_no` int(8) NOT NULL,
  `q_id` int(8) NOT NULL,
  `a_item` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `guide_clia`
--

CREATE TABLE `guide_clia` (
  `cli_id` int(8) NOT NULL,
  `q_id` int(8) NOT NULL,
  `a_no` int(8) NOT NULL,
  `a_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `guide_q`
--

CREATE TABLE `guide_q` (
  `q_id` int(8) NOT NULL,
  `q_seq` int(8) NOT NULL,
  `q_des` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `mark`
--

CREATE TABLE `mark` (
  `mark_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `pics` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL COMMENT '自然產生'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `member_name` varchar(100) NOT NULL,
  `member_bir` date NOT NULL,
  `member_mob` varchar(50) NOT NULL,
  `member_addr` varchar(100) NOT NULL,
  `member_level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `menu_pictures`
--

CREATE TABLE `menu_pictures` (
  `menu_pic_id` int(11) NOT NULL,
  `menu_pic_name` varchar(50) NOT NULL,
  `res_id` int(11) NOT NULL COMMENT 'FK：restaurant.res_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `menu_pictures`
--

INSERT INTO `menu_pictures` (`menu_pic_id`, `menu_pic_name`, `res_id`) VALUES
(1, '1-1.png', 1),
(2, '1-2.png', 1),
(3, '1-3.png', 1),
(4, '1-4.png', 1),
(5, '2-1.png', 2),
(6, '2-2.png', 2),
(7, '2-3.png', 2),
(8, '2-4.png', 2),
(9, '2-5.png', 2),
(10, '2-6.png', 2),
(11, '3-1.jpg', 3),
(12, '3-2.jpg', 3),
(13, '4-1.png', 4),
(14, '4-2.png', 4),
(15, '5-1.jpg', 5),
(16, '5-2.jpg', 5),
(17, '5-3.jpg', 5),
(18, '6-1.jpg', 6),
(19, '6-2.jpg', 6),
(20, '7-1.jpg', 7),
(21, '7-2.jpg', 7),
(22, '7-3.jpg', 7),
(23, '8-1.jpg', 8),
(24, '8-2.jpg', 8),
(25, '9-1.jpg', 9),
(26, '9-2.jpg', 9),
(27, '9-3.jpg', 9),
(28, '10-1.jpg', 10),
(29, '10-2.jpg', 10),
(30, '10-3.jpg', 10),
(31, '11-1.jpg', 11),
(32, '11-2.jpg', 11),
(33, '11-3.jpg', 11),
(34, '12-1.jpeg', 12),
(35, '12-2.jpeg', 12),
(36, '12-3.webp', 12);

-- --------------------------------------------------------

--
-- 資料表結構 `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `title` int(8) NOT NULL,
  `content` varchar(9999) NOT NULL COMMENT '存HTML?',
  `cover_pic` varchar(255) NOT NULL,
  `pics` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `order_event_d`
--

CREATE TABLE `order_event_d` (
  `order_d_id` varchar(14) NOT NULL COMMENT '日期＋當天編號三碼＋e＋編號 ex:20210401e00101\r\n自訂格式不勾選A_I',
  `order_id` int(11) NOT NULL COMMENT 'FK：order_m.order_id',
  `event_id` int(4) NOT NULL COMMENT 'FK：event.event_id',
  `order_name` varchar(225) NOT NULL,
  `order_mobile` varchar(20) NOT NULL,
  `order_email` varchar(225) NOT NULL,
  `order_d_price` int(10) NOT NULL COMMENT 'FK：event.event_cost',
  `order_state` varchar(10) NOT NULL COMMENT '即將到來、已結束、已取消'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `order_gift_d`
--

CREATE TABLE `order_gift_d` (
  `order_g_id` int(14) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_quantity` int(2) NOT NULL,
  `order_name` varchar(225) NOT NULL,
  `order_mobile` varchar(20) NOT NULL,
  `order_email` varchar(225) NOT NULL,
  `order_d_price` int(10) NOT NULL,
  `order_state` varchar(10) NOT NULL,
  `gift_id` int(11) NOT NULL,
  `box_color` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `order_gift_d_d`
--

CREATE TABLE `order_gift_d_d` (
  `order_g_pro_id` int(14) NOT NULL,
  `order_g_id` int(14) NOT NULL,
  `pro_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `order_main`
--

CREATE TABLE `order_main` (
  `order_id` int(11) NOT NULL COMMENT '日期＋當天編號三碼 ex:20210401001\r\n自訂格式不勾選A_I',
  `member_id` int(11) NOT NULL COMMENT 'FK：member.member_id',
  `type` varchar(1) NOT NULL COMMENT 'S(sake), E(event), B(subscribe)',
  `used_code` varchar(10) NOT NULL COMMENT 'FK:discount.discount_code',
  `order_date` datetime NOT NULL COMMENT '自然產生'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `order_mark`
--

CREATE TABLE `order_mark` (
  `order_mark_id` int(11) NOT NULL,
  `mark_id` int(11) NOT NULL,
  `order_d_id` varchar(14) NOT NULL COMMENT '酒標價錢，前端技術處理'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `order_sake_d`
--

CREATE TABLE `order_sake_d` (
  `order_d_id` varchar(14) NOT NULL COMMENT '日期＋當天編號三碼＋s＋編號 ex:20210401s00101\r\n自定義名稱不勾選A_I',
  `order_id` int(11) NOT NULL COMMENT 'FK：order_m.order_id',
  `pro_id` int(11) NOT NULL COMMENT 'FK:清酒.商品編號',
  `order_quantity` int(2) NOT NULL,
  `order_name` int(225) NOT NULL,
  `order_mobile` varchar(20) NOT NULL,
  `order_email` varchar(225) NOT NULL,
  `order_d_price` int(10) NOT NULL COMMENT '撈清酒.價格*數量',
  `order_state` varchar(10) NOT NULL COMMENT '待出貨、已出貨、已取消'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `order_sub_d`
--

CREATE TABLE `order_sub_d` (
  `order_d_id` varchar(14) NOT NULL COMMENT '日期＋當天編號三碼＋b＋編號ex:20210401b00101\r\n自訂名稱不勾選A_I',
  `order_id` int(11) NOT NULL COMMENT 'FK：order_m.order_id',
  `sub_id` int(5) NOT NULL,
  `subtime_id` int(11) NOT NULL,
  `order_mobile` varchar(20) NOT NULL,
  `order_email` varchar(225) NOT NULL,
  `order_d_price` int(10) NOT NULL COMMENT '撈訂閱方案.價格 * 訂閱週期.月數*訂閱週期.折扣',
  `order_state` varchar(10) NOT NULL COMMENT '進行中、已結束'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `payment_detail`
--

CREATE TABLE `payment_detail` (
  `payment_detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT 'FK: order_main.order_id\r\nex:20210401001',
  `card_num` int(16) NOT NULL,
  `security_code` int(3) NOT NULL,
  `expire_date` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `product_container`
--

CREATE TABLE `product_container` (
  `container_id` int(11) NOT NULL,
  `container_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `product_format`
--

CREATE TABLE `product_format` (
  `format_id` int(11) NOT NULL COMMENT 'ex:1234',
  `pro_price` int(8) NOT NULL COMMENT 'ex:2,000',
  `pro_capacity` int(8) NOT NULL COMMENT 'ex:720ml',
  `pro_loca` varchar(20) NOT NULL COMMENT '山形縣',
  `pro_level` varchar(10) NOT NULL COMMENT '純米大吟釀',
  `pro_brand` varchar(20) NOT NULL,
  `pro_essence` int(5) NOT NULL COMMENT '40%',
  `pro_alco` int(5) NOT NULL,
  `pro_marker` varchar(50) NOT NULL,
  `rice` varchar(50) NOT NULL COMMENT '雄町',
  `pro-taste` varchar(100) NOT NULL COMMENT '厚薄、酸甜、辛口',
  `pro-temp` varchar(100) NOT NULL COMMENT '冷藏',
  `pro_gift` int(5) NOT NULL,
  `pro_mark` tinyint(1) NOT NULL,
  `container_id` int(11) NOT NULL COMMENT '1+1禮盒酒器要從規格表去拿'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `product_gift`
--

CREATE TABLE `product_gift` (
  `gift_id` int(11) NOT NULL,
  `pro_gift` int(5) NOT NULL COMMENT '無、1入、2入、1+1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `product_gift_d`
--

CREATE TABLE `product_gift_d` (
  `gift_d_id` int(11) NOT NULL,
  `gift_id` int(11) NOT NULL COMMENT '1,1,2,2,3,3,',
  `gift_img` varchar(255) NOT NULL,
  `box_color` varchar(10) NOT NULL COMMENT '黑,紅,白'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `product_img`
--

CREATE TABLE `product_img` (
  `pro_img_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL COMMENT 'FK：商品表pro_id',
  `pro_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `product_sake`
--

CREATE TABLE `product_sake` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(20) NOT NULL COMMENT '純米大吟釀　夢殿',
  `pro_stock` int(11) NOT NULL,
  `pro_selling` int(11) NOT NULL COMMENT '篩選用，用++的方式',
  `pro_intro` varchar(700) NOT NULL,
  `pro_condition` varchar(10) NOT NULL COMMENT '補貨中',
  `format_id` int(11) NOT NULL,
  `pro_creat_time` datetime NOT NULL COMMENT '自然產生',
  `pro_unsell_time` datetime NOT NULL COMMENT '自然產生'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant`
--

CREATE TABLE `restaurant` (
  `res_id` int(11) NOT NULL,
  `res_type` varchar(20) NOT NULL COMMENT 'Fine Dining / 居酒屋 / Sake Bar',
  `res_area` varchar(2) NOT NULL COMMENT '北部 / 中部 / 南部',
  `res_name` varchar(50) NOT NULL COMMENT '陣列儲存營業時間資料\r\n"[""12:00–15:00 18:00–22:00"", \r\n""12:00–15:00 18:00–22:00"",\r\n""12:00–15:00 18:00–22:00"",\r\n""12:00–15:00 18:00–22:00"",\r\n""12:00–15:00 18:00–22:00"",\r\n""12:00–15:00 18:00–22:00"",\r\n""12:00–15:00 18:00–22:00""]"',
  `res_intro` varchar(255) NOT NULL,
  `res_address` varchar(255) NOT NULL,
  `res_ser_hours` varchar(255) NOT NULL,
  `res_t_number` varchar(20) NOT NULL,
  `web_link` varchar(255) DEFAULT NULL COMMENT '可為空值',
  `fb_link` varchar(255) DEFAULT NULL COMMENT '可為空值',
  `ig_link` varchar(255) DEFAULT NULL COMMENT '可為空值',
  `booking_link` varchar(255) DEFAULT NULL COMMENT '可為空值',
  `res_create_date` datetime NOT NULL COMMENT '自然產生',
  `res_update_date` datetime NOT NULL COMMENT '自然產生'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `restaurant`
--

INSERT INTO `restaurant` (`res_id`, `res_type`, `res_area`, `res_name`, `res_intro`, `res_address`, `res_ser_hours`, `res_t_number`, `web_link`, `fb_link`, `ig_link`, `booking_link`, `res_create_date`, `res_update_date`) VALUES
(1, 'Fine Dining', '北部', 'The Ukai Taipei', 'THE UKAI TAIPEI位於微風南山46樓，是台北第一家結合鐵板燒與日式割烹的「2合1複合業態高樓景觀餐廳」。來自日本的鐵板燒「Ukai-Tei」是全球第一間以鐵板燒料理摘下米其林一星的餐廳，並連續拿了7年。環境、景觀、服務、器皿及手藝，都是頂級規格的打造，在此有了不同以往的尊貴用餐感受。', '台北市信義區松智路17號46樓', '[\"12:00–15:00 18:00–22:00\", \r\n\"12:00–15:00 18:00–22:00\",\r\n\"12:00–15:00 18:00–22:00\",\r\n\"12:00–15:00 18:00–22:00\",\r\n\"12:00–15:00 18:00–22:00\",\r\n\"12:00–15:00 18:00–22:00\",\r\n\"12:00–15:00 18:00–22:00\"]', '02-7730-1166', 'https://www.ukai.co.jp/ct/taipei/', 'https://www.facebook.com/theukaitaipei/', 'https://www.instagram.com/theukaitaipei/', 'https://www.ukai-tpe.com.tw/websev?ref=pages&id=16&lang=zh-tw', '2022-01-02 05:22:23', '2022-01-02 05:22:23'),
(2, 'Fine Dining', '南部', 'THE UKAI Kaohsiung', 'Ukai-tei Kaohsiung 是高雄晶英行館引進的日本米其林星級餐飲，Ukai-tei 鐵板燒 是全世界第一間榮獲米其林一星的鐵板燒，高雄也是海外的第一家分店，採一位廚師對一組客人的專屬服務。', '高雄市前鎮區中山二路199號 晶英國際行館2F／3F', '[\"12:00–15:00 18:00–22:00\",\r\n\"12:00–15:00 18:00–22:00\",\r\n\"12:00–15:00 18:00–22:00\",\r\n\"12:00–15:00 18:00–22:00\",\r\n\"12:00–15:00 18:00–22:00\",\r\n\"12:00–15:00 18:00–22:00\",\r\n\"12:00–15:00 18:00–22:00\"]', '07-973-0122', 'https://www.ukai.co.jp/ct/kaohsiung/', 'https://www.facebook.com/ukaiteikaohsiung/', NULL, NULL, '2022-01-02 05:28:41', '2022-01-02 05:28:41'),
(3, '居酒屋', '北部', '獨樂清酒食堂 Koma Sake Bistro', '有別於台灣，在日本，居酒屋就是讓日常生活中充滿壓力的人在下班後能夠紓解一天緊張的心情，私下和同事、朋友聯絡感情的地方，希望能把日本居酒屋的文化帶來台灣。台北超級隱藏版日式餐酒館【獨樂清酒食堂 Koma Sake Bistro】，\r\n\r\n以多元化日本清酒及道地居酒屋料理為主，還有熱情親切的服務吸引客人向隅，來到這兒可以盡情放鬆的享用美食及美酒，紓解日常生活的壓力。', '台北市大同區重慶北路一段1號2樓', '[\"18:00–00:00\",\r\n\"18:00–00:00\",\r\n\"18:00–00:00\",\r\n\"18:00–00:00\",\r\n\"18:00–00:00\",\r\n\"18:00–00:00\",\r\n\"18:00–00:00\"]', '02-2558-0836', NULL, 'https://www.facebook.com/Koma2F/', NULL, 'https://inline.app/booking/-LhPREP3g3atpZGJVjQz%3Ainline-live-2a466/-LhPRESxDueQIB0eVDm7?step=0&fbclid=IwAR11lqm7LAn99H1JYYaunKhepHiw51UuSiiLSpNnn7vAGYtZxAOHuJ2Vx14', '2022-01-02 05:32:16', '2022-01-02 05:32:16'),
(4, 'Sake Bar', '北部', '知心寮', '位於台北市林森北路145巷內、九條通裡頭的「知心寮」，是以燒酎、日本酒為主題的日式居酒屋，不僅講日文、英文都能通，且老闆更是領有國際唎酒師的達人，都會依照每個人的喜好來推薦、介紹，讓每位客人都能喝到適合自己的酒類；此外這裡也有販售純米大吟釀、水果酒、清酒、啤酒甚至無酒精飲品、日本汽水等，足以滿足各種族群的需求!', '台北市中山區林森北路145巷17號1樓', '[\"18:00–00:00\",\r\n\"休息\",\r\n\"18:00–00:00\",\r\n\"18:00–00:00\",\r\n\"18:00–00:00\",\r\n\"18:00–00:00\",\r\n\"18:00–00:00\"]', '02-2531-5961', NULL, 'https://www.facebook.com/知心寮-107889457717193/', NULL, 'https://inline.app/booking/-MqxACFm8CDdynV0E_Vh:inline-live-2/-MqxACU3td_H0HdsUWUB?fbclid=IwAR1QuE7eph_bQyjE23sHwzEXzuupPOMZYXsyYYuHOcWyHlOyAFNlJ6Qlxjg', '2022-01-02 13:19:13', '2022-01-02 13:19:13'),
(5, '居酒屋', '中部', '板前燒肉一徹', '台中燒肉你都吃哪家？這家藏在巷子裡的板前燒肉“一徹”你一定不能錯過，全程桌邊服務～更能享受老闆嚴選食材的頂級美味，單點或是交給老闆搭配套餐通通都可以，絕佳烤功保證會一吃上癮！', '台中市中區民族路227號', '[\"18:00–01:00\",\r\n\"18:00–00:00\",\r\n\"18:00–00:00\",\r\n\"18:00–00:00\",\r\n\"18:00–00:00\",\r\n\"18:00–00:00\",\r\n\"18:00–01:00\"]', '04-22275353', NULL, 'https://www.facebook.com/nikuittetsu/?ref=page_internal', 'https://www.instagram.com/yakinikuittetsu/', 'https://inline.app/booking/-Lt8IklokDZk2tyKebkv:inline-live-1/-Lt8IkpknSMuxZzupKo4', '2022-01-02 13:19:13', '2022-01-02 13:19:13'),
(6, 'Fine Dining', '中部', '指月亭 和風料理', '員林人氣日式料理店，食材新鮮可期，刀工精湛，每道料理絕對色香味俱全，讓你彷彿置身日本居酒屋！指月亭首推職人手作辣椒醬，每每開放販售必定秒殺，來店裏絕對不能錯過！', '彰化縣員林市大同路二段102號', '[\"11:30–14:00 17:00–21:00\",\n\"11:30–14:00 17:00–21:00\",\n\"休息\",\n\"16:30–22:00\",\n\"16:30–22:00\",\n\"16:30–22:00\",\n\"16:30–22:00\"]', '04-833-8919', 'https://japanese-authentic-restaurant-57.business.site', 'https://www.facebook.com/Chigetsutei/', NULL, NULL, '2022-01-02 13:25:39', '2022-01-02 13:25:39'),
(7, '居酒屋', '南部', '柶築晚酌の店', '左營區重清路居酒屋-居酒手作料理，刺身、握壽司、串燒、燒烤、揚物、創意料理、orion生啤、日本sake，給晚下班想小酌的您一個日式氛圍，放鬆、及填飽肚子的地方。', '高雄市左營區重清路31號', '[\"17:30–01:00\",\r\n\"17:30–01:00\",\r\n\"休息\",\r\n\"17:30–01:00\",\r\n\"17:30–01:00\",\r\n\"17:30–01:00\",\r\n\"17:30–01:00\"]', '0930-733-808', NULL, 'https://www.facebook.com/SiZhuWanZhuonoDian/', 'https://www.instagram.com/sizhuwanzhuonodian/', NULL, '2022-01-02 13:27:25', '2022-01-02 13:27:25'),
(8, 'Fine Dining', '北部', '祥雲龍吟', '透過與在地農家與漁家交流，深入理解台灣季節轉化與食材特色，每日運用台灣豐富及新鮮物產，結合龍吟流的料理技巧，展演出兼具傳統創新的懷石料理。祥雲龍吟發源自日本東京，是龍吟日本在台灣的分店，主廚山本征治以台灣豐富物產創造獨有特色，致力創造難忘的餐飲體驗。\r\n料理長稗田良平先生依循龍吟創辦者山本征治先生的料理精神，透過與在地農家與漁家交流，深入理解台灣季節轉化與食材特色，每日運用台灣豐富及新鮮物產，結合龍吟流的料理技巧，展演出兼具傳統創新的懷石料理。\r\n「龍吟」來是取自佛家禪語的「龍吟雲起」。', '台北市中山區樂群三路301號5樓', '[\"18:00–21:00\",\r\n\"18:00–21:00\",\r\n\"休息\",\r\n\"18:00–21:00\",\r\n\"18:00–21:00\",\r\n\"18:00–21:00\",\r\n\"18:00–21:00\"]', '02-8501-5808', 'https://www.nihonryori-ryugin.com.tw/zh/default.aspx', 'https://www.facebook.com/ShounRyugin/', NULL, 'https://www.nihonryori-ryugin.com.tw/zh/RyBooking.aspx', '2022-01-02 13:29:08', '2022-01-02 13:29:08'),
(9, 'Fine Dining', '北部', '月夜岩 蟹懷石', '試想，在寂靜的春夜下晚風習習、心情舒暢，此時停佇在海岸邊，望著遼闊的大海和朦朧而柔和的月光相照相映；沉靜於如此場景的同時，我們想要提供給在此用餐的重要顧客們，一個緩和而可以放鬆享用美食的時間與空間……\r\n在絕佳的舒適空間中從容並慎重地品味著珍饉佳餚，我們不只想要滿足顧客的口腹之慾，而是連同從心中滿溢出來的滿足感也想一併提供給顧客們……\r\n在如此的深切想望下，我們將店名取做「月夜岩」( TSUKIYOIWA )。', '台北市中山區雙城街25巷9號', '[\"11:30–14:00 18:00–22:30\",\r\n\"休息\",\r\n\"11:30–14:00 18:00–22:30\",\r\n\"11:30–14:00 18:00–22:30\",\r\n\"11:30–14:00 18:00–22:30\",\r\n\"11:30–14:00 18:00–22:30\",\r\n\"11:30–14:00 18:00–22:30\"]', '02-2585-9221', 'https://tsukiyoiwa.com/tw/top', 'https://www.facebook.com/tsukiyoiwa/', NULL, 'https://tsukiyoiwa.com/tw/reservation', '2022-01-02 13:32:02', '2022-01-02 13:32:02'),
(10, '居酒屋', '北部', '大股 熟成燒肉專門-台北忠孝店', '我們是位在台北的燒肉店「大股熟成燒肉專門」。\r\n除了是第一間結合日本和牛和清酒販賣機的主題燒肉店，我們店內的牛肉均採用熟成技術，而經過熟成的肉質會變得更柔軟、脂肪更均勻，連帶的味道也會更加濃郁與多汁！\r\n我們在意每一個入口時都要是美好的口感，追求極致的態度，細膩處理肉品，懂得取捨的道理，去蕪存菁將夢幻肉品呈現給您！\r\n「大口吃肉，大口喝酒」是我們的承諾。', '台北市大安區忠孝東路四段216巷19弄17號', '[\"17:30–23:00\",\r\n\"17:30–23:00\",\r\n\"17:30–23:00\",\r\n\"17:30–23:00\",\r\n\"17:30–23:00\",\r\n\"17:30–23:00\",\r\n\"17:30–23:00\"]', '02-2721-6877', 'http://www.oomata.com/h/Index?key=556667067082', 'https://www.facebook.com/oomata.tw', NULL, NULL, '2022-01-02 13:34:47', '2022-01-02 13:34:47'),
(11, '居酒屋', '中部', '大股熟成燒肉專門 (台中總店)', '我們是位在台中的燒肉店「大股熟成燒肉專門」。\r\n除了是第一間結合日本和牛和清酒販賣機的主題燒肉店，我們店內的牛肉均採用熟成技術，而經過熟成的肉質會變得更柔軟、脂肪更均勻，連帶的味道也會更加濃郁與多汁！\r\n我們在意每一個入口時都要是美好的口感，追求極致的態度，細膩處理肉品，懂得取捨的道理，去蕪存菁將夢幻肉品呈現給您！\r\n「大口吃肉，大口喝酒」是我們的承諾。', '台中市西屯區大安街23號', '[\"12:00–15:00 17:30–23:00\",\r\n\"12:00–15:00 17:30–23:00\",\r\n\"17:30–23:00\",\r\n\"17:30–23:00\",\r\n\"17:30–23:00\",\r\n\"17:30–23:00\",\r\n\"17:30–23:00\"]', '04-2327-2300', 'http://www.oomata.com/h/Index?key=556667067082', 'https://www.facebook.com/oomata.taichung', NULL, 'https://page.line.me/uop5867t?openQrModal=true', '2022-01-02 13:36:22', '2022-01-02 13:36:22'),
(12, '居酒屋', '北部', '新串 New Trend', '新串 New Trend，是居酒屋與酒吧的混血，走出懷舊，打造出新潮的時尚和風。我們期待以「串燒Bar」全新的日式餐酒型態，打動都會的飲食男女。', '台北市大安區忠孝東路四段223巷10弄7號', '[\"17:30–01:00\",\r\n\"17:30–00:00\",\r\n\"17:30–00:00\",\r\n\"17:30–00:00\",\r\n\"17:30–00:00\",\r\n\"17:30–00:00\",\r\n\"17:30–01:00\"]', '02-2711-6169', 'https://new-trend-bar.business.site/?utm_source=gmb&utm_medium=referral', 'https://www.facebook.com/newtrend.yakitoribar/', NULL, 'https://inline.app/booking/-M-hJtXbre-CshVjKPo_:inline-live-1/-M-hJuAf1Qk9jD1jFrLM?fbclid=IwAR0--0Xb-GElpw5NTk2nohY56te6sfENFaMbpdktR-VNkriYFLw8mKTGQwY', '2022-01-02 13:38:08', '2022-01-02 13:38:08');

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant_pictures`
--

CREATE TABLE `restaurant_pictures` (
  `res_pic_id` int(11) NOT NULL,
  `res_pic_name` varchar(50) NOT NULL,
  `res_id` int(11) NOT NULL COMMENT 'FK：restaurant.res_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `restaurant_pictures`
--

INSERT INTO `restaurant_pictures` (`res_pic_id`, `res_pic_name`, `res_id`) VALUES
(1, '1-1.jpg', 1),
(2, '1-2.jpg', 1),
(3, '1-3.jpg', 1),
(4, '2-1.jpg', 2),
(5, '2-2.jpg', 2),
(6, '2-3.jpg', 2),
(7, '3-1.jpg', 3),
(8, '3-2.jpg', 3),
(9, '3-3.jpg', 3),
(10, '4-1.jpg', 4),
(11, '4-2.jpg', 4),
(12, '4-3.jpg', 4),
(13, '5-1.jpg', 5),
(14, '5-2.jpg', 5),
(15, '6-1.jpg', 6),
(16, '6-2.jpg', 6),
(17, '6-3.jpg', 6),
(18, '7-1.jpg', 7),
(19, '7-2.jpg', 7),
(20, '7-3.jpg', 7),
(21, '8-1.jpg', 8),
(22, '8-2.jpg', 8),
(23, '8-3.jpg', 8),
(24, '9-1.jpg', 9),
(25, '9-2.jpg', 9),
(26, '9-3.jpg', 9),
(27, '10-1.jpg', 10),
(28, '10-2.jpg', 10),
(29, '10-3.jpg', 10),
(30, '11-1.jpg', 11),
(31, '11-2.jpg', 11),
(32, '12-1.jpg', 12),
(33, '12-2.jpg', 12),
(34, '12-3.jpg', 12);

-- --------------------------------------------------------

--
-- 資料表結構 `shipment_detail`
--

CREATE TABLE `shipment_detail` (
  `shipment_detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `tracking_num` int(12) NOT NULL,
  `shipment_method` varchar(20) NOT NULL COMMENT '宅配、自取',
  `store_id` int(11) NOT NULL,
  `shipment_address` varchar(100) NOT NULL COMMENT '門市地址、自填地址',
  `shipment_note` varchar(50) NOT NULL COMMENT '訂單備註'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `special_menu`
--

CREATE TABLE `special_menu` (
  `sp_menu_id` int(11) NOT NULL,
  `sp_menu_pic_name` varchar(50) NOT NULL COMMENT '酒的圖片檔名',
  `sp_menu_name` varchar(50) NOT NULL COMMENT '酒的名稱 搭配 一道菜的名稱',
  `res_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `special_menu`
--

INSERT INTO `special_menu` (`sp_menu_id`, `sp_menu_pic_name`, `sp_menu_name`, `res_id`) VALUES
(1, '1.png', '白岩酒造 IWA 5 搭配美國特級肋眼', 1),
(2, '2.png', '三諸杉 Dio Abita 搭配伊比利豬', 2),
(3, '3.png', '久保田 萬壽 純米大吟釀搭配日本生蠔', 3),
(4, '4.png', '大嶺酒造 Ohmine 五粒米 Ver.005搭配花魚一夜干', 4),
(5, '5.png', '小西酒造 白雪 Cloudy Sake 純米濁酒搭配根島生態蝦', 5),
(6, '6.png', '天壽 鳥海山 純米大吟釀搭配', 6),
(7, '7.png', '文佳人 夏 純米吟釀搭配明太子雞腿串', 7),
(8, '8.png', '水芭蕉 PURE瓶內二次發酵搭配香魚', 8),
(9, '9.png', '出羽櫻 艶姫 純米吟釀搭配松葉蟹刺身', 9),
(10, '10.png', '末廣 純米吟釀原酒 冷卸搭配 A5日本和牛上蓋肉', 10),
(11, '11.png', '美鄉雪華 純米吟釀搭配大股牛肉威靈頓', 11),
(12, '12.png', '酒田酒造 上喜元 純米 出羽之里搭配鹽烤牛小排佐蒜片', 12);

-- --------------------------------------------------------

--
-- 資料表結構 `store`
--

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(50) NOT NULL,
  `store_address` varchar(50) NOT NULL,
  `store_ser_hours` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `sub_plan`
--

CREATE TABLE `sub_plan` (
  `sub_id` int(5) NOT NULL,
  `sub_plan` varchar(225) NOT NULL COMMENT '精米步合去分',
  `sub_products` varchar(20) NOT NULL COMMENT '直接寫死商品名稱',
  `sub_price` int(5) NOT NULL,
  `create_at` datetime NOT NULL COMMENT '自然產生',
  `modified_at` datetime NOT NULL COMMENT '自然產生'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `sub_time`
--

CREATE TABLE `sub_time` (
  `subtime_id` int(11) NOT NULL,
  `sub_time` varchar(225) NOT NULL COMMENT '一個月、六個月、一年',
  `sub_discount` float NOT NULL COMMENT '0.95,0.85,0.8',
  `create_at` datetime NOT NULL COMMENT '自然產生',
  `modified_at` datetime NOT NULL COMMENT '自然產生',
  `sub_time_month` int(2) NOT NULL COMMENT '1,6,12'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_account` varchar(20) NOT NULL,
  `user_pass` varchar(100) NOT NULL,
  `user_time` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- 資料表索引 `cart_gift`
--
ALTER TABLE `cart_gift`
  ADD PRIMARY KEY (`cart_gift_id`),
  ADD UNIQUE KEY `cart_gift_id` (`cart_gift_id`),
  ADD KEY `box_color` (`box_color`),
  ADD KEY `gift_id` (`gift_id`),
  ADD KEY `member_id` (`member_id`);

--
-- 資料表索引 `cart_gift_d_d`
--
ALTER TABLE `cart_gift_d_d`
  ADD PRIMARY KEY (`cart_g_pro_id`),
  ADD KEY `cart_gift_id` (`cart_gift_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- 資料表索引 `cart_mark`
--
ALTER TABLE `cart_mark`
  ADD PRIMARY KEY (`cart_mark_id`),
  ADD KEY `cart_sake_id` (`cart_sake_id`),
  ADD KEY `mark_id` (`mark_id`);

--
-- 資料表索引 `cart_sake`
--
ALTER TABLE `cart_sake`
  ADD PRIMARY KEY (`cart_sake_id`),
  ADD UNIQUE KEY `cart_sake_id` (`cart_sake_id`),
  ADD KEY `pro_id` (`pro_id`),
  ADD KEY `member_id` (`member_id`);

--
-- 資料表索引 `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discount_id`);

--
-- 資料表索引 `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `event_cat_id` (`event_cat_id`);

--
-- 資料表索引 `event_cat`
--
ALTER TABLE `event_cat`
  ADD PRIMARY KEY (`event_cat_id`);

--
-- 資料表索引 `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`fav_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- 資料表索引 `guide_a`
--
ALTER TABLE `guide_a`
  ADD PRIMARY KEY (`a_no`),
  ADD KEY `q_id` (`q_id`);

--
-- 資料表索引 `guide_clia`
--
ALTER TABLE `guide_clia`
  ADD PRIMARY KEY (`cli_id`),
  ADD KEY `a_no` (`a_no`),
  ADD KEY `q_id` (`q_id`);

--
-- 資料表索引 `guide_q`
--
ALTER TABLE `guide_q`
  ADD PRIMARY KEY (`q_id`);

--
-- 資料表索引 `mark`
--
ALTER TABLE `mark`
  ADD PRIMARY KEY (`mark_id`),
  ADD KEY `member_id` (`member_id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `menu_pictures`
--
ALTER TABLE `menu_pictures`
  ADD PRIMARY KEY (`menu_pic_id`),
  ADD UNIQUE KEY `menu_pic_name` (`menu_pic_name`),
  ADD KEY `res_id` (`res_id`);

--
-- 資料表索引 `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- 資料表索引 `order_event_d`
--
ALTER TABLE `order_event_d`
  ADD PRIMARY KEY (`order_d_id`),
  ADD UNIQUE KEY `order_d_id` (`order_d_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 資料表索引 `order_gift_d`
--
ALTER TABLE `order_gift_d`
  ADD PRIMARY KEY (`order_g_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `box_color` (`box_color`),
  ADD KEY `gift_id` (`gift_id`);

--
-- 資料表索引 `order_gift_d_d`
--
ALTER TABLE `order_gift_d_d`
  ADD PRIMARY KEY (`order_g_pro_id`),
  ADD KEY `order_g_id` (`order_g_id`);

--
-- 資料表索引 `order_main`
--
ALTER TABLE `order_main`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `member_id` (`member_id`);

--
-- 資料表索引 `order_mark`
--
ALTER TABLE `order_mark`
  ADD PRIMARY KEY (`order_mark_id`),
  ADD KEY `mark_id` (`mark_id`),
  ADD KEY `order_d_id` (`order_d_id`);

--
-- 資料表索引 `order_sake_d`
--
ALTER TABLE `order_sake_d`
  ADD PRIMARY KEY (`order_d_id`),
  ADD UNIQUE KEY `order_d_id` (`order_d_id`),
  ADD KEY `pro_id` (`pro_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 資料表索引 `order_sub_d`
--
ALTER TABLE `order_sub_d`
  ADD PRIMARY KEY (`order_d_id`),
  ADD UNIQUE KEY `order_d_id` (`order_d_id`),
  ADD KEY `sub_id` (`sub_id`),
  ADD KEY `subtime_id` (`subtime_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 資料表索引 `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD PRIMARY KEY (`payment_detail_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 資料表索引 `product_container`
--
ALTER TABLE `product_container`
  ADD PRIMARY KEY (`container_id`);

--
-- 資料表索引 `product_format`
--
ALTER TABLE `product_format`
  ADD PRIMARY KEY (`format_id`),
  ADD KEY `pro_gift` (`pro_gift`),
  ADD KEY `container_id` (`container_id`);

--
-- 資料表索引 `product_gift`
--
ALTER TABLE `product_gift`
  ADD PRIMARY KEY (`gift_id`),
  ADD UNIQUE KEY `pro_gift` (`pro_gift`);

--
-- 資料表索引 `product_gift_d`
--
ALTER TABLE `product_gift_d`
  ADD PRIMARY KEY (`gift_d_id`),
  ADD UNIQUE KEY `box_color` (`box_color`),
  ADD KEY `gift_id` (`gift_id`);

--
-- 資料表索引 `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`pro_img_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- 資料表索引 `product_sake`
--
ALTER TABLE `product_sake`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `format_id` (`format_id`);

--
-- 資料表索引 `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`res_id`);

--
-- 資料表索引 `restaurant_pictures`
--
ALTER TABLE `restaurant_pictures`
  ADD PRIMARY KEY (`res_pic_id`),
  ADD UNIQUE KEY `res_pic_name` (`res_pic_name`),
  ADD KEY `res_id` (`res_id`);

--
-- 資料表索引 `shipment_detail`
--
ALTER TABLE `shipment_detail`
  ADD PRIMARY KEY (`shipment_detail_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 資料表索引 `special_menu`
--
ALTER TABLE `special_menu`
  ADD PRIMARY KEY (`sp_menu_id`),
  ADD UNIQUE KEY `sp_menu_pic_name` (`sp_menu_pic_name`),
  ADD KEY `res_id` (`res_id`);

--
-- 資料表索引 `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- 資料表索引 `sub_plan`
--
ALTER TABLE `sub_plan`
  ADD PRIMARY KEY (`sub_id`);

--
-- 資料表索引 `sub_time`
--
ALTER TABLE `sub_time`
  ADD PRIMARY KEY (`subtime_id`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_account` (`user_account`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart_gift_d_d`
--
ALTER TABLE `cart_gift_d_d`
  MODIFY `cart_g_pro_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart_mark`
--
ALTER TABLE `cart_mark`
  MODIFY `cart_mark_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `discount`
--
ALTER TABLE `discount`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(4) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `event_cat`
--
ALTER TABLE `event_cat`
  MODIFY `event_cat_id` int(1) NOT NULL AUTO_INCREMENT COMMENT '1、2、3';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `favorite`
--
ALTER TABLE `favorite`
  MODIFY `fav_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `guide_a`
--
ALTER TABLE `guide_a`
  MODIFY `a_no` int(8) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `guide_clia`
--
ALTER TABLE `guide_clia`
  MODIFY `cli_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `guide_q`
--
ALTER TABLE `guide_q`
  MODIFY `q_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `mark`
--
ALTER TABLE `mark`
  MODIFY `mark_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `menu_pictures`
--
ALTER TABLE `menu_pictures`
  MODIFY `menu_pic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_gift_d`
--
ALTER TABLE `order_gift_d`
  MODIFY `order_g_id` int(14) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_gift_d_d`
--
ALTER TABLE `order_gift_d_d`
  MODIFY `order_g_pro_id` int(14) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_mark`
--
ALTER TABLE `order_mark`
  MODIFY `order_mark_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `payment_detail`
--
ALTER TABLE `payment_detail`
  MODIFY `payment_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_container`
--
ALTER TABLE `product_container`
  MODIFY `container_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_format`
--
ALTER TABLE `product_format`
  MODIFY `format_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ex:1234';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_gift`
--
ALTER TABLE `product_gift`
  MODIFY `gift_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_gift_d`
--
ALTER TABLE `product_gift_d`
  MODIFY `gift_d_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_img`
--
ALTER TABLE `product_img`
  MODIFY `pro_img_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_sake`
--
ALTER TABLE `product_sake`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `res_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `restaurant_pictures`
--
ALTER TABLE `restaurant_pictures`
  MODIFY `res_pic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `shipment_detail`
--
ALTER TABLE `shipment_detail`
  MODIFY `shipment_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `special_menu`
--
ALTER TABLE `special_menu`
  MODIFY `sp_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `sub_plan`
--
ALTER TABLE `sub_plan`
  MODIFY `sub_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `cart_gift`
--
ALTER TABLE `cart_gift`
  ADD CONSTRAINT `cart_gift_ibfk_1` FOREIGN KEY (`box_color`) REFERENCES `product_gift_d` (`box_color`),
  ADD CONSTRAINT `cart_gift_ibfk_2` FOREIGN KEY (`gift_id`) REFERENCES `product_gift` (`gift_id`),
  ADD CONSTRAINT `cart_gift_ibfk_3` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- 資料表的限制式 `cart_gift_d_d`
--
ALTER TABLE `cart_gift_d_d`
  ADD CONSTRAINT `cart_gift_d_d_ibfk_1` FOREIGN KEY (`cart_gift_id`) REFERENCES `cart_gift` (`cart_gift_id`),
  ADD CONSTRAINT `cart_gift_d_d_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `product_sake` (`pro_id`);

--
-- 資料表的限制式 `cart_mark`
--
ALTER TABLE `cart_mark`
  ADD CONSTRAINT `cart_mark_ibfk_1` FOREIGN KEY (`cart_sake_id`) REFERENCES `cart_sake` (`cart_sake_id`),
  ADD CONSTRAINT `cart_mark_ibfk_2` FOREIGN KEY (`mark_id`) REFERENCES `mark` (`mark_id`);

--
-- 資料表的限制式 `cart_sake`
--
ALTER TABLE `cart_sake`
  ADD CONSTRAINT `cart_sake_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product_sake` (`pro_id`),
  ADD CONSTRAINT `cart_sake_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- 資料表的限制式 `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_cat_id`) REFERENCES `event_cat` (`event_cat_id`);

--
-- 資料表的限制式 `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product_sake` (`pro_id`);

--
-- 資料表的限制式 `guide_a`
--
ALTER TABLE `guide_a`
  ADD CONSTRAINT `guide_a_ibfk_1` FOREIGN KEY (`q_id`) REFERENCES `guide_q` (`q_id`);

--
-- 資料表的限制式 `guide_clia`
--
ALTER TABLE `guide_clia`
  ADD CONSTRAINT `guide_clia_ibfk_1` FOREIGN KEY (`a_no`) REFERENCES `guide_a` (`a_no`),
  ADD CONSTRAINT `guide_clia_ibfk_2` FOREIGN KEY (`q_id`) REFERENCES `guide_q` (`q_id`);

--
-- 資料表的限制式 `mark`
--
ALTER TABLE `mark`
  ADD CONSTRAINT `mark_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- 資料表的限制式 `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- 資料表的限制式 `menu_pictures`
--
ALTER TABLE `menu_pictures`
  ADD CONSTRAINT `menu_pictures_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `order_event_d`
--
ALTER TABLE `order_event_d`
  ADD CONSTRAINT `order_event_d_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
  ADD CONSTRAINT `order_event_d_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_main` (`order_id`);

--
-- 資料表的限制式 `order_gift_d`
--
ALTER TABLE `order_gift_d`
  ADD CONSTRAINT `order_gift_d_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_main` (`order_id`),
  ADD CONSTRAINT `order_gift_d_ibfk_2` FOREIGN KEY (`box_color`) REFERENCES `product_gift_d` (`box_color`),
  ADD CONSTRAINT `order_gift_d_ibfk_3` FOREIGN KEY (`gift_id`) REFERENCES `product_gift` (`gift_id`);

--
-- 資料表的限制式 `order_gift_d_d`
--
ALTER TABLE `order_gift_d_d`
  ADD CONSTRAINT `order_gift_d_d_ibfk_1` FOREIGN KEY (`order_g_id`) REFERENCES `order_gift_d` (`order_g_id`);

--
-- 資料表的限制式 `order_main`
--
ALTER TABLE `order_main`
  ADD CONSTRAINT `order_main_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- 資料表的限制式 `order_mark`
--
ALTER TABLE `order_mark`
  ADD CONSTRAINT `order_mark_ibfk_1` FOREIGN KEY (`mark_id`) REFERENCES `mark` (`mark_id`),
  ADD CONSTRAINT `order_mark_ibfk_2` FOREIGN KEY (`order_d_id`) REFERENCES `order_sake_d` (`order_d_id`);

--
-- 資料表的限制式 `order_sake_d`
--
ALTER TABLE `order_sake_d`
  ADD CONSTRAINT `order_sake_d_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product_sake` (`pro_id`),
  ADD CONSTRAINT `order_sake_d_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_main` (`order_id`);

--
-- 資料表的限制式 `order_sub_d`
--
ALTER TABLE `order_sub_d`
  ADD CONSTRAINT `order_sub_d_ibfk_1` FOREIGN KEY (`sub_id`) REFERENCES `sub_plan` (`sub_id`),
  ADD CONSTRAINT `order_sub_d_ibfk_2` FOREIGN KEY (`subtime_id`) REFERENCES `sub_time` (`subtime_id`),
  ADD CONSTRAINT `order_sub_d_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `order_main` (`order_id`);

--
-- 資料表的限制式 `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD CONSTRAINT `payment_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_main` (`order_id`);

--
-- 資料表的限制式 `product_format`
--
ALTER TABLE `product_format`
  ADD CONSTRAINT `product_format_ibfk_1` FOREIGN KEY (`pro_gift`) REFERENCES `product_gift` (`gift_id`),
  ADD CONSTRAINT `product_format_ibfk_2` FOREIGN KEY (`container_id`) REFERENCES `product_container` (`container_id`);

--
-- 資料表的限制式 `product_gift_d`
--
ALTER TABLE `product_gift_d`
  ADD CONSTRAINT `product_gift_d_ibfk_1` FOREIGN KEY (`gift_id`) REFERENCES `product_gift` (`gift_id`);

--
-- 資料表的限制式 `product_img`
--
ALTER TABLE `product_img`
  ADD CONSTRAINT `product_img_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product_sake` (`pro_id`);

--
-- 資料表的限制式 `product_sake`
--
ALTER TABLE `product_sake`
  ADD CONSTRAINT `product_sake_ibfk_1` FOREIGN KEY (`format_id`) REFERENCES `product_format` (`format_id`);

--
-- 資料表的限制式 `restaurant_pictures`
--
ALTER TABLE `restaurant_pictures`
  ADD CONSTRAINT `restaurant_pictures_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `shipment_detail`
--
ALTER TABLE `shipment_detail`
  ADD CONSTRAINT `shipment_detail_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`),
  ADD CONSTRAINT `shipment_detail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_main` (`order_id`);

--
-- 資料表的限制式 `special_menu`
--
ALTER TABLE `special_menu`
  ADD CONSTRAINT `special_menu_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
