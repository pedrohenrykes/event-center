-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 05-Out-2017 às 17:14
-- Versão do servidor: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_eventadmin`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acessos`
--

CREATE TABLE `acessos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sessionid` varchar(100) DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `adminltecolors`
--

CREATE TABLE `adminltecolors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class` varchar(20) DEFAULT NULL,
  `colorname` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `adminltecolors`
--

INSERT INTO `adminltecolors` (`id`, `class`, `colorname`) VALUES
(1, 'bg-red', 'Vermelho'),
(2, 'bg-yellow', 'Amarelo'),
(3, 'bg-blue', 'Azul'),
(4, 'bg-light-blue', 'Azul claro'),
(5, 'bg-aqua', 'Azul aqua'),
(6, 'bg-navy', 'Azul marinho'),
(7, 'bg-teal', 'Azul teal'),
(8, 'bg-green', 'Verde'),
(9, 'bg-olive', 'Verde oliva'),
(10, 'bg-lime', 'Verde limão'),
(11, 'bg-orange', 'Laranja'),
(12, 'bg-fuchsia', 'Rosa fúcsia'),
(13, 'bg-purple', 'Lilás'),
(14, 'bg-maroon', 'Marrom'),
(15, 'bg-black', 'Preto'),
(16, 'bg-red-active', 'Vermelho ativo'),
(17, 'bg-yellow-active', 'Amarelo ativo'),
(18, 'bg-blue-active', 'Azul ativo'),
(19, 'bg-light-blue-active', 'Azul claro ativo'),
(20, 'bg-aqua-active', 'Azul aqua ativo'),
(21, 'bg-navy-active', 'Azul marinho ativo'),
(22, 'bg-teal-active', 'Azul teal ativo'),
(23, 'bg-green-active', 'Verde ativo'),
(24, 'bg-olive-active', 'Verde oliva ativo'),
(25, 'bg-lime-active', 'Verde limão ativo'),
(26, 'bg-orange-active', 'Laranja ativo'),
(27, 'bg-fuchsia-active', 'Rosa fúcsia ativo'),
(28, 'bg-purple-active', 'Lilás ativo'),
(29, 'bg-maroon-active', 'Marrom ativo'),
(30, 'bg-black-active', 'Preto ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dashboard`
--

CREATE TABLE `dashboard` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dataview` varchar(30) DEFAULT NULL,
  `quantifier` varchar(20) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `page` varchar(30) DEFAULT NULL,
  `action` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `eventos`
--

CREATE TABLE `eventos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `local_id` bigint(20) UNSIGNED NOT NULL,
  `genero_id` bigint(20) UNSIGNED NOT NULL,
  `edicao` int(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(1500) DEFAULT NULL,
  `data_evento` date DEFAULT NULL,
  `hora_evento` time DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `situacao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `eventos`
--

INSERT INTO `eventos` (`id`, `local_id`, `genero_id`, `edicao`, `nome`, `descricao`, `data_evento`, `hora_evento`, `duracao`, `situacao`) VALUES
(1, 1, 1, 55, 'Festa do Boi 2017', 'Maior evento agropecuário do RN', '2017-09-01', '06:00:00', 3, 'ATIVO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fontawesomeicons`
--

CREATE TABLE `fontawesomeicons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class` varchar(30) DEFAULT NULL,
  `unicode` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fontawesomeicons`
--

INSERT INTO `fontawesomeicons` (`id`, `class`, `unicode`) VALUES
(2, 'fa-500px', '&#xf26e;'),
(3, 'fa-address-book', '&#xf2b9;'),
(4, 'fa-address-book-o', '&#xf2ba;'),
(5, 'fa-address-card', '&#xf2bb;'),
(6, 'fa-address-card-o', '&#xf2bc;'),
(7, 'fa-adjust', '&#xf042;'),
(8, 'fa-adn', '&#xf170;'),
(9, 'fa-align-center', '&#xf037;'),
(10, 'fa-align-justify', '&#xf039;'),
(11, 'fa-align-left', '&#xf036;'),
(12, 'fa-align-right', '&#xf038;'),
(13, 'fa-amazon', '&#xf270;'),
(14, 'fa-ambulance', '&#xf0f9;'),
(15, 'fa-anchor', '&#xf13d;'),
(16, 'fa-android', '&#xf17b;'),
(17, 'fa-angellist', '&#xf209;'),
(18, 'fa-angle-double-down', '&#xf103;'),
(19, 'fa-angle-double-left', '&#xf100;'),
(20, 'fa-angle-double-right', '&#xf101;'),
(21, 'fa-angle-double-up', '&#xf102;'),
(22, 'fa-angle-down', '&#xf107;'),
(23, 'fa-angle-left', '&#xf104;'),
(24, 'fa-angle-right', '&#xf105;'),
(25, 'fa-angle-up', '&#xf106;'),
(26, 'fa-apple', '&#xf179;'),
(27, 'fa-archive', '&#xf187;'),
(28, 'fa-area-chart', '&#xf1fe;'),
(29, 'fa-arrow-circle-down', '&#xf0ab;'),
(30, 'fa-arrow-circle-left', '&#xf0a8;'),
(31, 'fa-arrow-circle-o-down', '&#xf01a;'),
(32, 'fa-arrow-circle-o-left', '&#xf190;'),
(33, 'fa-arrow-circle-o-right', '&#xf18e;'),
(34, 'fa-arrow-circle-o-up', '&#xf01b;'),
(35, 'fa-arrow-circle-right', '&#xf0a9;'),
(36, 'fa-arrow-circle-up', '&#xf0aa;'),
(37, 'fa-arrow-down', '&#xf063;'),
(38, 'fa-arrow-left', '&#xf060;'),
(39, 'fa-arrow-right', '&#xf061;'),
(40, 'fa-arrow-up', '&#xf062;'),
(41, 'fa-arrows', '&#xf047;'),
(42, 'fa-arrows-alt', '&#xf0b2;'),
(43, 'fa-arrows-h', '&#xf07e;'),
(44, 'fa-arrows-v', '&#xf07d;'),
(45, 'fa-asl-interpreting', '&#xf2a3;'),
(46, 'fa-assistive-listening-systems', '&#xf2a2;'),
(47, 'fa-asterisk', '&#xf069;'),
(48, 'fa-at', '&#xf1fa;'),
(49, 'fa-audio-description', '&#xf29e;'),
(50, 'fa-automobile', '&#xf1b9;'),
(51, 'fa-backward', '&#xf04a;'),
(52, 'fa-balance-scale', '&#xf24e;'),
(53, 'fa-ban', '&#xf05e;'),
(54, 'fa-bandcamp', '&#xf2d5;'),
(55, 'fa-bank', '&#xf19c;'),
(56, 'fa-bar-chart', '&#xf080;'),
(57, 'fa-bar-chart-o', '&#xf080;'),
(58, 'fa-barcode', '&#xf02a;'),
(59, 'fa-bars', '&#xf0c9;'),
(60, 'fa-bath', '&#xf2cd;'),
(61, 'fa-bathtub', '&#xf2cd;'),
(62, 'fa-battery', '&#xf240;'),
(63, 'fa-battery-0', '&#xf244;'),
(64, 'fa-battery-1', '&#xf243;'),
(65, 'fa-battery-2', '&#xf242;'),
(66, 'fa-battery-3', '&#xf241;'),
(67, 'fa-battery-4', '&#xf240;'),
(68, 'fa-battery-empty', '&#xf244;'),
(69, 'fa-battery-full', '&#xf240;'),
(70, 'fa-battery-half', '&#xf242;'),
(71, 'fa-battery-quarter', '&#xf243;'),
(72, 'fa-battery-three-quarters', '&#xf241;'),
(73, 'fa-bed', '&#xf236;'),
(74, 'fa-beer', '&#xf0fc;'),
(75, 'fa-behance', '&#xf1b4;'),
(76, 'fa-behance-square', '&#xf1b5;'),
(77, 'fa-bell', '&#xf0f3;'),
(78, 'fa-bell-o', '&#xf0a2;'),
(79, 'fa-bell-slash', '&#xf1f6;'),
(80, 'fa-bell-slash-o', '&#xf1f7;'),
(81, 'fa-bicycle', '&#xf206;'),
(82, 'fa-binoculars', '&#xf1e5;'),
(83, 'fa-birthday-cake', '&#xf1fd;'),
(84, 'fa-bitbucket', '&#xf171;'),
(85, 'fa-bitbucket-square', '&#xf172;'),
(86, 'fa-bitcoin', '&#xf15a;'),
(87, 'fa-black-tie', '&#xf27e;'),
(88, 'fa-blind', '&#xf29d;'),
(89, 'fa-bluetooth', '&#xf293;'),
(90, 'fa-bluetooth-b', '&#xf294;'),
(91, 'fa-bold', '&#xf032;'),
(92, 'fa-bolt', '&#xf0e7;'),
(93, 'fa-bomb', '&#xf1e2;'),
(94, 'fa-book', '&#xf02d;'),
(95, 'fa-bookmark', '&#xf02e;'),
(96, 'fa-bookmark-o', '&#xf097;'),
(97, 'fa-braille', '&#xf2a1;'),
(98, 'fa-briefcase', '&#xf0b1;'),
(99, 'fa-btc', '&#xf15a;'),
(100, 'fa-bug', '&#xf188;'),
(101, 'fa-building', '&#xf1ad;'),
(102, 'fa-building-o', '&#xf0f7;'),
(103, 'fa-bullhorn', '&#xf0a1;'),
(104, 'fa-bullseye', '&#xf140;'),
(105, 'fa-bus', '&#xf207;'),
(106, 'fa-buysellads', '&#xf20d;'),
(107, 'fa-cab', '&#xf1ba;'),
(108, 'fa-calculator', '&#xf1ec;'),
(109, 'fa-calendar', '&#xf073;'),
(110, 'fa-calendar-check-o', '&#xf274;'),
(111, 'fa-calendar-minus-o', '&#xf272;'),
(112, 'fa-calendar-o', '&#xf133;'),
(113, 'fa-calendar-plus-o', '&#xf271;'),
(114, 'fa-calendar-times-o', '&#xf273;'),
(115, 'fa-camera', '&#xf030;'),
(116, 'fa-camera-retro', '&#xf083;'),
(117, 'fa-car', '&#xf1b9;'),
(118, 'fa-caret-down', '&#xf0d7;'),
(119, 'fa-caret-left', '&#xf0d9;'),
(120, 'fa-caret-right', '&#xf0da;'),
(121, 'fa-caret-square-o-down', '&#xf150;'),
(122, 'fa-caret-square-o-left', '&#xf191;'),
(123, 'fa-caret-square-o-right', '&#xf152;'),
(124, 'fa-caret-square-o-up', '&#xf151;'),
(125, 'fa-caret-up', '&#xf0d8;'),
(126, 'fa-cart-arrow-down', '&#xf218;'),
(127, 'fa-cart-plus', '&#xf217;'),
(128, 'fa-cc', '&#xf20a;'),
(129, 'fa-cc-amex', '&#xf1f3;'),
(130, 'fa-cc-diners-club', '&#xf24c;'),
(131, 'fa-cc-discover', '&#xf1f2;'),
(132, 'fa-cc-jcb', '&#xf24b;'),
(133, 'fa-cc-mastercard', '&#xf1f1;'),
(134, 'fa-cc-paypal', '&#xf1f4;'),
(135, 'fa-cc-stripe', '&#xf1f5;'),
(136, 'fa-cc-visa', '&#xf1f0;'),
(137, 'fa-certificate', '&#xf0a3;'),
(138, 'fa-chain', '&#xf0c1;'),
(139, 'fa-chain-broken', '&#xf127;'),
(140, 'fa-check', '&#xf00c;'),
(141, 'fa-check-circle', '&#xf058;'),
(142, 'fa-check-circle-o', '&#xf05d;'),
(143, 'fa-check-square', '&#xf14a;'),
(144, 'fa-check-square-o', '&#xf046;'),
(145, 'fa-chevron-circle-down', '&#xf13a;'),
(146, 'fa-chevron-circle-left', '&#xf137;'),
(147, 'fa-chevron-circle-right', '&#xf138;'),
(148, 'fa-chevron-circle-up', '&#xf139;'),
(149, 'fa-chevron-down', '&#xf078;'),
(150, 'fa-chevron-left', '&#xf053;'),
(151, 'fa-chevron-right', '&#xf054;'),
(152, 'fa-chevron-up', '&#xf077;'),
(153, 'fa-child', '&#xf1ae;'),
(154, 'fa-chrome', '&#xf268;'),
(155, 'fa-circle', '&#xf111;'),
(156, 'fa-circle-o', '&#xf10c;'),
(157, 'fa-circle-o-notch', '&#xf1ce;'),
(158, 'fa-circle-thin', '&#xf1db;'),
(159, 'fa-clipboard', '&#xf0ea;'),
(160, 'fa-clock-o', '&#xf017;'),
(161, 'fa-clone', '&#xf24d;'),
(162, 'fa-close', '&#xf00d;'),
(163, 'fa-cloud', '&#xf0c2;'),
(164, 'fa-cloud-download', '&#xf0ed;'),
(165, 'fa-cloud-upload', '&#xf0ee;'),
(166, 'fa-cny', '&#xf157;'),
(167, 'fa-code', '&#xf121;'),
(168, 'fa-code-fork', '&#xf126;'),
(169, 'fa-codepen', '&#xf1cb;'),
(170, 'fa-codiepie', '&#xf284;'),
(171, 'fa-coffee', '&#xf0f4;'),
(172, 'fa-cog', '&#xf013;'),
(173, 'fa-cogs', '&#xf085;'),
(174, 'fa-columns', '&#xf0db;'),
(175, 'fa-comment', '&#xf075;'),
(176, 'fa-comment-o', '&#xf0e5;'),
(177, 'fa-commenting', '&#xf27a;'),
(178, 'fa-commenting-o', '&#xf27b;'),
(179, 'fa-comments', '&#xf086;'),
(180, 'fa-comments-o', '&#xf0e6;'),
(181, 'fa-compass', '&#xf14e;'),
(182, 'fa-compress', '&#xf066;'),
(183, 'fa-connectdevelop', '&#xf20e;'),
(184, 'fa-contao', '&#xf26d;'),
(185, 'fa-copy', '&#xf0c5;'),
(186, 'fa-copyright', '&#xf1f9;'),
(187, 'fa-creative-commons', '&#xf25e;'),
(188, 'fa-credit-card', '&#xf09d;'),
(189, 'fa-credit-card-alt', '&#xf283;'),
(190, 'fa-crop', '&#xf125;'),
(191, 'fa-crosshairs', '&#xf05b;'),
(192, 'fa-css3', '&#xf13c;'),
(193, 'fa-cube', '&#xf1b2;'),
(194, 'fa-cubes', '&#xf1b3;'),
(195, 'fa-cut', '&#xf0c4;'),
(196, 'fa-cutlery', '&#xf0f5;'),
(197, 'fa-dashboard', '&#xf0e4;'),
(198, 'fa-dashcube', '&#xf210;'),
(199, 'fa-database', '&#xf1c0;'),
(200, 'fa-deaf', '&#xf2a4;'),
(201, 'fa-deafness', '&#xf2a4;'),
(202, 'fa-dedent', '&#xf03b;'),
(203, 'fa-delicious', '&#xf1a5;'),
(204, 'fa-desktop', '&#xf108;'),
(205, 'fa-deviantart', '&#xf1bd;'),
(206, 'fa-diamond', '&#xf219;'),
(207, 'fa-digg', '&#xf1a6;'),
(208, 'fa-dollar', '&#xf155;'),
(209, 'fa-dot-circle-o', '&#xf192;'),
(210, 'fa-download', '&#xf019;'),
(211, 'fa-dribbble', '&#xf17d;'),
(212, 'fa-drivers-license', '&#xf2c2;'),
(213, 'fa-drivers-license-o', '&#xf2c3;'),
(214, 'fa-dropbox', '&#xf16b;'),
(215, 'fa-drupal', '&#xf1a9;'),
(216, 'fa-edge', '&#xf282;'),
(217, 'fa-edit', '&#xf044;'),
(218, 'fa-eercast', '&#xf2da;'),
(219, 'fa-eject', '&#xf052;'),
(220, 'fa-ellipsis-h', '&#xf141;'),
(221, 'fa-ellipsis-v', '&#xf142;'),
(222, 'fa-empire', '&#xf1d1;'),
(223, 'fa-envelope', '&#xf0e0;'),
(224, 'fa-envelope-o', '&#xf003;'),
(225, 'fa-envelope-open', '&#xf2b6;'),
(226, 'fa-envelope-open-o', '&#xf2b7;'),
(227, 'fa-envelope-square', '&#xf199;'),
(228, 'fa-envira', '&#xf299;'),
(229, 'fa-eraser', '&#xf12d;'),
(230, 'fa-etsy', '&#xf2d7;'),
(231, 'fa-eur', '&#xf153;'),
(232, 'fa-euro', '&#xf153;'),
(233, 'fa-exchange', '&#xf0ec;'),
(234, 'fa-exclamation', '&#xf12a;'),
(235, 'fa-exclamation-circle', '&#xf06a;'),
(236, 'fa-exclamation-triangle', '&#xf071;'),
(237, 'fa-expand', '&#xf065;'),
(238, 'fa-expeditedssl', '&#xf23e;'),
(239, 'fa-external-link', '&#xf08e;'),
(240, 'fa-external-link-square', '&#xf14c;'),
(241, 'fa-eye', '&#xf06e;'),
(242, 'fa-eye-slash', '&#xf070;'),
(243, 'fa-eyedropper', '&#xf1fb;'),
(244, 'fa-fa', '&#xf2b4;'),
(245, 'fa-facebook', '&#xf09a;'),
(246, 'fa-facebook-f', '&#xf09a;'),
(247, 'fa-facebook-official', '&#xf230;'),
(248, 'fa-facebook-square', '&#xf082;'),
(249, 'fa-fast-backward', '&#xf049;'),
(250, 'fa-fast-forward', '&#xf050;'),
(251, 'fa-fax', '&#xf1ac;'),
(252, 'fa-feed', '&#xf09e;'),
(253, 'fa-female', '&#xf182;'),
(254, 'fa-fighter-jet', '&#xf0fb;'),
(255, 'fa-file', '&#xf15b;'),
(256, 'fa-file-archive-o', '&#xf1c6;'),
(257, 'fa-file-audio-o', '&#xf1c7;'),
(258, 'fa-file-code-o', '&#xf1c9;'),
(259, 'fa-file-excel-o', '&#xf1c3;'),
(260, 'fa-file-image-o', '&#xf1c5;'),
(261, 'fa-file-movie-o', '&#xf1c8;'),
(262, 'fa-file-o', '&#xf016;'),
(263, 'fa-file-pdf-o', '&#xf1c1;'),
(264, 'fa-file-photo-o', '&#xf1c5;'),
(265, 'fa-file-picture-o', '&#xf1c5;'),
(266, 'fa-file-powerpoint-o', '&#xf1c4;'),
(267, 'fa-file-sound-o', '&#xf1c7;'),
(268, 'fa-file-text', '&#xf15c;'),
(269, 'fa-file-text-o', '&#xf0f6;'),
(270, 'fa-file-video-o', '&#xf1c8;'),
(271, 'fa-file-word-o', '&#xf1c2;'),
(272, 'fa-file-zip-o', '&#xf1c6;'),
(273, 'fa-files-o', '&#xf0c5;'),
(274, 'fa-film', '&#xf008;'),
(275, 'fa-filter', '&#xf0b0;'),
(276, 'fa-fire', '&#xf06d;'),
(277, 'fa-fire-extinguisher', '&#xf134;'),
(278, 'fa-firefox', '&#xf269;'),
(279, 'fa-first-order', '&#xf2b0;'),
(280, 'fa-flag', '&#xf024;'),
(281, 'fa-flag-checkered', '&#xf11e;'),
(282, 'fa-flag-o', '&#xf11d;'),
(283, 'fa-flash', '&#xf0e7;'),
(284, 'fa-flask', '&#xf0c3;'),
(285, 'fa-flickr', '&#xf16e;'),
(286, 'fa-floppy-o', '&#xf0c7;'),
(287, 'fa-folder', '&#xf07b;'),
(288, 'fa-folder-o', '&#xf114;'),
(289, 'fa-folder-open', '&#xf07c;'),
(290, 'fa-folder-open-o', '&#xf115;'),
(291, 'fa-font', '&#xf031;'),
(292, 'fa-font-awesome', '&#xf2b4;'),
(293, 'fa-fonticons', '&#xf280;'),
(294, 'fa-fort-awesome', '&#xf286;'),
(295, 'fa-forumbee', '&#xf211;'),
(296, 'fa-forward', '&#xf04e;'),
(297, 'fa-foursquare', '&#xf180;'),
(298, 'fa-free-code-camp', '&#xf2c5;'),
(299, 'fa-frown-o', '&#xf119;'),
(300, 'fa-futbol-o', '&#xf1e3;'),
(301, 'fa-gamepad', '&#xf11b;'),
(302, 'fa-gavel', '&#xf0e3;'),
(303, 'fa-gbp', '&#xf154;'),
(304, 'fa-ge', '&#xf1d1;'),
(305, 'fa-gear', '&#xf013;'),
(306, 'fa-gears', '&#xf085;'),
(307, 'fa-genderless', '&#xf22d;'),
(308, 'fa-get-pocket', '&#xf265;'),
(309, 'fa-gg', '&#xf260;'),
(310, 'fa-gg-circle', '&#xf261;'),
(311, 'fa-gift', '&#xf06b;'),
(312, 'fa-git', '&#xf1d3;'),
(313, 'fa-git-square', '&#xf1d2;'),
(314, 'fa-github', '&#xf09b;'),
(315, 'fa-github-alt', '&#xf113;'),
(316, 'fa-github-square', '&#xf092;'),
(317, 'fa-gitlab', '&#xf296;'),
(318, 'fa-gittip', '&#xf184;'),
(319, 'fa-glass', '&#xf000;'),
(320, 'fa-glide', '&#xf2a5;'),
(321, 'fa-glide-g', '&#xf2a6;'),
(322, 'fa-globe', '&#xf0ac;'),
(323, 'fa-google', '&#xf1a0;'),
(324, 'fa-google-plus', '&#xf0d5;'),
(325, 'fa-google-plus-circle', '&#xf2b3;'),
(326, 'fa-google-plus-official', '&#xf2b3;'),
(327, 'fa-google-plus-square', '&#xf0d4;'),
(328, 'fa-google-wallet', '&#xf1ee;'),
(329, 'fa-graduation-cap', '&#xf19d;'),
(330, 'fa-gratipay', '&#xf184;'),
(331, 'fa-grav', '&#xf2d6;'),
(332, 'fa-group', '&#xf0c0;'),
(333, 'fa-h-square', '&#xf0fd;'),
(334, 'fa-hacker-news', '&#xf1d4;'),
(335, 'fa-hand-grab-o', '&#xf255;'),
(336, 'fa-hand-lizard-o', '&#xf258;'),
(337, 'fa-hand-o-down', '&#xf0a7;'),
(338, 'fa-hand-o-left', '&#xf0a5;'),
(339, 'fa-hand-o-right', '&#xf0a4;'),
(340, 'fa-hand-o-up', '&#xf0a6;'),
(341, 'fa-hand-paper-o', '&#xf256;'),
(342, 'fa-hand-peace-o', '&#xf25b;'),
(343, 'fa-hand-pointer-o', '&#xf25a;'),
(344, 'fa-hand-rock-o', '&#xf255;'),
(345, 'fa-hand-scissors-o', '&#xf257;'),
(346, 'fa-hand-spock-o', '&#xf259;'),
(347, 'fa-hand-stop-o', '&#xf256;'),
(348, 'fa-handshake-o', '&#xf2b5;'),
(349, 'fa-hard-of-hearing', '&#xf2a4;'),
(350, 'fa-hashtag', '&#xf292;'),
(351, 'fa-hdd-o', '&#xf0a0;'),
(352, 'fa-header', '&#xf1dc;'),
(353, 'fa-headphones', '&#xf025;'),
(354, 'fa-heart', '&#xf004;'),
(355, 'fa-heart-o', '&#xf08a;'),
(356, 'fa-heartbeat', '&#xf21e;'),
(357, 'fa-history', '&#xf1da;'),
(358, 'fa-home', '&#xf015;'),
(359, 'fa-hospital-o', '&#xf0f8;'),
(360, 'fa-hotel', '&#xf236;'),
(361, 'fa-hourglass', '&#xf254;'),
(362, 'fa-hourglass-1', '&#xf251;'),
(363, 'fa-hourglass-2', '&#xf252;'),
(364, 'fa-hourglass-3', '&#xf253;'),
(365, 'fa-hourglass-end', '&#xf253;'),
(366, 'fa-hourglass-half', '&#xf252;'),
(367, 'fa-hourglass-o', '&#xf250;'),
(368, 'fa-hourglass-start', '&#xf251;'),
(369, 'fa-houzz', '&#xf27c;'),
(370, 'fa-html5', '&#xf13b;'),
(371, 'fa-i-cursor', '&#xf246;'),
(372, 'fa-id-badge', '&#xf2c1;'),
(373, 'fa-id-card', '&#xf2c2;'),
(374, 'fa-id-card-o', '&#xf2c3;'),
(375, 'fa-ils', '&#xf20b;'),
(376, 'fa-image', '&#xf03e;'),
(377, 'fa-imdb', '&#xf2d8;'),
(378, 'fa-inbox', '&#xf01c;'),
(379, 'fa-indent', '&#xf03c;'),
(380, 'fa-industry', '&#xf275;'),
(381, 'fa-info', '&#xf129;'),
(382, 'fa-info-circle', '&#xf05a;'),
(383, 'fa-inr', '&#xf156;'),
(384, 'fa-instagram', '&#xf16d;'),
(385, 'fa-institution', '&#xf19c;'),
(386, 'fa-internet-explorer', '&#xf26b;'),
(387, 'fa-intersex', '&#xf224;'),
(388, 'fa-ioxhost', '&#xf208;'),
(389, 'fa-italic', '&#xf033;'),
(390, 'fa-joomla', '&#xf1aa;'),
(391, 'fa-jpy', '&#xf157;'),
(392, 'fa-jsfiddle', '&#xf1cc;'),
(393, 'fa-key', '&#xf084;'),
(394, 'fa-keyboard-o', '&#xf11c;'),
(395, 'fa-krw', '&#xf159;'),
(396, 'fa-language', '&#xf1ab;'),
(397, 'fa-laptop', '&#xf109;'),
(398, 'fa-lastfm', '&#xf202;'),
(399, 'fa-lastfm-square', '&#xf203;'),
(400, 'fa-leaf', '&#xf06c;'),
(401, 'fa-leanpub', '&#xf212;'),
(402, 'fa-legal', '&#xf0e3;'),
(403, 'fa-lemon-o', '&#xf094;'),
(404, 'fa-level-down', '&#xf149;'),
(405, 'fa-level-up', '&#xf148;'),
(406, 'fa-life-bouy', '&#xf1cd;'),
(407, 'fa-life-buoy', '&#xf1cd;'),
(408, 'fa-life-ring', '&#xf1cd;'),
(409, 'fa-life-saver', '&#xf1cd;'),
(410, 'fa-lightbulb-o', '&#xf0eb;'),
(411, 'fa-line-chart', '&#xf201;'),
(412, 'fa-link', '&#xf0c1;'),
(413, 'fa-linkedin', '&#xf0e1;'),
(414, 'fa-linkedin-square', '&#xf08c;'),
(415, 'fa-linode', '&#xf2b8;'),
(416, 'fa-linux', '&#xf17c;'),
(417, 'fa-list', '&#xf03a;'),
(418, 'fa-list-alt', '&#xf022;'),
(419, 'fa-list-ol', '&#xf0cb;'),
(420, 'fa-list-ul', '&#xf0ca;'),
(421, 'fa-location-arrow', '&#xf124;'),
(422, 'fa-lock', '&#xf023;'),
(423, 'fa-long-arrow-down', '&#xf175;'),
(424, 'fa-long-arrow-left', '&#xf177;'),
(425, 'fa-long-arrow-right', '&#xf178;'),
(426, 'fa-long-arrow-up', '&#xf176;'),
(427, 'fa-low-vision', '&#xf2a8;'),
(428, 'fa-magic', '&#xf0d0;'),
(429, 'fa-magnet', '&#xf076;'),
(430, 'fa-mail-forward', '&#xf064;'),
(431, 'fa-mail-reply', '&#xf112;'),
(432, 'fa-mail-reply-all', '&#xf122;'),
(433, 'fa-male', '&#xf183;'),
(434, 'fa-map', '&#xf279;'),
(435, 'fa-map-marker', '&#xf041;'),
(436, 'fa-map-o', '&#xf278;'),
(437, 'fa-map-pin', '&#xf276;'),
(438, 'fa-map-signs', '&#xf277;'),
(439, 'fa-mars', '&#xf222;'),
(440, 'fa-mars-double', '&#xf227;'),
(441, 'fa-mars-stroke', '&#xf229;'),
(442, 'fa-mars-stroke-h', '&#xf22b;'),
(443, 'fa-mars-stroke-v', '&#xf22a;'),
(444, 'fa-maxcdn', '&#xf136;'),
(445, 'fa-meanpath', '&#xf20c;'),
(446, 'fa-medium', '&#xf23a;'),
(447, 'fa-medkit', '&#xf0fa;'),
(448, 'fa-meetup', '&#xf2e0;'),
(449, 'fa-meh-o', '&#xf11a;'),
(450, 'fa-mercury', '&#xf223;'),
(451, 'fa-microchip', '&#xf2db;'),
(452, 'fa-microphone', '&#xf130;'),
(453, 'fa-microphone-slash', '&#xf131;'),
(454, 'fa-minus', '&#xf068;'),
(455, 'fa-minus-circle', '&#xf056;'),
(456, 'fa-minus-square', '&#xf146;'),
(457, 'fa-minus-square-o', '&#xf147;'),
(458, 'fa-mixcloud', '&#xf289;'),
(459, 'fa-mobile', '&#xf10b;'),
(460, 'fa-mobile-phone', '&#xf10b;'),
(461, 'fa-modx', '&#xf285;'),
(462, 'fa-money', '&#xf0d6;'),
(463, 'fa-moon-o', '&#xf186;'),
(464, 'fa-mortar-board', '&#xf19d;'),
(465, 'fa-motorcycle', '&#xf21c;'),
(466, 'fa-mouse-pointer', '&#xf245;'),
(467, 'fa-music', '&#xf001;'),
(468, 'fa-navicon', '&#xf0c9;'),
(469, 'fa-neuter', '&#xf22c;'),
(470, 'fa-newspaper-o', '&#xf1ea;'),
(471, 'fa-object-group', '&#xf247;'),
(472, 'fa-object-ungroup', '&#xf248;'),
(473, 'fa-odnoklassniki', '&#xf263;'),
(474, 'fa-odnoklassniki-square', '&#xf264;'),
(475, 'fa-opencart', '&#xf23d;'),
(476, 'fa-openid', '&#xf19b;'),
(477, 'fa-opera', '&#xf26a;'),
(478, 'fa-optin-monster', '&#xf23c;'),
(479, 'fa-outdent', '&#xf03b;'),
(480, 'fa-pagelines', '&#xf18c;'),
(481, 'fa-paint-brush', '&#xf1fc;'),
(482, 'fa-paper-plane', '&#xf1d8;'),
(483, 'fa-paper-plane-o', '&#xf1d9;'),
(484, 'fa-paperclip', '&#xf0c6;'),
(485, 'fa-paragraph', '&#xf1dd;'),
(486, 'fa-paste', '&#xf0ea;'),
(487, 'fa-pause', '&#xf04c;'),
(488, 'fa-pause-circle', '&#xf28b;'),
(489, 'fa-pause-circle-o', '&#xf28c;'),
(490, 'fa-paw', '&#xf1b0;'),
(491, 'fa-paypal', '&#xf1ed;'),
(492, 'fa-pencil', '&#xf040;'),
(493, 'fa-pencil-square', '&#xf14b;'),
(494, 'fa-pencil-square-o', '&#xf044;'),
(495, 'fa-percent', '&#xf295;'),
(496, 'fa-phone', '&#xf095;'),
(497, 'fa-phone-square', '&#xf098;'),
(498, 'fa-photo', '&#xf03e;'),
(499, 'fa-picture-o', '&#xf03e;'),
(500, 'fa-pie-chart', '&#xf200;'),
(501, 'fa-pied-piper', '&#xf2ae;'),
(502, 'fa-pied-piper-alt', '&#xf1a8;'),
(503, 'fa-pied-piper-pp', '&#xf1a7;'),
(504, 'fa-pinterest', '&#xf0d2;'),
(505, 'fa-pinterest-p', '&#xf231;'),
(506, 'fa-pinterest-square', '&#xf0d3;'),
(507, 'fa-plane', '&#xf072;'),
(508, 'fa-play', '&#xf04b;'),
(509, 'fa-play-circle', '&#xf144;'),
(510, 'fa-play-circle-o', '&#xf01d;'),
(511, 'fa-plug', '&#xf1e6;'),
(512, 'fa-plus', '&#xf067;'),
(513, 'fa-plus-circle', '&#xf055;'),
(514, 'fa-plus-square', '&#xf0fe;'),
(515, 'fa-plus-square-o', '&#xf196;'),
(516, 'fa-podcast', '&#xf2ce;'),
(517, 'fa-power-off', '&#xf011;'),
(518, 'fa-print', '&#xf02f;'),
(519, 'fa-product-hunt', '&#xf288;'),
(520, 'fa-puzzle-piece', '&#xf12e;'),
(521, 'fa-qq', '&#xf1d6;'),
(522, 'fa-qrcode', '&#xf029;'),
(523, 'fa-question', '&#xf128;'),
(524, 'fa-question-circle', '&#xf059;'),
(525, 'fa-question-circle-o', '&#xf29c;'),
(526, 'fa-quora', '&#xf2c4;'),
(527, 'fa-quote-left', '&#xf10d;'),
(528, 'fa-quote-right', '&#xf10e;'),
(529, 'fa-ra', '&#xf1d0;'),
(530, 'fa-random', '&#xf074;'),
(531, 'fa-ravelry', '&#xf2d9;'),
(532, 'fa-rebel', '&#xf1d0;'),
(533, 'fa-recycle', '&#xf1b8;'),
(534, 'fa-reddit', '&#xf1a1;'),
(535, 'fa-reddit-alien', '&#xf281;'),
(536, 'fa-reddit-square', '&#xf1a2;'),
(537, 'fa-refresh', '&#xf021;'),
(538, 'fa-registered', '&#xf25d;'),
(539, 'fa-remove', '&#xf00d;'),
(540, 'fa-renren', '&#xf18b;'),
(541, 'fa-reorder', '&#xf0c9;'),
(542, 'fa-repeat', '&#xf01e;'),
(543, 'fa-reply', '&#xf112;'),
(544, 'fa-reply-all', '&#xf122;'),
(545, 'fa-resistance', '&#xf1d0;'),
(546, 'fa-retweet', '&#xf079;'),
(547, 'fa-rmb', '&#xf157;'),
(548, 'fa-road', '&#xf018;'),
(549, 'fa-rocket', '&#xf135;'),
(550, 'fa-rotate-left', '&#xf0e2;'),
(551, 'fa-rotate-right', '&#xf01e;'),
(552, 'fa-rouble', '&#xf158;'),
(553, 'fa-rss', '&#xf09e;'),
(554, 'fa-rss-square', '&#xf143;'),
(555, 'fa-rub', '&#xf158;'),
(556, 'fa-ruble', '&#xf158;'),
(557, 'fa-rupee', '&#xf156;'),
(558, 'fa-s15', '&#xf2cd;'),
(559, 'fa-safari', '&#xf267;'),
(560, 'fa-save', '&#xf0c7;'),
(561, 'fa-scissors', '&#xf0c4;'),
(562, 'fa-scribd', '&#xf28a;'),
(563, 'fa-search', '&#xf002;'),
(564, 'fa-search-minus', '&#xf010;'),
(565, 'fa-search-plus', '&#xf00e;'),
(566, 'fa-sellsy', '&#xf213;'),
(567, 'fa-send', '&#xf1d8;'),
(568, 'fa-send-o', '&#xf1d9;'),
(569, 'fa-server', '&#xf233;'),
(570, 'fa-share', '&#xf064;'),
(571, 'fa-share-alt', '&#xf1e0;'),
(572, 'fa-share-alt-square', '&#xf1e1;'),
(573, 'fa-share-square', '&#xf14d;'),
(574, 'fa-share-square-o', '&#xf045;'),
(575, 'fa-shekel', '&#xf20b;'),
(576, 'fa-sheqel', '&#xf20b;'),
(577, 'fa-shield', '&#xf132;'),
(578, 'fa-ship', '&#xf21a;'),
(579, 'fa-shirtsinbulk', '&#xf214;'),
(580, 'fa-shopping-bag', '&#xf290;'),
(581, 'fa-shopping-basket', '&#xf291;'),
(582, 'fa-shopping-cart', '&#xf07a;'),
(583, 'fa-shower', '&#xf2cc;'),
(584, 'fa-sign-in', '&#xf090;'),
(585, 'fa-sign-language', '&#xf2a7;'),
(586, 'fa-sign-out', '&#xf08b;'),
(587, 'fa-signal', '&#xf012;'),
(588, 'fa-signing', '&#xf2a7;'),
(589, 'fa-simplybuilt', '&#xf215;'),
(590, 'fa-sitemap', '&#xf0e8;'),
(591, 'fa-skyatlas', '&#xf216;'),
(592, 'fa-skype', '&#xf17e;'),
(593, 'fa-slack', '&#xf198;'),
(594, 'fa-sliders', '&#xf1de;'),
(595, 'fa-slideshare', '&#xf1e7;'),
(596, 'fa-smile-o', '&#xf118;'),
(597, 'fa-snapchat', '&#xf2ab;'),
(598, 'fa-snapchat-ghost', '&#xf2ac;'),
(599, 'fa-snapchat-square', '&#xf2ad;'),
(600, 'fa-snowflake-o', '&#xf2dc;'),
(601, 'fa-soccer-ball-o', '&#xf1e3;'),
(602, 'fa-sort', '&#xf0dc;'),
(603, 'fa-sort-alpha-asc', '&#xf15d;'),
(604, 'fa-sort-alpha-desc', '&#xf15e;'),
(605, 'fa-sort-amount-asc', '&#xf160;'),
(606, 'fa-sort-amount-desc', '&#xf161;'),
(607, 'fa-sort-asc', '&#xf0de;'),
(608, 'fa-sort-desc', '&#xf0dd;'),
(609, 'fa-sort-down', '&#xf0dd;'),
(610, 'fa-sort-numeric-asc', '&#xf162;'),
(611, 'fa-sort-numeric-desc', '&#xf163;'),
(612, 'fa-sort-up', '&#xf0de;'),
(613, 'fa-soundcloud', '&#xf1be;'),
(614, 'fa-space-shuttle', '&#xf197;'),
(615, 'fa-spinner', '&#xf110;'),
(616, 'fa-spoon', '&#xf1b1;'),
(617, 'fa-spotify', '&#xf1bc;'),
(618, 'fa-square', '&#xf0c8;'),
(619, 'fa-square-o', '&#xf096;'),
(620, 'fa-stack-exchange', '&#xf18d;'),
(621, 'fa-stack-overflow', '&#xf16c;'),
(622, 'fa-star', '&#xf005;'),
(623, 'fa-star-half', '&#xf089;'),
(624, 'fa-star-half-empty', '&#xf123;'),
(625, 'fa-star-half-full', '&#xf123;'),
(626, 'fa-star-half-o', '&#xf123;'),
(627, 'fa-star-o', '&#xf006;'),
(628, 'fa-steam', '&#xf1b6;'),
(629, 'fa-steam-square', '&#xf1b7;'),
(630, 'fa-step-backward', '&#xf048;'),
(631, 'fa-step-forward', '&#xf051;'),
(632, 'fa-stethoscope', '&#xf0f1;'),
(633, 'fa-sticky-note', '&#xf249;'),
(634, 'fa-sticky-note-o', '&#xf24a;'),
(635, 'fa-stop', '&#xf04d;'),
(636, 'fa-stop-circle', '&#xf28d;'),
(637, 'fa-stop-circle-o', '&#xf28e;'),
(638, 'fa-street-view', '&#xf21d;'),
(639, 'fa-strikethrough', '&#xf0cc;'),
(640, 'fa-stumbleupon', '&#xf1a4;'),
(641, 'fa-stumbleupon-circle', '&#xf1a3;'),
(642, 'fa-subscript', '&#xf12c;'),
(643, 'fa-subway', '&#xf239;'),
(644, 'fa-suitcase', '&#xf0f2;'),
(645, 'fa-sun-o', '&#xf185;'),
(646, 'fa-superpowers', '&#xf2dd;'),
(647, 'fa-superscript', '&#xf12b;'),
(648, 'fa-support', '&#xf1cd;'),
(649, 'fa-table', '&#xf0ce;'),
(650, 'fa-tablet', '&#xf10a;'),
(651, 'fa-tachometer', '&#xf0e4;'),
(652, 'fa-tag', '&#xf02b;'),
(653, 'fa-tags', '&#xf02c;'),
(654, 'fa-tasks', '&#xf0ae;'),
(655, 'fa-taxi', '&#xf1ba;'),
(656, 'fa-telegram', '&#xf2c6;'),
(657, 'fa-television', '&#xf26c;'),
(658, 'fa-tencent-weibo', '&#xf1d5;'),
(659, 'fa-terminal', '&#xf120;'),
(660, 'fa-text-height', '&#xf034;'),
(661, 'fa-text-width', '&#xf035;'),
(662, 'fa-th', '&#xf00a;'),
(663, 'fa-th-large', '&#xf009;'),
(664, 'fa-th-list', '&#xf00b;'),
(665, 'fa-themeisle', '&#xf2b2;'),
(666, 'fa-thermometer', '&#xf2c7;'),
(667, 'fa-thermometer-0', '&#xf2cb;'),
(668, 'fa-thermometer-1', '&#xf2ca;'),
(669, 'fa-thermometer-2', '&#xf2c9;'),
(670, 'fa-thermometer-3', '&#xf2c8;'),
(671, 'fa-thermometer-4', '&#xf2c7;'),
(672, 'fa-thermometer-empty', '&#xf2cb;'),
(673, 'fa-thermometer-full', '&#xf2c7;'),
(674, 'fa-thermometer-half', '&#xf2c9;'),
(675, 'fa-thermometer-quarter', '&#xf2ca;'),
(676, 'fa-thermometer-three-quarters', '&#xf2c8;'),
(677, 'fa-thumb-tack', '&#xf08d;'),
(678, 'fa-thumbs-down', '&#xf165;'),
(679, 'fa-thumbs-o-down', '&#xf088;'),
(680, 'fa-thumbs-o-up', '&#xf087;'),
(681, 'fa-thumbs-up', '&#xf164;'),
(682, 'fa-ticket', '&#xf145;'),
(683, 'fa-times', '&#xf00d;'),
(684, 'fa-times-circle', '&#xf057;'),
(685, 'fa-times-circle-o', '&#xf05c;'),
(686, 'fa-times-rectangle', '&#xf2d3;'),
(687, 'fa-times-rectangle-o', '&#xf2d4;'),
(688, 'fa-tint', '&#xf043;'),
(689, 'fa-toggle-down', '&#xf150;'),
(690, 'fa-toggle-left', '&#xf191;'),
(691, 'fa-toggle-off', '&#xf204;'),
(692, 'fa-toggle-on', '&#xf205;'),
(693, 'fa-toggle-right', '&#xf152;'),
(694, 'fa-toggle-up', '&#xf151;'),
(695, 'fa-trademark', '&#xf25c;'),
(696, 'fa-train', '&#xf238;'),
(697, 'fa-transgender', '&#xf224;'),
(698, 'fa-transgender-alt', '&#xf225;'),
(699, 'fa-trash', '&#xf1f8;'),
(700, 'fa-trash-o', '&#xf014;'),
(701, 'fa-tree', '&#xf1bb;'),
(702, 'fa-trello', '&#xf181;'),
(703, 'fa-tripadvisor', '&#xf262;'),
(704, 'fa-trophy', '&#xf091;'),
(705, 'fa-truck', '&#xf0d1;'),
(706, 'fa-try', '&#xf195;'),
(707, 'fa-tty', '&#xf1e4;'),
(708, 'fa-tumblr', '&#xf173;'),
(709, 'fa-tumblr-square', '&#xf174;'),
(710, 'fa-turkish-lira', '&#xf195;'),
(711, 'fa-tv', '&#xf26c;'),
(712, 'fa-twitch', '&#xf1e8;'),
(713, 'fa-twitter', '&#xf099;'),
(714, 'fa-twitter-square', '&#xf081;'),
(715, 'fa-umbrella', '&#xf0e9;'),
(716, 'fa-underline', '&#xf0cd;'),
(717, 'fa-undo', '&#xf0e2;'),
(718, 'fa-universal-access', '&#xf29a;'),
(719, 'fa-university', '&#xf19c;'),
(720, 'fa-unlink', '&#xf127;'),
(721, 'fa-unlock', '&#xf09c;'),
(722, 'fa-unlock-alt', '&#xf13e;'),
(723, 'fa-unsorted', '&#xf0dc;'),
(724, 'fa-upload', '&#xf093;'),
(725, 'fa-usb', '&#xf287;'),
(726, 'fa-usd', '&#xf155;'),
(727, 'fa-user', '&#xf007;'),
(728, 'fa-user-circle', '&#xf2bd;'),
(729, 'fa-user-circle-o', '&#xf2be;'),
(730, 'fa-user-md', '&#xf0f0;'),
(731, 'fa-user-o', '&#xf2c0;'),
(732, 'fa-user-plus', '&#xf234;'),
(733, 'fa-user-secret', '&#xf21b;'),
(734, 'fa-user-times', '&#xf235;'),
(735, 'fa-users', '&#xf0c0;'),
(736, 'fa-vcard', '&#xf2bb;'),
(737, 'fa-vcard-o', '&#xf2bc;'),
(738, 'fa-venus', '&#xf221;'),
(739, 'fa-venus-double', '&#xf226;'),
(740, 'fa-venus-mars', '&#xf228;'),
(741, 'fa-viacoin', '&#xf237;'),
(742, 'fa-viadeo', '&#xf2a9;'),
(743, 'fa-viadeo-square', '&#xf2aa;'),
(744, 'fa-video-camera', '&#xf03d;'),
(745, 'fa-vimeo', '&#xf27d;'),
(746, 'fa-vimeo-square', '&#xf194;'),
(747, 'fa-vine', '&#xf1ca;'),
(748, 'fa-vk', '&#xf189;'),
(749, 'fa-volume-control-phone', '&#xf2a0;'),
(750, 'fa-volume-down', '&#xf027;'),
(751, 'fa-volume-off', '&#xf026;'),
(752, 'fa-volume-up', '&#xf028;'),
(753, 'fa-warning', '&#xf071;'),
(754, 'fa-wechat', '&#xf1d7;'),
(755, 'fa-weibo', '&#xf18a;'),
(756, 'fa-weixin', '&#xf1d7;'),
(757, 'fa-whatsapp', '&#xf232;'),
(758, 'fa-wheelchair', '&#xf193;'),
(759, 'fa-wheelchair-alt', '&#xf29b;'),
(760, 'fa-wifi', '&#xf1eb;'),
(761, 'fa-wikipedia-w', '&#xf266;'),
(762, 'fa-window-close', '&#xf2d3;'),
(763, 'fa-window-close-o', '&#xf2d4;'),
(764, 'fa-window-maximize', '&#xf2d0;'),
(765, 'fa-window-minimize', '&#xf2d1;'),
(766, 'fa-window-restore', '&#xf2d2;'),
(767, 'fa-windows', '&#xf17a;'),
(768, 'fa-won', '&#xf159;'),
(769, 'fa-wordpress', '&#xf19a;'),
(770, 'fa-wpbeginner', '&#xf297;'),
(771, 'fa-wpexplorer', '&#xf2de;'),
(772, 'fa-wpforms', '&#xf298;'),
(773, 'fa-wrench', '&#xf0ad;'),
(774, 'fa-xing', '&#xf168;'),
(775, 'fa-xing-square', '&#xf169;'),
(776, 'fa-y-combinator', '&#xf23b;'),
(777, 'fa-y-combinator-square', '&#xf1d4;'),
(778, 'fa-yahoo', '&#xf19e;'),
(779, 'fa-yc', '&#xf23b;'),
(780, 'fa-yc-square', '&#xf1d4;'),
(781, 'fa-yelp', '&#xf1e9;'),
(782, 'fa-yen', '&#xf157;'),
(783, 'fa-yoast', '&#xf2b1;'),
(784, 'fa-youtube', '&#xf167;'),
(785, 'fa-youtube-play', '&#xf16a;'),
(786, 'fa-youtube-square', '&#xf166;');

-- --------------------------------------------------------

--
-- Estrutura da tabela `generos`
--

CREATE TABLE `generos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `generos`
--

INSERT INTO `generos` (`id`, `nome`) VALUES
(1, 'Feira de Negócios'),
(2, 'Palestra');

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupos`
--

CREATE TABLE `grupos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupos`
--

INSERT INTO `grupos` (`id`, `name`) VALUES
(1, 'PADRÃO'),
(2, 'DESENVOLVEDORES'),
(3, 'ADMINISTRADORES');

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupos_programas`
--

CREATE TABLE `grupos_programas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `system_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `system_program_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupos_programas`
--

INSERT INTO `grupos_programas` (`id`, `system_group_id`, `system_program_id`) VALUES
(88, 3, 39),
(89, 3, 40),
(90, 3, 41),
(91, 3, 42),
(92, 3, 43),
(93, 3, 44),
(94, 3, 45),
(95, 3, 46),
(96, 3, 47),
(97, 3, 48),
(98, 1, 1),
(99, 1, 17),
(100, 1, 18),
(101, 1, 32),
(102, 2, 2),
(103, 2, 3),
(104, 2, 4),
(105, 2, 5),
(106, 2, 6),
(107, 2, 7),
(108, 2, 8),
(109, 2, 9),
(110, 2, 10),
(111, 2, 11),
(112, 2, 12),
(113, 2, 13),
(114, 2, 14),
(115, 2, 15),
(116, 2, 16),
(117, 2, 19),
(118, 2, 20),
(119, 2, 21),
(120, 2, 22),
(121, 2, 23),
(122, 2, 24),
(123, 2, 25),
(124, 2, 26),
(125, 2, 27),
(126, 2, 28),
(127, 2, 29),
(128, 2, 30),
(129, 2, 31),
(130, 2, 32),
(131, 2, 33),
(132, 2, 34),
(133, 2, 35),
(134, 2, 36),
(135, 2, 37),
(136, 2, 38);

-- --------------------------------------------------------

--
-- Estrutura da tabela `locais`
--

CREATE TABLE `locais` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `municipio` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `locais`
--

INSERT INTO `locais` (`id`, `nome`, `municipio`, `bairro`, `endereco`, `latitude`, `longitude`) VALUES
(1, 'Parque de Exposições Aristófanes Fernandes', 'Parnamirim', 'Centro', 'BR101', -5.904718, -35.260229);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagens`
--

CREATE TABLE `mensagens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `system_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `system_user_to_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `dt_message` datetime DEFAULT NULL,
  `checked` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `system_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `system_user_to_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `dt_message` datetime DEFAULT NULL,
  `action_url` varchar(200) DEFAULT NULL,
  `action_label` varchar(200) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `checked` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `preferencias`
--

CREATE TABLE `preferencias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `profissional`
--

CREATE TABLE `profissional` (
  `id` bigint(20) NOT NULL,
  `tipoprofissional_id` bigint(20) NOT NULL,
  `nomeprofissional` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `numeroconselho` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `numerocpf` varchar(14) COLLATE latin1_general_ci DEFAULT NULL,
  `endereco` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `bairro` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `cidade` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `uf` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  `telefone1` varchar(14) COLLATE latin1_general_ci DEFAULT NULL,
  `telefone2` varchar(14) COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `situacao` varchar(7) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci PACK_KEYS=0;

--
-- Extraindo dados da tabela `profissional`
--

INSERT INTO `profissional` (`id`, `tipoprofissional_id`, `nomeprofissional`, `numeroconselho`, `numerocpf`, `endereco`, `bairro`, `cidade`, `uf`, `telefone1`, `telefone2`, `email`, `situacao`) VALUES
(1, 2, 'PEDRO HENRIQUE', NULL, NULL, NULL, NULL, 'NATAL', NULL, NULL, NULL, NULL, 'ATIVO'),
(3, 1, 'PEDRO HENRIQUE', NULL, NULL, NULL, NULL, 'NATAL', NULL, NULL, NULL, NULL, NULL),
(4, 2, 'PEDRITA BEZERRA', NULL, NULL, NULL, NULL, 'NATAL', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `programacoes`
--

CREATE TABLE `programacoes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `evento_id` bigint(20) UNSIGNED NOT NULL,
  `setor_id` bigint(20) UNSIGNED NOT NULL,
  `genero_id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(1500) DEFAULT NULL,
  `data_evento` date DEFAULT NULL,
  `hora_evento` time DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `situacao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `programacoes`
--

INSERT INTO `programacoes` (`id`, `evento_id`, `setor_id`, `genero_id`, `nome`, `descricao`, `data_evento`, `hora_evento`, `duracao`, `situacao`) VALUES
(2, 1, 2, 1, 'Exposição de caprinos', 'Ovelhas e cabras', '2017-09-02', '13:30:00', 2, 'ABERTO'),
(3, 1, 3, 1, 'Exposição de bovinos', 'Vacas diversas', '2017-09-03', '14:00:00', 2, 'ABERTO'),
(4, 1, 4, 1, 'Exposição de equinos', 'Melhores cavalos', '2017-09-04', '15:30:00', 2, 'ABERTO'),
(5, 1, 5, 2, 'Exposição de cultivos', 'Cultivo orgânico', '2017-09-04', '16:30:00', 2, 'ABERTO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `programas`
--

CREATE TABLE `programas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `controller` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `programas`
--

INSERT INTO `programas` (`id`, `name`, `controller`) VALUES
(1, 'Welcome', 'WelcomeView'),
(2, 'System Group Form', 'SystemGroupForm'),
(3, 'System Group List', 'SystemGroupList'),
(4, 'System Program Form', 'SystemProgramForm'),
(5, 'System Program List', 'SystemProgramList'),
(6, 'System User Form', 'SystemUserForm'),
(7, 'System User List', 'SystemUserList'),
(8, 'System Unit Form', 'SystemUnitForm'),
(9, 'System Unit List', 'SystemUnitList'),
(10, 'System SMTP Preference', 'SystemPreferenceForm'),
(11, 'System Change Log', 'SystemChangeLogView'),
(12, 'System Access Log', 'SystemAccessLogList'),
(13, 'System SQL Log', 'SystemSqlLogList'),
(14, 'System Access stats', 'SystemAccessLogStats'),
(15, 'System SQL Panel', 'SystemSQLPanel'),
(16, 'System PHP Info', 'SystemPHPInfoView'),
(17, 'System Profile View', 'SystemProfileView'),
(18, 'System Profile Form', 'SystemProfileForm'),
(19, 'System Message Form', 'SystemMessageForm'),
(20, 'System Message List', 'SystemMessageList'),
(21, 'System Message Form View', 'SystemMessageFormView'),
(22, 'System Notification List', 'SystemNotificationList'),
(23, 'System Notification Form View', 'SystemNotificationFormView'),
(24, 'System Support form', 'SystemSupportForm'),
(25, 'System Document Category', 'SystemDocumentCategoryFormList'),
(26, 'System Document Form', 'SystemDocumentForm'),
(27, 'System Document List', 'SystemDocumentList'),
(28, 'System Document Upload', 'SystemDocumentUploadForm'),
(29, 'System Shared Document', 'SystemSharedDocumentList'),
(30, 'Sidemenu - Formulário', 'SideMenuForm'),
(31, 'Sidemenu - Listagem', 'SideMenuList'),
(32, 'Dashboard - Painel', 'DashBoardCreate'),
(33, 'Dashboard - Formulário', 'DashBoardForm'),
(34, 'Dashboard - Listagem', 'DashBoardList'),
(35, 'Profissionais - Formulário', 'ProfissionalForm'),
(36, 'Profissionais - Listagem', 'ProfissionalList'),
(37, 'Tipos de Profissionais - Formulário', 'TipoProfissionalForm'),
(38, 'Tipos de Profissionais - Listagem', 'TipoProfissionalList'),
(39, 'EventosForm', 'EventosForm'),
(40, 'EventosList', 'EventosList'),
(41, 'GenerosForm', 'GenerosForm'),
(42, 'GenerosList', 'GenerosList'),
(43, 'LocaisForm', 'LocaisForm'),
(44, 'LocaisList', 'LocaisList'),
(45, 'ProgramacoesForm', 'ProgramacoesForm'),
(46, 'ProgramacoesList', 'ProgramacoesList'),
(47, 'SetoresForm', 'SetoresForm'),
(48, 'SetoresList', 'SetoresList');

-- --------------------------------------------------------

--
-- Estrutura da tabela `setores`
--

CREATE TABLE `setores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `local_id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `setores`
--

INSERT INTO `setores` (`id`, `local_id`, `nome`) VALUES
(1, 1, 'Setor 1'),
(2, 1, 'Setor 2'),
(3, 1, 'Setor 3'),
(4, 1, 'Setor 4'),
(5, 1, 'Setor 5');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sidemenu`
--

CREATE TABLE `sidemenu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_type` varchar(7) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `icon` varchar(40) DEFAULT NULL,
  `sequence` float NOT NULL,
  `action_class` varchar(100) DEFAULT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `active` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sidemenu`
--

INSERT INTO `sidemenu` (`id`, `menu_type`, `name`, `icon`, `sequence`, `action_class`, `menu_id`, `active`) VALUES
(1, 'menu', 'Administração', 'fa-institution', 1, 'null', 0, 'Y'),
(2, 'submenu', 'Programas', 'fa-file-code-o', 1.1, 'SystemProgramList', 1, 'Y'),
(3, 'submenu', 'Grupos', 'fa-users', 1.2, 'SystemGroupList', 1, 'Y'),
(4, 'submenu', 'Unidades', 'fa-institution', 1.3, 'SystemUnitList', 1, 'N'),
(5, 'submenu', 'Usuários', 'fa-user', 1.4, 'SystemUserList', 1, 'Y'),
(6, 'submenu', 'Sidemenu', 'fa-list-ul', 1.5, 'SideMenuList', 1, 'Y'),
(7, 'submenu', 'Dashboard', 'fa-th', 1.6, 'DashBoardList', 1, 'Y'),
(8, 'menu', 'Logs', 'fa-tv', 2, 'null', 0, 'N'),
(9, 'submenu', 'Estatística de acesso', 'fa-bar-chart', 2.1, 'SystemAccessLogStats', 8, 'N'),
(10, 'submenu', 'Log de acesso', 'fa-key', 2.2, 'SystemAccessLogList', 8, 'N'),
(11, 'menu', 'Cadastros', 'fa-leanpub', 3, 'null', 0, 'Y'),
(12, 'submenu', 'Profissionais', 'fa-user', 3.1, 'ProfissionalList', 11, 'Y'),
(13, 'submenu', 'Tipos de Profissionais', 'fa-users', 3.2, 'TipoProfissionalList', 11, 'Y'),
(14, 'submenu', 'Eventos', 'fa-bullhorn', 3.3, 'EventosList', 11, 'Y'),
(15, 'submenu', 'Genêros', 'fa-bullhorn', 3.4, 'GenerosList', 11, 'Y'),
(16, 'submenu', 'Locais', 'fa-bullhorn', 3.5, 'LocaisList', 11, 'Y'),
(17, 'submenu', 'Programações', 'fa-bullhorn', 3.6, 'ProgramacoesList', 11, 'Y'),
(18, 'submenu', 'Setores', 'fa-bullhorn', 3.7, 'SetoresList', 11, 'Y');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoprofissional`
--

CREATE TABLE `tipoprofissional` (
  `id` bigint(20) NOT NULL,
  `nometipoprofissional` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci PACK_KEYS=0;

--
-- Extraindo dados da tabela `tipoprofissional`
--

INSERT INTO `tipoprofissional` (`id`, `nometipoprofissional`) VALUES
(2, 'ADMINISTRADOR'),
(1, 'DESENVOLVEDOR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `unidades`
--

CREATE TABLE `unidades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `unit_type` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `neighborhood` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `situation` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `frontpage_id` bigint(20) UNSIGNED DEFAULT NULL,
  `system_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `profissional_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `name`, `login`, `password`, `email`, `frontpage_id`, `system_unit_id`, `active`, `profissional_id`) VALUES
(1, 'DESENVOLVEDOR', 'devel', 'b105c1d3ad540a0fb4635d0d854b08f3', NULL, NULL, NULL, 'Y', 1),
(2, 'ADMINISTRADOR', 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL, NULL, NULL, 'N', 3),
(5, 'PEDRITA BEZERRA', 'pedritabezerra', '86d448956043a207d170a9ab4df0021a', NULL, NULL, NULL, 'Y', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_grupos`
--

CREATE TABLE `usuarios_grupos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `system_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `system_group_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios_grupos`
--

INSERT INTO `usuarios_grupos` (`id`, `system_user_id`, `system_group_id`) VALUES
(11, 2, 1),
(12, 2, 3),
(13, 1, 1),
(14, 1, 2),
(15, 1, 3),
(16, 5, 1),
(17, 5, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_programas`
--

CREATE TABLE `usuarios_programas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `system_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `system_program_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `adminltecolors`
--
ALTER TABLE `adminltecolors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard`
--
ALTER TABLE `dashboard`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_eventos_generos1_idx` (`genero_id`),
  ADD KEY `fk_eventos_locais1_idx` (`local_id`);

--
-- Indexes for table `fontawesomeicons`
--
ALTER TABLE `fontawesomeicons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `grupos_programas`
--
ALTER TABLE `grupos_programas`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_grupos_programas1` (`system_program_id`) USING BTREE,
  ADD KEY `idx_grupos_programas2` (`system_group_id`) USING BTREE;

--
-- Indexes for table `locais`
--
ALTER TABLE `locais`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mensagens`
--
ALTER TABLE `mensagens`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_mensagens1` (`system_user_id`) USING BTREE,
  ADD KEY `idx_mensagens2` (`system_user_to_id`) USING BTREE;

--
-- Indexes for table `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_notificacoes1` (`system_user_id`) USING BTREE,
  ADD KEY `idx_notificacoes2` (`system_user_to_id`) USING BTREE;

--
-- Indexes for table `preferencias`
--
ALTER TABLE `preferencias`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `profissional`
--
ALTER TABLE `profissional`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `tipoprofissional_id` (`tipoprofissional_id`);

--
-- Indexes for table `programacoes`
--
ALTER TABLE `programacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_programacoes_setores1_idx` (`setor_id`),
  ADD KEY `fk_programacoes_generos1_idx` (`genero_id`),
  ADD KEY `fk_programacoes_eventos1_idx` (`evento_id`);

--
-- Indexes for table `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `setores`
--
ALTER TABLE `setores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_setores_locais_idx` (`local_id`);

--
-- Indexes for table `sidemenu`
--
ALTER TABLE `sidemenu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipoprofissional`
--
ALTER TABLE `tipoprofissional`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `nometipoprofissional` (`nometipoprofissional`);

--
-- Indexes for table `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_usuarios1` (`system_unit_id`) USING BTREE,
  ADD KEY `idx_usuarios2` (`profissional_id`) USING BTREE,
  ADD KEY `idx_usuarios3` (`frontpage_id`);

--
-- Indexes for table `usuarios_grupos`
--
ALTER TABLE `usuarios_grupos`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_usuarios_grupos1` (`system_group_id`) USING BTREE,
  ADD KEY `idx_usuarios_grupos2` (`system_user_id`) USING BTREE;

--
-- Indexes for table `usuarios_programas`
--
ALTER TABLE `usuarios_programas`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_usuarios_programas1` (`system_program_id`) USING BTREE,
  ADD KEY `idx_usuarios_programas2` (`system_user_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `adminltecolors`
--
ALTER TABLE `adminltecolors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `dashboard`
--
ALTER TABLE `dashboard`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fontawesomeicons`
--
ALTER TABLE `fontawesomeicons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=787;
--
-- AUTO_INCREMENT for table `generos`
--
ALTER TABLE `generos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `grupos_programas`
--
ALTER TABLE `grupos_programas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;
--
-- AUTO_INCREMENT for table `locais`
--
ALTER TABLE `locais`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mensagens`
--
ALTER TABLE `mensagens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `preferencias`
--
ALTER TABLE `preferencias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `profissional`
--
ALTER TABLE `profissional`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `programacoes`
--
ALTER TABLE `programacoes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `programas`
--
ALTER TABLE `programas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `setores`
--
ALTER TABLE `setores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sidemenu`
--
ALTER TABLE `sidemenu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tipoprofissional`
--
ALTER TABLE `tipoprofissional`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `usuarios_grupos`
--
ALTER TABLE `usuarios_grupos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `usuarios_programas`
--
ALTER TABLE `usuarios_programas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `fk_eventos_generos1` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`),
  ADD CONSTRAINT `fk_eventos_locais1` FOREIGN KEY (`local_id`) REFERENCES `locais` (`id`);

--
-- Limitadores para a tabela `grupos_programas`
--
ALTER TABLE `grupos_programas`
  ADD CONSTRAINT `fk_grupos_programas1` FOREIGN KEY (`system_group_id`) REFERENCES `grupos` (`id`),
  ADD CONSTRAINT `fk_grupos_programas2` FOREIGN KEY (`system_program_id`) REFERENCES `programas` (`id`);

--
-- Limitadores para a tabela `mensagens`
--
ALTER TABLE `mensagens`
  ADD CONSTRAINT `fk_mensagens1` FOREIGN KEY (`system_user_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_mensagens2` FOREIGN KEY (`system_user_to_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD CONSTRAINT `fk_notificacoes1` FOREIGN KEY (`system_user_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_notificacoes2` FOREIGN KEY (`system_user_to_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `profissional`
--
ALTER TABLE `profissional`
  ADD CONSTRAINT `fk_profissional1` FOREIGN KEY (`tipoprofissional_id`) REFERENCES `tipoprofissional` (`id`);

--
-- Limitadores para a tabela `programacoes`
--
ALTER TABLE `programacoes`
  ADD CONSTRAINT `fk_programacoes_eventos1` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`),
  ADD CONSTRAINT `fk_programacoes_generos1` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`),
  ADD CONSTRAINT `fk_programacoes_setores1` FOREIGN KEY (`setor_id`) REFERENCES `setores` (`id`);

--
-- Limitadores para a tabela `setores`
--
ALTER TABLE `setores`
  ADD CONSTRAINT `fk_setores_locais` FOREIGN KEY (`local_id`) REFERENCES `locais` (`id`);

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios1` FOREIGN KEY (`frontpage_id`) REFERENCES `programas` (`id`),
  ADD CONSTRAINT `fk_usuarios2` FOREIGN KEY (`profissional_id`) REFERENCES `profissional` (`id`),
  ADD CONSTRAINT `fk_usuarios3` FOREIGN KEY (`system_unit_id`) REFERENCES `unidades` (`id`);

--
-- Limitadores para a tabela `usuarios_grupos`
--
ALTER TABLE `usuarios_grupos`
  ADD CONSTRAINT `fk_usuarios_grupos1` FOREIGN KEY (`system_group_id`) REFERENCES `grupos` (`id`),
  ADD CONSTRAINT `fk_usuarios_grupos2` FOREIGN KEY (`system_user_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `usuarios_programas`
--
ALTER TABLE `usuarios_programas`
  ADD CONSTRAINT `fk_usuarios_programas1` FOREIGN KEY (`system_program_id`) REFERENCES `programas` (`id`),
  ADD CONSTRAINT `fk_usuarios_programas2` FOREIGN KEY (`system_user_id`) REFERENCES `usuarios` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
