-- 6388009 Rungpilin, 6388013 Jomchai, 6388122 Warisa, 6388123 Kornkanok
-- Section 1
-- Group 9
-- TBSP.Music Coperation eiei

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Tablespoon`
--

drop database if exists Tablespoon;
create database if not exists Tablespoon;
use Tablespoon;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `logID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `log` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`logID`, `userID`, `username`, `password`, `role`, `log`) VALUES
(1, 1, '_piiploys', 'Littleployinwonderworld2002', 'user', 'open music Wonder'),
(2, 2, 'lsbbeam', 'babyboo1234', 'user', 'open music 1 minute'),
(3, 3, 'wrssa', 'warisa2002', 'admin', 'manage music'),
(4, 4, 'Tata_Jomchai', 'Tatangai101', 'user', 'open music 1 minute'),
(8, 8, 'admin', 'admin', 'admin', 'postman');

-- --------------------------------------------------------

--
-- Table structure for table `musics`
--

CREATE TABLE `musics` (
  `musicID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Genre` varchar(200) NOT NULL,
  `Artist` varchar(200) NOT NULL,
  `Pic` varchar(500) NOT NULL,
  `Duration` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `musics`
--

INSERT INTO `musics` (`musicID`, `Name`, `Genre`, `Artist`, `Pic`, `Duration`) VALUES
(1, 'Ruthless', 'Alternative/Indie','The Marías', 'https://m.media-amazon.com/images/I/91tRiHP+OXL._SS500_.jpg', 4.08),
(2, 'love it if we made it','Alternative/Indie', 'The 1975', 'https://i.ytimg.com/vi/Hu0xlyLwK7Q/maxresdefault.jpg', 4),
(3, 'chocolate','Pop rock', 'The 1975', 'https://s.isanook.com/jo/0/rp/r/w300/ya0xa0m1w0/aHR0cDovL2ltYWdlLmpvb3guY29tL0pPT1hjb3Zlci8wL2VlZDVkNmFmMGVhZWE3M2IvNjQwLmpwZw==.jpg', 3.45),
(4, 'Winter Blossom','Pop', 'Dept', 'https://s.isanook.com/jo/0/rp/r/w700/ya0xa0m1w0/aHR0cDovL2ltYWdlLmpvb3guY29tL0pPT1hjb3Zlci8wL2E5MWNkNDdjM2VhMDdmNjEvNjQwLmpwZw==.jpg', 2.49),
(5, 'Some Type Of Love','Pop', 'Charlie Puth', 'https://is4-ssl.mzstatic.com/image/thumb/Music124/v4/ee/64/f6/ee64f630-db15-49fb-0a0e-075e10b3f475/075679924414.jpg/1200x1200bf-60.jpg', 3.08),
(6, 'She Could Be','Pop', 'Lullaboy', 'https://s.isanook.com/jo/0/rp/r/w700/ya0xa0m1w0/aHR0cDovL2ltYWdlLmpvb3guY29tL0pPT1hjb3Zlci8wLzQxM2Y0N2U0OWQxZDJmZDMvMTAwMC5qcGc=.jpg', 3.13),
(7, 'Girl','Pop rock','The 1975', 'https://i.ytimg.com/vi/QkubQCI4Fxo/maxresdefault.jpg', 4),
(8, 'Think About You','R&B', 'Joosiq', 'https://i.scdn.co/image/ab67616d0000b2731ccc8cbc13eb6446f12b0226', 3.33),
(9, 'Don’t Wanna Fall','R&B', 'Stevie Hoang', 'https://i.ytimg.com/vi/aX2zCRf10VQ/maxresdefault.jpg', 4.27),
(10, 'Romeo+Juliet: Love Goes On','Jpop', 'HIRAIDAI', 'https://i.ytimg.com/vi/PRoCvsJTnCI/maxresdefault.jpg', 3.12),
(11, 'glad we broke up!','Pop', 'KAYDEN', 'https://s.isanook.com/jo/0/rp/rc/w300h300/ya0xa0m1w0/aHR0cDovL2ltYWdlLmpvb3guY29tL0pPT1hjb3Zlci8wL2MyYWIyZWM4NThkMWUxZDYvNjQwLmpwZw==.jpg', 3.22),
(12, 'Light Switch','Pop', 'Charlie Puth', 'https://www.educatepark.com/wp-content/uploads/2022/01/Light-Switch-200.png', 3.06),
(13, 'The Weekend','Pop', '88rising', 'https://m.media-amazon.com/images/I/A1SxyJdRBtL._SS500_.jpg', 2.48),
(14, 'I always wanna die','Britpop', 'The 1975', 'http://www.favforward.com/app/uploads/2016/03/The1975-2rd-Album-02-1.jpg', 5),
(15, 'Stand Out Fit In','Rock', 'One Ok Rock', 'https://item-shopping.c.yimg.jp/i/l/monoichi_azzs-81', 4.25),
(16, 'blue','R&B', 'Kamal', 'https://m.media-amazon.com/images/I/61bQU3LHpBL._SS500_.jpg', 3.05),
(17, 'Someday','Jpop', 'ADOY', 'https://cdns-images.dzcdn.net/images/cover/045f6bd0f9684c4f8990706121ff8a12/500x500.jpg', 3.3),
(18, 'New Light','Softrock', 'John mayer', 'https://www.gannett-cdn.com/presto/2021/07/13/USAT/b27c4cff-ceb2-4320-8de8-5c6220af31ce-JM_SobRock_cover.jpg', 3),
(19, 'Big Plans','Pop', 'Why Don’t We', 'https://images.genius.com/c0c41883ca79679fae36940237afa89d.1000x1000x1.jpg', 3),
(20, 'Wonder','Kpop', 'ADOY', 'https://is2-ssl.mzstatic.com/image/thumb/Music124/v4/3e/cd/9e/3ecd9e69-40d5-febf-f8b9-2ba3a99b88ee/196006101732.jpg/400x400bb.jpg', 3.56),
(21, 'Yokaze','Jpop', 'Hentai Shinshi Club', 'https://images.genius.com/6c3b0e31853547fecd09811a6ee2a7c6.800x800x1.jpg', 4.26),
(22, 'Gravity','Pop', 'The 1975', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/cont-1556301392.jpg”', 4),
(23, 'Telepath','Alternative/Indie', 'Conan Gray', 'https://s3.amazonaws.com/media.thecrimson.com/photos/2021/11/08/202243_1352738.jpeg', 3.15),
(24, 'Snow Jam','Japanese Hiphop', 'Rinne', 'https://s.isanook.com/jo/0/rp/r/w700/ya0xa0m1w0/aHR0cDovL2ltYWdlLmpvb3guY29tL0pPT1hjb3Zlci8wLzY4MmRhOTQ2YzNlNDI3ZGUvMTAwMC5qcGc=.jpg', 3.25),
(25, 'Someone To You','Alternative/Indie', 'BANNERS', 'https://i.scdn.co/image/ab67616d00001e02f1bff89049561177b7cccebb', 3.4),
(26, 'Your Body ls a Wonderland','Softrock', 'John mayer', 'https://media.pitchfork.com/photos/5d97967490fe870008f50a37/1:1/w_600/johnmayer_roomforsquares.jpg”', 4),
(27, 'Angel Baby','Pop', 'Troye Sivan', 'https://m.media-amazon.com/images/I/71pEH2VEnuL._SS500_.jpg', 3.41),
(28, 'Lauren','Dance/Electronic', 'Men I Trust', 'https://i.ytimg.com/vi/TNsSBhl_2LI/maxresdefault.jpg”', 3.38),
(29, 'Slow Dancing in a Burning Room','Rock', 'John mayer', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/cont-1556301392.jpg', 4),
(30, 'Line By Line','Alternative/Indie', 'Prep', 'https://i.ytimg.com/vi/unxxm3Q6Ob8/maxresdefault.jpg', 3.58),
(31, 'i <3 u','Alternative/Indie', 'boy pablo', 'https://media.pitchfork.com/photos/5f889f6246ede078a4647488/1:1/w_600/wachito%20rico_boy%20pablo.jpg', 4.15),
(32, 'Set Piece','Dream Pop', 'Vansire', 'https://i1.sndcdn.com/artworks-000340621434-d5mnny-t500x500.jpg', 3.2),
(33, 'How Deep Is Your Love','Softrock', 'Bee Gees', 'https://lineimg.omusic.com.tw/img/album/1307368.jpg?v=20211106053528', 4.05),
(34, 'Dancing With My Phone','Alternative/Indie', 'HYBS', 'https://images.genius.com/fe641088a67c38111e18407ae2088ef7.640x640x1.jpg', 3.24),
(35, 'CHICKEN TENDIES','Folk Pop', 'Clinton Kane', 'https://m.media-amazon.com/images/I/71QQn3nrLAL._SS500_.jpg', 3.17),
(36, 'Feeling Lonely','Alternative/Indie', 'boy pablo', 'https://i.ytimg.com/vi/BDvu5OaJiHM/maxresdefault.jpg', 3),
(37, 'Ride','Alternative/Indie', 'HYBS', 'https://i.ytimg.com/vi/qbEVGyRfS0I/maxresdefault.jpg', 3.24),
(38, 'Leave Before You Love Me','Pop', 'Marshmello', 'https://upload.wikimedia.org/wikipedia/en/c/ca/Marshmello_-_Leave_Before_You_Love_Me.png', 2.35),
(39, 'Sunflower','Alternative/Indie', 'Rex Orange County', 'https://ih1.redbubble.net/image.1342855007.3962/pp,840x830-pad,1000x1000,f8f8f8.jpg', 4.12),
(40, 'Astronomy','Pop', 'Conan Gray', 'https://m.media-amazon.com/images/I/71XyiXdc6qS._SS500_.jpg', 4.04),
(41, 'Okinawa','R&B', '92914', 'https://images.genius.com/c84c747c7266eb5b14019ef4b5111027.1000x1000x1.jpg', 5.48),
(42, 'Somebody To You','Pop', 'The Vamps', 'https://i.scdn.co/image/ab67616d0000b2739f89b8390933e9ccb3673c89', 3.05),
(43, 'La Novela','Alternative/Indie', 'boy pablo', 'https://pbs.twimg.com/media/FLAzzuEXMAI-t2m?format=jpg&name=large', 4),
(44, 'That I miss You','Alternative/Indie', 'Vansire', 'https://f4.bcbits.com/img/a1150276255_10.jpg', 2.2),
(45, 'Birdland','Jazz', 'Weather Report', 'https://i1.sndcdn.com/artworks-000088775786-xgi8ds-t500x500.jpg', 5.56),
(46, 'Made In Heaven','Rock', 'Queen', 'https://upload.wikimedia.org/wikipedia/en/0/03/Madeinheaven.jpg', 5.24),
(47, 'Killer Queen','Power Pop', 'Queen', 'https://upload.wikimedia.org/wikipedia/en/f/f4/Queen_Sheer_Heart_Attack.png', 3),
(48, 'Run To Me','Folk Pop', 'Bee Gees', 'https://i.ytimg.com/vi/Xk8cJts_xRc/hqdefault.jpg', 3.11),
(49, 'Tragedy','Disco', 'Bee Gees', 'https://upload.wikimedia.org/wikipedia/en/1/12/Bee-Gees-Tragedy.jpg', 5.01),
(50, 'Dive to world','Alternative', 'CHERRYBLOSSOM', 'https://i.scdn.co/image/ab67616d0000b273e5b3ac28ff23124a4af2d772', 4.42),
(51, 'Easy Go','Jpop', 'Kazuki Kato', 'https://m.media-amazon.com/images/I/716CDof725L._SL1098_.jpg', 3.36),
(52, 'Thunder','Electro Pop', 'Imagine Dragons', 'Imagine Dragons', 3.07),
(53, 'Attention','Pop', 'Charlie Puth', 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Charlie_Puth_-_Attention_%28Official_Single_Cover%29.png', 3.28),
(54, 'Paris','Dance/Electronic', 'The Chainmokers', 'https://upload.wikimedia.org/wikipedia/en/e/e8/Paris_%28Official_Single_Cover%29_by_The_Chainsmokers.png', 3.41),
(55, 'New Rules','Dance/Electronic', 'Dua Lipa', 'https://s.isanook.com/jo/0/rp/r/w300/ya0xa0m1w0/aHR0cDovL2ltYWdlLmpvb3guY29tL0pPT1hjb3Zlci8wLzlkZTk4MmY5OGJkYWE5MWEvNjQwLmpwZw==.jpg', 3.28),
(56, 'How Far I’ll Go','Soul', 'Alessia Cara', 'https://i.scdn.co/image/ab67616d0000b2731673756c5f4c31e3f05082ea', 2.55),
(57, 'Dance, Baby','Alternative/Indie', 'boypablo', 'https://i.pinimg.com/originals/87/80/e8/8780e88ef9d9d76a99bb61148bd6e8c5.jpg', 3.18),
(58, 'Everytime','Alternative/Indie', 'boypablo', 'https://i.pinimg.com/originals/87/80/e8/8780e88ef9d9d76a99bb61148bd6e8c5.jpg', 2.52),
(59, 'mustache','Alternative/Indie', 'boypablo', 'https://is2-ssl.mzstatic.com/image/thumb/Music125/v4/c5/cb/43/c5cb43d9-bb30-2b24-b913-f08d239ea979/192641722264_Cover.jpg/600x600bb.jpeg', 2),
(60, 'hey girl','Alternative/Indie', 'boypablo', 'https://is2-ssl.mzstatic.com/image/thumb/Music125/v4/c5/cb/43/c5cb43d9-bb30-2b24-b913-f08d239ea979/192641722264_Cover.jpg/600x600bb.jpeg', 3),
(61, 'Give Me Your Forever','Pop', 'Zack Tabudlo', 'https://images.workpointnews.com/workpointnews/2022/01/28165545/1643363743_13687_Cover-Art-Give-Me-Your-Forever-b4c42943.jpg.jpg', 4.05),
(62, 'Night Changes','Pop', 'One Direction', 'https://media.teroradio.com/pix/single/16904.jpg', 3.47),
(63, 'Rewrite the star','Pop', 'Anne-Marie and James Arthur', 'https://images.genius.com/89309a706a2098ceafa00c9950ee2081.1000x1000x1.jpg', 3.38),
(64, 'NUNU NANA','Kpop', 'Jessi', 'https://i1.sndcdn.com/artworks-tJ3Cu9RTfHVPltWP-3GG1kw-t500x500.jpg', 3.16),
(65, 'Good Boy','Kpop', 'G-Dragon and Taeyoung', 'https://i.ytimg.com/vi/1ZRb1we80kM/maxresdefault.jpg', 4.06),
(66, 'Maria','Kpop', 'Hwa Sa', 'https://upload.wikimedia.org/wikipedia/en/7/73/Hwasa_-_Mar%C3%ADa.jpg', 3.2),
(67, 'How You Like That','Kpop/Hip Hop/ Korea Electronic/Dance', 'Black Pink', 'https://i.ytimg.com/vi/ioNng23DkIM/maxresdefault.jpg', 3.02),
(68, 'Hello Bitches','Kpop/Korea Dance/Electronic', 'CL', 'https://upload.wikimedia.org/wikipedia/en/2/26/Hello_Bitches_%28Official_Single_Cover%29_by_CL.png', 2.59),
(69, 'Butter','Kpop', 'BTS', 'https://f.ptcdn.info/561/075/000/r332ex2oc8d4dJq61Bu-o.jpg', 2.44),
(70, 'Running','Kpop', 'Gaho', 'https://1.bp.blogspot.com/-bD1M9L5NATo/X7j8WvwvaII/AAAAAAAABJU/vxH9vd_X4fIHavbPigDbWUJKinA8oHTAQCLcBGAsYHQ/s1000/GAHO_2020.10.30.jpg', 3.3),
(71, 'Hot Sauce','Kpop', 'NCT Dream', 'https://external-preview.redd.it/CSQjLzkEbbTGm7m25hwNnIz1rifr42vafNvavlG1qyk.jpg?width=640&crop=smart&auto=webp&s=888384a6125f10a30133b92287e835b249e133a2', 3.16),
(72, 'Stay With Me','Kpop', 'Chanyeol & Punch', 'https://1.bp.blogspot.com/-uc6HBtSd7iQ/WELI-dTlRvI/AAAAAAAADxE/C7vW9FcU72E9a0yDDqcJtuNlSpH7zcdTgCLcB/s1600/Goblin-OST-PART-1.jpg', 3.12),
(73, 'Fine','Kpop/Korea Ballads', 'Kim Taeyeon', 'https://i0.wp.com/colorcodedlyrics.com/wp-content/uploads/2017/02/10040265_org.jpg?fit=600%2C600&ssl=1', 3.29),
(74, 'Just One Day','Kpop/Korea Dance/Electronic', 'BTS', 'https://c-cl.cdn.smule.com/rs-s26/arr/a9/03/3fdf8c4f-93ee-480e-9e3d-1d047dac2af3_1024.jpg', 4),
(75, 'Hurt The Ones I Love','Folk', 'Reagan Beem', 'https://i.scdn.co/image/ab67616d0000b2730cb1a43c5dcaf61543cfbb98', 3.35),
(76, 'Face ID','Kpop/Hiphop', 'Epik High', 'https://i.ytimg.com/vi/xBsHAyB73Rk/maxresdefault.jpg', 3.37),
(77, 'Highway','Jpop', 'NOA', 'https://i.ytimg.com/vi/MRR6eR8mnd4/maxresdefault.jpg', 3.51),
(78, 'WHO YOU?','Kpop', 'G-Dragon', 'https://i.ytimg.com/vi/doFK7Eanm3I/maxresdefault.jpg', 5.38),
(79, 'Life is still going on','Kpop/Rap/Hip Hop', 'NCT Dream', 'https://pbs.twimg.com/media/E4vQwmWVkAATYp9.jpg', 3.39),
(80, 'Hide and Seek','Kpop/Drama OST', 'VROMANCE', 'https://i.scdn.co/image/ab67616d0000b27381a4197e5697514285b61c6e', 3.4),
(81, 'The First Snow','Kpop/Korea Ballads/Korea Electronic/Pop', 'EXO', 'https://4.bp.blogspot.com/-w-haMgLV50U/VkLrXjmOCZI/AAAAAAAAPFo/xFmIgsCe_R0/s1600/317626.jpg', 3.28),
(82, 'The Image of You','Kpop/Drama OST', 'SANDEUL', 'https://1.bp.blogspot.com/-oH6I9biUML0/YVrs65lnfsI/AAAAAAAAfIo/7_YNp8p5wX8chUqQK6GegVepXsYilLlSACLcBGAsYHQ/s600/Sandeul___Hometown_Cha_Cha_Cha_OST_Part_6.webp', 3.1),
(83, 'Going Crazy','Kpop', 'Shim Seung Shik', 'https://i.scdn.co/image/ab67616d00001e0248893f76ccd23f1a05240308', 3.21),
(84, 'Somebody To Tell Me (Theme Song from “Love, Victor")','Alternative Rock', 'Tyler Glenn', 'https://s.isanook.com/jo/0/rp/r/w700/ya0xa0m1w0/aHR0cDovL2ltYWdlLmpvb3guY29tL0pPT1hjb3Zlci8wLzQwZjMxNzg5NThlMDIyYzAvNjQwLmpwZw==.jpg', 2.49),
(85, 'What If Love','Kpop', 'Wendy', 'https://images.genius.com/1909cdbc59d1166c942d2e854adb1c84.500x500x1.jpg', 3.14),
(86, 'LALISA','Kpop/Hip Hop/EDM', 'LISA', 'https://news.thaipbs.or.th/media/TSNBg3wSBdng7ijMh1SGhkl8fuHpVkQR2GsLXk7dawS.jpg', 3.26),
(87, 'S.C.H','Kpop/Korean Ballads/Korean Folk/Blues', 'Standing Egg', 'https://is4-ssl.mzstatic.com/image/thumb/Music115/v4/42/83/da/4283da34-732a-d3de-f887-71205d045197/192914332435.jpg/400x400cc.jpg', 4.49),
(88, 'From now on','Kpop', 'Kim Min Seung', 'https://i1.sndcdn.com/artworks-000557289909-4575mn-t500x500.jpg', 3.1),
(89, 'We are','Kpop/Hiphop', 'Woo', 'https://i.ytimg.com/vi/20WRG_2r0QE/maxresdefault.jpg', 3.16),
(90, 'Phoenix','Japanese Rock', 'BURNOUT SYNDROMES', 'https://www.lyrical-nonsense.com/wp-content/uploads/2020/01/BURNOUT-SYNDROMES-PHOENIX.jpeg', 4.07),
(91, 'FLY HIGH','Japanese Rock', 'Burnout Syndromes', 'https://1.bp.blogspot.com/--ZqvXTZGe-U/XxKslyMu0oI/AAAAAAAAB-I/ODjhx6vtvP4Q3Nr6I5Br__LEc47tKDoiwCLcBGAsYHQ/s1600/haikyuu.jpg', 4.03),
(92, 'Katahouno Mirai','Jpop', 'TEE', 'https://i.ytimg.com/vi/93sHqEh-Uh0/maxresdefault.jpg', 4.21),
(93, 'Safe and Sound','Alternative/Indie', 'Madilyn Bailey', 'https://i.ytimg.com/vi/ztYjNxowN0s/hqdefault.jpg', 3.37),
(94, 'Colorless','Jpop/Contemporary/R&B', 'Taichi Mukai', 'https://images.genius.com/68f64074a3aba70a3a79b8bcb85def9c.1000x1000x1.jpg', 5.14),
(95, 'Reset','Jpop', 'Taichi Mukai', 'https://image.joox.com/JOOXcover/0/5eb55ebb8c784629/300', 4.05),
(96, 'Michi','Jpop/Contemporary', 'Taichi Mukai', 'https://images.genius.com/17659ec41e75051a2c9923ccb20f4af6.1000x1000x1.webp', 3.52),
(97, 'Life is Good','Japanese Hip Hop/Rap', 'GEG', 'https://i.ytimg.com/vi/ucHlPQc5qm0/maxresdefault.jpg', 5.4),
(98, 'Hard For Me','Kpop', 'Do Young', 'https://i0.wp.com/colorcodedlyrics.com/wp-content/uploads/2018/06/Doyoung-Rich-Man-OST-Part.5.jpg?fit=1000%2C1000&ssl=1', 3.23),
(99, 'A Lot Like Love','Kpop', 'Baek A Yeon', 'https://images.genius.com/ebfcb859b652b8bdb563a5726552f6f5.600x600x1.jpg', 3.56),
(100, 'Almost Maybe','Country', 'Jordan Davis', 'https://i.scdn.co/image/ab67616d0000b2735a9e9f725356e6cf6cd6947f', 3),
(101, 'Bad Liar','Alternative/Indie', 'Imagine Dragons', 'https://i.ytimg.com/vi/a40XLhSUREo/maxresdefault.jpg', 4.21),
(102, 'Everything I Need','Chamber pop', 'Skylar Grey', 'https://i1.sndcdn.com/artworks-000534485118-rlwlmg-t500x500.jpg', 3.21),
(103, 'Baby Only You','Kpop', 'Doyong & Mark of NCT U', 'https://musicnook.co/wp-content/uploads/2019/10/NCT-U-The-Tale-of-Nokdu-OST-Part-1.jpg', 3.16),
(104, 'Love is the Name','Pop', 'Sofia Carson', 'https://upload.wikimedia.org/wikipedia/en/1/1f/Sofia_Carson_-_Love_is_the_Name.png', 3.28),
(105, 'Sweet Talk','Pop', 'Chandra Liow, Rizky Febian, and Sheryl Sheinafia', 'https://s.isanook.com/jo/0/rp/r/w700/ya0xa0m1w0/aHR0cDovL2ltYWdlLmpvb3guY29tL0pPT1hjb3Zlci8wLzY3MTk3NjQxOTE3OGE4OGYvMTAwMC5qcGc=.jpg', 2.59),
(106, 'The Night With You','Kpop', 'Lee Min Hyuk', 'https://cdns-images.dzcdn.net/images/cover/17d587cc9e4d08b109f067b0e4d1e4a6/500x500.jpg', 3.57),
(107, 'Lead The Way (From Raya and the last Dragon)','Pop', 'Jhene Aiko', 'https://i1.sndcdn.com/artworks-vTojjOPUs0m8CtAa-v8S4Yg-t500x500.jpg', 4),
(108, 'Trust Again','Pop', 'Raisa, YonnyBoii, Matthaios, SPRITE', 'https://s.isanook.com/jo/0/rp/r/w700/ya0xa0m1w0/aHR0cDovL2ltYWdlLmpvb3guY29tL0pPT1hjb3Zlci8wLzQ0NTYxZDBiOTY2MzM4OTYvNjQwLmpwZw==.jpg', 3.48),
(109, 'Me to You, You to Me','Kpop', 'Mido and Falasol', 'https://1.bp.blogspot.com/-Dpi14caK0ew/XtEKqBsAoQI/AAAAAAAAQUY/Ibwy5fH2cbERvXLg3HINyJmgCka6q3jSgCLcBGAsYHQ/s1600/Mido_and_Falasol___Me_to_You_You_to_Me.webp', 3.53),
(110, 'Butterfly','Kpop', 'Loveholic', 'https://img.discogs.com/4YnEf90yZ16J68TR4_i2HM1UIks=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-9913074-1488431662-5979.jpeg.jpg', 4.09),
(111, 'Eureka','Jpop', 'Hentai Shinshi Club feat. Kojikoji', 'https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/4c/4c/b1/4c4cb173-cf04-f453-be10-b5c449b95ff4/TFCC-86765WW.jpg/400x400bb.jpg', 3.57),
(112, 'Hero','Jpop', 'Hentai Shinshi Club', 'https://i.scdn.co/image/ab67616d0000b2735cfadbe864b42ff114157d07', 4.58),
(113, 'Just Friends','Pop', 'Audrey Mika', 'ttps://cdns-images.dzcdn.net/images/cover/4de7afddcc0a0618a9b1868cc4f4f490/500x500.jpg', 2.49),
(114, 'The night we parted','Kpop', 'ACOURVE', 'https://i.scdn.co/image/ab67616d0000b27379488538a910fa09013ddea3', 3.5),
(115, 'The Ocean of yours','Kpop/Folk', 'J_ust', 'https://is1-ssl.mzstatic.com/image/thumb/Music123/v4/8d/4a/5e/8d4a5eb0-a249-42bf-ced3-672e5b6623bc/cover_-_DS.jpg/400x400cc.jpg', 3.17),
(116, 'Walking in the star light','Kpop', 'Lee Min Hyuk', 'https://i.scdn.co/image/ab6761610000e5ebb83d26df9d3dcb58ba46b6ab', 4.18),
(117, 'Bravo, My life!','Kpop', 'Eric Nam', 'https://3.bp.blogspot.com/-LYaOTHn5rvM/WmNUYeEX2II/AAAAAAAANH4/am7hz1seucUoWzzpJZLgARrp51pMZFHuQCLcBGAs/s1600/5520.jpg', 4.05),
(118, 'Oh! My angel','Kpop', 'Jeong Se-woon', 'https://3.bp.blogspot.com/-J_IQOAhlhQ0/Wals4Z-WTqI/AAAAAAAALy0/Pk_-V1nom5kvvabSrNVhxLfDaGbK3hocgCPcBGAYYCw/s1600/jeong-sewoon-the-1st-mini-album-part-1-ever.jpg', 3.26),
(119, 'Days Gone By','Jpop', 'VIGORMAN, Hiplin and GEG', 'https://i.scdn.co/image/ab67616d0000b273dbdb6653b4a457f83ee2c8dc', 3.51),
(120, 'Rocky Trail','Alternative/Indie', 'Kings of Convenience', 'https://i.scdn.co/image/ab67616d0000b273dd5e5dae4671661784941506', 3.3),
(121, 'Surf Me To The Ocean','Jpanese Hip Hop/Rap', 'Def Tech', 'https://takemetotheocean.nl/wp-content/uploads/2021/04/IMG_8802-1.png', 4.09),
(122, 'Your Shampoo Scent in the Flowers','Kpop', 'Jang Beom June', 'https://popgasa1.files.wordpress.com/2019/09/3293030.jp', 2.49),
(123, 'Hold Me Tight (ห่มผ้า)','Tpop', 'PP Krit', 'https://1.bp.blogspot.com/-HdVZlPbPyeE/YLB_NvrdsbI/AAAAAAAAJ8U/S_Ko3VzlMwQAbqJ-N8cNzBPntdbPSyytgCLcBGAsYHQ/s828/pppp.jpg', 4.41),
(124, 'Merry Go Round','Jpop', 'GEG', 'https://is2-ssl.mzstatic.com/image/thumb/Music124/v4/dd/c9/81/ddc98120-11a5-e416-a97f-e140a03ab1b1/4538182824795_cov.jpg/400x400bb.jpg', 5.55),
(125, 'Happy End','Jpop', 'Mone Kamishiraishi', 'https://image.joox.com/JOOXcover/0/0d89dd34029c4abe/300', 4.5),
(126, 'Headlight','Jpop/Japanese Rock', 'MONKEY MAJIK', 'https://static.wikia.nocookie.net/jpop/images/f/f2/MONKEY_MAJIK_May_2021.jpg/revision/latest?cb=20210710222005', 5.2),
(127, 'You’re the Reason','Pop', 'INTERSECTION', 'https://images.genius.com/0dfdf75266608842b11ebd19829c1000.1000x1000x1.jpg', 3.18),
(128, 'Only U','Kpop', 'Yu Seungwoo', 'https://c-cl.cdn.smule.com/rs-s92/arr/2d/41/4ef0b98c-0630-4c27-857c-befc57ead836_1024.jpg', 3.5),
(129, 'One Step Closer','R&B/Soul', 'INTERSECTION', 'https://lastfm.freetls.fastly.net/i/u/ar0/a19f6cbe0bf0bc4de769a5514f160ca6.jpg', 3.55),
(130, 'Blue Bird','Kpop', 'Ailee', 'https://kgasa.com/wp-content/uploads/2020/11/Start-Up-Ost-Part-9.jpg', 3.46),
(131, 'Tipsy','Jpop', 'Wanuka', 'https://images.genius.com/7f6f2b55e47161aa26cd921b20863edb.1000x1000x1.jpg', 3.37),
(132, 'Superstar','R&B/Soul', 'IV Jay', 'https://i.ytimg.com/vi/yBBNnWaFcHI/maxresdefault.jpg', 2.46),
(133, 'Into The New World','Kpop', 'Girls\' Generation', 'https://c-cl.cdn.smule.com/rs-s-sf-2/arr/ec/80/56c97df5-ea1a-4abb-88b6-635767380f97_1024.jpg', 4.28),
(134, 'Down To One','Country', 'Luke Bryan', 'https://images.genius.com/ae30ddb55ff9ad1dcdb672dac0ea2606.1000x1000x1.png', 3.42),
(135, 'Is There Still Anything That Love Can Do?','Jpanese Indie/Jpop', 'Radwimps', 'https://www.lyrical-nonsense.com/wp-content/uploads/2019/04/RADWIMPS-Tenki-no-Ko-2.jpg', 7.29),
(136, 'Sucker For You','Pop', 'Matt Terry', 'https://upload.wikimedia.org/wikipedia/en/9/9d/Matt_Terry_Sucker_for_You.png', 3.24),
(137, 'BLUE','Jpop', 'LUCKY TAPES feat. kojikoji', 'https://owldb.net/wp-content/uploads/2021/04/LUCKY-TAPES-BLUE.jpg', 4.04),
(138, 'Thinkin’ Bout U”','Pop', 'Tobii', 'https://is4-ssl.mzstatic.com/image/thumb/Music124/v4/2e/05/fc/2e05fc5b-f8e4-3604-1a04-911d23bd92cb/artwork.jpg/400x400bb.jpg', 3.39),
(139, 'Windowpane','Pop', 'Matthaios and Dane Amar', 'https://images.genius.com/80efbcf5aee4a5db9cc529281df98590.1000x1000x1.png', 3.05),
(140, 'One Too Many','Country Pop', 'Keith Urban', 'https://i.scdn.co/image/ab67616d0000b273f2a428f109f825ec22c64656', 3.24),
(141, 'The Cave','Alternative/Indie/Folk','Mumford & sons', 'https://www.songmeaningsandfacts.com/wp-content/uploads/2020/08/Mumford-Sons-The-Cave.jpg', 3.36),
(142, 'STONE COLD','Pop', 'Nodis', 'https://images.genius.com/900f90e767bf65fa86ae8756cffc299e.1000x1000x1.jpg', 3.01),
(143, 'Love So Fine','Kpop', 'Cha Eun Woo', 'https://f.ptcdn.info/462/072/000/qnycrmfbyi5ab74l5WK-o.jpg', 3.12),
(144, 'Puzzle Piece','Kpop', 'NCT Dream', 'https://f.ptcdn.info/094/069/000/q958e81bafPk9c24TNln-o.jpg', 3.48),
(145, 'Love Is Life','Jpop', 'Taichi Mukai', 'https://geo-media.beatport.com/image_size/500x500/a0502632-1d21-4c9e-8605-f0eeb3002928.jpg', 3.32),
(146, 'No Words','Kpop', 'Crush', 'https://i0.wp.com/colorcodedlyrics.com/wp-content/uploads/2020/12/Crush-No-Words-Itaewon-Class-OST-Pt-11.jpg?fit=600%2C600&ssl=1', 4.31),
(147, 'Hopeful','Alternative/Indie/Pop/Hip Hop/Rap', 'Bars and Melody', 'https://i.ytimg.com/vi/wT3RhIJZu4k/maxresdefault.jpg', 3.21),
(148, 'Like It’s Christmas','Pop', 'Jonas Brothers', 'https://www.educatepark.com/wp-content/uploads/2019/11/like-its-christmas.jpg', 3.21),
(149, 'Bonfire','Pop', 'Peder Elias', 'https://images.genius.com/3f729921f6bf593d09fed4a2577d2154.1000x1000x1.jpg', 2.47),
(150, 'Above Average','Hip Hop/Rap', 'Jay Author', 'https://is4-ssl.mzstatic.com/image/thumb/Music113/v4/aa/62/28/aa622851-0ca3-8ce3-1f4a-0b9def470cc3/artwork.jpg/400x400cc.jpg', 3.48),
(151, 'Best Of Joy','R&B/Soul/Pop', 'Michael Jackson', 'https://s.isanook.com/jo/0/rp/r/w300/ya0xa0m1w0/aHR0cDovL2ltYWdlLmpvb3guY29tL0pPT1hjb3Zlci8wL2ViNWRiMzVmMjlkYWVmYjgvNjQwLmpwZw==.jpg', 3.02),
(152, 'Perfectly Lonely','Rock/Pop', 'John Mayer', 'https://angartwork.akamaized.net/?id=3261&size=640', 4.28),
(153, '(I Like) The Way You Love Me','R&B/Soul', 'Michael Jackson', 'https://s.isanook.com/jo/0/rp/r/w300/ya0xa0m1w0/aHR0cDovL2ltYWdlLmpvb3guY29tL0pPT1hjb3Zlci8wL2ViNWRiMzVmMjlkYWVmYjgvNjQwLmpwZw==.jpg', 4.34),
(154, 'I’ll Be There','Pop', 'Walk Off The Earth', 'https://i.scdn.co/image/ab67616d0000b273a21727d38ed201c03d9bac24', 3.12),
(155, 'BOOM','Kpop/Korean Dance/Electronic/Rythm and Blues', 'NCT Dream', 'https://1.bp.blogspot.com/-rvI4CcLSyMY/XUAQ2-Ms5kI/AAAAAAAAPQU/zLmHerx8kH4LxMWUTKxFwbdRSdB6l2tZgCLcBGAs/s1600/iiioaX.jpg', 3.15),
(156, 'Under the Cloud','Pop', 'Han Hong ft. JJ Lin', 'https://i.ytimg.com/vi/ytGrT9JV3G0/maxresdefault.jpg', 4.34),
(157, 'I’m the One','Pop/Hip Hop/Rap','DJ Khaled ft. Justin Bieber, Quavo, Chance the Rapper, Lil Wayne', 'https://s.isanook.com/jo/0/rp/r/w700/ya0xa0m1w0/aHR0cDovL2ltYWdlLmpvb3guY29tL0pPT1hjb3Zlci8wL2ExYmQzMTI1MGIxOWM1YTcvNjQwLmpwZw==.jpg', 4.53);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `fname` varchar(60) NOT NULL,
  `Lname` varchar(60) NOT NULL,
  `Address` varchar(500) NOT NULL,
  `Age` int(11) NOT NULL,
  `Preferences` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `fname`, `Lname`, `Address`, `Age`, `Preferences`, `Email`) VALUES
(1, 'Kornkanok', 'Kosolsombat', '230/34 Vcondo Salaya (Building 9), Salaya, Phutthamonthon, Nakhon Pathom 73170', 19, 'kpop, jpop', 'ploykosol@gmail.com'),
(2, 'Rungpilin', 'Anantathanavit', '95/177 PAVE salaya (soi 39), Salaya, Phutthamonthon, Nakhon Pathom', 19, 'kpop', 'beamxteen@gmail.com'),
(3, 'Warisa', 'Kongsantinart', '75 Ekkachai80/1 Ekkachai Bangbon BKK10150', 20, 'jpop', 'warisa_kstn@hotmail.com'),
(4, 'Jomchai', 'Chongthanakorn', '244-246 Ratchadapisek11 Ratchadapisek(Thapra-Taksin) Dawkanong Thonburi BKK 10600', 19, 'hop', 'Jomchaic62@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`logID`);

--
-- Indexes for table `musics`
--
ALTER TABLE `musics`
  ADD PRIMARY KEY (`musicID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `logID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `musics`
--
ALTER TABLE `musics`
  MODIFY `musicID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
