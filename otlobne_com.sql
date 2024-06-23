-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 23, 2024 at 09:56 AM
-- Server version: 5.7.33
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `otlobne_com`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `current_balance` decimal(24,2) NOT NULL,
  `amount` decimal(24,2) NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `add_ons`
--

CREATE TABLE `add_ons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `add_ons`
--

INSERT INTO `add_ons` (`id`, `name`, `price`, `created_at`, `updated_at`, `store_id`, `status`) VALUES
(1, 'Elwakil Addon', 20.00, '2023-09-29 08:26:16', '2023-09-30 08:29:20', 43, 1),
(3, '4', 5.00, '2023-09-29 08:28:48', '2023-09-29 08:30:42', 43, 1),
(4, 'Rashw', 2.00, '2023-09-29 08:29:01', '2023-09-30 08:31:25', 43, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_logged_in` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `zone_id`, `is_logged_in`) VALUES
(1, 'Salah', 'Saror', '+212667048193', 'sarorsalah2@gmail.com', '2023-05-16-6463937633a49.png', '$2y$10$hPtyN8vj/616rNIWX/0GduF1YoWH7AUcsdm8yiZRjYOENVzO.084a', 'AiLLJP6bWjQibi9IXy0RZemO71nXhj4HkrIze6eX7ltROgkj5WA8xwL6IQis', '2023-05-03 12:35:00', '2023-05-16 14:30:14', 1, NULL, 1),
(2, 'Otlobne', 'App', '+96590001860', 'info@otlobne.com', '2024-05-18-664812f01d75e.png', '$2y$10$MI04WOd4IRGsIU3Ue30iy.QBgcRUt2I2UcReyL1I2cQ7GCkvMXLv.', 'aCTdA3J4kC2h4B9m60Xff3GcGnF3ZWpgEGdyjJSYcGWViITpAiAzO4uIoSMX', '2023-05-03 12:35:00', '2024-05-18 02:31:56', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `modules`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master admin', NULL, 1, NULL, NULL),
(2, 'Salah', '[\"account\",\"account\",\"addon\",\"attribute\",\"banner\",\"campaign\",\"category\",\"coupon\",\"customerList\",\"deliveryman\",\"provide_dm_earning\",\"employee\",\"item\",\"notification\",\"order\",\"store\",\"report\",\"settings\",\"withdraw_list\",\"zone\",\"module\",\"parcel\",\"unit\"]', 1, '2023-05-05 18:31:36', '2023-05-05 18:31:36'),
(3, 'Ahmed Al-Swifey', '[\"account\",\"account\",\"addon\",\"attribute\",\"banner\",\"campaign\",\"category\",\"coupon\",\"customerList\",\"deliveryman\",\"provide_dm_earning\",\"employee\",\"item\",\"notification\",\"order\",\"store\",\"report\",\"settings\",\"withdraw_list\",\"zone\",\"module\",\"parcel\",\"pos\",\"unit\"]', 1, '2024-05-18 02:56:50', '2024-05-18 02:56:50');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `total_commission_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `digital_received` decimal(24,2) NOT NULL DEFAULT '0.00',
  `manual_received` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,3) NOT NULL DEFAULT '0.000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `total_commission_earning`, `digital_received`, `manual_received`, `created_at`, `updated_at`, `delivery_charge`) VALUES
(1, 1, 12.00, 0.00, 0.00, '2023-06-15 22:29:32', '2023-06-16 00:28:49', 200.000);

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `default_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `type`, `image`, `status`, `data`, `created_at`, `updated_at`, `zone_id`, `module_id`, `featured`, `default_link`) VALUES
(5, 'للمطاعم', 'item_wise', '2023-05-16-6463ab9df3894.png', 1, '39', '2023-05-16 16:13:17', '2023-06-15 20:21:50', 15, 1, 1, NULL),
(6, 'مطعم', 'store_wise', '2023-05-17-6464b483a11ce.png', 1, '39', '2023-05-17 11:03:31', '2023-05-17 11:06:04', 15, 1, 1, NULL),
(7, 'مطعم', 'store_wise', '2023-05-17-6464b4b70552b.png', 1, '39', '2023-05-17 11:04:23', '2023-05-17 11:06:08', 15, 1, 1, NULL),
(8, 'مطعم', 'store_wise', '2023-05-17-6464b4f2a42df.png', 1, '39', '2023-05-17 11:05:22', '2023-06-15 20:21:49', 15, 1, 1, NULL),
(10, 'مطعم', 'store_wise', '2023-05-17-6464b5a21fdd2.png', 1, '39', '2023-05-17 11:08:18', '2023-05-17 11:18:17', 15, 1, 1, NULL),
(11, 'مطعم', 'store_wise', '2023-05-17-6464b5d4a90d8.png', 1, '39', '2023-05-17 11:09:08', '2023-05-17 11:18:05', 15, 1, 1, NULL),
(12, 'مطعم', 'store_wise', '2023-05-17-6464b60ae50c6.png', 1, '39', '2023-05-17 11:10:02', '2023-05-17 11:18:10', 15, 1, 1, NULL),
(13, 'مطعم', 'store_wise', '2023-05-17-6464b6506f169.png', 1, '39', '2023-05-17 11:11:12', '2023-05-17 11:18:05', 15, 1, 1, NULL),
(14, 'التجميل', 'store_wise', '2023-05-17-6464b69872ace.png', 1, '39', '2023-05-17 11:12:24', '2023-05-17 11:18:10', 15, 1, 1, NULL),
(15, 'التجميل', 'store_wise', '2023-05-17-6464b6c84278f.png', 1, '39', '2023-05-17 11:13:12', '2023-05-17 11:18:02', 15, 1, 1, NULL),
(17, 'مطعم', 'store_wise', '2023-05-17-6464b958f3550.png', 1, '39', '2023-05-17 11:24:08', '2023-06-15 20:22:45', 15, 1, 1, NULL),
(18, 'Zakia', 'store_wise', '2023-05-18-646637c0aff9d.png', 1, '39', '2023-05-18 14:35:44', '2023-05-18 14:35:51', 15, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'cash_on_delivery', '{\"status\":\"1\"}', '2021-07-01 15:51:17', '2021-07-01 15:51:17'),
(2, 'stripe', '{\"status\":null,\"api_key\":\"sk_test_v3xBwkDI8boVV9HeADsgrBYJ00EOLHsdLy\",\"published_key\":\"pk_test_3vkFye1bctuqx73gezfFf95j00rIlpOxjT\"}', '2021-05-11 03:57:02', '2023-07-19 22:33:04'),
(4, 'mail_config', '{\"status\":\"1\",\"name\":\"Otlobne\",\"host\":\"smtp.gmail.com\",\"driver\":\"smtp\",\"port\":\"587\",\"username\":\"otlobne.com@gmail.com\",\"email_id\":\"otlobne.com@gmail.com\",\"encryption\":\"tls\",\"password\":\"cijfzigpxnuerhvp\"}', NULL, '2023-07-19 22:31:30'),
(5, 'fcm_project_id', 'otlobne-app', NULL, NULL),
(6, 'push_notification_key', 'AAAAFIYh1kg:APA91bFFEKMnDR8xiUA7MA836xJGe2HYvXgN6GBi54VeO2T5Ele804tCpNyXmyXKdPngj4uih-W8SXq--IqjtzdJ3KVk_e7xX-rJrKSqHCJxGspEVlG7lE4f5R0OG1htzUXBIPPFucvQ', NULL, NULL),
(7, 'order_pending_message', '{\"status\":1,\"message\":\"Your order is successfully placed\"}', NULL, NULL),
(8, 'order_confirmation_msg', '{\"status\":1,\"message\":\"Your order is confirmed\"}', NULL, NULL),
(9, 'order_processing_message', '{\"status\":1,\"message\":\"Your order is started for cooking\"}', NULL, NULL),
(10, 'out_for_delivery_message', '{\"status\":1,\"message\":\"Your food is ready for delivery\"}', NULL, NULL),
(11, 'order_delivered_message', '{\"status\":1,\"message\":\"Your order is delivered\"}', NULL, NULL),
(12, 'delivery_boy_assign_message', '{\"status\":1,\"message\":\"Your order has been assigned to a delivery man\"}', NULL, NULL),
(13, 'delivery_boy_start_message', '{\"status\":1,\"message\":\"Your order is picked up by delivery man\"}', NULL, NULL),
(14, 'delivery_boy_delivered_message', '{\"status\":1,\"message\":\"Order delivered successfully\"}', NULL, NULL),
(15, 'terms_and_conditions', '<h1>Terms and Conditions</h1>\r\n\r\n<p>Last updated: June 15, 2023</p>\r\n\r\n<p>Please read these terms and conditions carefully before using Our Service.</p>\r\n\r\n<h1>Interpretation and Definitions</h1>\r\n\r\n<h2>Interpretation</h2>\r\n\r\n<p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p>\r\n\r\n<h2>Definitions</h2>\r\n\r\n<p>For the purposes of these Terms and Conditions:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Application</strong> means the software program provided by the Company downloaded by You on any electronic device, named اطلب اطلبني</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Application Store</strong> means the digital distribution service operated and developed by Apple Inc. (Apple App Store) or Google Inc. (Google Play Store) in which the Application has been downloaded.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Affiliate</strong> means an entity that controls, is controlled by or is under common control with a party, where &quot;control&quot; means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Country</strong> refers to: Egypt</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Company</strong> (referred to as either &quot;the Company&quot;, &quot;We&quot;, &quot;Us&quot; or &quot;Our&quot; in this Agreement) refers to Otlobne.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Device</strong> means any device that can access the Service such as a computer, a cellphone or a digital tablet.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Service</strong> refers to the Application or the Website or both.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Terms and Conditions</strong> (also referred as &quot;Terms&quot;) mean these Terms and Conditions that form the entire agreement between You and the Company regarding the use of the Service. This Terms and Conditions agreement has been created with the help of the <a href=\"https://www.freeprivacypolicy.com/free-terms-and-conditions-generator/\" target=\"_blank\">Free Terms and Conditions Generator</a>.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Third-party Social Media Service</strong> means any services or content (including data, information, products or services) provided by a third-party that may be displayed, included or made available by the Service.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Website</strong> refers to Otlobne, accessible from <a href=\"https://Otlobne.com/\" target=\"_blank\">https://Otlobne.com/</a></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>You</strong> means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h1>Acknowledgment</h1>\r\n\r\n<p>These are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.</p>\r\n\r\n<p>Your access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.</p>\r\n\r\n<p>By accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.</p>\r\n\r\n<p>You represent that you are over the age of 18. The Company does not permit those under 18 to use the Service.</p>\r\n\r\n<p>Your access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.</p>\r\n\r\n<h1>Links to Other Websites</h1>\r\n\r\n<p>Our Service may contain links to third-party web sites or services that are not owned or controlled by the Company.</p>\r\n\r\n<p>The Company has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that the Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such content, goods or services available on or through any such web sites or services.</p>\r\n\r\n<p>We strongly advise You to read the terms and conditions and privacy policies of any third-party web sites or services that You visit.</p>\r\n\r\n<h1>Termination</h1>\r\n\r\n<p>We may terminate or suspend Your access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions.</p>\r\n\r\n<p>Upon termination, Your right to use the Service will cease immediately.</p>\r\n\r\n<h1>Limitation of Liability</h1>\r\n\r\n<p>Notwithstanding any damages that You might incur, the entire liability of the Company and any of its suppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by You through the Service or 100 USD if You haven&#39;t purchased anything through the Service.</p>\r\n\r\n<p>To the maximum extent permitted by applicable law, in no event shall the Company or its suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, loss of data or other information, for business interruption, for personal injury, loss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party software and/or third-party hardware used with the Service, or otherwise in connection with any provision of this Terms), even if the Company or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose.</p>\r\n\r\n<p>Some states do not allow the exclusion of implied warranties or limitation of liability for incidental or consequential damages, which means that some of the above limitations may not apply. In these states, each party&#39;s liability will be limited to the greatest extent permitted by law.</p>\r\n\r\n<h1>&quot;AS IS&quot; and &quot;AS AVAILABLE&quot; Disclaimer</h1>\r\n\r\n<p>The Service is provided to You &quot;AS IS&quot; and &quot;AS AVAILABLE&quot; and with all faults and defects without warranty of any kind. To the maximum extent permitted under applicable law, the Company, on its own behalf and on behalf of its Affiliates and its and their respective licensors and service providers, expressly disclaims all warranties, whether express, implied, statutory or otherwise, with respect to the Service, including all implied warranties of merchantability, fitness for a particular purpose, title and non-infringement, and warranties that may arise out of course of dealing, course of performance, usage or trade practice. Without limitation to the foregoing, the Company provides no warranty or undertaking, and makes no representation of any kind that the Service will meet Your requirements, achieve any intended results, be compatible or work with any other software, applications, systems or services, operate without interruption, meet any performance or reliability standards or be error free or that any errors or defects can or will be corrected.</p>\r\n\r\n<p>Without limiting the foregoing, neither the Company nor any of the company&#39;s provider makes any representation or warranty of any kind, express or implied: (i) as to the operation or availability of the Service, or the information, content, and materials or products included thereon; (ii) that the Service will be uninterrupted or error-free; (iii) as to the accuracy, reliability, or currency of any information or content provided through the Service; or (iv) that the Service, its servers, the content, or e-mails sent from or on behalf of the Company are free of viruses, scripts, trojan horses, worms, malware, timebombs or other harmful components.</p>\r\n\r\n<p>Some jurisdictions do not allow the exclusion of certain types of warranties or limitations on applicable statutory rights of a consumer, so some or all of the above exclusions and limitations may not apply to You. But in such a case the exclusions and limitations set forth in this section shall be applied to the greatest extent enforceable under applicable law.</p>\r\n\r\n<h1>Governing Law</h1>\r\n\r\n<p>The laws of the Country, excluding its conflicts of law rules, shall govern this Terms and Your use of the Service. Your use of the Application may also be subject to other local, state, national, or international laws.</p>\r\n\r\n<h1>Disputes Resolution</h1>\r\n\r\n<p>If You have any concern or dispute about the Service, You agree to first try to resolve the dispute informally by contacting the Company.</p>\r\n\r\n<h1>For European Union (EU) Users</h1>\r\n\r\n<p>If You are a European Union consumer, you will benefit from any mandatory provisions of the law of the country in which you are resident in.</p>\r\n\r\n<h1>United States Legal Compliance</h1>\r\n\r\n<p>You represent and warrant that (i) You are not located in a country that is subject to the United States government embargo, or that has been designated by the United States government as a &quot;terrorist supporting&quot; country, and (ii) You are not listed on any United States government list of prohibited or restricted parties.</p>\r\n\r\n<h1>Severability and Waiver</h1>\r\n\r\n<h2>Severability</h2>\r\n\r\n<p>If any provision of these Terms is held to be unenforceable or invalid, such provision will be changed and interpreted to accomplish the objectives of such provision to the greatest extent possible under applicable law and the remaining provisions will continue in full force and effect.</p>\r\n\r\n<h2>Waiver</h2>\r\n\r\n<p>Except as provided herein, the failure to exercise a right or to require performance of an obligation under these Terms shall not effect a party&#39;s ability to exercise such right or require such performance at any time thereafter nor shall the waiver of a breach constitute a waiver of any subsequent breach.</p>\r\n\r\n<h1>Translation Interpretation</h1>\r\n\r\n<p>These Terms and Conditions may have been translated if We have made them available to You on our Service. You agree that the original English text shall prevail in the case of a dispute.</p>\r\n\r\n<h1>Changes to These Terms and Conditions</h1>\r\n\r\n<p>We reserve the right, at Our sole discretion, to modify or replace these Terms at any time. If a revision is material We will make reasonable efforts to provide at least 30 days&#39; notice prior to any new terms taking effect. What constitutes a material change will be determined at Our sole discretion.</p>\r\n\r\n<p>By continuing to access or use Our Service after those revisions become effective, You agree to be bound by the revised terms. If You do not agree to the new terms, in whole or in part, please stop using the website and the Service.</p>\r\n\r\n<h1>Contact Us</h1>\r\n\r\n<p>If you have any questions about these Terms and Conditions, You can contact us:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>By email: info@Otlobne.com</p>\r\n	</li>\r\n	<li>\r\n	<p>By visiting this page on our website: <a href=\"https://Otlobne.com/contact-us\" target=\"_blank\">https://Otlobne.com/contact-us</a></p>\r\n	</li>\r\n	<li>\r\n	<p>By phone number: +20 100 443 3037</p>\r\n	</li>\r\n</ul>', NULL, '2023-06-15 16:22:36'),
(16, 'business_name', 'اطلبني Otlobne', NULL, NULL),
(17, 'currency', 'KWD', NULL, NULL),
(18, 'logo', '2024-05-18-6648083a56395.png', NULL, NULL),
(19, 'phone', '+96590001860', NULL, NULL),
(20, 'email_address', 'info@otlobne.com', NULL, NULL),
(21, 'address', 'الكويت ، حولي', NULL, NULL),
(22, 'footer_text', 'All Right Reserved - 2023', NULL, NULL),
(23, 'customer_verification', NULL, NULL, NULL),
(24, 'map_api_key', 'AIzaSyC35I9Pt46EtPLEwIQvfgh6FJajhO0H6_Y', NULL, NULL),
(25, 'about_us', '<p><strong>- كل احتياجات البيت متوفرة لدينا.<br />\r\n- توصيل سريع.<br />\r\n- دفع امن .<br />\r\n- تتبع طلبك من الألف للياء.<br />\r\n- احصل على العروض الحصرية.<br />\r\n- ضع نجمة على متجرك المفضل، ليظهر دائماً أعلى الشاشة&nbsp;<br />\r\n- نقّي اختياراتك حسب العروضات، الأسعار.<br />\r\n- توصيل اي شي من أي مكان وتوصيل بين المدن ، خدمات متطورة ومتنوعة.<br />\r\n- أطلب قهوه ، كوفي ، شاي نعناع وروق عندنا أفضل مطاعم وأحدث المتاجر وكل لوازم البيت.<br />\r\n- مكنك طلب الطعام والزهور و البقالة والأزياء ولعب الأطفال و والحلويات والقهوة المفضلة لديك من المقاهي المحيطة بك</strong></p>', NULL, '2023-06-15 20:08:56'),
(26, 'privacy_policy', '<h1>Privacy Policy</h1>\r\n\r\n<p>Last updated: June 15, 2023</p>\r\n\r\n<p>This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.</p>\r\n\r\n<p>We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy.</p>\r\n\r\n<h1>Interpretation and Definitions</h1>\r\n\r\n<h2>Interpretation</h2>\r\n\r\n<p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p>\r\n\r\n<h2>Definitions</h2>\r\n\r\n<p>For the purposes of this Privacy Policy:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Account</strong> means a unique account created for You to access our Service or parts of our Service.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Affiliate</strong> means an entity that controls, is controlled by or is under common control with a party, where &quot;control&quot; means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Application</strong> refers to اطلب اطلبني, the software program provided by the Company.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Company</strong> (referred to as either &quot;the Company&quot;, &quot;We&quot;, &quot;Us&quot; or &quot;Our&quot; in this Agreement) refers to Otlobne.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Cookies</strong> are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Country</strong> refers to: Egypt</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Device</strong> means any device that can access the Service such as a computer, a cellphone or a digital tablet.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Personal Data</strong> is any information that relates to an identified or identifiable individual.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Service</strong> refers to the Application or the Website or both.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Service Provider</strong> means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Usage Data</strong> refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Website</strong> refers to Otlobne, accessible from <a href=\"https://Otlobne.com/\" target=\"_blank\">https://Otlobne.com/</a></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>You</strong> means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h1>Collecting and Using Your Personal Data</h1>\r\n\r\n<h2>Types of Data Collected</h2>\r\n\r\n<h3>Personal Data</h3>\r\n\r\n<p>While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>First name and last name</p>\r\n	</li>\r\n	<li>\r\n	<p>Phone number</p>\r\n	</li>\r\n	<li>\r\n	<p>Address, State, Province, ZIP/Postal code, City</p>\r\n	</li>\r\n	<li>\r\n	<p>Usage Data</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>Usage Data</h3>\r\n\r\n<p>Usage Data is collected automatically when using the Service.</p>\r\n\r\n<p>Usage Data may include information such as Your Device&#39;s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.</p>\r\n\r\n<p>When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.</p>\r\n\r\n<p>We may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.</p>\r\n\r\n<h3>Information Collected while Using the Application</h3>\r\n\r\n<p>While using Our Application, in order to provide features of Our Application, We may collect, with Your prior permission:</p>\r\n\r\n<ul>\r\n	<li>Information regarding your location</li>\r\n	<li>Information from your Device&#39;s phone book (contacts list)</li>\r\n	<li>Pictures and other information from your Device&#39;s camera and photo library</li>\r\n</ul>\r\n\r\n<p>We use this information to provide features of Our Service, to improve and customize Our Service. The information may be uploaded to the Company&#39;s servers and/or a Service Provider&#39;s server or it may be simply stored on Your device.</p>\r\n\r\n<p>You can enable or disable access to this information at any time, through Your Device settings.</p>\r\n\r\n<h3>Tracking Technologies and Cookies</h3>\r\n\r\n<p>We use Cookies and similar tracking technologies to track the activity on Our Service and store certain information. Tracking technologies used are beacons, tags, and scripts to collect and track information and to improve and analyze Our Service. The technologies We use may include:</p>\r\n\r\n<ul>\r\n	<li><strong>Cookies or Browser Cookies.</strong> A cookie is a small file placed on Your Device. You can instruct Your browser to refuse all Cookies or to indicate when a Cookie is being sent. However, if You do not accept Cookies, You may not be able to use some parts of our Service. Unless you have adjusted Your browser setting so that it will refuse Cookies, our Service may use Cookies.</li>\r\n	<li><strong>Web Beacons.</strong> Certain sections of our Service and our emails may contain small electronic files known as web beacons (also referred to as clear gifs, pixel tags, and single-pixel gifs) that permit the Company, for example, to count users who have visited those pages or opened an email and for other related website statistics (for example, recording the popularity of a certain section and verifying system and server integrity).</li>\r\n</ul>\r\n\r\n<p>Cookies can be &quot;Persistent&quot; or &quot;Session&quot; Cookies. Persistent Cookies remain on Your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close Your web browser. Learn more about cookies on the <a href=\"https://www.freeprivacypolicy.com/blog/sample-privacy-policy-template/#Use_Of_Cookies_And_Tracking\" target=\"_blank\">Free Privacy Policy website</a> article.</p>\r\n\r\n<p>We use both Session and Persistent Cookies for the purposes set out below:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Necessary / Essential Cookies</strong></p>\r\n\r\n	<p>Type: Session Cookies</p>\r\n\r\n	<p>Administered by: Us</p>\r\n\r\n	<p>Purpose: These Cookies are essential to provide You with services available through the Website and to enable You to use some of its features. They help to authenticate users and prevent fraudulent use of user accounts. Without these Cookies, the services that You have asked for cannot be provided, and We only use these Cookies to provide You with those services.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Cookies Policy / Notice Acceptance Cookies</strong></p>\r\n\r\n	<p>Type: Persistent Cookies</p>\r\n\r\n	<p>Administered by: Us</p>\r\n\r\n	<p>Purpose: These Cookies identify if users have accepted the use of cookies on the Website.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Functionality Cookies</strong></p>\r\n\r\n	<p>Type: Persistent Cookies</p>\r\n\r\n	<p>Administered by: Us</p>\r\n\r\n	<p>Purpose: These Cookies allow us to remember choices You make when You use the Website, such as remembering your login details or language preference. The purpose of these Cookies is to provide You with a more personal experience and to avoid You having to re-enter your preferences every time You use the Website.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>For more information about the cookies we use and your choices regarding cookies, please visit our Cookies Policy or the Cookies section of our Privacy Policy.</p>\r\n\r\n<h2>Use of Your Personal Data</h2>\r\n\r\n<p>The Company may use Personal Data for the following purposes:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>To provide and maintain our Service</strong>, including to monitor the usage of our Service.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>To manage Your Account:</strong> to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>For the performance of a contract:</strong> the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>To contact You:</strong> To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application&#39;s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>To provide You</strong> with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>To manage Your requests:</strong> To attend and manage Your requests to Us.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>For business transfers:</strong> We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>For other purposes</strong>: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>We may share Your personal information in the following situations:</p>\r\n\r\n<ul>\r\n	<li><strong>With Service Providers:</strong> We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.</li>\r\n	<li><strong>For business transfers:</strong> We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.</li>\r\n	<li><strong>With Affiliates:</strong> We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.</li>\r\n	<li><strong>With business partners:</strong> We may share Your information with Our business partners to offer You certain products, services or promotions.</li>\r\n	<li><strong>With other users:</strong> when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside.</li>\r\n	<li><strong>With Your consent</strong>: We may disclose Your personal information for any other purpose with Your consent.</li>\r\n</ul>\r\n\r\n<h2>Retention of Your Personal Data</h2>\r\n\r\n<p>The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.</p>\r\n\r\n<p>The Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.</p>\r\n\r\n<h2>Transfer of Your Personal Data</h2>\r\n\r\n<p>Your information, including Personal Data, is processed at the Company&#39;s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to &mdash; and maintained on &mdash; computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.</p>\r\n\r\n<p>Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.</p>\r\n\r\n<p>The Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.</p>\r\n\r\n<h2>Delete Your Personal Data</h2>\r\n\r\n<p>You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You.</p>\r\n\r\n<p>Our Service may give You the ability to delete certain information about You from within the Service.</p>\r\n\r\n<p>You may update, amend, or delete Your information at any time by signing in to Your Account, if you have one, and visiting the account settings section that allows you to manage Your personal information. You may also contact Us to request access to, correct, or delete any personal information that You have provided to Us.</p>\r\n\r\n<p>Please note, however, that We may need to retain certain information when we have a legal obligation or lawful basis to do so.</p>\r\n\r\n<h2>Disclosure of Your Personal Data</h2>\r\n\r\n<h3>Business Transactions</h3>\r\n\r\n<p>If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.</p>\r\n\r\n<h3>Law enforcement</h3>\r\n\r\n<p>Under certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).</p>\r\n\r\n<h3>Other legal requirements</h3>\r\n\r\n<p>The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:</p>\r\n\r\n<ul>\r\n	<li>Comply with a legal obligation</li>\r\n	<li>Protect and defend the rights or property of the Company</li>\r\n	<li>Prevent or investigate possible wrongdoing in connection with the Service</li>\r\n	<li>Protect the personal safety of Users of the Service or the public</li>\r\n	<li>Protect against legal liability</li>\r\n</ul>\r\n\r\n<h2>Security of Your Personal Data</h2>\r\n\r\n<p>The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.</p>\r\n\r\n<h1>Children&#39;s Privacy</h1>\r\n\r\n<p>Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.</p>\r\n\r\n<p>If We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent&#39;s consent before We collect and use that information.</p>\r\n\r\n<h1>Links to Other Websites</h1>\r\n\r\n<p>Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party&#39;s site. We strongly advise You to review the Privacy Policy of every site You visit.</p>\r\n\r\n<p>We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.</p>\r\n\r\n<h1>Changes to this Privacy Policy</h1>\r\n\r\n<p>We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.</p>\r\n\r\n<p>We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the &quot;Last updated&quot; date at the top of this Privacy Policy.</p>\r\n\r\n<p>You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.</p>\r\n\r\n<h1>Contact Us</h1>\r\n\r\n<p>If you have any questions about this Privacy Policy, You can contact us:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>By email: info@Otlobne.com</p>\r\n	</li>\r\n	<li>\r\n	<p>By visiting this page on our website: <a href=\"https://Otlobne.com/contact-us\" target=\"_blank\">https://Otlobne.com/contact-us</a></p>\r\n	</li>\r\n	<li>\r\n	<p>By phone number: +20 100 443 3037</p>\r\n	</li>\r\n</ul>', NULL, '2023-06-15 16:20:16'),
(27, 'minimum_shipping_charge', '1', NULL, NULL),
(28, 'per_km_shipping_charge', '0.100', NULL, NULL),
(29, 'digital_payment', '{\"status\":\"1\"}', '2021-07-01 14:27:38', '2021-08-22 00:47:42'),
(30, 'ssl_commerz_payment', '{\"status\":\"0\",\"store_id\":null,\"store_password\":null}', '2021-07-04 15:41:24', '2022-03-23 04:21:28'),
(31, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', '2021-07-04 15:41:28', '2022-03-23 04:21:38'),
(32, 'paypal', '{\"status\":\"0\",\"paypal_client_id\":null,\"paypal_secret\":null}', '2021-07-04 15:41:34', '2022-03-23 04:21:49'),
(33, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":null,\"merchantEmail\":null}', '2021-07-04 15:41:42', '2022-03-23 04:22:15'),
(34, 'senang_pay', '{\"status\":null,\"secret_key\":null,\"published_key\":null,\"merchant_id\":null}', '2021-07-04 15:41:48', '2023-05-03 20:09:34'),
(35, 'order_handover_message', '{\"status\":1,\"message\":\"Delivery man is on the way\"}', NULL, NULL),
(36, 'order_cancled_message', '{\"status\":1,\"message\":\"Order is canceled by your request\"}', NULL, NULL),
(37, 'timezone', 'Asia/Kuwait', NULL, NULL),
(38, 'order_delivery_verification', NULL, NULL, NULL),
(39, 'currency_symbol_position', 'right', NULL, NULL),
(40, 'schedule_order', '1', NULL, NULL),
(41, 'app_minimum_version', '0', NULL, NULL),
(42, 'tax', NULL, NULL, NULL),
(43, 'admin_commission', '1', NULL, NULL),
(44, 'country', 'KW', NULL, NULL),
(45, 'app_url', 'https://www.google.com', NULL, NULL),
(46, 'default_location', '{\"lat\":\"29.33043120000001\",\"lng\":\"48.0190676\"}', NULL, NULL),
(47, 'twilio_sms', '{\"status\":\"0\",\"sid\":null,\"messaging_service_id\":null,\"token\":null,\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}', '2023-06-03 15:47:04', '2023-06-03 15:47:04'),
(48, 'nexmo_sms', '{\"status\":0,\"api_key\":null,\"api_secret\":null,\"signature_secret\":\"\",\"private_key\":\"\",\"application_id\":\"\",\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}', '2023-05-14 10:17:54', '2023-05-14 10:17:54'),
(49, '2factor_sms', '{\"status\":0,\"api_key\":null}', '2023-05-14 10:17:54', '2023-05-14 10:17:54'),
(50, 'msg91_sms', '{\"status\":0,\"template_id\":null,\"authkey\":null}', '2023-05-14 10:17:54', '2023-05-14 10:17:54'),
(51, 'free_delivery_over', NULL, NULL, NULL),
(52, 'maintenance_mode', '0', '2021-09-08 15:44:28', '2021-09-08 15:44:28'),
(53, 'app_minimum_version_ios', NULL, '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(54, 'app_minimum_version_android', NULL, '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(55, 'app_url_ios', NULL, '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(56, 'app_url_android', NULL, '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(57, 'flutterwave', '{\"status\":null,\"public_key\":\"FLWPUBK_TEST-3f6a0b6c3d621c4ecbb9beeff516c92b-X\",\"secret_key\":\"FLWSECK_TEST-ec27426eb062491500a9eb95723b5436-X\",\"hash\":\"FLWSECK_TEST951e36220f66\"}', '2021-09-21 22:54:10', '2023-07-19 22:33:10'),
(58, 'dm_maximum_orders', '30', '2021-09-24 17:46:13', '2021-09-24 17:46:13'),
(59, 'order_confirmation_model', 'deliveryman', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(60, 'popular_food', '1', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(61, 'popular_restaurant', '1', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(62, 'new_restaurant', '1', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(63, 'mercadopago', '{\"status\":null,\"public_key\":null,\"access_token\":null}', '2021-10-17 00:05:08', '2023-05-03 20:14:38'),
(64, 'map_api_key_server', 'AIzaSyC35I9Pt46EtPLEwIQvfgh6FJajhO0H6_Y', NULL, NULL),
(66, 'most_reviewed_foods', '1', '2021-11-15 15:55:37', '2021-11-15 15:55:37');
INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(67, 'landing_page_text', '{\"header_title_1\":\"\\u062a\\u0637\\u0628\\u064a\\u0642  \\u0627\\u0637\\u0644\\u0628\\u0646\\u064a \\u0644\\u062a\\u0648\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0637\\u0644\\u0628\\u0627\\u062a\",\"header_title_2\":\"\\u0627\\u0637\\u0644\\u0628\\u0646\\u064a \\u0623\\u0633\\u0631\\u0639 \\u0648\\u0623\\u0641\\u0636\\u0644 \\u0645\\u0646\\u0635\\u0629 \\u0644\\u062a\\u0648\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0637\\u0644\\u0628\\u0627\\u062a \\u0641\\u064a \\u0627\\u0644\\u0643\\u0648\\u064a\\u062a\",\"header_title_3\":null,\"about_title\":\"\\u0627\\u0637\\u0644\\u0628\\u0646\\u064a \\u0623\\u0633\\u0631\\u0639 \\u0648\\u0623\\u0641\\u0636\\u0644 \\u0645\\u0646\\u0635\\u0629 \\u0644\\u062a\\u0648\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0637\\u0644\\u0628\\u0627\\u062a \\u0641\\u064a \\u0627\\u0644\\u0643\\u0648\\u064a\\u062a\",\"why_choose_us\":null,\"why_choose_us_title\":\"\\u0644\\u064a\\u0647 \\u062a\\u062e\\u062a\\u0627\\u0631 \\u062a\\u0637\\u0628\\u064a\\u0642 \\u0627\\u0637\\u0644\\u0628\\u0646\\u064a \\u061f\",\"module_section_title\":\"\\u0627\\u0644\\u0633\\u0631\\u0639\\u0629 \\u0648\\u0627\\u0644\\u062f\\u0642\\u0629 \\u0648\\u0627\\u0644\\u0623\\u0645\\u0627\\u0646\",\"module_section_sub_title\":\"\\u0627\\u0644\\u062f\\u0639\\u0645 \\u0627\\u0644\\u0645\\u0628\\u0627\\u0634\\u0631\",\"refer_section_title\":\"\\u0633\\u0647\\u0644 \\u0627\\u0644\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\",\"refer_section_sub_title\":\"\\u0627\\u0646\\u062a\\u0634\\u0627\\u0631 \\u0627\\u0643\\u062a\\u0631 \\u0641\\u064a \\u0643\\u0644 \\u0645\\u0643\\u0627\\u0646\",\"refer_section_description\":\"- \\u0643\\u0644 \\u0627\\u062d\\u062a\\u064a\\u0627\\u062c\\u0627\\u062a \\u0627\\u0644\\u0628\\u064a\\u062a \\u0645\\u062a\\u0648\\u0641\\u0631\\u0629 \\u0644\\u062f\\u064a\\u0646\\u0627.\\r\\n- \\u062a\\u0648\\u0635\\u064a\\u0644 \\u0633\\u0631\\u064a\\u0639.\\r\\n- \\u062f\\u0641\\u0639 \\u0627\\u0645\\u0646 .\\r\\n- \\u062a\\u062a\\u0628\\u0639 \\u0637\\u0644\\u0628\\u0643 \\u0645\\u0646 \\u0627\\u0644\\u0623\\u0644\\u0641 \\u0644\\u0644\\u064a\\u0627\\u0621.\\r\\n- \\u0627\\u062d\\u0635\\u0644 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0639\\u0631\\u0648\\u0636 \\u0627\\u0644\\u062d\\u0635\\u0631\\u064a\\u0629.\\r\\n- \\u0636\\u0639 \\u0646\\u062c\\u0645\\u0629 \\u0639\\u0644\\u0649 \\u0645\\u062a\\u062c\\u0631\\u0643 \\u0627\\u0644\\u0645\\u0641\\u0636\\u0644\\u060c \\u0644\\u064a\\u0638\\u0647\\u0631 \\u062f\\u0627\\u0626\\u0645\\u0627\\u064b \\u0623\\u0639\\u0644\\u0649 \\u0627\\u0644\\u0634\\u0627\\u0634\\u0629 \\r\\n- \\u0646\\u0642\\u0651\\u064a \\u0627\\u062e\\u062a\\u064a\\u0627\\u0631\\u0627\\u062a\\u0643 \\u062d\\u0633\\u0628 \\u0627\\u0644\\u0639\\u0631\\u0648\\u0636\\u0627\\u062a\\u060c \\u0627\\u0644\\u0623\\u0633\\u0639\\u0627\\u0631.\\r\\n- \\u062a\\u0648\\u0635\\u064a\\u0644 \\u0627\\u064a \\u0634\\u064a \\u0645\\u0646 \\u0623\\u064a \\u0645\\u0643\\u0627\\u0646 \\u0648\\u062a\\u0648\\u0635\\u064a\\u0644 \\u0628\\u064a\\u0646 \\u0627\\u0644\\u0645\\u062f\\u0646 \\u060c \\u062e\\u062f\\u0645\\u0627\\u062a \\u0645\\u062a\\u0637\\u0648\\u0631\\u0629 \\u0648\\u0645\\u062a\\u0646\\u0648\\u0639\\u0629.\\r\\n- \\u0623\\u0637\\u0644\\u0628 \\u0642\\u0647\\u0648\\u0647 \\u060c \\u0643\\u0648\\u0641\\u064a \\u060c \\u0634\\u0627\\u064a \\u0646\\u0639\\u0646\\u0627\\u0639 \\u0648\\u0631\\u0648\\u0642 \\u0639\\u0646\\u062f\\u0646\\u0627 \\u0623\\u0641\\u0636\\u0644 \\u0645\\u0637\\u0627\\u0639\\u0645 \\u0648\\u0623\\u062d\\u062f\\u062b \\u0627\\u0644\\u0645\\u062a\\u0627\\u062c\\u0631 \\u0648\\u0643\\u0644 \\u0644\\u0648\\u0627\\u0632\\u0645 \\u0627\\u0644\\u0628\\u064a\\u062a.\\r\\n- \\u0645\\u0643\\u0646\\u0643 \\u0637\\u0644\\u0628 \\u0627\\u0644\\u0637\\u0639\\u0627\\u0645 \\u0648\\u0627\\u0644\\u0632\\u0647\\u0648\\u0631 \\u0648 \\u0627\\u0644\\u0628\\u0642\\u0627\\u0644\\u0629 \\u0648\\u0627\\u0644\\u0623\\u0632\\u064a\\u0627\\u0621 \\u0648\\u0644\\u0639\\u0628 \\u0627\\u0644\\u0623\\u0637\\u0641\\u0627\\u0644 \\u0648 \\u0648\\u0627\\u0644\\u062d\\u0644\\u0648\\u064a\\u0627\\u062a \\u0648\\u0627\\u0644\\u0642\\u0647\\u0648\\u0629 \\u0627\\u0644\\u0645\\u0641\\u0636\\u0644\\u0629 \\u0644\\u062f\\u064a\\u0643 \\u0645\\u0646 \\u0627\\u0644\\u0645\\u0642\\u0627\\u0647\\u064a \\u0627\\u0644\\u0645\\u062d\\u064a\\u0637\\u0629 \\u0628\\u0643\",\"joinus_section_title\":\"\\u0627\\u0646\\u0636\\u0645 \\u0627\\u0644\\u064a\\u0646\\u0627 \\u0627\\u0644\\u0623\\u0646\",\"joinus_section_sub_title\":\"\\u0627\\u0646\\u0636\\u0645 \\u0627\\u0644\\u064a \\u0642\\u0627\\u0626\\u0645\\u0629 \\u0634\\u0631\\u0643\\u0627\\u0621 Otlobne \\u0648\\u062d\\u0642\\u0642 \\u0627\\u0639\\u0644\\u064a \\u0627\\u0644\\u0623\\u0631\\u0628\\u0627\\u062d\",\"download_app_section_title\":\"\\u062d\\u0645\\u0644 \\u0627\\u0644\\u062a\\u0637\\u0628\\u064a\\u0642 \\u0627\\u0644\\u0627\\u0646\",\"download_app_section_sub_title\":\"\\u062d\\u0645\\u0644 \\u0627\\u0644\\u062a\\u0637\\u0628\\u064a\\u0642 \\u0648 \\u0627\\u0633\\u062a\\u0645\\u062a\\u0639 \\u0628\\u0627\\u0641\\u0636\\u0644 \\u0627\\u0644\\u0639\\u0631\\u0648\\u0636 \\u0648 \\u0627\\u0644\\u062a\\u062e\\u0641\\u064a\\u0636\\u0627\\u062a\",\"testimonial_title\":\"\\u0627\\u0631\\u0627\\u0621 \\u0639\\u0645\\u0644\\u0627\\u0626\\u0646\\u0627 \\u0639\\u0644\\u064a \\u0627\\u0644\\u0645\\u0646\\u0635\\u0627\\u062a \\u0627\\u0644\\u0645\\u062e\\u062a\\u0644\\u0641\\u0647\",\"mobile_app_section_heading\":\"\\u0627\\u0637\\u0644\\u0628\\u0646\\u064a - Otlobne\",\"mobile_app_section_text\":\"- \\u0643\\u0644 \\u0627\\u062d\\u062a\\u064a\\u0627\\u062c\\u0627\\u062a \\u0627\\u0644\\u0628\\u064a\\u062a \\u0645\\u062a\\u0648\\u0641\\u0631\\u0629 \\u0644\\u062f\\u064a\\u0646\\u0627. - \\u062a\\u0648\\u0635\\u064a\\u0644 \\u0633\\u0631\\u064a\\u0639. - \\u062f\\u0641\\u0639 \\u0627\\u0645\\u0646 . - \\u062a\\u062a\\u0628\\u0639 \\u0637\\u0644\\u0628\\u0643 \\u0645\\u0646 \\u0627\\u0644\\u0623\\u0644\\u0641 \\u0644\\u0644\\u064a\\u0627\\u0621. - \\u0627\\u062d\\u0635\\u0644 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0639\\u0631\\u0648\\u0636 \\u0627\\u0644\\u062d\\u0635\\u0631\\u064a\\u0629. - \\u0636\\u0639 \\u0646\\u062c\\u0645\\u0629 \\u0639\\u0644\\u0649 \\u0645\\u062a\\u062c\\u0631\\u0643 \\u0627\\u0644\\u0645\\u0641\\u0636\\u0644\\u060c \\u0644\\u064a\\u0638\\u0647\\u0631 \\u062f\\u0627\\u0626\\u0645\\u0627\\u064b \\u0623\\u0639\\u0644\\u0649 \\u0627\\u0644\\u0634\\u0627\\u0634\\u0629  - \\u0646\\u0642\\u0651\\u064a \\u0627\\u062e\\u062a\\u064a\\u0627\\u0631\\u0627\\u062a\\u0643 \\u062d\\u0633\\u0628 \\u0627\\u0644\\u0639\\u0631\\u0648\\u0636\\u0627\\u062a\\u060c \\u0627\\u0644\\u0623\\u0633\\u0639\\u0627\\u0631. - \\u062a\\u0648\\u0635\\u064a\\u0644 \\u0627\\u064a \\u0634\\u064a \\u0645\\u0646 \\u0623\\u064a \\u0645\\u0643\\u0627\\u0646 \\u0648\\u062a\\u0648\\u0635\\u064a\\u0644 \\u0628\\u064a\\u0646 \\u0627\\u0644\\u0645\\u062f\\u0646 \\u060c \\u062e\\u062f\\u0645\\u0627\\u062a \\u0645\\u062a\\u0637\\u0648\\u0631\\u0629 \\u0648\\u0645\\u062a\\u0646\\u0648\\u0639\\u0629. - \\u0623\\u0637\\u0644\\u0628 \\u0642\\u0647\\u0648\\u0647 \\u060c \\u0643\\u0648\\u0641\\u064a \\u060c \\u0634\\u0627\\u064a \\u0646\\u0639\\u0646\\u0627\\u0639 \\u0648\\u0631\\u0648\\u0642 \\u0639\\u0646\\u062f\\u0646\\u0627 \\u0623\\u0641\\u0636\\u0644 \\u0645\\u0637\\u0627\\u0639\\u0645 \\u0648\\u0623\\u062d\\u062f\\u062b \\u0627\\u0644\\u0645\\u062a\\u0627\\u062c\\u0631 \\u0648\\u0643\\u0644 \\u0644\\u0648\\u0627\\u0632\\u0645 \\u0627\\u0644\\u0628\\u064a\\u062a. - \\u0645\\u0643\\u0646\\u0643 \\u0637\\u0644\\u0628 \\u0627\\u0644\\u0637\\u0639\\u0627\\u0645 \\u0648\\u0627\\u0644\\u0632\\u0647\\u0648\\u0631 \\u0648 \\u0627\\u0644\\u0628\\u0642\\u0627\\u0644\\u0629 \\u0648\\u0627\\u0644\\u0623\\u0632\\u064a\\u0627\\u0621 \\u0648\\u0644\\u0639\\u0628 \\u0627\\u0644\\u0623\\u0637\\u0641\\u0627\\u0644 \\u0648 \\u0648\\u0627\\u0644\\u062d\\u0644\\u0648\\u064a\\u0627\\u062a \\u0648\\u0627\\u0644\\u0642\\u0647\\u0648\\u0629 \\u0627\\u0644\\u0645\\u0641\\u0636\\u0644\\u0629 \\u0644\\u062f\\u064a\\u0643 \\u0645\\u0646 \\u0627\\u0644\\u0645\\u0642\\u0627\\u0647\\u064a \\u0627\\u0644\\u0645\\u062d\\u064a\\u0637\\u0629 \\u0628\\u0643\",\"feature_section_description\":\"\\u0639\\u0645\\u0644\\u0627\\u0626\\u0643 \\u0633\\u0639\\u062f\\u0627\\u0621\\r\\n\\u0627\\u0644\\u0633\\u0631\\u0639\\u0629 \\u0648\\u0627\\u0644\\u062c\\u0648\\u062f\\u0629 \\u0641\\u064a \\u062a\\u0648\\u0635\\u064a\\u0644 \\u0645\\u0646\\u062a\\u062c\\u0627\\u062a\\u0643 \\u0641\\u064a \\u062d\\u0627\\u0644\\u0629 \\u0645\\u0645\\u062a\\u0627\\u0632\\u0629 \\u064a\\u062c\\u0639\\u0644 \\u0639\\u0645\\u0644\\u0627\\u0626\\u0643 \\u0623\\u0643\\u062b\\u0631 \\u0633\\u0639\\u0627\\u062f\\u0629\\r\\n\\r\\n\\u0646\\u0641\\u0642\\u0627\\u062a \\u0623\\u0642\\u0644\\r\\n\\u062a\\u0642\\u0644\\u064a\\u0644 \\u0627\\u0644\\u062a\\u0643\\u0627\\u0644\\u064a\\u0641 \\u0627\\u0644\\u0634\\u0647\\u0631\\u064a\\u0629 \\u0627\\u0644\\u062b\\u0627\\u0628\\u062a\\u0629 \\u0644\\u0644\\u0633\\u0627\\u0626\\u0642\\u064a\\u0646 \\u0648\\u062e\\u0641\\u0636 \\u062a\\u0643\\u0644\\u0641\\u0629 \\u0627\\u0644\\u062a\\u0634\\u063a\\u064a\\u0644\\r\\n\\r\\n\\u0633\\u0647\\u0644 \\u0627\\u0644\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\r\\n\\u064a\\u0639\\u0645\\u0644 Otlobne \\u0639\\u0644\\u064a \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u0627\\u062c\\u0647\\u0632\\u0629 \\u0627\\u0644\\u0644\\u0648\\u062d\\u064a\\u0629 \\u0648\\u0627\\u0644\\u0645\\u062d\\u0645\\u0648\\u0644\\u0629\",\"feature_section_title\":\"\\u0627\\u0644\\u0645\\u0645\\u064a\\u0632\\u0627\\u062a\",\"newsletter_title\":null,\"newsletter_sub_title\":null,\"contact_us_title\":\"\\u0627\\u0644\\u062e\\u062f\\u0645\\u0629 \\u0628\\u062a\\u0643\\u0648\\u0646 \\u0645\\u0646 \\u0627\\u0644\\u0633\\u0627\\u0639\\u0629 \\u0643\\u0627\\u0645 \\u0644\\u0644\\u0633\\u0627\\u0639\\u0629 \\u0643\\u0627\\u0645 \\u061f\\r\\n\\u0639\\u0644\\u064a \\u0645\\u062f\\u0627\\u0631 24 \\u0633\\u0627\\u0639\\u0647\",\"contact_us_sub_title\":null,\"footer_article\":\"- \\u0643\\u0644 \\u0627\\u062d\\u062a\\u064a\\u0627\\u062c\\u0627\\u062a \\u0627\\u0644\\u0628\\u064a\\u062a \\u0645\\u062a\\u0648\\u0641\\u0631\\u0629 \\u0644\\u062f\\u064a\\u0646\\u0627.\\r\\n- \\u062a\\u0648\\u0635\\u064a\\u0644 \\u0633\\u0631\\u064a\\u0639.\\r\\n- \\u062f\\u0641\\u0639 \\u0627\\u0645\\u0646 .\\r\\n- \\u062a\\u062a\\u0628\\u0639 \\u0637\\u0644\\u0628\\u0643 \\u0645\\u0646 \\u0627\\u0644\\u0623\\u0644\\u0641 \\u0644\\u0644\\u064a\\u0627\\u0621.\\r\\n- \\u0627\\u062d\\u0635\\u0644 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0639\\u0631\\u0648\\u0636 \\u0627\\u0644\\u062d\\u0635\\u0631\\u064a\\u0629.\\r\\n- \\u0636\\u0639 \\u0646\\u062c\\u0645\\u0629 \\u0639\\u0644\\u0649 \\u0645\\u062a\\u062c\\u0631\\u0643 \\u0627\\u0644\\u0645\\u0641\\u0636\\u0644\\u060c \\u0644\\u064a\\u0638\\u0647\\u0631 \\u062f\\u0627\\u0626\\u0645\\u0627\\u064b \\u0623\\u0639\\u0644\\u0649 \\u0627\\u0644\\u0634\\u0627\\u0634\\u0629 \\r\\n- \\u0646\\u0642\\u0651\\u064a \\u0627\\u062e\\u062a\\u064a\\u0627\\u0631\\u0627\\u062a\\u0643 \\u062d\\u0633\\u0628 \\u0627\\u0644\\u0639\\u0631\\u0648\\u0636\\u0627\\u062a\\u060c \\u0627\\u0644\\u0623\\u0633\\u0639\\u0627\\u0631.\\r\\n- \\u062a\\u0648\\u0635\\u064a\\u0644 \\u0627\\u064a \\u0634\\u064a \\u0645\\u0646 \\u0623\\u064a \\u0645\\u0643\\u0627\\u0646 \\u0648\\u062a\\u0648\\u0635\\u064a\\u0644 \\u0628\\u064a\\u0646 \\u0627\\u0644\\u0645\\u062f\\u0646 \\u060c \\u062e\\u062f\\u0645\\u0627\\u062a \\u0645\\u062a\\u0637\\u0648\\u0631\\u0629 \\u0648\\u0645\\u062a\\u0646\\u0648\\u0639\\u0629.\\r\\n- \\u0623\\u0637\\u0644\\u0628 \\u0642\\u0647\\u0648\\u0647 \\u060c \\u0643\\u0648\\u0641\\u064a \\u060c \\u0634\\u0627\\u064a \\u0646\\u0639\\u0646\\u0627\\u0639 \\u0648\\u0631\\u0648\\u0642 \\u0639\\u0646\\u062f\\u0646\\u0627 \\u0623\\u0641\\u0636\\u0644 \\u0645\\u0637\\u0627\\u0639\\u0645 \\u0648\\u0623\\u062d\\u062f\\u062b \\u0627\\u0644\\u0645\\u062a\\u0627\\u062c\\u0631 \\u0648\\u0643\\u0644 \\u0644\\u0648\\u0627\\u0632\\u0645 \\u0627\\u0644\\u0628\\u064a\\u062a.\\r\\n- \\u064a\\u0645\\u0643\\u0646\\u0643 \\u0637\\u0644\\u0628 \\u0627\\u0644\\u0637\\u0639\\u0627\\u0645 \\u0648\\u0627\\u0644\\u0632\\u0647\\u0648\\u0631 \\u0648 \\u0627\\u0644\\u0628\\u0642\\u0627\\u0644\\u0629 \\u0648\\u0627\\u0644\\u0623\\u0632\\u064a\\u0627\\u0621 \\u0648\\u0644\\u0639\\u0628 \\u0627\\u0644\\u0623\\u0637\\u0641\\u0627\\u0644 \\u0648 \\u0648\\u0627\\u0644\\u062d\\u0644\\u0648\\u064a\\u0627\\u062a \\u0648\\u0627\\u0644\\u0642\\u0647\\u0648\\u0629 \\u0627\\u0644\\u0645\\u0641\\u0636\\u0644\\u0629 \\u0644\\u062f\\u064a\\u0643 \\u0645\\u0646 \\u0627\\u0644\\u0645\\u0642\\u0627\\u0647\\u064a \\u0627\\u0644\\u0645\\u062d\\u064a\\u0637\\u0629 \\u0628\\u0643\"}', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(68, 'landing_page_links', '{\"app_url_android_status\":\"1\",\"app_url_android\":\"https:\\/\\/play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https:\\/\\/www.apple.com\\/app-store\",\"web_app_url_status\":null,\"web_app_url\":\"https:\\/\\/HekalStore.dev-hekal.com\\/\",\"seller_app_url_status\":null,\"seller_app_url\":null,\"deliveryman_app_url_status\":null,\"deliveryman_app_url\":null}', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(69, 'speciality', '[{\"img\":\"clean_&_cheap_icon.png\",\"title\":\"Clean & Cheap Price\"},{\"img\":\"best_dishes_icon.png\",\"title\":\"Best Dishes Near You\"},{\"img\":\"virtual_restaurant_icon.png\",\"title\":\"Your Own Virtual Restaurant\"}]', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(70, 'testimonial', '[]', '2021-11-15 15:55:37', '2023-07-19 22:27:27'),
(71, 'landing_page_images', '{\"top_content_image\":\"double_screen_image.png\",\"about_us_image\":\"about_us_image.png\",\"contact_us_image\":\"2024-05-18-66480b1c233ce.png\"}', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(72, 'paymob_accept', '{\"status\":\"0\",\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(73, 'admin_order_notification', '1', NULL, NULL),
(74, 'swish_payment', '{\"status\":\"1\"}', NULL, '2021-12-28 12:02:40'),
(76, 'service_charge', '12', NULL, NULL),
(77, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":null,\"client_secret\":null,\"status\":\"0\"},{\"login_medium\":\"facebook\",\"client_id\":null,\"client_secret\":null,\"status\":\"0\"}]', NULL, '2022-01-04 13:09:23'),
(78, 'language', '[\"en\",\"ar\"]', NULL, NULL),
(79, 'timeformat', '12', NULL, NULL),
(80, 'canceled_by_restaurant', '0', NULL, NULL),
(81, 'canceled_by_deliveryman', '1', NULL, NULL),
(82, 'show_dm_earning', '1', NULL, NULL),
(83, 'recaptcha', '{\"status\":\"1\",\"site_key\":\"6LeYpjonAAAAAK9X--9V6Oj9F5fKd8WZzWoxMc4t\",\"secret_key\":\"6LeYpjonAAAAANwBbcNoIR0LCm3K21Ivg-WP46pA\"}', '2023-05-03 19:56:53', '2023-05-03 19:56:53'),
(84, 'toggle_veg_non_veg', NULL, NULL, NULL),
(85, 'toggle_dm_registration', '1', NULL, NULL),
(86, 'toggle_restaurant_registration', '1', NULL, NULL),
(87, 'order_refunded_message', '{\"status\":1,\"message\":\"Order is refunded successfully\"}', NULL, NULL),
(88, 'liqpay', '{\"status\":null,\"public_key\":null,\"private_key\":null}', NULL, '2023-05-03 20:14:53'),
(89, 'klarna', '{\"status\":\"1\",\"region\":\"america\",\"username\":\"PN06804_1a368db08f6d\",\"password\":\"6ljrP6BDJNKT6F2y\"}', NULL, '2022-01-26 08:30:51'),
(90, 'fatoorah', '{\"status\":\"1\",\"api_key\":\"rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL\"}', NULL, '2022-02-20 11:05:26'),
(91, 'bkash', '{\"status\":null,\"api_key\":\"5tunt4masn6pv2hnvte1sb5n3j\",\"api_secret\":\"1vggbqd4hqk9g96o9rrrp2jftvek578v7d2bnerim12a87dbrrka\",\"username\":\"sandboxTestUser\",\"password\":\"hWD@8vtzw0\"}', NULL, '2023-05-03 20:14:42'),
(92, 'paytabs', '{\"status\":null,\"profile_id\":null,\"server_key\":null,\"base_url\":null}', NULL, '2023-05-03 20:14:56'),
(93, 'paytm', '{\"status\":null,\"paytm_merchant_key\":null,\"paytm_merchant_mid\":null,\"paytm_merchant_website\":null,\"paytm_refund_url\":null}', NULL, '2023-05-03 20:14:48'),
(94, 'schedule_order_slot_duration', '0', NULL, NULL),
(95, 'digit_after_decimal_point', '1', NULL, NULL),
(96, 'icon', '2024-05-18-6648083a5777d.png', NULL, NULL),
(97, 'toggle_store_registration', '1', NULL, NULL),
(98, 'canceled_by_store', '1', NULL, NULL),
(99, 'parcel_per_km_shipping_charge', '0', NULL, NULL),
(100, 'parcel_minimum_shipping_charge', '0', NULL, NULL),
(101, 'parcel_commission_dm', '0', NULL, NULL),
(102, 'landing_page_links', '{\"app_url_android_status\":\"1\",\"app_url_android\":\"https:\\/\\/play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https:\\/\\/www.apple.com\\/app-store\",\"web_app_url_status\":\"1\",\"web_app_url\":\"https:\\/\\/HekalStore.dev-hekal.com\\/\"}', NULL, NULL),
(103, 'wallet_status', '1', '2022-07-05 03:26:19', '2022-07-05 03:26:19'),
(104, 'loyalty_point_status', '1', '2022-07-05 03:26:19', '2022-07-05 03:26:19'),
(105, 'ref_earning_status', '1', '2022-07-05 03:26:19', '2022-07-05 03:26:19'),
(106, 'wallet_add_refund', '1', '2022-07-05 03:26:19', '2022-07-05 03:26:19'),
(107, 'loyalty_point_exchange_rate', '100', '2022-07-05 03:26:20', '2022-07-05 03:26:20'),
(108, 'ref_earning_exchange_rate', '1', '2022-07-05 03:26:20', '2022-07-05 03:26:20'),
(109, 'loyalty_point_item_purchase_point', '5', '2022-07-05 03:26:20', '2022-07-05 03:26:20'),
(110, 'loyalty_point_minimum_point', '500', '2022-07-05 03:26:20', '2022-07-05 03:26:20'),
(111, 'refund_active_status', '0', '2022-07-05 03:26:20', '2022-07-05 03:26:20'),
(112, 'dm_tips_status', '1', '2022-07-05 03:26:20', '2022-07-05 03:26:20'),
(113, 'site_direction', NULL, NULL, NULL),
(114, 'tax_included', NULL, NULL, NULL),
(115, 'free_delivery_over_status', NULL, NULL, NULL),
(116, 'prescription_order_status', '1', NULL, NULL),
(117, 'delivery_charge_comission', '1', NULL, NULL),
(118, 'opening_time', '07:00', NULL, NULL),
(119, 'closing_time', '23:59', NULL, NULL),
(120, 'opening_day', 'saturday', NULL, NULL),
(121, 'closing_day', 'friday', NULL, NULL),
(122, 'system_language', '[{\"id\":1,\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":false},{\"id\":2,\"direction\":\"rtl\",\"code\":\"ar\",\"status\":1,\"default\":true}]', '2023-05-03 19:39:43', '2023-06-03 19:21:26'),
(123, 'refund', '{\"status\":null,\"value\":\"<h1>Return and Refund Policy<\\/h1>\\r\\n\\r\\n<p>Last updated: June 15, 2023<\\/p>\\r\\n\\r\\n<p>Thank you for shopping at Otlobne website and \\u0627\\u0637\\u0644\\u0628 \\u0641\\u0648\\u0631\\u064a\\u0631\\u0629 app.<\\/p>\\r\\n\\r\\n<p>If, for any reason, You are not completely satisfied with a purchase We invite You to review our policy on refunds and returns. This Return and Refund Policy has been created with the help of the <a href=\\\"https:\\/\\/www.freeprivacypolicy.com\\/free-return-refund-policy-generator\\/\\\" target=\\\"_blank\\\">Free Return and Refund Policy Generator<\\/a>.<\\/p>\\r\\n\\r\\n<p>The following terms are applicable for any products that You purchased with Us.<\\/p>\\r\\n\\r\\n<h1>Interpretation and Definitions<\\/h1>\\r\\n\\r\\n<h2>Interpretation<\\/h2>\\r\\n\\r\\n<p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.<\\/p>\\r\\n\\r\\n<h2>Definitions<\\/h2>\\r\\n\\r\\n<p>For the purposes of this Return and Refund Policy:<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\r\\n\\t<p><strong>Application<\\/strong> means the software program provided by the Company downloaded by You on any electronic device, named \\u0627\\u0637\\u0644\\u0628 \\u0641\\u0648\\u0631\\u064a\\u0631\\u0629<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p><strong>Company<\\/strong> (referred to as either &quot;the Company&quot;, &quot;We&quot;, &quot;Us&quot; or &quot;Our&quot; in this Agreement) refers to Otlobne.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p><strong>Goods<\\/strong> refer to the items offered for sale on the Service.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p><strong>Orders<\\/strong> mean a request by You to purchase Goods from Us.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p><strong>Service<\\/strong> refers to the Application or the Website or both.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p><strong>Website<\\/strong> refers to Otlobne, accessible from <a href=\\\"https:\\/\\/Otlobne.com\\/\\\" target=\\\"_blank\\\"> https:\\/\\/Otlobne.com\\/<\\/a><\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p><strong>You<\\/strong> means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.<\\/p>\\r\\n\\t<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<h1>Your Order Cancellation Rights<\\/h1>\\r\\n\\r\\n<p>You are entitled to cancel Your Order within 7 days without giving any reason for doing so.<\\/p>\\r\\n\\r\\n<p>The deadline for cancelling an Order is 7 days from the date on which You received the Goods or on which a third party you have appointed, who is not the carrier, takes possession of the product delivered.<\\/p>\\r\\n\\r\\n<p>In order to exercise Your right of cancellation, You must inform Us of your decision by means of a clear statement. You can inform us of your decision by:<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\r\\n\\t<p>By email: info@Otlobne,com<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>By visiting this page on our website: <a href=\\\"https:\\/\\/Otlobne.com\\/contact-us\\\" target=\\\"_blank\\\">https:\\/\\/Otlobne.com\\/contact-us<\\/a><\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>By phone number: 01004433037<\\/p>\\r\\n\\t<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>We will reimburse You no later than 14 days from the day on which We receive the returned Goods. We will use the same means of payment as You used for the Order, and You will not incur any fees for such reimbursement.<\\/p>\\r\\n\\r\\n<h1>Conditions for Returns<\\/h1>\\r\\n\\r\\n<p>In order for the Goods to be eligible for a return, please make sure that:<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>The Goods were purchased in the last 7 days<\\/li>\\r\\n\\t<li>The Goods are in the original packaging<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>The following Goods cannot be returned:<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>The supply of Goods made to Your specifications or clearly personalized.<\\/li>\\r\\n\\t<li>The supply of Goods which according to their nature are not suitable to be returned, deteriorate rapidly or where the date of expiry is over.<\\/li>\\r\\n\\t<li>The supply of Goods which are not suitable for return due to health protection or hygiene reasons and were unsealed after delivery.<\\/li>\\r\\n\\t<li>The supply of Goods which are, after delivery, according to their nature, inseparably mixed with other items.<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>We reserve the right to refuse returns of any merchandise that does not meet the above return conditions in our sole discretion.<\\/p>\\r\\n\\r\\n<p>Only regular priced Goods may be refunded. Unfortunately, Goods on sale cannot be refunded. This exclusion may not apply to You if it is not permitted by applicable law.<\\/p>\\r\\n\\r\\n<h1>Returning Goods<\\/h1>\\r\\n\\r\\n<p>You are responsible for the cost and risk of returning the Goods to Us. You should send the Goods at the following address:<\\/p>\\r\\n\\r\\n<p>Contacting On Whatsapp First ,<br \\/>\\r\\nhttps:\\/\\/wa.me\\/201004433037<br \\/>\\r\\nthen , Describing the issue.<br \\/>\\r\\nAfter That We Send Delivery Representative to the client.<\\/p>\\r\\n\\r\\n<p>We cannot be held responsible for Goods damaged or lost in return shipment. Therefore, We recommend an insured and trackable mail service. We are unable to issue a refund without actual receipt of the Goods or proof of received return delivery.<\\/p>\\r\\n\\r\\n<h1>Gifts<\\/h1>\\r\\n\\r\\n<p>If the Goods were marked as a gift when purchased and then shipped directly to you, You&#39;ll receive a gift credit for the value of your return. Once the returned product is received, a gift certificate will be mailed to You.<\\/p>\\r\\n\\r\\n<p>If the Goods weren&#39;t marked as a gift when purchased, or the gift giver had the Order shipped to themselves to give it to You later, We will send the refund to the gift giver.<\\/p>\\r\\n\\r\\n<h2>Contact Us<\\/h2>\\r\\n\\r\\n<p>If you have any questions about our Returns and Refunds Policy, please contact us:<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\r\\n\\t<p>By email: info@Otlobne,com<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>By visiting this page on our website: <a href=\\\"https:\\/\\/Otlobne.com\\/contact-us\\\" target=\\\"_blank\\\">https:\\/\\/Otlobne.com\\/contact-us<\\/a><\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>By phone number: 01004433037<\\/p>\\r\\n\\t<\\/li>\\r\\n<\\/ul>\"}', NULL, '2023-06-15 16:25:37'),
(124, 'cancelation', '{\"status\":null,\"value\":\"<h1><img alt=\\\"\\\" src=\\\"https:\\/\\/store.dev-hekal.com\\/public\\/assets\\/admin\\/img\\/privacy-policy.png\\\" \\/>&nbsp;Cancelation is Accepted&nbsp;before the order being aproved.<\\/h1>\"}', NULL, '2023-05-12 17:34:58'),
(125, 'shipping_policy', '{\"status\":null,\"value\":\"<h1><img alt=\\\"\\\" src=\\\"https:\\/\\/store.dev-hekal.com\\/public\\/assets\\/admin\\/img\\/privacy-policy.png\\\" \\/>&nbsp;Shipping Fees depends on the distance KM.<\\/h1>\"}', NULL, '2023-05-12 17:35:29'),
(126, 'fcm_credentials', '{\"apiKey\":\"AIzaSyC35I9Pt46EtPLEwIQvfgh6FJajhO0H6_Y\",\"authDomain\":\"otlobne-app.firebaseapp.com\",\"projectId\":\"otlobne-app\",\"storageBucket\":\"otlobne-app.appspot.com\",\"messagingSenderId\":\"88149710408\",\"appId\":\"1:88149710408:web:8379e2b5a1ddd1adddea7d\",\"measurementId\":\"G-S5S1C1X44T\"}', NULL, NULL),
(127, 'web_app_landing_page_settings', '{\"top_content_image\":\"2024-05-18-66480d6e6231a.png\",\"mobile_app_section_image\":\"2024-05-18-66480d7ca2618.png\"}', NULL, NULL),
(128, 'app_minimum_version_android_store', NULL, NULL, NULL),
(129, 'app_url_android_store', NULL, NULL, NULL),
(130, 'app_minimum_version_ios_store', NULL, NULL, NULL),
(131, 'app_url_ios_store', NULL, NULL, NULL),
(132, 'app_minimum_version_android_deliveryman', NULL, NULL, NULL),
(133, 'app_url_android_deliveryman', NULL, NULL, NULL),
(134, 'app_minimum_version_ios_deliveryman', NULL, NULL, NULL),
(135, 'app_url_ios_deliveryman', NULL, NULL, NULL),
(136, 'backgroundChange', '{\"primary_1_hex\":\"#1633f4\",\"primary_1_rgb\":\"22, 51, 244\",\"primary_2_hex\":\"#fffdfd\",\"primary_2_rgb\":\"255, 253, 253\"}', NULL, NULL),
(137, 'delivery_service_section', '{\"delivery_service_section_image\":\"2023-06-07-6480c7461bd98.png\",\"delivery_service_section_title\":\"\\u0627\\u0644\\u062a\\u0648\\u0635\\u064a\\u0644\",\"delivery_service_section_description\":\"\\u062a\\u0648\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0642\\u0631\\u0628\"}', NULL, NULL),
(138, 'apple_login', '[{\"login_medium\":\"apple\",\"client_id\":\"\",\"client_secret\":\"\",\"team_id\":\"\",\"key_id\":\"\",\"service_file\":\"\",\"redirect_url\":\"\",\"status\":\"\"}]', '2023-05-15 00:26:30', '2023-05-15 00:26:30');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_store`
--

CREATE TABLE `campaign_store` (
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `campaign_status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `position`, `status`, `created_at`, `updated_at`, `priority`, `module_id`, `slug`) VALUES
(1, 'Grocery', '', 0, 0, 1, NULL, NULL, 0, 1, 'grocery'),
(2, 'Pharmacy', '2023-05-15-64627c27bad37.png', 0, 0, 1, NULL, '2023-05-15 18:38:31', 0, 2, 'pharmacy'),
(3, 'Ecommerce', '2023-05-19-6466c9c3cdde1.png', 0, 0, 1, NULL, '2023-05-19 00:58:43', 0, 3, 'ecommerce'),
(4, 'Restaurants', '', 0, 0, 1, NULL, NULL, 0, 4, 'restaurants'),
(5, 'Women\'s clothing', '2023-05-19-6466ca8e848ec.png', 0, 0, 1, NULL, '2023-05-19 01:02:06', 0, 6, 'womens-clothing'),
(6, 'Smartphones', '', 0, 0, 1, NULL, NULL, 0, 7, 'smartphones'),
(7, 'Sweets', '', 0, 0, 1, NULL, NULL, 0, 8, 'sweets'),
(8, 'Car accessories', '', 0, 0, 1, NULL, NULL, 0, 9, 'car-accessories'),
(9, 'Car parts', '', 8, 0, 1, NULL, NULL, 0, 9, 'car-parts'),
(10, 'Car audio', '', 8, 0, 1, NULL, NULL, 0, 9, 'car-audio'),
(11, 'Chocolates', '2023-05-15-646178f1288a0.png', 7, 0, 1, NULL, '2023-05-15 00:12:33', 0, 8, 'chocolates'),
(12, 'Candies', '2023-05-15-6461784ae084e.png', 7, 0, 1, NULL, '2023-05-15 00:09:46', 0, 8, 'candies'),
(13, 'Dresses', '2023-05-19-6466cb95732c1.png', 5, 0, 1, NULL, '2023-05-19 01:06:29', 0, 6, 'dresses'),
(14, 'Tops', '2023-05-19-6466cca1cdfb2.png', 5, 0, 1, NULL, '2023-05-19 01:10:57', 0, 6, 'tops'),
(15, 'Pants', '2023-05-19-6466cd6c1a197.png', 5, 0, 1, NULL, '2023-05-19 01:14:20', 0, 6, 'pants'),
(16, 'Shoes', '', 5, 0, 1, NULL, NULL, 0, 6, 'shoes'),
(17, 'Laptops', '', 6, 0, 1, NULL, NULL, 0, 7, 'laptops'),
(18, 'Smartwatches', '', 6, 0, 1, NULL, NULL, 0, 7, 'smartwatches'),
(19, 'Tablets', '', 6, 0, 1, NULL, NULL, 0, 7, 'tablets'),
(20, 'Mobile phones', '', 6, 0, 1, NULL, NULL, 0, 7, 'mobile-phones'),
(21, 'Fruits', '', 1, 0, 1, NULL, NULL, 0, 1, 'fruits'),
(22, 'Vegetables', '', 1, 0, 1, NULL, NULL, 0, 1, 'vegetables'),
(23, 'Meat', '', 1, 0, 1, NULL, NULL, 0, 1, 'meat'),
(24, 'Fish', '', 1, 0, 1, NULL, NULL, 0, 1, 'fish'),
(25, 'Medicines', '2023-05-15-64626d2517e8f.png', 2, 0, 1, NULL, '2023-05-15 17:34:29', 0, 2, 'medicines'),
(26, 'Vitamins', '2023-05-15-646272b8e647d.png', 2, 0, 1, NULL, '2023-05-15 17:58:16', 0, 2, 'vitamins'),
(27, 'Supplements', '2023-05-15-646275094b3bc.png', 2, 0, 1, NULL, '2023-05-15 18:08:09', 0, 2, 'supplements'),
(28, 'Fast food', '', 4, 0, 1, NULL, NULL, 0, 4, 'fast-food'),
(29, 'Fine dining', '', 4, 0, 1, NULL, NULL, 0, 4, 'fine-dining'),
(30, 'Bakery', '', 1, 0, 1, NULL, NULL, 0, 1, 'bakery'),
(31, 'Dairy', '', 1, 0, 1, NULL, NULL, 0, 1, 'dairy'),
(32, 'Frozen foods', '', 1, 0, 1, NULL, NULL, 0, 1, 'frozen-foods'),
(33, 'Canned goods', '', 1, 0, 1, NULL, NULL, 0, 1, 'canned-goods'),
(34, 'Personal care', '2023-05-15-64627611a573a.png', 2, 0, 1, NULL, '2023-05-15 18:12:33', 0, 2, 'personal-care'),
(35, 'Baby care', '2023-05-15-64627757722e4.png', 2, 0, 1, NULL, '2023-05-15 18:17:59', 0, 2, 'baby-care'),
(36, 'First aid', '2023-05-15-646276b9b5f64.png', 2, 0, 1, NULL, '2023-05-15 18:15:21', 0, 2, 'first-aid'),
(37, 'Makeup', '2023-05-15-646279a478d1f.png', 2, 0, 1, NULL, '2023-05-15 18:27:48', 0, 2, 'makeup'),
(38, 'Skin care', '2023-05-15-64627a291cf30.png', 2, 0, 1, NULL, '2023-05-15 18:30:01', 0, 2, 'skin-care'),
(39, 'Hair care', '2023-05-15-64627ab5a5c21.png', 2, 0, 1, NULL, '2023-05-15 18:32:21', 0, 2, 'hair-care'),
(40, 'Books', '2023-05-15-646232c3a7ab1.png', 3, 0, 1, NULL, '2023-05-15 13:25:23', 0, 3, 'books'),
(41, 'Electronics', '2023-05-15-64622efb9d0a6.png', 3, 0, 1, NULL, '2023-05-15 13:09:15', 0, 3, 'electronics'),
(42, 'Home appliances', '2023-05-15-64622fa59f72c.png', 3, 0, 1, NULL, '2023-05-15 13:12:05', 0, 3, 'home-appliances'),
(43, 'Furniture', '2023-05-15-646233512af6f.png', 3, 0, 1, NULL, '2023-05-15 13:27:45', 0, 3, 'furniture'),
(44, 'Toys', '2023-05-15-646233db91bab.png', 3, 0, 1, NULL, '2023-05-15 13:30:03', 0, 3, 'toys'),
(45, 'Sporting goods', '', 3, 0, 1, NULL, NULL, 0, 3, 'sporting-goods'),
(46, 'Pet supplies', '2023-05-15-64623645bd081.png', 3, 0, 1, NULL, '2023-05-15 13:40:21', 0, 3, 'pet-supplies'),
(47, 'Office supplies', '2023-05-15-6462354fc78f2.png', 3, 0, 1, NULL, '2023-05-15 13:36:15', 0, 3, 'office-supplies'),
(48, 'Jewelry', '', 5, 0, 1, NULL, NULL, 0, 6, 'jewelry'),
(49, 'Handbags', '', 5, 0, 1, NULL, NULL, 0, 6, 'handbags'),
(50, 'Accessories', '', 5, 0, 1, NULL, NULL, 0, 6, 'accessories'),
(51, 'T-shirts', '', 5, 0, 1, NULL, NULL, 0, 6, 't-shirts'),
(52, 'Jeans', '', 5, 0, 1, NULL, NULL, 0, 6, 'jeans'),
(53, 'Skirts', '', 5, 0, 1, NULL, NULL, 0, 6, 'skirts'),
(54, 'Sandals', '', 5, 0, 1, NULL, NULL, 0, 6, 'sandals'),
(55, 'Boots', '', 5, 0, 1, NULL, NULL, 0, 6, 'boots'),
(56, 'Sneakers', '', 5, 0, 1, NULL, NULL, 0, 6, 'sneakers'),
(57, 'Watches', '', 6, 0, 1, NULL, NULL, 0, 7, 'watches'),
(58, 'Headphones', '', 6, 0, 1, NULL, NULL, 0, 7, 'headphones'),
(59, 'Cameras', '', 6, 0, 1, NULL, NULL, 0, 7, 'cameras'),
(60, 'Gaming', '', 6, 0, 1, NULL, NULL, 0, 7, 'gaming'),
(61, 'Smart home', '', 6, 0, 1, NULL, NULL, 0, 7, 'smart-home'),
(67, 'Cakes', '2023-05-15-646178d6491fc.png', 7, 0, 1, NULL, '2023-05-15 00:12:06', 0, 8, 'cakes'),
(68, 'Cookies', '2023-05-15-64617974a76e9.png', 7, 0, 1, NULL, '2023-05-15 00:14:44', 0, 8, 'cookies'),
(69, 'Ice cream', '2023-05-15-646179b66728e.png', 7, 0, 1, NULL, '2023-05-15 00:23:57', 0, 8, 'ice-cream'),
(70, 'Cupcakes', '', 7, 0, 1, NULL, NULL, 0, 8, 'cupcakes'),
(71, 'Pies', '', 7, 0, 1, NULL, NULL, 0, 8, 'pies'),
(72, 'Burgers', '', 8, 0, 1, NULL, NULL, 0, 4, 'burgers'),
(73, 'Pizza', '', 8, 0, 1, NULL, NULL, 0, 4, 'pizza'),
(74, 'Sandwiches', '', 8, 0, 1, NULL, NULL, 0, 4, 'sandwiches'),
(75, 'Salads', '', 8, 0, 1, NULL, NULL, 0, 4, 'salads'),
(76, 'Seafood', '', 8, 0, 1, NULL, NULL, 0, 4, 'seafood'),
(77, 'Steak', '', 8, 0, 1, NULL, NULL, 0, 4, 'steak'),
(78, 'Asian cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'asian-cuisine'),
(79, 'Mexican cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'mexican-cuisine'),
(80, 'Italian cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'italian-cuisine'),
(81, 'Indian cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'indian-cuisine'),
(82, 'Greek cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'greek-cuisine'),
(83, 'Middle Eastern cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'middle-eastern-cuisine'),
(84, 'American cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'american-cuisine'),
(85, 'French cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'french-cuisine'),
(86, 'Spanish cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'spanish-cuisine'),
(87, 'German cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'german-cuisine'),
(88, 'Chinese cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'chinese-cuisine'),
(89, 'Japanese cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'japanese-cuisine'),
(90, 'Korean cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'korean-cuisine'),
(91, 'Thai cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'thai-cuisine'),
(92, 'Vietnamese cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'vietnamese-cuisine'),
(93, 'Russian cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'russian-cuisine'),
(94, 'African cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'african-cuisine'),
(95, 'Australian cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'australian-cuisine'),
(96, 'South American cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'south-american-cuisine'),
(97, 'Caribbean cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'caribbean-cuisine'),
(98, 'Mediterranean cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'mediterranean-cuisine'),
(99, 'Vegetarian cuisine', '', 8, 0, 1, NULL, NULL, 0, 4, 'vegetarian-cuisine'),
(100, 'Beverages', '', 1, 0, 1, NULL, NULL, 0, 1, 'beverages'),
(101, 'Snacks', '', 1, 0, 1, NULL, NULL, 0, 1, 'snacks'),
(102, 'Bread', '', 1, 0, 1, NULL, NULL, 0, 1, 'bread'),
(103, 'Cheese', '', 1, 0, 1, NULL, NULL, 0, 1, 'cheese'),
(104, 'Yogurt', '', 1, 0, 1, NULL, NULL, 0, 1, 'yogurt'),
(105, 'Ice cream', '', 1, 0, 1, NULL, NULL, 0, 1, 'ice-cream'),
(106, 'Soup', '', 1, 0, 1, NULL, NULL, 0, 1, 'soup'),
(107, 'Pasta', '', 1, 0, 1, NULL, NULL, 0, 1, 'pasta'),
(108, 'Rice', '', 1, 0, 1, NULL, NULL, 0, 1, 'rice'),
(109, 'Cereal', '', 1, 0, 1, NULL, NULL, 0, 1, 'cereal'),
(110, 'Tea', '', 1, 0, 1, NULL, NULL, 0, 1, 'tea'),
(111, 'Coffee', '', 1, 0, 1, NULL, NULL, 0, 1, 'coffee'),
(112, 'Juice', '', 1, 0, 1, NULL, NULL, 0, 1, 'juice'),
(113, 'Soda', '', 1, 0, 1, NULL, NULL, 0, 1, 'soda'),
(114, 'Water', '', 1, 0, 1, NULL, NULL, 0, 1, 'water'),
(115, 'Chips', '', 2, 0, 1, NULL, NULL, 0, 8, 'chips'),
(116, 'Popcorn', '', 2, 0, 1, NULL, NULL, 0, 8, 'popcorn'),
(117, 'Nuts', '', 2, 0, 1, NULL, NULL, 0, 8, 'nuts'),
(118, 'Trail mix', '', 2, 0, 1, NULL, NULL, 0, 8, 'trail-mix'),
(119, 'Crackers', '', 2, 0, 1, NULL, NULL, 0, 8, 'crackers'),
(120, 'Cookies', '', 2, 0, 1, NULL, NULL, 0, 8, 'cookies'),
(121, 'Candy', '', 2, 0, 1, NULL, NULL, 0, 8, 'candy'),
(122, 'Chocolate', '', 2, 0, 1, NULL, NULL, 0, 8, 'chocolate'),
(123, 'Biscuits', '', 2, 0, 1, NULL, NULL, 0, 8, 'biscuits'),
(124, 'Bagels', '', 2, 0, 1, NULL, NULL, 0, 8, 'bagels'),
(125, 'Croissants', '', 2, 0, 1, NULL, NULL, 0, 8, 'croissants'),
(126, 'Donuts', '', 2, 0, 1, NULL, NULL, 0, 8, 'donuts'),
(127, 'Muffins', '', 2, 0, 1, NULL, NULL, 0, 8, 'muffins'),
(128, 'Sourdough', '', 2, 0, 1, NULL, NULL, 0, 8, 'sourdough'),
(129, 'Whole wheat', '', 2, 0, 1, NULL, NULL, 0, 8, 'whole-wheat'),
(130, 'Sliced', '', 2, 0, 1, NULL, NULL, 0, 8, 'sliced'),
(131, 'Shredded', '', 2, 0, 1, NULL, NULL, 0, 8, 'shredded'),
(132, 'Block', '', 2, 0, 1, NULL, NULL, 0, 8, 'block'),
(133, 'Spreadable', '', 2, 0, 1, NULL, NULL, 0, 8, 'spreadable'),
(134, 'Greek', '', 2, 0, 1, NULL, NULL, 0, 8, 'greek'),
(135, 'Low-fat', '', 2, 0, 1, NULL, NULL, 0, 8, 'low-fat'),
(136, 'Non-fat', '', 2, 0, 1, NULL, NULL, 0, 8, 'non-fat'),
(137, 'Low-sugar', '', 2, 0, 1, NULL, NULL, 0, 8, 'low-sugar'),
(138, 'Low-calorie', '', 2, 0, 1, NULL, NULL, 0, 8, 'low-calorie'),
(139, 'Vanilla', '', 2, 0, 1, NULL, NULL, 0, 8, 'vanilla'),
(140, 'Strawberry', '', 2, 0, 1, NULL, NULL, 0, 8, 'strawberry'),
(141, 'Blueberry', '', 2, 0, 1, NULL, NULL, 0, 8, 'blueberry'),
(142, 'Raspberry', '', 2, 0, 1, NULL, NULL, 0, 8, 'raspberry'),
(143, 'Mixed berry', '', 2, 0, 1, NULL, NULL, 0, 8, 'mixed-berry'),
(144, 'Chocolate chip', '', 2, 0, 1, NULL, NULL, 0, 8, 'chocolate-chip'),
(145, 'Mint chocolate chip', '', 2, 0, 1, NULL, NULL, 0, 8, 'mint-chocolate-chip'),
(146, 'Rocky road', '', 2, 0, 1, NULL, NULL, 0, 8, 'rocky-road'),
(147, 'Butter pecan', '', 2, 0, 1, NULL, NULL, 0, 8, 'butter-pecan'),
(148, 'Strawberry cheesecake', '', 2, 0, 1, NULL, NULL, 0, 8, 'strawberry-cheesecake'),
(149, 'Tomato', '', 1, 0, 1, NULL, NULL, 0, 1, 'tomato'),
(150, 'Potato', '', 1, 0, 1, NULL, NULL, 0, 1, 'potato'),
(151, 'Onion', '', 1, 0, 1, NULL, NULL, 0, 1, 'onion'),
(152, 'Garlic', '', 1, 0, 1, NULL, NULL, 0, 1, 'garlic'),
(153, 'Carrot', '', 1, 0, 1, NULL, NULL, 0, 1, 'carrot'),
(154, 'Broccoli', '', 1, 0, 1, NULL, NULL, 0, 1, 'broccoli'),
(155, 'Cauliflower', '', 1, 0, 1, NULL, NULL, 0, 1, 'cauliflower'),
(156, 'Cucumber', '', 1, 0, 1, NULL, NULL, 0, 1, 'cucumber'),
(157, 'Lettuce', '', 1, 0, 1, NULL, NULL, 0, 1, 'lettuce'),
(158, 'Spinach', '', 1, 0, 1, NULL, NULL, 0, 1, 'spinach'),
(159, 'Kale', '', 1, 0, 1, NULL, NULL, 0, 1, 'kale'),
(160, 'Arugula', '', 1, 0, 1, NULL, NULL, 0, 1, 'arugula'),
(161, 'Bell pepper', '', 1, 0, 1, NULL, NULL, 0, 1, 'bell-pepper'),
(162, 'Zucchini', '', 1, 0, 1, NULL, NULL, 0, 1, 'zucchini'),
(163, 'Eggplant', '', 1, 0, 1, NULL, NULL, 0, 1, 'eggplant'),
(164, 'Mushroom', '', 1, 0, 1, NULL, NULL, 0, 1, 'mushroom'),
(165, 'Asparagus', '', 1, 0, 1, NULL, NULL, 0, 1, 'asparagus'),
(166, 'Green beans', '', 1, 0, 1, NULL, NULL, 0, 1, 'green-beans'),
(167, 'Peas', '', 1, 0, 1, NULL, NULL, 0, 1, 'peas'),
(168, 'Corn', '', 1, 0, 1, NULL, NULL, 0, 1, 'corn'),
(169, 'Apples', '', 1, 0, 1, NULL, NULL, 0, 1, 'apples'),
(170, 'Bananas', '', 1, 0, 1, NULL, NULL, 0, 1, 'bananas'),
(171, 'Oranges', '', 1, 0, 1, NULL, NULL, 0, 1, 'oranges'),
(172, 'Grapes', '', 1, 0, 1, NULL, NULL, 0, 1, 'grapes'),
(173, 'Pineapple', '', 1, 0, 1, NULL, NULL, 0, 1, 'pineapple'),
(174, 'Mango', '', 1, 0, 1, NULL, NULL, 0, 1, 'mango'),
(175, 'Peaches', '', 1, 0, 1, NULL, NULL, 0, 1, 'peaches'),
(176, 'Plums', '', 1, 0, 1, NULL, NULL, 0, 1, 'plums'),
(177, 'Pears', '', 1, 0, 1, NULL, NULL, 0, 1, 'pears'),
(178, 'Watermelon', '', 1, 0, 1, NULL, NULL, 0, 1, 'watermelon'),
(179, 'Honeydew', '', 1, 0, 1, NULL, NULL, 0, 1, 'honeydew'),
(180, 'Cantaloupe', '', 1, 0, 1, NULL, NULL, 0, 1, 'cantaloupe'),
(181, 'Strawberries', '', 1, 0, 1, NULL, NULL, 0, 1, 'strawberries'),
(182, 'Raspberries', '', 1, 0, 1, NULL, NULL, 0, 1, 'raspberries'),
(183, 'Blueberries', '', 1, 0, 1, NULL, NULL, 0, 1, 'blueberries'),
(184, 'Blackberries', '', 1, 0, 1, NULL, NULL, 0, 1, 'blackberries'),
(185, 'Raisins', '', 1, 0, 1, NULL, NULL, 0, 1, 'raisins'),
(186, 'Dates', '', 1, 0, 1, NULL, NULL, 0, 1, 'dates'),
(187, 'Figs', '', 1, 0, 1, NULL, NULL, 0, 1, 'figs'),
(188, 'Apricots', '', 1, 0, 1, NULL, NULL, 0, 1, 'apricots'),
(189, 'Prunes', '', 1, 0, 1, NULL, NULL, 0, 1, 'prunes'),
(190, 'Beef', '', 1, 0, 1, NULL, NULL, 0, 1, 'beef'),
(191, 'Pork', '', 1, 0, 1, NULL, NULL, 0, 1, 'pork'),
(192, 'Chicken', '', 1, 0, 1, NULL, NULL, 0, 1, 'chicken'),
(193, 'Turkey', '', 1, 0, 1, NULL, NULL, 0, 1, 'turkey'),
(194, 'Lamb', '', 1, 0, 1, NULL, NULL, 0, 1, 'lamb'),
(195, 'Salmon', '', 1, 0, 1, NULL, NULL, 0, 1, 'salmon'),
(196, 'Tuna', '', 1, 0, 1, NULL, NULL, 0, 1, 'tuna'),
(197, 'Cod', '', 1, 0, 1, NULL, NULL, 0, 1, 'cod'),
(198, 'Shrimp', '', 1, 0, 1, NULL, NULL, 0, 1, 'shrimp'),
(199, 'Crab', '', 1, 0, 1, NULL, NULL, 0, 1, 'crab'),
(200, 'Lobster', '', 1, 0, 1, NULL, NULL, 0, 1, 'lobster'),
(201, 'Scallops', '', 1, 0, 1, NULL, NULL, 0, 1, 'scallops'),
(202, 'Clams', '', 1, 0, 1, NULL, NULL, 0, 1, 'clams'),
(203, 'Mussels', '', 1, 0, 1, NULL, NULL, 0, 1, 'mussels'),
(204, 'Oysters', '', 1, 0, 1, NULL, NULL, 0, 1, 'oysters'),
(205, 'Sausage', '', 1, 0, 1, NULL, NULL, 0, 1, 'sausage'),
(206, 'Bacon', '', 1, 0, 1, NULL, NULL, 0, 1, 'bacon'),
(207, 'Ham', '', 1, 0, 1, NULL, NULL, 0, 1, 'ham'),
(208, 'Hot dogs', '', 1, 0, 1, NULL, NULL, 0, 1, 'hot-dogs'),
(209, 'Ground beef', '', 1, 0, 1, NULL, NULL, 0, 1, 'ground-beef'),
(210, 'Ground turkey', '', 1, 0, 1, NULL, NULL, 0, 1, 'ground-turkey'),
(211, 'Ground pork', '', 1, 0, 1, NULL, NULL, 0, 1, 'ground-pork'),
(212, 'Ground chicken', '', 1, 0, 1, NULL, NULL, 0, 1, 'ground-chicken'),
(213, 'Tofu', '', 1, 0, 1, NULL, NULL, 0, 1, 'tofu'),
(214, 'Tempeh', '', 1, 0, 1, NULL, NULL, 0, 1, 'tempeh'),
(215, 'Seitan', '', 1, 0, 1, NULL, NULL, 0, 1, 'seitan'),
(216, 'Quinoa', '', 1, 0, 1, NULL, NULL, 0, 1, 'quinoa'),
(217, 'Brown rice', '', 1, 0, 1, NULL, NULL, 0, 1, 'brown-rice'),
(218, 'White rice', '', 1, 0, 1, NULL, NULL, 0, 1, 'white-rice'),
(219, 'Couscous', '', 1, 0, 1, NULL, NULL, 0, 1, 'couscous'),
(220, 'Barley', '', 1, 0, 1, NULL, NULL, 0, 1, 'barley'),
(221, 'Bulgur', '', 1, 0, 1, NULL, NULL, 0, 1, 'bulgur'),
(222, 'Oats', '', 1, 0, 1, NULL, NULL, 0, 1, 'oats'),
(223, 'Cornmeal', '', 1, 0, 1, NULL, NULL, 0, 1, 'cornmeal'),
(224, 'Buckwheat', '', 1, 0, 1, NULL, NULL, 0, 1, 'buckwheat'),
(225, 'Millet', '', 1, 0, 1, NULL, NULL, 0, 1, 'millet'),
(226, 'Wheat berries', '', 1, 0, 1, NULL, NULL, 0, 1, 'wheat-berries'),
(227, 'Spelt', '', 1, 0, 1, NULL, NULL, 0, 1, 'spelt'),
(228, 'Kamut', '', 1, 0, 1, NULL, NULL, 0, 1, 'kamut'),
(229, 'Rye', '', 1, 0, 1, NULL, NULL, 0, 1, 'rye'),
(230, 'Soy milk', '', 1, 0, 1, NULL, NULL, 0, 1, 'soy-milk'),
(231, 'Almond milk', '', 1, 0, 1, NULL, NULL, 0, 1, 'almond-milk'),
(232, 'Coconut milk', '', 1, 0, 1, NULL, NULL, 0, 1, 'coconut-milk'),
(233, 'Cashew milk', '', 1, 0, 1, NULL, NULL, 0, 1, 'cashew-milk'),
(234, 'Oat milk', '', 1, 0, 1, NULL, NULL, 0, 1, 'oat-milk'),
(235, 'Hemp milk', '', 1, 0, 1, NULL, NULL, 0, 1, 'hemp-milk'),
(236, 'Rice milk', '', 1, 0, 1, NULL, NULL, 0, 1, 'rice-milk'),
(237, 'Soy sauce', '', 1, 0, 1, NULL, NULL, 0, 1, 'soy-sauce'),
(238, 'Teriyaki sauce', '', 1, 0, 1, NULL, NULL, 0, 1, 'teriyaki-sauce'),
(239, 'Hoisin sauce', '', 1, 0, 1, NULL, NULL, 0, 1, 'hoisin-sauce'),
(240, 'Fish sauce', '', 1, 0, 1, NULL, NULL, 0, 1, 'fish-sauce'),
(241, 'Oyster sauce', '', 1, 0, 1, NULL, NULL, 0, 1, 'oyster-sauce'),
(242, 'Sriracha', '', 1, 0, 1, NULL, NULL, 0, 1, 'sriracha'),
(243, 'Tabasco', '', 1, 0, 1, NULL, NULL, 0, 1, 'tabasco'),
(244, 'Mayonnaise', '', 1, 0, 1, NULL, NULL, 0, 1, 'mayonnaise'),
(245, 'Ketchup', '', 1, 0, 1, NULL, NULL, 0, 1, 'ketchup'),
(246, 'Mustard', '', 1, 0, 1, NULL, NULL, 0, 1, 'mustard'),
(247, 'Relish', '', 1, 0, 1, NULL, NULL, 0, 1, 'relish'),
(248, 'Salsa', '', 1, 0, 1, NULL, NULL, 0, 1, 'salsa'),
(249, 'Guacamole', '', 1, 0, 1, NULL, NULL, 0, 1, 'guacamole'),
(250, 'Hummus', '', 1, 0, 1, NULL, NULL, 0, 1, 'hummus'),
(251, 'Pesto', '', 1, 0, 1, NULL, NULL, 0, 1, 'pesto'),
(252, 'Tzatziki', '', 1, 0, 1, NULL, NULL, 0, 1, 'tzatziki'),
(253, 'Taramasalata', '', 1, 0, 1, NULL, NULL, 0, 1, 'taramasalata'),
(254, 'Baba ghanoush', '', 1, 0, 1, NULL, NULL, 0, 1, 'baba-ghanoush'),
(255, 'Tahini', '', 1, 0, 1, NULL, NULL, 0, 1, 'tahini'),
(256, 'Peanut butter', '', 1, 0, 1, NULL, NULL, 0, 1, 'peanut-butter'),
(257, 'Almond butter', '', 1, 0, 1, NULL, NULL, 0, 1, 'almond-butter'),
(258, 'Cashew butter', '', 1, 0, 1, NULL, NULL, 0, 1, 'cashew-butter'),
(259, 'Hazelnut butter', '', 1, 0, 1, NULL, NULL, 0, 1, 'hazelnut-butter'),
(260, 'Sunflower seed butter', '', 1, 0, 1, NULL, NULL, 0, 1, 'sunflower-seed-butter'),
(261, 'Jam', '', 1, 0, 1, NULL, NULL, 0, 1, 'jam'),
(262, 'Jelly', '', 1, 0, 1, NULL, NULL, 0, 1, 'jelly'),
(263, 'Marmalade', '', 1, 0, 1, NULL, NULL, 0, 1, 'marmalade'),
(264, 'Honey', '', 1, 0, 1, NULL, NULL, 0, 1, 'honey'),
(265, 'Maple syrup', '', 1, 0, 1, NULL, NULL, 0, 1, 'maple-syrup'),
(266, 'Agave nectar', '', 1, 0, 1, NULL, NULL, 0, 1, 'agave-nectar'),
(267, 'Molasses', '', 1, 0, 1, NULL, NULL, 0, 1, 'molasses'),
(268, 'Sugar', '', 1, 0, 1, NULL, NULL, 0, 1, 'sugar'),
(269, 'Brown sugar', '', 1, 0, 1, NULL, NULL, 0, 1, 'brown-sugar'),
(270, 'Powdered sugar', '', 1, 0, 1, NULL, NULL, 0, 1, 'powdered-sugar'),
(271, 'Flour', '', 1, 0, 1, NULL, NULL, 0, 1, 'flour'),
(272, 'Baking powder', '', 1, 0, 1, NULL, NULL, 0, 1, 'baking-powder'),
(273, 'Baking soda', '', 1, 0, 1, NULL, NULL, 0, 1, 'baking-soda'),
(274, 'Cornstarch', '', 1, 0, 1, NULL, NULL, 0, 1, 'cornstarch'),
(275, 'Yeast', '', 1, 0, 1, NULL, NULL, 0, 1, 'yeast'),
(276, 'Vanilla extract', '', 1, 0, 1, NULL, NULL, 0, 1, 'vanilla-extract'),
(277, 'Cinnamon', '', 1, 0, 1, NULL, NULL, 0, 1, 'cinnamon'),
(278, 'Nutmeg', '', 1, 0, 1, NULL, NULL, 0, 1, 'nutmeg'),
(279, 'Ginger', '', 1, 0, 1, NULL, NULL, 0, 1, 'ginger'),
(280, 'Cloves', '', 1, 0, 1, NULL, NULL, 0, 1, 'cloves'),
(281, 'Allspice', '', 1, 0, 1, NULL, NULL, 0, 1, 'allspice'),
(282, 'Cardamom', '', 1, 0, 1, NULL, NULL, 0, 1, 'cardamom'),
(283, 'Bay leaves', '', 1, 0, 1, NULL, NULL, 0, 1, 'bay-leaves'),
(284, 'Thyme', '', 1, 0, 1, NULL, NULL, 0, 1, 'thyme'),
(285, 'Rosemary', '', 1, 0, 1, NULL, NULL, 0, 1, 'rosemary'),
(286, 'Sage', '', 1, 0, 1, NULL, NULL, 0, 1, 'sage'),
(287, 'Oregano', '', 1, 0, 1, NULL, NULL, 0, 1, 'oregano'),
(288, 'Basil', '', 1, 0, 1, NULL, NULL, 0, 1, 'basil'),
(289, 'Parsley', '', 1, 0, 1, NULL, NULL, 0, 1, 'parsley'),
(290, 'Cilantro', '', 1, 0, 1, NULL, NULL, 0, 1, 'cilantro'),
(291, 'Bakery', '', 1, 5, 1, NULL, NULL, 0, 1, 'bakery'),
(292, 'Dairy', '', 1, 6, 1, NULL, NULL, 0, 1, 'dairy'),
(293, 'Frozen foods', '', 1, 7, 1, NULL, NULL, 0, 1, 'frozen-foods'),
(294, 'Canned goods', '', 1, 8, 1, NULL, NULL, 0, 1, 'canned-goods'),
(295, 'Personal care', '', 2, 4, 1, NULL, NULL, 0, 2, 'personal-care'),
(296, 'Baby care', '', 2, 5, 1, NULL, NULL, 0, 2, 'baby-care'),
(297, 'First aid', '', 2, 6, 1, NULL, NULL, 0, 2, 'first-aid'),
(298, 'Makeup', '', 2, 7, 1, NULL, NULL, 0, 2, 'makeup'),
(299, 'Skin care', '', 2, 8, 1, NULL, NULL, 0, 2, 'skin-care'),
(300, 'Hair care', '', 2, 9, 1, NULL, NULL, 0, 2, 'hair-care'),
(301, 'Books', '', 3, 1, 1, NULL, NULL, 0, 3, 'books'),
(302, 'Electronics', '', 3, 2, 1, NULL, NULL, 0, 3, 'electronics'),
(303, 'Home appliances', '', 3, 3, 1, NULL, NULL, 0, 3, 'home-appliances'),
(304, 'Furniture', '', 3, 4, 1, NULL, NULL, 0, 3, 'furniture'),
(305, 'Toys', '', 3, 5, 1, NULL, NULL, 0, 3, 'toys'),
(306, 'Sporting goods', '', 3, 6, 1, NULL, NULL, 0, 3, 'sporting-goods'),
(307, 'Pet supplies', '', 3, 7, 1, NULL, NULL, 0, 3, 'pet-supplies'),
(308, 'Office supplies', '', 3, 8, 1, NULL, NULL, 0, 3, 'office-supplies'),
(309, 'Jewelry', '', 5, 5, 1, NULL, NULL, 0, 6, 'jewelry'),
(310, 'Handbags', '', 5, 6, 1, NULL, NULL, 0, 6, 'handbags'),
(311, 'Accessories', '', 5, 7, 1, NULL, NULL, 0, 6, 'accessories'),
(312, 'T-shirts', '', 5, 8, 1, NULL, NULL, 0, 6, 't-shirts'),
(313, 'Jeans', '', 5, 9, 1, NULL, NULL, 0, 6, 'jeans'),
(314, 'Skirts', '', 5, 10, 1, NULL, NULL, 0, 6, 'skirts'),
(315, 'Sandals', '', 5, 11, 1, NULL, NULL, 0, 6, 'sandals'),
(316, 'Boots', '', 5, 12, 1, NULL, NULL, 0, 6, 'boots'),
(317, 'Sneakers', '', 5, 13, 1, NULL, NULL, 0, 6, 'sneakers'),
(318, 'Watches', '', 6, 5, 1, NULL, NULL, 0, 7, 'watches'),
(319, 'Headphones', '', 6, 6, 1, NULL, NULL, 0, 7, 'headphones'),
(320, 'Cameras', '', 6, 7, 1, NULL, NULL, 0, 7, 'cameras'),
(321, 'Gaming', '', 6, 8, 1, NULL, NULL, 0, 7, 'gaming'),
(322, 'Smart home', '', 6, 9, 1, NULL, NULL, 0, 7, 'smart-home'),
(323, 'Kitchen appliances', '', 6, 10, 1, NULL, NULL, 0, 7, 'kitchen-appliances'),
(324, 'Bedroom furniture', '', 6, 11, 1, NULL, NULL, 0, 7, 'bedroom-furniture'),
(325, 'Living room furniture', '', 6, 12, 1, NULL, NULL, 0, 7, 'living-room-furniture'),
(326, 'Outdoor furniture', '', 6, 13, 1, NULL, NULL, 0, 7, 'outdoor-furniture'),
(327, 'Board games', '', 7, 3, 1, NULL, NULL, 0, 8, 'board-games'),
(328, 'Cakes', '', 7, 4, 1, NULL, NULL, 0, 8, 'cakes'),
(329, 'Cookies', '', 7, 5, 1, NULL, NULL, 0, 8, 'cookies'),
(330, 'Ice cream', '', 7, 6, 1, NULL, NULL, 0, 8, 'ice-cream'),
(331, 'Cupcakes', '', 7, 7, 1, NULL, NULL, 0, 8, 'cupcakes'),
(332, 'Pies', '', 7, 8, 1, NULL, NULL, 0, 8, 'pies'),
(333, 'Burgers', '', 8, 3, 1, NULL, NULL, 0, 4, 'burgers'),
(334, 'Pizza', '', 8, 4, 1, NULL, NULL, 0, 4, 'pizza'),
(335, 'Sandwiches', '', 8, 5, 1, NULL, NULL, 0, 4, 'sandwiches'),
(336, 'Salads', '', 8, 6, 1, NULL, NULL, 0, 4, 'salads'),
(337, 'Seafood', '', 8, 7, 1, NULL, NULL, 0, 4, 'seafood'),
(338, 'Steak', '', 8, 8, 1, NULL, NULL, 0, 4, 'steak'),
(339, 'Asian cuisine', '', 8, 9, 1, NULL, NULL, 0, 4, 'asian-cuisine'),
(340, 'Mexican cuisine', '', 8, 10, 1, NULL, NULL, 0, 4, 'mexican-cuisine'),
(341, 'Italian cuisine', '', 8, 11, 1, NULL, NULL, 0, 4, 'italian-cuisine'),
(342, 'Indian cuisine', '', 8, 12, 1, NULL, NULL, 0, 4, 'indian-cuisine'),
(343, 'Greek cuisine', '', 8, 13, 1, NULL, NULL, 0, 4, 'greek-cuisine'),
(344, 'Middle Eastern cuisine', '', 8, 14, 1, NULL, NULL, 0, 4, 'middle-eastern-cuisine'),
(345, 'American cuisine', '', 8, 15, 1, NULL, NULL, 0, 4, 'american-cuisine'),
(346, 'French cuisine', '', 8, 16, 1, NULL, NULL, 0, 4, 'french-cuisine'),
(347, 'Spanish cuisine', '', 8, 17, 1, NULL, NULL, 0, 4, 'spanish-cuisine'),
(348, 'German cuisine', '', 8, 18, 1, NULL, NULL, 0, 4, 'german-cuisine'),
(349, 'Chinese cuisine', '', 8, 19, 1, NULL, NULL, 0, 4, 'chinese-cuisine'),
(350, 'Japanese cuisine', '', 8, 20, 1, NULL, NULL, 0, 4, 'japanese-cuisine'),
(351, 'Korean cuisine', '', 8, 21, 1, NULL, NULL, 0, 4, 'korean-cuisine'),
(352, 'Thai cuisine', '', 8, 22, 1, NULL, NULL, 0, 4, 'thai-cuisine'),
(353, 'Vietnamese cuisine', '', 8, 23, 1, NULL, NULL, 0, 4, 'vietnamese-cuisine'),
(354, 'Russian cuisine', '', 8, 24, 1, NULL, NULL, 0, 4, 'russian-cuisine'),
(355, 'African cuisine', '', 8, 25, 1, NULL, NULL, 0, 4, 'african-cuisine'),
(356, 'Australian cuisine', '', 8, 26, 1, NULL, NULL, 0, 4, 'australian-cuisine'),
(357, 'South American cuisine', '', 8, 27, 1, NULL, NULL, 0, 4, 'south-american-cuisine'),
(358, 'Caribbean cuisine', '', 8, 28, 1, NULL, NULL, 0, 4, 'caribbean-cuisine'),
(359, 'Mediterranean cuisine', '', 8, 29, 1, NULL, NULL, 0, 4, 'mediterranean-cuisine'),
(360, 'Vegetarian cuisine', '', 8, 30, 1, NULL, NULL, 0, 4, 'vegetarian-cuisine'),
(361, 'Art supplies', '', 3, 9, 1, NULL, NULL, 0, 3, 'art-supplies'),
(362, 'Bathroom accessories', '', 3, 10, 1, NULL, NULL, 0, 3, 'bathroom-accessories'),
(363, 'Bedding', '', 3, 11, 1, NULL, NULL, 0, 3, 'bedding'),
(364, 'Cleaning supplies', '', 3, 12, 1, NULL, NULL, 0, 3, 'cleaning-supplies'),
(365, 'Decor', '', 3, 13, 1, NULL, NULL, 0, 3, 'decor'),
(366, 'Lighting', '', 3, 14, 1, NULL, NULL, 0, 3, 'lighting'),
(367, 'Rugs', '', 3, 15, 1, NULL, NULL, 0, 3, 'rugs'),
(368, 'Storage', '', 3, 16, 1, NULL, NULL, 0, 3, 'storage'),
(369, 'Tools', '', 3, 17, 1, NULL, NULL, 0, 3, 'tools'),
(370, 'Wine', '', 1, 9, 1, NULL, NULL, 0, 1, 'wine'),
(371, 'Beer', '', 1, 10, 1, NULL, NULL, 0, 1, 'beer'),
(372, 'Spirits', '', 1, 11, 1, NULL, NULL, 0, 1, 'spirits'),
(373, 'Tea', '', 1, 12, 1, NULL, NULL, 0, 1, 'tea'),
(374, 'Coffee', '', 1, 13, 1, NULL, NULL, 0, 1, 'coffee'),
(375, 'Juice', '', 1, 14, 1, NULL, NULL, 0, 1, 'juice'),
(376, 'Soda', '', 1, 15, 1, NULL, NULL, 0, 1, 'soda'),
(377, 'Water', '', 1, 16, 1, NULL, NULL, 0, 1, 'water'),
(378, 'Cocktails', '', 1, 17, 1, NULL, NULL, 0, 1, 'cocktails'),
(379, 'Watches', '', 5, 14, 1, NULL, NULL, 0, 6, 'watches'),
(380, 'Necklaces', '', 5, 15, 1, NULL, NULL, 0, 6, 'necklaces'),
(381, 'Earrings', '', 5, 16, 1, NULL, NULL, 0, 6, 'earrings'),
(382, 'Bracelets', '', 5, 17, 1, NULL, NULL, 0, 6, 'bracelets'),
(383, 'Rings', '', 5, 18, 1, NULL, NULL, 0, 6, 'rings'),
(384, 'Hats', '', 5, 19, 1, NULL, NULL, 0, 6, 'hats'),
(385, 'Scarves', '', 5, 20, 1, NULL, NULL, 0, 6, 'scarves'),
(386, 'Belts', '', 5, 21, 1, NULL, NULL, 0, 6, 'belts'),
(387, 'Sunglasses', '', 5, 22, 1, NULL, NULL, 0, 6, 'sunglasses'),
(388, 'Wallets', '', 5, 23, 1, NULL, NULL, 0, 6, 'wallets'),
(389, 'Backpacks', '', 5, 24, 1, NULL, NULL, 0, 6, 'backpacks'),
(390, 'Briefcases', '', 5, 25, 1, NULL, NULL, 0, 6, 'briefcases'),
(391, 'Ties', '', 5, 26, 1, NULL, NULL, 0, 6, 'ties'),
(392, 'Socks', '', 5, 27, 1, NULL, NULL, 0, 6, 'socks'),
(393, 'Underwear', '', 5, 28, 1, NULL, NULL, 0, 6, 'underwear'),
(394, 'Swimwear', '', 5, 29, 1, NULL, NULL, 0, 6, 'swimwear'),
(395, 'Jackets', '', 5, 30, 1, NULL, NULL, 0, 6, 'jackets'),
(396, 'Coats', '', 5, 31, 1, NULL, NULL, 0, 6, 'coats'),
(397, 'Sweaters', '', 5, 32, 1, NULL, NULL, 0, 6, 'sweaters'),
(398, 'Hoodies', '', 5, 33, 1, NULL, NULL, 0, 6, 'hoodies'),
(399, 'Blouses', '', 5, 34, 1, NULL, NULL, 0, 6, 'blouses'),
(400, 'Tank tops', '', 5, 35, 1, NULL, NULL, 0, 6, 'tank-tops'),
(401, 'Shorts', '', 5, 36, 1, NULL, NULL, 0, 6, 'shorts'),
(402, 'Swim trunks', '', 5, 37, 1, NULL, NULL, 0, 6, 'swim-trunks'),
(403, 'Suits', '', 5, 38, 1, NULL, NULL, 0, 6, 'suits'),
(404, 'Dress shoes', '', 5, 39, 1, NULL, NULL, 0, 6, 'dress-shoes'),
(405, 'Sneakers', '', 5, 40, 1, NULL, NULL, 0, 6, 'sneakers'),
(406, 'Boots', '', 5, 41, 1, NULL, NULL, 0, 6, 'boots'),
(407, 'Sandals', '', 5, 42, 1, NULL, NULL, 0, 6, 'sandals'),
(408, 'Slippers', '', 5, 43, 1, NULL, NULL, 0, 6, 'slippers'),
(409, 'Luggage', '', 5, 44, 1, NULL, NULL, 0, 6, 'luggage'),
(410, 'Carry-on bags', '', 5, 45, 1, NULL, NULL, 0, 6, 'carry-on-bags'),
(411, 'Checked bags', '', 5, 46, 1, NULL, NULL, 0, 6, 'checked-bags'),
(412, 'Duffel bags', '', 5, 47, 1, NULL, NULL, 0, 6, 'duffel-bags'),
(413, 'Backpacks', '', 5, 48, 1, NULL, NULL, 0, 6, 'backpacks'),
(414, 'Messenger bags', '', 5, 49, 1, NULL, NULL, 0, 6, 'messenger-bags'),
(415, 'Tote bags', '', 5, 50, 1, NULL, NULL, 0, 6, 'tote-bags'),
(416, 'Wallets', '', 5, 51, 1, NULL, NULL, 0, 6, 'wallets'),
(417, 'Passport holders', '', 5, 52, 1, NULL, NULL, 0, 6, 'passport-holders'),
(418, 'Travel accessories', '', 5, 53, 1, NULL, NULL, 0, 6, 'travel-accessories'),
(419, 'Laptops', '', 6, 14, 1, NULL, NULL, 0, 7, 'laptops'),
(420, 'Desktops', '', 6, 15, 1, NULL, NULL, 0, 7, 'desktops'),
(421, 'Tablets', '', 6, 16, 1, NULL, NULL, 0, 7, 'tablets'),
(422, 'Smartphones', '', 6, 17, 1, NULL, NULL, 0, 7, 'smartphones'),
(423, 'Smartwatches', '', 6, 18, 1, NULL, NULL, 0, 7, 'smartwatches'),
(424, 'Fitness trackers', '', 6, 19, 1, NULL, NULL, 0, 7, 'fitness-trackers'),
(425, 'Headphones', '', 6, 20, 1, NULL, NULL, 0, 7, 'headphones'),
(426, 'Speakers', '', 6, 21, 1, NULL, NULL, 0, 7, 'speakers'),
(427, 'Cameras', '', 6, 22, 1, NULL, NULL, 0, 7, 'cameras'),
(428, 'Gaming consoles', '', 6, 23, 1, NULL, NULL, 0, 7, 'gaming-consoles'),
(429, 'Gaming accessories', '', 6, 24, 1, NULL, NULL, 0, 7, 'gaming-accessories'),
(430, 'Home security', '', 6, 25, 1, NULL, NULL, 0, 7, 'home-security'),
(431, 'Smart thermostats', '', 6, 26, 1, NULL, NULL, 0, 7, 'smart-thermostats'),
(432, 'Smart lighting', '', 6, 27, 1, NULL, NULL, 0, 7, 'smart-lighting'),
(433, 'Smart locks', '', 6, 28, 1, NULL, NULL, 0, 7, 'smart-locks'),
(434, 'Smart plugs', '', 6, 29, 1, NULL, NULL, 0, 7, 'smart-plugs'),
(435, 'Smart cameras', '', 6, 30, 1, NULL, NULL, 0, 7, 'smart-cameras'),
(436, 'Blenders', '', 6, 31, 1, NULL, NULL, 0, 7, 'blenders'),
(437, 'Coffee makers', '', 6, 32, 1, NULL, NULL, 0, 7, 'coffee-makers'),
(438, 'Toasters', '', 6, 33, 1, NULL, NULL, 0, 7, 'toasters'),
(439, 'Microwaves', '', 6, 34, 1, NULL, NULL, 0, 7, 'microwaves'),
(440, 'Ovens', '', 6, 35, 1, NULL, NULL, 0, 7, 'ovens'),
(441, 'Refrigerators', '', 6, 36, 1, NULL, NULL, 0, 7, 'refrigerators'),
(442, 'Washers', '', 6, 37, 1, NULL, NULL, 0, 7, 'washers'),
(443, 'Dryers', '', 6, 38, 1, NULL, NULL, 0, 7, 'dryers'),
(444, 'Dishwashers', '', 6, 39, 1, NULL, NULL, 0, 7, 'dishwashers'),
(445, 'Vacuums', '', 6, 40, 1, NULL, NULL, 0, 7, 'vacuums'),
(446, 'Air purifiers', '', 6, 41, 1, NULL, NULL, 0, 7, 'air-purifiers'),
(447, 'Humidifiers', '', 6, 42, 1, NULL, NULL, 0, 7, 'humidifiers'),
(448, 'Dehumidifiers', '', 6, 43, 1, NULL, NULL, 0, 7, 'dehumidifiers'),
(449, 'Fans', '', 6, 44, 1, NULL, NULL, 0, 7, 'fans'),
(450, 'Heaters', '', 6, 45, 1, NULL, NULL, 0, 7, 'heaters'),
(451, 'Air conditioners', '', 6, 46, 1, NULL, NULL, 0, 7, 'air-conditioners'),
(452, 'Bed frames', '', 6, 47, 1, NULL, NULL, 0, 7, 'bed-frames'),
(453, 'Mattresses', '', 6, 48, 1, NULL, NULL, 0, 7, 'mattresses'),
(454, 'Dressers', '', 6, 49, 1, NULL, NULL, 0, 7, 'dressers'),
(455, 'Nightstands', '', 6, 50, 1, NULL, NULL, 0, 7, 'nightstands'),
(456, 'Sofas', '', 6, 51, 1, NULL, NULL, 0, 7, 'sofas'),
(457, 'Sectionals', '', 6, 52, 1, NULL, NULL, 0, 7, 'sectionals'),
(458, 'Chairs', '', 6, 53, 1, NULL, NULL, 0, 7, 'chairs'),
(459, 'Coffee tables', '', 6, 54, 1, NULL, NULL, 0, 7, 'coffee-tables'),
(460, 'End tables', '', 6, 55, 1, NULL, NULL, 0, 7, 'end-tables'),
(461, 'TV stands', '', 6, 56, 1, NULL, NULL, 0, 7, 'tv-stands'),
(462, 'Bookcases', '', 6, 57, 1, NULL, NULL, 0, 7, 'bookcases'),
(463, 'Desks', '', 6, 58, 1, NULL, NULL, 0, 7, 'desks'),
(464, 'Outdoor seating', '', 6, 59, 1, NULL, NULL, 0, 7, 'outdoor-seating'),
(465, 'Outdoor tables', '', 6, 60, 1, NULL, NULL, 0, 7, 'outdoor-tables'),
(466, 'Grills', '', 6, 61, 1, NULL, NULL, 0, 7, 'grills'),
(467, 'Patio heaters', '', 6, 62, 1, NULL, NULL, 0, 7, 'patio-heaters'),
(468, 'Fire pits', '', 6, 63, 1, NULL, NULL, 0, 7, 'fire-pits'),
(469, 'Board games', '', 7, 4, 1, NULL, NULL, 0, 8, 'board-games'),
(470, 'Card games', '', 7, 5, 1, NULL, NULL, 0, 8, 'card-games'),
(471, 'Puzzles', '', 7, 6, 1, NULL, NULL, 0, 8, 'puzzles'),
(472, 'Action figures', '', 7, 7, 1, NULL, NULL, 0, 8, 'action-figures'),
(473, 'Dolls', '', 7, 8, 1, NULL, NULL, 0, 8, 'dolls'),
(474, 'Stuffed animals', '', 7, 9, 1, NULL, NULL, 0, 8, 'stuffed-animals'),
(475, 'Building sets', '', 7, 10, 1, NULL, NULL, 0, 8, 'building-sets'),
(476, 'Arts and crafts', '', 7, 11, 1, NULL, NULL, 0, 8, 'arts-and-crafts'),
(477, 'Science kits', '', 7, 12, 1, NULL, NULL, 0, 8, 'science-kits'),
(478, 'Bikes', '', 7, 13, 1, NULL, NULL, 0, 8, 'bikes'),
(479, 'Scooters', '', 7, 14, 1, NULL, NULL, 0, 8, 'scooters'),
(480, 'Skateboards', '', 7, 15, 1, NULL, NULL, 0, 8, 'skateboards'),
(481, 'Office Stationery', '2022-03-16-6231943b1bd92.png', 0, 0, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(482, 'Skin Care', '2022-03-16-6231947a4b98c.png', 0, 0, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(483, 'Fish & Meat', '2022-03-16-623194a9baa9e.png', 0, 0, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(484, 'Personal Care', '2022-03-16-623194d3e4fc5.png', 0, 0, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(485, 'Cooking Essentials', '2022-03-16-623194fd6b4f3.png', 0, 0, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(486, 'Cleaning Supplies', '2022-03-16-6231952e7c1d1.png', 0, 0, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(487, 'Pest Control', '2022-03-16-623195534810e.png', 0, 0, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(488, 'BreakFast', '2022-03-16-62319579da6b9.png', 0, 0, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(489, 'Fruits & Vegetables', '2022-03-16-623195ec20ac4.png', 0, 0, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(490, 'Baby Care', '2022-03-16-6231961846dbd.png', 0, 0, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(491, 'Dairy Needs', '2022-03-16-623196439c74f.png', 0, 0, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(492, 'Home and Kitchen Appliance', '2022-03-16-6231969c9928d.png', 0, 0, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(493, 'Dates', 'def.png', 9, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(494, 'Fresh Fruits', 'def.png', 9, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(495, 'Fresh Vegetables', 'def.png', 9, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(496, 'Meat', 'def.png', 3, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(497, 'Frozen Fish', 'def.png', 3, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(498, 'Dried Fish', 'def.png', 3, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(499, 'Rice', 'def.png', 5, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(500, 'Colors & Flavours', 'def.png', 5, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(501, 'Oil', 'def.png', 5, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(502, 'Laundry', 'def.png', 12, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(503, 'Toilet Cleaners', 'def.png', 12, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(504, 'Air Fresheners', 'def.png', 12, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(505, 'Pest Control', 'def.png', 12, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(506, 'Newborn Essentials', 'def.png', 10, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(507, 'Feeders', 'def.png', 10, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(508, 'Fooding', 'def.png', 10, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(509, 'Baby Oral Care', 'def.png', 10, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(510, 'Organizers', 'def.png', 1, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(511, 'Writing & Printing', 'def.png', 1, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(512, 'Arts & Crafts', 'def.png', 1, 1, 1, '2023-05-14 12:13:49', '2023-05-14 12:13:49', 0, 1, NULL),
(513, 'pots', '2023-05-18-64667b916c001.png', 0, 0, 1, '2023-05-18 19:25:05', '2023-05-18 19:25:05', 0, 14, 'pots'),
(514, 'Floor cleaner', '2023-05-19-6466c8ce714c3.png', 0, 0, 1, '2023-05-18 19:34:36', '2023-05-19 00:54:38', 0, 14, 'for-rooftops'),
(515, 'javel', '2023-05-19-6466c7ae0bf5c.png', 0, 0, 1, '2023-05-18 19:43:12', '2023-05-19 00:49:50', 0, 14, 'for-clothes');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(4) NOT NULL DEFAULT '0',
  `feedback` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `reply` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `message`, `seen`, `feedback`, `reply`, `created_at`, `updated_at`) VALUES
(1, 'Nestor D.', 'pat@aneesho.com', 'Design Work', 'Just wanted to ask if you would be interested in getting external help with graphic design? We do all design work like banners, advertisements, photo edits, logos, flyers, etc. for a fixed monthly fee. \r\n\r\nWe don\'t charge for each task. What kind of work do you need on a regular basis? Let me know and I\'ll share my portfolio with you.', 0, '0', NULL, '2023-11-10 12:38:08', '2023-11-10 12:38:08'),
(2, 'Ahmed', 'bestbusiness.q8@gmail.com', 'D', 'لماذا انا غير مصرح له ،', 0, '0', NULL, '2024-05-17 23:28:25', '2024-05-17 23:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `sender_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_message_id` bigint(20) UNSIGNED DEFAULT NULL,
  `last_message_time` timestamp NULL DEFAULT NULL,
  `unread_message_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `sender_id`, `sender_type`, `receiver_id`, `receiver_type`, `last_message_id`, `last_message_time`, `unread_message_count`, `created_at`, `updated_at`) VALUES
(7, 18, 'customer', 0, 'admin', 11, '2023-09-28 14:46:40', 2, '2023-09-28 14:46:34', '2023-09-28 14:46:40'),
(8, 19, 'vendor', 20, 'customer', 15, '2023-10-02 07:08:17', 1, '2023-09-30 08:00:40', '2023-10-02 07:08:17');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `coupon_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `limit` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_uses` bigint(20) DEFAULT '0',
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'admin',
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '["all"]',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `code`, `start_date`, `expire_date`, `min_purchase`, `max_discount`, `discount`, `discount_type`, `coupon_type`, `limit`, `status`, `created_at`, `updated_at`, `data`, `total_uses`, `module_id`, `created_by`, `customer_id`, `slug`, `store_id`) VALUES
(1, 'خصم علي اول طلب', '2023', '2023-06-16', '2024-06-16', 1.00, 500.00, 10.00, 'percent', 'zone_wise', 1, 1, '2023-06-15 21:05:56', '2023-06-15 21:05:56', '[\"15\"]', 0, 1, 'admin', '[\"all\"]', NULL, NULL),
(2, 'شحن مجاني', 'free001', '2023-06-16', '2024-06-16', 100.00, 0.00, 0.00, '', 'free_delivery', 1, 1, '2023-06-15 21:37:10', '2023-06-15 21:37:10', '\"\"', 0, 1, 'admin', '[\"all\"]', NULL, NULL),
(3, 'Elwakil coupon', '1', '2023-09-29', '2023-10-31', 100.00, 0.00, 100.00, 'percent', 'default', 2, 1, '2023-09-29 07:46:24', '2023-09-29 08:10:24', '\"\"', 0, 4, 'vendor', '[\"all\"]', NULL, 43),
(4, 'elwakil coupon value', '3', '2023-09-30', '2023-09-29', 0.00, 300.00, 50.00, 'amount', 'default', 5, 1, '2023-09-29 07:49:00', '2023-09-29 08:10:13', '\"\"', 0, 4, 'vendor', '[\"all\"]', NULL, 43),
(7, 'الكويت', 'C1', '2023-10-02', '2023-10-02', 100.00, 250.00, 50.00, 'percent', 'default', 2, 1, '2023-10-02 17:06:43', '2023-10-02 17:24:25', '\"\"', 0, 1, 'vendor', '[\"all\"]', NULL, 47),
(8, 'الكويت', 'v1', '2023-10-03', '2023-10-04', 0.00, 0.00, 2000.00, 'amount', 'default', 1, 1, '2023-10-02 17:07:36', '2023-10-02 17:07:36', '\"\"', 0, 1, 'vendor', '[\"all\"]', NULL, 47);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency_code`, `currency_symbol`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', 1.00, NULL, NULL),
(2, 'Canadian Dollar', 'CAD', 'CA$', 1.00, NULL, NULL),
(3, 'Euro', 'EUR', '€', 1.00, NULL, NULL),
(4, 'United Arab Emirates Dirham', 'AED', 'د.إ.‏', 1.00, NULL, NULL),
(5, 'Afghan Afghani', 'AFN', '؋', 1.00, NULL, NULL),
(6, 'Albanian Lek', 'ALL', 'L', 1.00, NULL, NULL),
(7, 'Armenian Dram', 'AMD', '֏', 1.00, NULL, NULL),
(8, 'Argentine Peso', 'ARS', '$', 1.00, NULL, NULL),
(9, 'Australian Dollar', 'AUD', '$', 1.00, NULL, NULL),
(10, 'Azerbaijani Manat', 'AZN', '₼', 1.00, NULL, NULL),
(11, 'Bosnia-Herzegovina Convertible Mark', 'BAM', 'KM', 1.00, NULL, NULL),
(12, 'Bangladeshi Taka', 'BDT', '৳', 1.00, NULL, NULL),
(13, 'Bulgarian Lev', 'BGN', 'лв.', 1.00, NULL, NULL),
(14, 'Bahraini Dinar', 'BHD', 'د.ب.‏', 1.00, NULL, NULL),
(15, 'Burundian Franc', 'BIF', 'FBu', 1.00, NULL, NULL),
(16, 'Brunei Dollar', 'BND', 'B$', 1.00, NULL, NULL),
(17, 'Bolivian Boliviano', 'BOB', 'Bs', 1.00, NULL, NULL),
(18, 'Brazilian Real', 'BRL', 'R$', 1.00, NULL, NULL),
(19, 'Botswanan Pula', 'BWP', 'P', 1.00, NULL, NULL),
(20, 'Belarusian Ruble', 'BYN', 'Br', 1.00, NULL, NULL),
(21, 'Belize Dollar', 'BZD', '$', 1.00, NULL, NULL),
(22, 'Congolese Franc', 'CDF', 'FC', 1.00, NULL, NULL),
(23, 'Swiss Franc', 'CHF', 'CHf', 1.00, NULL, NULL),
(24, 'Chilean Peso', 'CLP', '$', 1.00, NULL, NULL),
(25, 'Chinese Yuan', 'CNY', '¥', 1.00, NULL, NULL),
(26, 'Colombian Peso', 'COP', '$', 1.00, NULL, NULL),
(27, 'Costa Rican Colón', 'CRC', '₡', 1.00, NULL, NULL),
(28, 'Cape Verdean Escudo', 'CVE', '$', 1.00, NULL, NULL),
(29, 'Czech Republic Koruna', 'CZK', 'Kč', 1.00, NULL, NULL),
(30, 'Djiboutian Franc', 'DJF', 'Fdj', 1.00, NULL, NULL),
(31, 'Danish Krone', 'DKK', 'Kr.', 1.00, NULL, NULL),
(32, 'Dominican Peso', 'DOP', 'RD$', 1.00, NULL, NULL),
(33, 'Algerian Dinar', 'DZD', 'د.ج.‏', 1.00, NULL, NULL),
(34, 'Estonian Kroon', 'EEK', 'kr', 1.00, NULL, NULL),
(35, 'Egyptian Pound', 'EGP', 'جنيه', 1.00, NULL, NULL),
(36, 'Eritrean Nakfa', 'ERN', 'Nfk', 1.00, NULL, NULL),
(37, 'Ethiopian Birr', 'ETB', 'Br', 1.00, NULL, NULL),
(38, 'British Pound Sterling', 'GBP', '£', 1.00, NULL, NULL),
(39, 'Georgian Lari', 'GEL', 'GEL', 1.00, NULL, NULL),
(40, 'Ghanaian Cedi', 'GHS', 'GH¢', 1.00, NULL, NULL),
(41, 'Guinean Franc', 'GNF', 'FG', 1.00, NULL, NULL),
(42, 'Guatemalan Quetzal', 'GTQ', 'Q', 1.00, NULL, NULL),
(43, 'Hong Kong Dollar', 'HKD', 'HK$', 1.00, NULL, NULL),
(44, 'Honduran Lempira', 'HNL', 'L', 1.00, NULL, NULL),
(45, 'Croatian Kuna', 'HRK', 'kn', 1.00, NULL, NULL),
(46, 'Hungarian Forint', 'HUF', 'Ft', 1.00, NULL, NULL),
(47, 'Indonesian Rupiah', 'IDR', 'Rp', 1.00, NULL, NULL),
(48, 'Israeli New Sheqel', 'ILS', '₪', 1.00, NULL, NULL),
(49, 'Indian Rupee', 'INR', '₹', 1.00, NULL, NULL),
(50, 'Iraqi Dinar', 'IQD', 'ع.د', 1.00, NULL, NULL),
(51, 'Iranian Rial', 'IRR', '﷼', 1.00, NULL, NULL),
(52, 'Icelandic Króna', 'ISK', 'kr', 1.00, NULL, NULL),
(53, 'Jamaican Dollar', 'JMD', '$', 1.00, NULL, NULL),
(54, 'Jordanian Dinar', 'JOD', 'د.ا‏', 1.00, NULL, NULL),
(55, 'Japanese Yen', 'JPY', '¥', 1.00, NULL, NULL),
(56, 'Kenyan Shilling', 'KES', 'Ksh', 1.00, NULL, NULL),
(57, 'Cambodian Riel', 'KHR', '៛', 1.00, NULL, NULL),
(58, 'Comorian Franc', 'KMF', 'FC', 1.00, NULL, NULL),
(59, 'South Korean Won', 'KRW', 'CF', 1.00, NULL, NULL),
(60, 'Kuwaiti Dinar', 'KWD', 'د.ك.‏', 1.00, NULL, NULL),
(61, 'Kazakhstani Tenge', 'KZT', '₸.', 1.00, NULL, NULL),
(62, 'Lebanese Pound', 'LBP', 'ل.ل.‏', 1.00, NULL, NULL),
(63, 'Sri Lankan Rupee', 'LKR', 'Rs', 1.00, NULL, NULL),
(64, 'Lithuanian Litas', 'LTL', 'Lt', 1.00, NULL, NULL),
(65, 'Latvian Lats', 'LVL', 'Ls', 1.00, NULL, NULL),
(66, 'Libyan Dinar', 'LYD', 'د.ل.‏', 1.00, NULL, NULL),
(67, 'Moroccan Dirham', 'MAD', 'د.م.‏', 1.00, NULL, NULL),
(68, 'Moldovan Leu', 'MDL', 'L', 1.00, NULL, NULL),
(69, 'Malagasy Ariary', 'MGA', 'Ar', 1.00, NULL, NULL),
(70, 'Macedonian Denar', 'MKD', 'Ден', 1.00, NULL, NULL),
(71, 'Myanma Kyat', 'MMK', 'K', 1.00, NULL, NULL),
(72, 'Macanese Pataca', 'MOP', 'MOP$', 1.00, NULL, NULL),
(73, 'Mauritian Rupee', 'MUR', 'Rs', 1.00, NULL, NULL),
(74, 'Mexican Peso', 'MXN', '$', 1.00, NULL, NULL),
(75, 'Malaysian Ringgit', 'MYR', 'RM', 1.00, NULL, NULL),
(76, 'Mozambican Metical', 'MZN', 'MT', 1.00, NULL, NULL),
(77, 'Namibian Dollar', 'NAD', 'N$', 1.00, NULL, NULL),
(78, 'Nigerian Naira', 'NGN', '₦', 1.00, NULL, NULL),
(79, 'Nicaraguan Córdoba', 'NIO', 'C$', 1.00, NULL, NULL),
(80, 'Norwegian Krone', 'NOK', 'kr', 1.00, NULL, NULL),
(81, 'Nepalese Rupee', 'NPR', 'Re.', 1.00, NULL, NULL),
(82, 'New Zealand Dollar', 'NZD', '$', 1.00, NULL, NULL),
(83, 'Omani Rial', 'OMR', 'ر.ع.‏', 1.00, NULL, NULL),
(84, 'Panamanian Balboa', 'PAB', 'B/.', 1.00, NULL, NULL),
(85, 'Peruvian Nuevo Sol', 'PEN', 'S/', 1.00, NULL, NULL),
(86, 'Philippine Peso', 'PHP', '₱', 1.00, NULL, NULL),
(87, 'Pakistani Rupee', 'PKR', 'Rs', 1.00, NULL, NULL),
(88, 'Polish Zloty', 'PLN', 'zł', 1.00, NULL, NULL),
(89, 'Paraguayan Guarani', 'PYG', '₲', 1.00, NULL, NULL),
(90, 'Qatari Rial', 'QAR', 'ر.ق.‏', 1.00, NULL, NULL),
(91, 'Romanian Leu', 'RON', 'lei', 1.00, NULL, NULL),
(92, 'Serbian Dinar', 'RSD', 'din.', 1.00, NULL, NULL),
(93, 'Russian Ruble', 'RUB', '₽.', 1.00, NULL, NULL),
(94, 'Rwandan Franc', 'RWF', 'FRw', 1.00, NULL, NULL),
(95, 'Saudi Riyal', 'SAR', 'ر.س.‏', 1.00, NULL, NULL),
(96, 'Sudanese Pound', 'SDG', 'ج.س.', 1.00, NULL, NULL),
(97, 'Swedish Krona', 'SEK', 'kr', 1.00, NULL, NULL),
(98, 'Singapore Dollar', 'SGD', '$', 1.00, NULL, NULL),
(99, 'Somali Shilling', 'SOS', 'Sh.so.', 1.00, NULL, NULL),
(100, 'Syrian Pound', 'SYP', 'LS‏', 1.00, NULL, NULL),
(101, 'Thai Baht', 'THB', '฿', 1.00, NULL, NULL),
(102, 'Tunisian Dinar', 'TND', 'د.ت‏', 1.00, NULL, NULL),
(103, 'Tongan Paʻanga', 'TOP', 'T$', 1.00, NULL, NULL),
(104, 'Turkish Lira', 'TRY', '₺', 1.00, NULL, NULL),
(105, 'Trinidad and Tobago Dollar', 'TTD', '$', 1.00, NULL, NULL),
(106, 'New Taiwan Dollar', 'TWD', 'NT$', 1.00, NULL, NULL),
(107, 'Tanzanian Shilling', 'TZS', 'TSh', 1.00, NULL, NULL),
(108, 'Ukrainian Hryvnia', 'UAH', '₴', 1.00, NULL, NULL),
(109, 'Ugandan Shilling', 'UGX', 'USh', 1.00, NULL, NULL),
(110, 'Uruguayan Peso', 'UYU', '$', 1.00, NULL, NULL),
(111, 'Uzbekistan Som', 'UZS', 'so\'m', 1.00, NULL, NULL),
(112, 'Venezuelan Bolívar', 'VEF', 'Bs.F.', 1.00, NULL, NULL),
(113, 'Vietnamese Dong', 'VND', '₫', 1.00, NULL, NULL),
(114, 'CFA Franc BEAC', 'XAF', 'FCFA', 1.00, NULL, NULL),
(115, 'CFA Franc BCEAO', 'XOF', 'CFA', 1.00, NULL, NULL),
(116, 'Yemeni Rial', 'YER', '﷼‏', 1.00, NULL, NULL),
(117, 'South African Rand', 'ZAR', 'R', 1.00, NULL, NULL),
(118, 'Zambian Kwacha', 'ZMK', 'ZK', 1.00, NULL, NULL),
(119, 'Zimbabwean Dollar', 'ZWL', 'Z$', 1.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `floor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `road` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `address_type`, `contact_person_number`, `address`, `latitude`, `longitude`, `user_id`, `contact_person_name`, `created_at`, `updated_at`, `zone_id`, `floor`, `road`, `house`) VALUES
(1, 'office', '+201000272192', '8F6J+GV اسطبلات الجهراء، Kuwait', '29.311336893551953', '47.48213130980731', 19, 'Eslam Elwakil', '2023-09-27 15:25:35', '2023-09-27 15:25:35', 15, NULL, NULL, NULL),
(2, 'office', '+201226565019', 'Kuwait', '29.311666080851438', '47.48175881803036', 24, 'اسلام الوكيل', '2023-09-29 08:15:10', '2023-09-29 08:15:10', 15, NULL, NULL, NULL),
(3, 'office', '+201226565011', '8F6J+6Q اسطبلات الجهراء، Kuwait', '29.310532338951383', '47.48196803033352', 26, 'customer one', '2023-10-02 09:00:11', '2023-10-02 09:00:11', 15, '2', '200', '1'),
(5, 'others', '+', 'e', '29.311666080851438', '47.48175881803036', 27, 'e', '2023-10-02 12:30:15', '2023-10-02 12:30:15', 15, NULL, NULL, NULL),
(6, 'home', '+201226565020', 'الكويت‎', '29.311666080851438', '47.48175881803036', 28, 'C10 C10', '2023-10-02 15:58:42', '2023-10-02 15:58:42', 15, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_histories`
--

INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(729, NULL, 3, '2023-07-20 23:32:13', '-122.084', '37.4219983', '1600, Santa Clara County, US', '2023-07-20 20:32:13', '2023-07-20 20:32:13'),
(730, NULL, 3, '2023-07-20 23:32:27', '-122.084', '37.4219983', '1600, Santa Clara County, US', '2023-07-20 20:32:27', '2023-07-20 20:32:27'),
(731, NULL, 3, '2023-07-20 23:34:15', '-122.084', '37.4219983', '1600, Santa Clara County, US', '2023-07-20 20:34:15', '2023-07-20 20:34:15'),
(732, NULL, 3, '2023-07-20 23:34:26', '-122.084', '37.4219983', '1600, Santa Clara County, US', '2023-07-20 20:34:26', '2023-07-20 20:34:26'),
(733, NULL, 3, '2023-07-21 00:55:16', '-122.084', '37.4219983', '1600, Santa Clara County, US', '2023-07-20 21:55:16', '2023-07-20 21:55:16'),
(734, NULL, 3, '2023-07-21 00:55:41', '-122.084', '37.4219983', '1600, Santa Clara County, US', '2023-07-20 21:55:41', '2023-07-20 21:55:41'),
(735, NULL, 3, '2023-07-21 00:55:51', '-122.084', '37.4219983', '1600, Santa Clara County, US', '2023-07-20 21:55:51', '2023-07-20 21:55:51'),
(736, NULL, 3, '2023-07-21 00:56:17', '-122.084', '37.4219983', '1600, Santa Clara County, US', '2023-07-20 21:56:17', '2023-07-20 21:56:17'),
(737, NULL, 3, '2023-07-21 02:45:40', '48.0188445', '29.3259562', '196, , KW', '2023-07-20 23:45:40', '2023-07-20 23:45:40'),
(738, NULL, 3, '2023-07-21 02:46:00', '48.0188561', '29.3259606', '196, , KW', '2023-07-20 23:46:00', '2023-07-20 23:46:00'),
(739, NULL, 3, '2023-07-25 23:12:52', '48.0187225', '29.3261495', '196, , KW', '2023-07-25 20:12:52', '2023-07-25 20:12:52'),
(740, NULL, 3, '2023-07-25 23:13:06', '48.0187215', '29.3261497', '196, , KW', '2023-07-25 20:13:06', '2023-07-25 20:13:06'),
(741, NULL, 3, '2023-07-25 23:13:19', '48.0186393', '29.3259498', '196, , KW', '2023-07-25 20:13:19', '2023-07-25 20:13:19'),
(742, NULL, 3, '2023-07-25 23:13:32', '48.0186742', '29.3260308', '196, , KW', '2023-07-25 20:13:32', '2023-07-25 20:13:32'),
(743, NULL, 3, '2023-07-25 23:13:36', '48.0187004', '29.3260927', '196, , KW', '2023-07-25 20:13:36', '2023-07-25 20:13:36'),
(744, NULL, 3, '2023-07-25 23:13:45', '48.0187298', '29.3261652', '196, , KW', '2023-07-25 20:13:45', '2023-07-25 20:13:45'),
(745, NULL, 3, '2023-07-26 01:19:28', '48.0187205', '29.3261491', '196, , KW', '2023-07-25 22:19:28', '2023-07-25 22:19:28'),
(746, NULL, 3, '2023-07-26 01:19:37', '48.018704', '29.3260719', '196, , KW', '2023-07-25 22:19:37', '2023-07-25 22:19:37'),
(747, NULL, 3, '2023-07-26 01:19:46', '48.0187147', '29.3261199', '196, , KW', '2023-07-25 22:19:46', '2023-07-25 22:19:46'),
(748, NULL, 3, '2023-07-26 01:19:57', '48.0187245', '29.326147', '196, , KW', '2023-07-25 22:19:57', '2023-07-25 22:19:57'),
(749, NULL, 3, '2023-07-26 01:20:07', '48.018715', '29.326111', '196, , KW', '2023-07-25 22:20:07', '2023-07-25 22:20:07'),
(750, NULL, 3, '2023-07-26 01:20:17', '48.0187232', '29.3261389', '196, , KW', '2023-07-25 22:20:17', '2023-07-25 22:20:17'),
(751, NULL, 3, '2023-07-26 01:20:32', '48.018714', '29.3261075', '196, , KW', '2023-07-25 22:20:32', '2023-07-25 22:20:32'),
(752, NULL, 3, '2023-07-26 01:20:36', '48.018714', '29.3261075', '196, , KW', '2023-07-25 22:20:36', '2023-07-25 22:20:36'),
(753, NULL, 3, '2023-07-26 01:20:57', '48.0187246', '29.3261498', '196, , KW', '2023-07-25 22:20:57', '2023-07-25 22:20:57'),
(754, NULL, 3, '2023-07-26 01:20:58', '48.0187246', '29.3261498', '196, , KW', '2023-07-25 22:20:58', '2023-07-25 22:20:58'),
(755, NULL, 3, '2023-07-26 01:21:07', '48.0187296', '29.3261486', '196, , KW', '2023-07-25 22:21:07', '2023-07-25 22:21:07'),
(756, NULL, 3, '2023-07-26 01:21:17', '48.0187256', '29.3261489', '196, , KW', '2023-07-25 22:21:17', '2023-07-25 22:21:17'),
(757, NULL, 3, '2023-07-26 01:21:27', '48.0187244', '29.3261464', '196, , KW', '2023-07-25 22:21:27', '2023-07-25 22:21:27'),
(758, NULL, 3, '2023-07-26 01:21:52', '48.0187073', '29.3260984', '196, , KW', '2023-07-25 22:21:52', '2023-07-25 22:21:52'),
(759, NULL, 3, '2023-07-26 01:22:03', '48.0186697', '29.3259487', '196, , KW', '2023-07-25 22:22:03', '2023-07-25 22:22:03'),
(760, NULL, 3, '2023-07-26 01:22:12', '48.0186982', '29.3260315', '196, , KW', '2023-07-25 22:22:12', '2023-07-25 22:22:12'),
(761, NULL, 3, '2023-07-26 01:22:30', '48.0187189', '29.3261479', '196, , KW', '2023-07-25 22:22:30', '2023-07-25 22:22:30'),
(762, NULL, 3, '2023-07-26 01:22:33', '48.0187189', '29.3261479', '196, , KW', '2023-07-25 22:22:33', '2023-07-25 22:22:33'),
(763, NULL, 3, '2023-07-26 01:22:59', '48.0186803', '29.3260253', '196, , KW', '2023-07-25 22:22:59', '2023-07-25 22:22:59'),
(764, NULL, 3, '2023-07-26 01:23:04', '48.0186942', '29.3260285', '196, , KW', '2023-07-25 22:23:04', '2023-07-25 22:23:04'),
(765, NULL, 3, '2023-07-26 01:23:05', '48.0186942', '29.3260285', '196, , KW', '2023-07-25 22:23:05', '2023-07-25 22:23:05'),
(766, NULL, 3, '2023-07-26 01:23:14', '48.018653', '29.3258621', '82G9+9G6, , KW', '2023-07-25 22:23:14', '2023-07-25 22:23:14'),
(767, NULL, 3, '2023-07-26 01:24:23', '48.018704', '29.3260417', '196, , KW', '2023-07-25 22:24:23', '2023-07-25 22:24:23'),
(768, NULL, 3, '2023-07-26 01:24:59', '48.0187219', '29.3261475', '196, , KW', '2023-07-25 22:24:59', '2023-07-25 22:24:59'),
(769, NULL, 3, '2023-07-26 01:25:40', '48.0187249', '29.3261494', '196, , KW', '2023-07-25 22:25:40', '2023-07-25 22:25:40'),
(770, NULL, 3, '2023-07-26 01:26:49', '48.0185253', '29.326423', '82G9+G78, , KW', '2023-07-25 22:26:49', '2023-07-25 22:26:49'),
(771, NULL, 3, '2023-07-26 01:27:09', '48.0187213', '29.3261497', '196, , KW', '2023-07-25 22:27:09', '2023-07-25 22:27:09'),
(772, NULL, 3, '2023-07-26 01:27:19', '48.0187213', '29.3261497', '196, , KW', '2023-07-25 22:27:19', '2023-07-25 22:27:19'),
(773, NULL, 3, '2023-07-26 01:27:44', '48.0187052', '29.3261585', '196, , KW', '2023-07-25 22:27:44', '2023-07-25 22:27:44'),
(774, NULL, 3, '2023-07-26 01:27:54', '48.0186357', '29.3258331', '82G9+9G6, , KW', '2023-07-25 22:27:54', '2023-07-25 22:27:54'),
(775, NULL, 3, '2023-07-26 01:28:04', '48.0186105', '29.325712', 'الكويت‎, , KW', '2023-07-25 22:28:04', '2023-07-25 22:28:04'),
(776, NULL, 3, '2023-07-26 01:28:05', '48.0186112', '29.3257125', 'الكويت‎, , KW', '2023-07-25 22:28:05', '2023-07-25 22:28:05'),
(777, NULL, 3, '2023-07-26 01:28:08', '48.0186112', '29.3257125', 'الكويت‎, , KW', '2023-07-25 22:28:08', '2023-07-25 22:28:08'),
(778, NULL, 3, '2023-07-26 01:29:35', '48.0187043', '29.3261455', '196, , KW', '2023-07-25 22:29:35', '2023-07-25 22:29:35'),
(779, NULL, 3, '2023-07-26 01:29:49', '48.0187043', '29.3261455', '196, , KW', '2023-07-25 22:29:49', '2023-07-25 22:29:49'),
(780, NULL, 3, '2023-07-26 01:32:21', '48.0187044', '29.3261393', '196, , KW', '2023-07-25 22:32:21', '2023-07-25 22:32:21'),
(781, NULL, 3, '2023-07-26 01:33:52', '48.0187049', '29.3261447', '196, , KW', '2023-07-25 22:33:52', '2023-07-25 22:33:52'),
(782, NULL, 3, '2023-07-26 01:40:12', '48.0181423', '29.3258655', '82G9+893, , KW', '2023-07-25 22:40:12', '2023-07-25 22:40:12'),
(783, NULL, 3, '2023-07-26 01:40:38', '48.0186303', '29.3261082', '196, , KW', '2023-07-25 22:40:38', '2023-07-25 22:40:38'),
(784, NULL, 3, '2023-07-26 01:40:39', '48.0186303', '29.3261082', '196, , KW', '2023-07-25 22:40:39', '2023-07-25 22:40:39'),
(785, NULL, 3, '2023-07-26 01:40:46', '48.018714', '29.3261488', '196, , KW', '2023-07-25 22:40:46', '2023-07-25 22:40:46'),
(786, NULL, 3, '2023-07-26 01:41:01', '48.0187042', '29.3261437', '196, , KW', '2023-07-25 22:41:01', '2023-07-25 22:41:01'),
(787, NULL, 3, '2023-07-26 01:41:05', '48.0187042', '29.3261437', '196, , KW', '2023-07-25 22:41:05', '2023-07-25 22:41:05'),
(788, NULL, 3, '2023-07-26 01:41:16', '48.0187096', '29.3261446', '196, , KW', '2023-07-25 22:41:16', '2023-07-25 22:41:16'),
(789, NULL, 3, '2023-07-26 01:41:26', '48.0186874', '29.3261336', '196, , KW', '2023-07-25 22:41:26', '2023-07-25 22:41:26'),
(790, NULL, 3, '2023-07-26 01:41:44', '48.0186992', '29.3261272', '196, , KW', '2023-07-25 22:41:44', '2023-07-25 22:41:44'),
(791, NULL, 3, '2023-07-26 01:42:45', '48.0187044', '29.3261435', '196, , KW', '2023-07-25 22:42:45', '2023-07-25 22:42:45'),
(792, NULL, 3, '2023-07-26 01:43:48', '48.0187056', '29.3261435', '196, , KW', '2023-07-25 22:43:48', '2023-07-25 22:43:48'),
(793, NULL, 3, '2023-07-26 01:43:58', '48.0186967', '29.3261345', '196, , KW', '2023-07-25 22:43:58', '2023-07-25 22:43:58'),
(794, NULL, 3, '2023-07-26 01:44:08', '48.0186744', '29.3261286', '196, , KW', '2023-07-25 22:44:08', '2023-07-25 22:44:08'),
(795, NULL, 3, '2023-07-26 01:44:23', '48.0186783', '29.3261341', '196, , KW', '2023-07-25 22:44:23', '2023-07-25 22:44:23'),
(796, NULL, 3, '2023-07-26 01:44:27', '48.0186783', '29.3261341', '196, , KW', '2023-07-25 22:44:27', '2023-07-25 22:44:27'),
(797, NULL, 3, '2023-07-26 01:44:38', '48.0186347', '29.3260978', '196, , KW', '2023-07-25 22:44:38', '2023-07-25 22:44:38'),
(798, NULL, 3, '2023-07-26 01:44:48', '48.0187032', '29.326139', '196, , KW', '2023-07-25 22:44:48', '2023-07-25 22:44:48'),
(799, NULL, 3, '2023-07-26 01:44:58', '48.0187094', '29.3261421', '196, , KW', '2023-07-25 22:44:58', '2023-07-25 22:44:58'),
(800, NULL, 3, '2023-07-26 01:45:08', '48.0187049', '29.3261365', '196, , KW', '2023-07-25 22:45:08', '2023-07-25 22:45:08'),
(801, NULL, 3, '2023-07-26 01:45:18', '48.0187096', '29.3261439', '196, , KW', '2023-07-25 22:45:18', '2023-07-25 22:45:18'),
(802, NULL, 3, '2023-07-26 01:45:28', '48.0187108', '29.3261459', '196, , KW', '2023-07-25 22:45:28', '2023-07-25 22:45:28'),
(803, NULL, 3, '2023-07-26 01:45:38', '48.0186956', '29.3261404', '196, , KW', '2023-07-25 22:45:38', '2023-07-25 22:45:38'),
(804, NULL, 3, '2023-07-26 01:45:47', '48.0186941', '29.326139', '196, , KW', '2023-07-25 22:45:47', '2023-07-25 22:45:47'),
(805, NULL, 3, '2023-07-26 01:45:58', '48.0186859', '29.3261351', '196, , KW', '2023-07-25 22:45:58', '2023-07-25 22:45:58'),
(806, NULL, 3, '2023-07-26 01:46:08', '48.0186968', '29.3261394', '196, , KW', '2023-07-25 22:46:08', '2023-07-25 22:46:08'),
(807, NULL, 3, '2023-07-26 01:46:18', '48.0186733', '29.3261234', '196, , KW', '2023-07-25 22:46:18', '2023-07-25 22:46:18'),
(808, NULL, 3, '2023-07-26 01:46:28', '48.0186807', '29.3261265', '196, , KW', '2023-07-25 22:46:28', '2023-07-25 22:46:28'),
(809, NULL, 3, '2023-07-26 01:46:38', '48.0187036', '29.3261407', '196, , KW', '2023-07-25 22:46:38', '2023-07-25 22:46:38'),
(810, NULL, 3, '2023-07-26 01:46:48', '48.0187951', '29.3260419', '196, , KW', '2023-07-25 22:46:48', '2023-07-25 22:46:48'),
(811, NULL, 3, '2023-07-26 01:46:58', '48.0188546', '29.3259416', '196, , KW', '2023-07-25 22:46:58', '2023-07-25 22:46:58'),
(812, NULL, 3, '2023-07-26 01:47:08', '48.0188583', '29.3259328', '196, , KW', '2023-07-25 22:47:08', '2023-07-25 22:47:08'),
(813, NULL, 3, '2023-07-26 01:47:22', '48.0188238', '29.3259748', '196, , KW', '2023-07-25 22:47:22', '2023-07-25 22:47:22'),
(814, NULL, 3, '2023-07-26 01:47:29', '48.0188184', '29.3259951', '196, , KW', '2023-07-25 22:47:29', '2023-07-25 22:47:29'),
(815, NULL, 3, '2023-07-26 01:47:38', '48.0188563', '29.3259378', '196, , KW', '2023-07-25 22:47:38', '2023-07-25 22:47:38'),
(816, NULL, 3, '2023-07-26 01:47:48', '48.0188133', '29.3259484', '196, , KW', '2023-07-25 22:47:48', '2023-07-25 22:47:48'),
(817, NULL, 3, '2023-07-26 01:47:58', '48.01874', '29.3260395', '196, , KW', '2023-07-25 22:47:58', '2023-07-25 22:47:58'),
(818, NULL, 3, '2023-07-26 01:48:08', '48.0188439', '29.3259695', '196, , KW', '2023-07-25 22:48:08', '2023-07-25 22:48:08'),
(819, NULL, 3, '2023-07-26 01:48:18', '48.0188727', '29.3259275', '196, , KW', '2023-07-25 22:48:18', '2023-07-25 22:48:18'),
(820, NULL, 3, '2023-07-26 01:48:28', '48.0188351', '29.3259524', '196, , KW', '2023-07-25 22:48:28', '2023-07-25 22:48:28'),
(821, NULL, 3, '2023-07-26 01:48:38', '48.0188327', '29.3259667', '196, , KW', '2023-07-25 22:48:38', '2023-07-25 22:48:38'),
(822, NULL, 3, '2023-07-26 01:48:48', '48.0188121', '29.3260018', '196, , KW', '2023-07-25 22:48:48', '2023-07-25 22:48:48'),
(823, NULL, 3, '2023-07-26 01:48:58', '48.0188052', '29.3260207', '196, , KW', '2023-07-25 22:48:58', '2023-07-25 22:48:58'),
(824, NULL, 3, '2023-07-26 01:49:08', '48.0188498', '29.3259541', '196, , KW', '2023-07-25 22:49:08', '2023-07-25 22:49:08'),
(825, NULL, 3, '2023-07-26 01:49:18', '48.0188506', '29.3259364', '196, , KW', '2023-07-25 22:49:18', '2023-07-25 22:49:18'),
(826, NULL, 3, '2023-07-26 01:49:28', '48.0188422', '29.3259132', '196, , KW', '2023-07-25 22:49:28', '2023-07-25 22:49:28'),
(827, NULL, 3, '2023-07-26 01:49:38', '48.0188512', '29.3259521', '196, , KW', '2023-07-25 22:49:38', '2023-07-25 22:49:38'),
(828, NULL, 3, '2023-07-26 01:49:48', '48.0188705', '29.3259323', '196, , KW', '2023-07-25 22:49:48', '2023-07-25 22:49:48'),
(829, NULL, 3, '2023-07-26 01:49:58', '48.018868', '29.3259214', '196, , KW', '2023-07-25 22:49:58', '2023-07-25 22:49:58'),
(830, NULL, 3, '2023-07-26 01:50:08', '48.0188033', '29.3260046', '196, , KW', '2023-07-25 22:50:08', '2023-07-25 22:50:08'),
(831, NULL, 3, '2023-07-26 01:50:18', '48.01887', '29.3259262', '196, , KW', '2023-07-25 22:50:18', '2023-07-25 22:50:18'),
(832, NULL, 3, '2023-07-26 01:50:28', '48.0188686', '29.3259204', '196, , KW', '2023-07-25 22:50:28', '2023-07-25 22:50:28'),
(833, NULL, 3, '2023-07-26 01:50:38', '48.0188737', '29.325919', '196, , KW', '2023-07-25 22:50:38', '2023-07-25 22:50:38'),
(834, NULL, 3, '2023-07-26 01:50:48', '48.0188341', '29.3259591', '196, , KW', '2023-07-25 22:50:48', '2023-07-25 22:50:48'),
(835, NULL, 3, '2023-07-26 01:50:58', '48.0188634', '29.3259318', '196, , KW', '2023-07-25 22:50:58', '2023-07-25 22:50:58'),
(836, NULL, 3, '2023-07-26 01:51:08', '48.0188552', '29.3259278', '196, , KW', '2023-07-25 22:51:08', '2023-07-25 22:51:08'),
(837, NULL, 3, '2023-07-26 01:51:18', '48.0188553', '29.3259501', '196, , KW', '2023-07-25 22:51:18', '2023-07-25 22:51:18'),
(838, NULL, 3, '2023-07-26 01:51:28', '48.0188727', '29.3259257', '196, , KW', '2023-07-25 22:51:28', '2023-07-25 22:51:28'),
(839, NULL, 3, '2023-07-26 01:51:38', '48.0188235', '29.3259752', '196, , KW', '2023-07-25 22:51:38', '2023-07-25 22:51:38'),
(840, NULL, 3, '2023-07-26 01:51:48', '48.018807', '29.3259962', '196, , KW', '2023-07-25 22:51:48', '2023-07-25 22:51:48'),
(841, NULL, 3, '2023-07-26 01:51:57', '48.0188646', '29.3259322', '196, , KW', '2023-07-25 22:51:57', '2023-07-25 22:51:57'),
(842, NULL, 3, '2023-07-26 01:52:08', '48.0188512', '29.3259506', '196, , KW', '2023-07-25 22:52:08', '2023-07-25 22:52:08'),
(843, NULL, 3, '2023-07-26 01:52:18', '48.0188441', '29.3259484', '196, , KW', '2023-07-25 22:52:18', '2023-07-25 22:52:18'),
(844, NULL, 3, '2023-07-26 01:52:28', '48.0188581', '29.3259484', '196, , KW', '2023-07-25 22:52:28', '2023-07-25 22:52:28'),
(845, NULL, 3, '2023-07-26 01:52:38', '48.0188665', '29.3259245', '196, , KW', '2023-07-25 22:52:38', '2023-07-25 22:52:38'),
(846, NULL, 3, '2023-07-26 01:52:48', '48.0188675', '29.3259205', '196, , KW', '2023-07-25 22:52:48', '2023-07-25 22:52:48'),
(847, NULL, 3, '2023-07-26 01:52:58', '48.0188586', '29.3259342', '196, , KW', '2023-07-25 22:52:58', '2023-07-25 22:52:58'),
(848, NULL, 3, '2023-07-26 01:53:12', '48.0188653', '29.3259384', '196, , KW', '2023-07-25 22:53:12', '2023-07-25 22:53:12'),
(849, NULL, 3, '2023-07-26 01:53:33', '48.0186886', '29.3261152', '196, , KW', '2023-07-25 22:53:33', '2023-07-25 22:53:33'),
(850, NULL, 3, '2023-07-26 01:53:43', '48.0188734', '29.3259222', '196, , KW', '2023-07-25 22:53:43', '2023-07-25 22:53:43'),
(851, NULL, 3, '2023-07-26 01:53:53', '48.0188681', '29.3259203', '196, , KW', '2023-07-25 22:53:53', '2023-07-25 22:53:53'),
(852, NULL, 3, '2023-07-26 01:54:03', '48.0188691', '29.3259281', '196, , KW', '2023-07-25 22:54:03', '2023-07-25 22:54:03'),
(853, NULL, 3, '2023-07-26 01:54:13', '48.0188669', '29.3259235', '196, , KW', '2023-07-25 22:54:13', '2023-07-25 22:54:13'),
(854, NULL, 3, '2023-07-26 01:54:23', '48.0188519', '29.325945', '196, , KW', '2023-07-25 22:54:23', '2023-07-25 22:54:23'),
(855, NULL, 3, '2023-07-26 01:54:33', '48.0188349', '29.3259778', '196, , KW', '2023-07-25 22:54:33', '2023-07-25 22:54:33'),
(856, NULL, 3, '2023-07-26 01:54:43', '48.0188023', '29.3260046', '196, , KW', '2023-07-25 22:54:43', '2023-07-25 22:54:43'),
(857, NULL, 3, '2023-07-26 01:54:54', '48.0187733', '29.3260551', '196, , KW', '2023-07-25 22:54:54', '2023-07-25 22:54:54'),
(858, NULL, 3, '2023-07-26 01:55:03', '48.0188044', '29.3260063', '196, , KW', '2023-07-25 22:55:03', '2023-07-25 22:55:03'),
(859, NULL, 3, '2023-07-26 01:55:14', '48.0186016', '29.3259827', '196, , KW', '2023-07-25 22:55:14', '2023-07-25 22:55:14'),
(860, NULL, 3, '2023-07-26 01:55:24', '48.0187922', '29.3259974', '196, , KW', '2023-07-25 22:55:24', '2023-07-25 22:55:24'),
(861, NULL, 3, '2023-07-26 01:55:34', '48.0188513', '29.3259331', '196, , KW', '2023-07-25 22:55:34', '2023-07-25 22:55:34'),
(862, NULL, 3, '2023-07-26 01:55:44', '48.0188652', '29.3259163', '196, , KW', '2023-07-25 22:55:44', '2023-07-25 22:55:44'),
(863, NULL, 3, '2023-07-26 01:55:54', '48.0188549', '29.3259382', '196, , KW', '2023-07-25 22:55:54', '2023-07-25 22:55:54'),
(864, NULL, 3, '2023-07-26 01:56:04', '48.0188562', '29.3259328', '196, , KW', '2023-07-25 22:56:04', '2023-07-25 22:56:04'),
(865, NULL, 3, '2023-07-26 01:56:14', '48.0188111', '29.325993', '196, , KW', '2023-07-25 22:56:14', '2023-07-25 22:56:14'),
(866, NULL, 3, '2023-07-26 01:56:24', '48.0187824', '29.3260405', '196, , KW', '2023-07-25 22:56:24', '2023-07-25 22:56:24'),
(867, NULL, 3, '2023-07-26 01:56:54', '48.0188687', '29.3259194', '196, , KW', '2023-07-25 22:56:54', '2023-07-25 22:56:54'),
(868, NULL, 3, '2023-07-26 01:57:09', '48.018813', '29.3259941', '196, , KW', '2023-07-25 22:57:09', '2023-07-25 22:57:09'),
(869, NULL, 3, '2023-07-26 01:59:28', '48.0188391', '29.3259773', '196, , KW', '2023-07-25 22:59:28', '2023-07-25 22:59:28'),
(870, NULL, 3, '2023-07-26 01:59:39', '48.0188419', '29.3259599', '196, , KW', '2023-07-25 22:59:39', '2023-07-25 22:59:39'),
(871, NULL, 3, '2023-07-26 01:59:49', '48.0188401', '29.3259361', '196, , KW', '2023-07-25 22:59:49', '2023-07-25 22:59:49'),
(872, NULL, 3, '2023-07-26 01:59:59', '48.0185929', '29.3259265', '196, , KW', '2023-07-25 22:59:59', '2023-07-25 22:59:59'),
(873, NULL, 3, '2023-07-26 02:00:09', '48.0188382', '29.3259362', '196, , KW', '2023-07-25 23:00:09', '2023-07-25 23:00:09'),
(874, NULL, 3, '2023-07-26 02:00:18', '48.0188477', '29.3259227', '196, , KW', '2023-07-25 23:00:18', '2023-07-25 23:00:18'),
(875, NULL, 3, '2023-07-26 02:00:30', '48.0188515', '29.325941', '196, , KW', '2023-07-25 23:00:30', '2023-07-25 23:00:30'),
(876, NULL, 3, '2023-07-26 02:00:39', '48.0188562', '29.3259299', '196, , KW', '2023-07-25 23:00:39', '2023-07-25 23:00:39'),
(877, NULL, 3, '2023-07-26 02:00:50', '48.0188641', '29.325925', '196, , KW', '2023-07-25 23:00:50', '2023-07-25 23:00:50'),
(878, NULL, 3, '2023-07-26 02:01:00', '48.0188727', '29.3259196', '196, , KW', '2023-07-25 23:01:00', '2023-07-25 23:01:00'),
(879, NULL, 3, '2023-07-26 02:01:09', '48.0188315', '29.3259804', '196, , KW', '2023-07-25 23:01:09', '2023-07-25 23:01:09'),
(880, NULL, 3, '2023-07-26 02:01:21', '48.0188426', '29.3259517', '196, , KW', '2023-07-25 23:01:21', '2023-07-25 23:01:21'),
(881, NULL, 3, '2023-07-26 02:01:29', '48.0188483', '29.3259456', '196, , KW', '2023-07-25 23:01:29', '2023-07-25 23:01:29'),
(882, NULL, 3, '2023-07-26 02:01:39', '48.0188715', '29.3259234', '196, , KW', '2023-07-25 23:01:39', '2023-07-25 23:01:39'),
(883, NULL, 3, '2023-07-26 02:01:49', '48.0188556', '29.3259345', '196, , KW', '2023-07-25 23:01:49', '2023-07-25 23:01:49'),
(884, NULL, 3, '2023-07-26 02:01:59', '48.01886', '29.3259407', '196, , KW', '2023-07-25 23:01:59', '2023-07-25 23:01:59'),
(885, NULL, 3, '2023-07-26 02:02:08', '48.0188642', '29.3259371', '196, , KW', '2023-07-25 23:02:08', '2023-07-25 23:02:08'),
(886, NULL, 3, '2023-07-26 02:02:18', '48.0188646', '29.3259195', '196, , KW', '2023-07-25 23:02:18', '2023-07-25 23:02:18'),
(887, NULL, 3, '2023-07-26 02:02:29', '48.0188549', '29.325928', '196, , KW', '2023-07-25 23:02:29', '2023-07-25 23:02:29'),
(888, NULL, 3, '2023-07-26 02:02:39', '48.0188603', '29.3259228', '196, , KW', '2023-07-25 23:02:39', '2023-07-25 23:02:39'),
(889, NULL, 3, '2023-07-26 02:02:52', '48.0188386', '29.3259551', '196, , KW', '2023-07-25 23:02:52', '2023-07-25 23:02:52'),
(890, NULL, 3, '2023-07-26 02:03:00', '48.0188482', '29.3259617', '196, , KW', '2023-07-25 23:03:00', '2023-07-25 23:03:00'),
(891, NULL, 3, '2023-08-10 03:53:32', '-7.09262', '31.7917017', 'Unknown Location Found', '2023-08-10 00:53:32', '2023-08-10 00:53:32'),
(892, NULL, 3, '2023-08-10 03:53:37', '-7.09262', '31.7917017', 'Unknown Location Found', '2023-08-10 00:53:37', '2023-08-10 00:53:37'),
(893, NULL, 3, '2023-08-10 03:53:42', '-7.09262', '31.7917017', 'Unknown Location Found', '2023-08-10 00:53:42', '2023-08-10 00:53:42'),
(894, NULL, 3, '2023-08-10 03:53:48', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 00:53:48', '2023-08-10 00:53:48'),
(895, NULL, 3, '2023-08-10 03:53:59', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 00:53:59', '2023-08-10 00:53:59'),
(896, NULL, 3, '2023-08-10 03:54:09', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 00:54:09', '2023-08-10 00:54:09'),
(897, NULL, 3, '2023-08-10 03:54:19', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 00:54:19', '2023-08-10 00:54:19'),
(898, NULL, 3, '2023-08-10 03:54:32', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 00:54:32', '2023-08-10 00:54:32'),
(899, NULL, 3, '2023-08-10 03:54:38', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 00:54:38', '2023-08-10 00:54:38'),
(900, NULL, 3, '2023-08-10 04:08:55', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:08:55', '2023-08-10 01:08:55'),
(901, NULL, 3, '2023-08-10 04:09:11', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:09:11', '2023-08-10 01:09:11'),
(902, NULL, 3, '2023-08-10 04:09:21', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:09:21', '2023-08-10 01:09:21'),
(903, NULL, 3, '2023-08-10 04:09:32', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:09:32', '2023-08-10 01:09:32'),
(904, NULL, 3, '2023-08-10 04:09:42', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:09:42', '2023-08-10 01:09:42'),
(905, NULL, 3, '2023-08-10 04:09:54', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:09:54', '2023-08-10 01:09:54'),
(906, NULL, 3, '2023-08-10 04:10:07', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:10:07', '2023-08-10 01:10:07'),
(907, NULL, 3, '2023-08-10 04:10:15', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:10:15', '2023-08-10 01:10:15'),
(908, NULL, 3, '2023-08-10 04:10:25', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:10:25', '2023-08-10 01:10:25'),
(909, NULL, 3, '2023-08-10 04:10:34', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:10:34', '2023-08-10 01:10:34'),
(910, NULL, 3, '2023-08-10 04:10:44', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:10:44', '2023-08-10 01:10:44'),
(911, NULL, 3, '2023-08-10 04:10:55', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:10:55', '2023-08-10 01:10:55'),
(912, NULL, 3, '2023-08-10 04:11:05', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:11:05', '2023-08-10 01:11:05'),
(913, NULL, 3, '2023-08-10 04:11:17', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:11:17', '2023-08-10 01:11:17'),
(914, NULL, 3, '2023-08-10 04:11:25', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:11:25', '2023-08-10 01:11:25'),
(915, NULL, 3, '2023-08-10 04:11:35', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:11:35', '2023-08-10 01:11:35'),
(916, NULL, 3, '2023-08-10 04:11:45', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:11:45', '2023-08-10 01:11:45'),
(917, NULL, 3, '2023-08-10 04:11:55', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:11:55', '2023-08-10 01:11:55'),
(918, NULL, 3, '2023-08-10 04:12:05', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:12:05', '2023-08-10 01:12:05'),
(919, NULL, 3, '2023-08-10 04:12:15', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:12:15', '2023-08-10 01:12:15'),
(920, NULL, 3, '2023-08-10 04:12:28', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:12:28', '2023-08-10 01:12:28'),
(921, NULL, 3, '2023-08-10 04:12:35', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:12:35', '2023-08-10 01:12:35'),
(922, NULL, 3, '2023-08-10 04:12:44', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:12:44', '2023-08-10 01:12:44'),
(923, NULL, 3, '2023-08-10 04:12:55', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:12:55', '2023-08-10 01:12:55'),
(924, NULL, 3, '2023-08-10 04:13:04', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:13:04', '2023-08-10 01:13:04'),
(925, NULL, 3, '2023-08-10 04:13:15', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:13:15', '2023-08-10 01:13:15'),
(926, NULL, 3, '2023-08-10 04:13:24', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:13:24', '2023-08-10 01:13:24'),
(927, NULL, 3, '2023-08-10 04:13:38', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:13:38', '2023-08-10 01:13:38'),
(928, NULL, 3, '2023-08-10 04:13:44', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:13:44', '2023-08-10 01:13:44'),
(929, NULL, 3, '2023-08-10 04:13:54', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:13:54', '2023-08-10 01:13:54'),
(930, NULL, 3, '2023-08-10 04:14:04', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:14:04', '2023-08-10 01:14:04'),
(931, NULL, 3, '2023-08-10 04:14:14', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:14:14', '2023-08-10 01:14:14'),
(932, NULL, 3, '2023-08-10 04:14:24', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:14:24', '2023-08-10 01:14:24'),
(933, NULL, 3, '2023-08-10 04:14:34', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:14:34', '2023-08-10 01:14:34'),
(934, NULL, 3, '2023-08-10 04:14:48', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:14:48', '2023-08-10 01:14:48'),
(935, NULL, 3, '2023-08-10 04:14:54', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:14:54', '2023-08-10 01:14:54'),
(936, NULL, 3, '2023-08-10 04:15:04', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:15:04', '2023-08-10 01:15:04'),
(937, NULL, 3, '2023-08-10 04:15:14', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:15:14', '2023-08-10 01:15:14'),
(938, NULL, 3, '2023-08-10 04:15:24', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:15:24', '2023-08-10 01:15:24'),
(939, NULL, 3, '2023-08-10 04:15:34', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:15:34', '2023-08-10 01:15:34'),
(940, NULL, 3, '2023-08-10 04:15:44', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:15:44', '2023-08-10 01:15:44'),
(941, NULL, 3, '2023-08-10 04:15:58', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:15:58', '2023-08-10 01:15:58'),
(942, NULL, 3, '2023-08-10 04:16:04', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:16:04', '2023-08-10 01:16:04'),
(943, NULL, 3, '2023-08-10 04:16:14', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:16:14', '2023-08-10 01:16:14'),
(944, NULL, 3, '2023-08-10 04:16:24', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:16:24', '2023-08-10 01:16:24'),
(945, NULL, 3, '2023-08-10 04:16:34', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:16:34', '2023-08-10 01:16:34'),
(946, NULL, 3, '2023-08-10 04:16:44', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:16:44', '2023-08-10 01:16:44'),
(947, NULL, 3, '2023-08-10 04:16:55', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:16:55', '2023-08-10 01:16:55'),
(948, NULL, 3, '2023-08-10 04:17:07', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:17:07', '2023-08-10 01:17:07'),
(949, NULL, 3, '2023-08-10 04:17:14', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:17:14', '2023-08-10 01:17:14'),
(950, NULL, 3, '2023-08-10 04:17:24', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:17:24', '2023-08-10 01:17:24'),
(951, NULL, 3, '2023-08-10 04:17:34', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:17:34', '2023-08-10 01:17:34'),
(952, NULL, 3, '2023-08-10 04:17:44', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:17:44', '2023-08-10 01:17:44'),
(953, NULL, 3, '2023-08-10 04:17:54', '-7.09262', '31.7917017', 'QWR4+MXC, El Kelaâ des Sraghna, MA', '2023-08-10 01:17:54', '2023-08-10 01:17:54'),
(954, NULL, 3, '2023-08-13 07:56:19', '101.6782995', '3.1269439', 'Jalan Bangsar Utama 1, , MY', '2023-08-13 04:56:19', '2023-08-13 04:56:19'),
(955, NULL, 3, '2023-08-13 07:56:31', '101.6783001', '3.1269458', 'Jalan Bangsar Utama 1, , MY', '2023-08-13 04:56:31', '2023-08-13 04:56:31'),
(956, NULL, 3, '2023-08-13 07:56:46', '101.6783001', '3.1269439', 'Jalan Bangsar Utama 1, , MY', '2023-08-13 04:56:46', '2023-08-13 04:56:46'),
(957, NULL, 3, '2023-08-13 07:57:01', '101.6783011', '3.12695', 'Jalan Bangsar Utama 1, , MY', '2023-08-13 04:57:01', '2023-08-13 04:57:01'),
(958, NULL, 3, '2023-08-13 07:57:10', '101.678303', '3.1269479', 'Jalan Bangsar Utama 1, , MY', '2023-08-13 04:57:10', '2023-08-13 04:57:10'),
(959, NULL, 3, '2023-08-13 07:57:21', '101.6783002', '3.1269439', 'Jalan Bangsar Utama 1, , MY', '2023-08-13 04:57:21', '2023-08-13 04:57:21'),
(960, NULL, 3, '2023-08-13 07:57:30', '101.6783037', '3.1269477', 'Jalan Bangsar Utama 1, , MY', '2023-08-13 04:57:30', '2023-08-13 04:57:30'),
(961, NULL, 3, '2023-08-13 07:57:41', '101.6783044', '3.126953', 'Jalan Bangsar Utama 1, , MY', '2023-08-13 04:57:41', '2023-08-13 04:57:41'),
(962, NULL, 3, '2023-08-13 07:57:50', '101.6782981', '3.1269442', 'Jalan Bangsar Utama 1, , MY', '2023-08-13 04:57:50', '2023-08-13 04:57:50'),
(963, NULL, 3, '2023-08-13 07:58:00', '101.6782997', '3.1269442', 'Jalan Bangsar Utama 1, , MY', '2023-08-13 04:58:00', '2023-08-13 04:58:00'),
(964, NULL, 3, '2023-08-13 07:58:11', '101.6782977', '3.1269443', 'Jalan Bangsar Utama 1, , MY', '2023-08-13 04:58:11', '2023-08-13 04:58:11'),
(965, NULL, 3, '2023-08-13 07:58:21', '101.6783007', '3.1269454', 'Jalan Bangsar Utama 1, , MY', '2023-08-13 04:58:21', '2023-08-13 04:58:21'),
(966, NULL, 3, '2023-09-09 11:03:24', '48.0187131', '29.3261504', '196, , KW', '2023-09-09 08:03:24', '2023-09-09 08:03:24'),
(967, NULL, 3, '2023-09-09 11:03:37', '48.0187369', '29.3261536', '196, , KW', '2023-09-09 08:03:37', '2023-09-09 08:03:37'),
(968, NULL, 3, '2023-09-09 11:03:47', '48.0184879', '29.3256136', 'الكويت‎, , KW', '2023-09-09 08:03:47', '2023-09-09 08:03:47'),
(969, NULL, 3, '2023-09-09 11:03:57', '48.0183524', '29.3253149', '82G9+59R, , KW', '2023-09-09 08:03:57', '2023-09-09 08:03:57'),
(970, NULL, 3, '2023-09-09 11:04:07', '48.0185879', '29.3256917', 'الكويت‎, , KW', '2023-09-09 08:04:07', '2023-09-09 08:04:07'),
(971, NULL, 3, '2023-09-09 11:04:09', '48.0185879', '29.3256917', 'الكويت‎, , KW', '2023-09-09 08:04:09', '2023-09-09 08:04:09'),
(972, NULL, 3, '2023-09-09 11:04:13', '48.0185879', '29.3256917', 'الكويت‎, , KW', '2023-09-09 08:04:13', '2023-09-09 08:04:13'),
(973, NULL, 3, '2023-09-09 11:04:23', '48.0185879', '29.3256917', 'الكويت‎, , KW', '2023-09-09 08:04:23', '2023-09-09 08:04:23'),
(974, NULL, 3, '2023-09-09 11:05:08', '48.0185879', '29.3256917', 'الكويت‎, , KW', '2023-09-09 08:05:08', '2023-09-09 08:05:08'),
(975, NULL, 3, '2023-09-09 11:06:02', '48.0185879', '29.3256917', 'الكويت‎, , KW', '2023-09-09 08:06:02', '2023-09-09 08:06:02'),
(976, NULL, 3, '2023-09-09 11:06:02', '48.0185879', '29.3256917', 'الكويت‎, , KW', '2023-09-09 08:06:02', '2023-09-09 08:06:02'),
(977, NULL, 3, '2023-09-09 11:07:48', '48.0185879', '29.3256917', 'الكويت‎, , KW', '2023-09-09 08:07:48', '2023-09-09 08:07:48'),
(978, NULL, 3, '2023-09-09 11:07:48', '48.0185879', '29.3256917', 'الكويت‎, , KW', '2023-09-09 08:07:48', '2023-09-09 08:07:48'),
(979, NULL, 3, '2023-09-09 11:07:48', '48.0185879', '29.3256917', 'الكويت‎, , KW', '2023-09-09 08:07:48', '2023-09-09 08:07:48'),
(980, NULL, 3, '2023-09-09 11:07:54', '48.0185879', '29.3256917', 'الكويت‎, , KW', '2023-09-09 08:07:54', '2023-09-09 08:07:54'),
(981, NULL, 3, '2023-09-09 11:08:24', '48.0186086', '29.325744', 'الكويت‎, , KW', '2023-09-09 08:08:24', '2023-09-09 08:08:24'),
(982, NULL, 3, '2023-09-09 11:09:19', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 08:09:19', '2023-09-09 08:09:19'),
(983, NULL, 3, '2023-09-09 11:09:40', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 08:09:40', '2023-09-09 08:09:40'),
(984, NULL, 3, '2023-09-09 11:11:27', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 08:11:27', '2023-09-09 08:11:27'),
(985, NULL, 3, '2023-09-09 11:26:26', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:26', '2023-09-09 08:26:26'),
(986, NULL, 3, '2023-09-09 11:26:26', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:26', '2023-09-09 08:26:26'),
(987, NULL, 3, '2023-09-09 11:26:26', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:26', '2023-09-09 08:26:26'),
(988, NULL, 3, '2023-09-09 11:26:26', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:26', '2023-09-09 08:26:26'),
(989, NULL, 3, '2023-09-09 11:26:26', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:26', '2023-09-09 08:26:26'),
(990, NULL, 3, '2023-09-09 11:26:26', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:26', '2023-09-09 08:26:26'),
(991, NULL, 3, '2023-09-09 11:26:26', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:26', '2023-09-09 08:26:26'),
(992, NULL, 3, '2023-09-09 11:26:26', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:26', '2023-09-09 08:26:26'),
(993, NULL, 3, '2023-09-09 11:26:26', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:26', '2023-09-09 08:26:26'),
(994, NULL, 3, '2023-09-09 11:26:26', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:26', '2023-09-09 08:26:26'),
(995, NULL, 3, '2023-09-09 11:26:26', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:26', '2023-09-09 08:26:26'),
(996, NULL, 3, '2023-09-09 11:26:26', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:26', '2023-09-09 08:26:26'),
(997, NULL, 3, '2023-09-09 11:26:26', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:26', '2023-09-09 08:26:26'),
(998, NULL, 3, '2023-09-09 11:26:26', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:26', '2023-09-09 08:26:26'),
(999, NULL, 3, '2023-09-09 11:26:27', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:27', '2023-09-09 08:26:27'),
(1000, NULL, 3, '2023-09-09 11:26:27', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:27', '2023-09-09 08:26:27'),
(1001, NULL, 3, '2023-09-09 11:26:27', '48.0144171', '29.3250804', '82G7+2QF, , KW', '2023-09-09 08:26:27', '2023-09-09 08:26:27'),
(1002, NULL, 3, '2023-09-09 11:26:32', '48.0142606', '29.3253301', 'شارع شرحبيل بن حسنة, , KW', '2023-09-09 08:26:32', '2023-09-09 08:26:32'),
(1003, NULL, 3, '2023-09-09 11:26:42', '48.0138973', '29.3259012', 'الكويت‎, , KW', '2023-09-09 08:26:42', '2023-09-09 08:26:42'),
(1004, NULL, 3, '2023-09-09 11:26:52', '48.013558', '29.3262135', '82G7+GF2, , KW', '2023-09-09 08:26:52', '2023-09-09 08:26:52'),
(1005, NULL, 3, '2023-09-09 11:27:02', '48.0132363', '29.3266168', '82G7+RC3, , KW', '2023-09-09 08:27:02', '2023-09-09 08:27:02'),
(1006, NULL, 3, '2023-09-09 11:27:12', '48.0129456', '29.3273566', '82G7+W3X, , KW', '2023-09-09 08:27:12', '2023-09-09 08:27:12'),
(1007, NULL, 3, '2023-09-09 11:27:22', '48.0124169', '29.3277366', '82H7+323, , KW', '2023-09-09 08:27:22', '2023-09-09 08:27:22'),
(1008, NULL, 3, '2023-09-09 11:27:32', '48.0121636', '29.3281635', '82H6+7R5, , KW', '2023-09-09 08:27:32', '2023-09-09 08:27:32'),
(1009, NULL, 3, '2023-09-09 11:27:42', '48.0125556', '29.3285203', '82H7+F33, , KW', '2023-09-09 08:27:42', '2023-09-09 08:27:42'),
(1010, NULL, 3, '2023-09-09 11:30:21', '48.0143351', '29.3292346', '82H7+MQG, , KW', '2023-09-09 08:30:21', '2023-09-09 08:30:21'),
(1011, NULL, 3, '2023-09-09 11:32:09', '48.0166157', '29.3297528', 'الكويت‎, , KW', '2023-09-09 08:32:09', '2023-09-09 08:32:09'),
(1012, NULL, 3, '2023-09-09 11:33:59', '48.0165838', '29.3301345', '196, , KW', '2023-09-09 08:33:59', '2023-09-09 08:33:59'),
(1013, NULL, 3, '2023-09-09 11:35:28', '48.0177885', '29.3325831', '82M9+334, , KW', '2023-09-09 08:35:28', '2023-09-09 08:35:28'),
(1014, NULL, 3, '2023-09-09 11:39:40', '48.0177474', '29.3327595', '82M9+34V, , KW', '2023-09-09 08:39:40', '2023-09-09 08:39:40'),
(1015, NULL, 3, '2023-09-09 11:41:57', '48.019637', '29.328791', '9204, , KW', '2023-09-09 08:41:57', '2023-09-09 08:41:57'),
(1016, NULL, 3, '2023-09-09 11:42:10', '48.0225214', '29.3294127', '82HF+R4P, , KW', '2023-09-09 08:42:10', '2023-09-09 08:42:10'),
(1017, NULL, 3, '2023-09-09 11:42:30', '48.0196334', '29.3287929', '9204, , KW', '2023-09-09 08:42:30', '2023-09-09 08:42:30'),
(1018, NULL, 3, '2023-09-09 11:42:40', '48.0231225', '29.3276575', '82HF+578, , KW', '2023-09-09 08:42:40', '2023-09-09 08:42:40'),
(1019, NULL, 3, '2023-09-09 11:42:50', '48.0233843', '29.326982', '82GF+J8W, , KW', '2023-09-09 08:42:50', '2023-09-09 08:42:50'),
(1020, NULL, 3, '2023-09-09 11:43:00', '48.0233364', '29.3267298', '82GF+J8W, , KW', '2023-09-09 08:43:00', '2023-09-09 08:43:00'),
(1021, NULL, 3, '2023-09-09 11:43:10', '48.0233028', '29.3266786', '82GF+J8W, , KW', '2023-09-09 08:43:10', '2023-09-09 08:43:10'),
(1022, NULL, 3, '2023-09-09 11:43:21', '48.0215744', '29.3248974', 'الجابرية, , KW', '2023-09-09 08:43:21', '2023-09-09 08:43:21'),
(1023, NULL, 3, '2023-09-09 11:43:30', '48.0214322', '29.3255465', 'الكويت‎, , KW', '2023-09-09 08:43:30', '2023-09-09 08:43:30'),
(1024, NULL, 3, '2023-09-09 11:43:40', '48.0201863', '29.3256274', '82GC+633, , KW', '2023-09-09 08:43:40', '2023-09-09 08:43:40'),
(1025, NULL, 3, '2023-09-09 11:43:50', '48.0193839', '29.3255733', '82G9+5M7, , KW', '2023-09-09 08:43:50', '2023-09-09 08:43:50'),
(1026, NULL, 3, '2023-09-09 11:44:07', '48.0178204', '29.3247598', 'طريق حسين بن علي الرومي, , KW', '2023-09-09 08:44:07', '2023-09-09 08:44:07'),
(1027, NULL, 3, '2023-09-09 11:45:12', '48.0152959', '29.3230279', '82F8+56X, , KW', '2023-09-09 08:45:12', '2023-09-09 08:45:12'),
(1028, NULL, 3, '2023-09-09 11:45:35', '48.0202951', '29.3255849', '82GC+633, , KW', '2023-09-09 08:45:35', '2023-09-09 08:45:35'),
(1029, NULL, 3, '2023-09-09 11:45:51', '48.0217627', '29.3249828', '82FC+XM7, , KW', '2023-09-09 08:45:51', '2023-09-09 08:45:51'),
(1030, NULL, 3, '2023-09-09 11:46:06', '48.02695', '29.3277483', '82HG+4PH, , KW', '2023-09-09 08:46:06', '2023-09-09 08:46:06'),
(1031, NULL, 3, '2023-09-09 11:46:24', '48.0312948', '29.3291849', '82HJ+PFF, , KW', '2023-09-09 08:46:24', '2023-09-09 08:46:24'),
(1032, NULL, 3, '2023-09-09 11:49:29', '48.0656255', '29.2984701', 'المدرسة البريطانية بالكويت سلوى, , KW', '2023-09-09 08:49:29', '2023-09-09 08:49:29'),
(1033, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1034, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1035, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1036, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1037, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1038, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1039, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1040, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1041, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1042, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1043, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1044, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1045, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1046, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1047, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1048, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1049, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1050, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1051, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1052, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1053, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1054, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1055, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1056, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1057, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1058, NULL, 3, '2023-09-09 12:02:27', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:27', '2023-09-09 09:02:27'),
(1059, NULL, 3, '2023-09-09 12:02:28', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:28', '2023-09-09 09:02:28'),
(1060, NULL, 3, '2023-09-09 12:02:28', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:28', '2023-09-09 09:02:28'),
(1061, NULL, 3, '2023-09-09 12:02:28', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:28', '2023-09-09 09:02:28'),
(1062, NULL, 3, '2023-09-09 12:02:28', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:28', '2023-09-09 09:02:28'),
(1063, NULL, 3, '2023-09-09 12:02:31', '48.0584959', '29.3030635', 'Bayan park, , KW', '2023-09-09 09:02:31', '2023-09-09 09:02:31'),
(1064, NULL, 3, '2023-09-09 12:02:42', '48.0582185', '29.3087799', '8355+FCX, , KW', '2023-09-09 09:02:42', '2023-09-09 09:02:42'),
(1065, NULL, 3, '2023-09-09 12:15:44', '48.0192059', '29.3297368', '82H9+VJ9, , KW', '2023-09-09 09:15:44', '2023-09-09 09:15:44'),
(1066, NULL, 3, '2023-09-09 12:15:44', '48.0192059', '29.3297368', '82H9+VJ9, , KW', '2023-09-09 09:15:44', '2023-09-09 09:15:44'),
(1067, NULL, 3, '2023-09-09 12:15:44', '48.0192059', '29.3297368', '82H9+VJ9, , KW', '2023-09-09 09:15:44', '2023-09-09 09:15:44'),
(1068, NULL, 3, '2023-09-09 12:15:44', '48.0192059', '29.3297368', '82H9+VJ9, , KW', '2023-09-09 09:15:44', '2023-09-09 09:15:44'),
(1069, NULL, 3, '2023-09-09 12:15:44', '48.0192059', '29.3297368', '82H9+VJ9, , KW', '2023-09-09 09:15:44', '2023-09-09 09:15:44'),
(1070, NULL, 3, '2023-09-09 12:15:44', '48.0192059', '29.3297368', '82H9+VJ9, , KW', '2023-09-09 09:15:44', '2023-09-09 09:15:44'),
(1071, NULL, 3, '2023-09-09 12:15:45', '48.0192059', '29.3297368', '82H9+VJ9, , KW', '2023-09-09 09:15:45', '2023-09-09 09:15:45'),
(1072, NULL, 3, '2023-09-09 12:15:45', '48.0192059', '29.3297368', '82H9+VJ9, , KW', '2023-09-09 09:15:45', '2023-09-09 09:15:45'),
(1073, NULL, 3, '2023-09-09 12:15:45', '48.0192059', '29.3297368', '82H9+VJ9, , KW', '2023-09-09 09:15:45', '2023-09-09 09:15:45'),
(1074, NULL, 3, '2023-09-09 12:19:49', '48.0187665', '29.330069', 'حولي, , KW', '2023-09-09 09:19:49', '2023-09-09 09:19:49'),
(1075, NULL, 3, '2023-09-09 12:20:30', '48.0187298', '29.330031', 'حولي, , KW', '2023-09-09 09:20:30', '2023-09-09 09:20:30'),
(1076, NULL, 3, '2023-09-09 12:21:44', '48.0185675', '29.3300564', 'حولي, , KW', '2023-09-09 09:21:44', '2023-09-09 09:21:44'),
(1077, NULL, 3, '2023-09-09 12:23:12', '48.0186982', '29.3301692', '82J9+4FF, , KW', '2023-09-09 09:23:12', '2023-09-09 09:23:12'),
(1078, NULL, 3, '2023-09-09 12:23:21', '48.0186974', '29.3301617', '82J9+4FF, , KW', '2023-09-09 09:23:21', '2023-09-09 09:23:21'),
(1079, NULL, 3, '2023-09-09 12:23:31', '48.0189352', '29.3298421', 'الكويت‎, , KW', '2023-09-09 09:23:31', '2023-09-09 09:23:31'),
(1080, NULL, 3, '2023-09-09 12:23:42', '48.0187941', '29.330167', '82J9+3GQ, , KW', '2023-09-09 09:23:42', '2023-09-09 09:23:42'),
(1081, NULL, 3, '2023-09-09 12:23:52', '48.0188924', '29.3302239', '82J9+3GQ, , KW', '2023-09-09 09:23:52', '2023-09-09 09:23:52'),
(1082, NULL, 3, '2023-09-09 12:24:02', '48.0192833', '29.3295364', '82H9+QPR, , KW', '2023-09-09 09:24:02', '2023-09-09 09:24:02'),
(1083, NULL, 3, '2023-09-09 12:24:12', '48.0192219', '29.3298897', 'مجمع علياء, , KW', '2023-09-09 09:24:12', '2023-09-09 09:24:12'),
(1084, NULL, 3, '2023-09-09 12:24:22', '48.0190688', '29.3300255', '82J9+2MP, , KW', '2023-09-09 09:24:22', '2023-09-09 09:24:22'),
(1085, NULL, 3, '2023-09-09 12:24:32', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:24:32', '2023-09-09 09:24:32'),
(1086, NULL, 3, '2023-09-09 12:24:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:24:40', '2023-09-09 09:24:40'),
(1087, NULL, 3, '2023-09-09 12:24:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:24:50', '2023-09-09 09:24:50'),
(1088, NULL, 3, '2023-09-09 12:25:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:25:00', '2023-09-09 09:25:00'),
(1089, NULL, 3, '2023-09-09 12:25:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:25:10', '2023-09-09 09:25:10'),
(1090, NULL, 3, '2023-09-09 12:25:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:25:20', '2023-09-09 09:25:20'),
(1091, NULL, 3, '2023-09-09 12:25:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:25:30', '2023-09-09 09:25:30'),
(1092, NULL, 3, '2023-09-09 12:25:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:25:40', '2023-09-09 09:25:40'),
(1093, NULL, 3, '2023-09-09 12:25:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:25:50', '2023-09-09 09:25:50'),
(1094, NULL, 3, '2023-09-09 12:26:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:26:00', '2023-09-09 09:26:00'),
(1095, NULL, 3, '2023-09-09 12:26:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:26:10', '2023-09-09 09:26:10'),
(1096, NULL, 3, '2023-09-09 12:26:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:26:20', '2023-09-09 09:26:20'),
(1097, NULL, 3, '2023-09-09 12:26:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:26:30', '2023-09-09 09:26:30'),
(1098, NULL, 3, '2023-09-09 12:26:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:26:40', '2023-09-09 09:26:40'),
(1099, NULL, 3, '2023-09-09 12:26:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:26:50', '2023-09-09 09:26:50'),
(1100, NULL, 3, '2023-09-09 12:27:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:27:00', '2023-09-09 09:27:00'),
(1101, NULL, 3, '2023-09-09 12:27:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:27:10', '2023-09-09 09:27:10'),
(1102, NULL, 3, '2023-09-09 12:27:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:27:20', '2023-09-09 09:27:20'),
(1103, NULL, 3, '2023-09-09 12:27:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:27:30', '2023-09-09 09:27:30'),
(1104, NULL, 3, '2023-09-09 12:27:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:27:40', '2023-09-09 09:27:40'),
(1105, NULL, 3, '2023-09-09 12:27:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:27:50', '2023-09-09 09:27:50'),
(1106, NULL, 3, '2023-09-09 12:28:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:28:00', '2023-09-09 09:28:00'),
(1107, NULL, 3, '2023-09-09 12:28:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:28:10', '2023-09-09 09:28:10'),
(1108, NULL, 3, '2023-09-09 12:28:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:28:20', '2023-09-09 09:28:20');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(1109, NULL, 3, '2023-09-09 12:28:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:28:30', '2023-09-09 09:28:30'),
(1110, NULL, 3, '2023-09-09 12:28:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:28:40', '2023-09-09 09:28:40'),
(1111, NULL, 3, '2023-09-09 12:28:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:28:50', '2023-09-09 09:28:50'),
(1112, NULL, 3, '2023-09-09 12:29:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:29:00', '2023-09-09 09:29:00'),
(1113, NULL, 3, '2023-09-09 12:29:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:29:10', '2023-09-09 09:29:10'),
(1114, NULL, 3, '2023-09-09 12:29:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:29:20', '2023-09-09 09:29:20'),
(1115, NULL, 3, '2023-09-09 12:29:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:29:30', '2023-09-09 09:29:30'),
(1116, NULL, 3, '2023-09-09 12:29:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:29:40', '2023-09-09 09:29:40'),
(1117, NULL, 3, '2023-09-09 12:29:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:29:50', '2023-09-09 09:29:50'),
(1118, NULL, 3, '2023-09-09 12:30:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:30:00', '2023-09-09 09:30:00'),
(1119, NULL, 3, '2023-09-09 12:30:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:30:10', '2023-09-09 09:30:10'),
(1120, NULL, 3, '2023-09-09 12:30:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:30:20', '2023-09-09 09:30:20'),
(1121, NULL, 3, '2023-09-09 12:30:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:30:30', '2023-09-09 09:30:30'),
(1122, NULL, 3, '2023-09-09 12:30:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:30:40', '2023-09-09 09:30:40'),
(1123, NULL, 3, '2023-09-09 12:30:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:30:50', '2023-09-09 09:30:50'),
(1124, NULL, 3, '2023-09-09 12:31:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:31:00', '2023-09-09 09:31:00'),
(1125, NULL, 3, '2023-09-09 12:31:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:31:10', '2023-09-09 09:31:10'),
(1126, NULL, 3, '2023-09-09 12:31:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:31:20', '2023-09-09 09:31:20'),
(1127, NULL, 3, '2023-09-09 12:31:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:31:30', '2023-09-09 09:31:30'),
(1128, NULL, 3, '2023-09-09 12:31:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:31:40', '2023-09-09 09:31:40'),
(1129, NULL, 3, '2023-09-09 12:31:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:31:50', '2023-09-09 09:31:50'),
(1130, NULL, 3, '2023-09-09 12:32:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:32:00', '2023-09-09 09:32:00'),
(1131, NULL, 3, '2023-09-09 12:32:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:32:10', '2023-09-09 09:32:10'),
(1132, NULL, 3, '2023-09-09 12:32:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:32:20', '2023-09-09 09:32:20'),
(1133, NULL, 3, '2023-09-09 12:32:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:32:30', '2023-09-09 09:32:30'),
(1134, NULL, 3, '2023-09-09 12:32:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:32:40', '2023-09-09 09:32:40'),
(1135, NULL, 3, '2023-09-09 12:32:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:32:50', '2023-09-09 09:32:50'),
(1136, NULL, 3, '2023-09-09 12:33:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:33:00', '2023-09-09 09:33:00'),
(1137, NULL, 3, '2023-09-09 12:33:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:33:10', '2023-09-09 09:33:10'),
(1138, NULL, 3, '2023-09-09 12:33:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:33:20', '2023-09-09 09:33:20'),
(1139, NULL, 3, '2023-09-09 12:33:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:33:30', '2023-09-09 09:33:30'),
(1140, NULL, 3, '2023-09-09 12:33:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:33:40', '2023-09-09 09:33:40'),
(1141, NULL, 3, '2023-09-09 12:33:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:33:50', '2023-09-09 09:33:50'),
(1142, NULL, 3, '2023-09-09 12:34:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:34:00', '2023-09-09 09:34:00'),
(1143, NULL, 3, '2023-09-09 12:34:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:34:10', '2023-09-09 09:34:10'),
(1144, NULL, 3, '2023-09-09 12:34:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:34:20', '2023-09-09 09:34:20'),
(1145, NULL, 3, '2023-09-09 12:34:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:34:30', '2023-09-09 09:34:30'),
(1146, NULL, 3, '2023-09-09 12:34:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:34:40', '2023-09-09 09:34:40'),
(1147, NULL, 3, '2023-09-09 12:34:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:34:50', '2023-09-09 09:34:50'),
(1148, NULL, 3, '2023-09-09 12:35:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:35:00', '2023-09-09 09:35:00'),
(1149, NULL, 3, '2023-09-09 12:35:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:35:10', '2023-09-09 09:35:10'),
(1150, NULL, 3, '2023-09-09 12:35:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:35:20', '2023-09-09 09:35:20'),
(1151, NULL, 3, '2023-09-09 12:35:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:35:30', '2023-09-09 09:35:30'),
(1152, NULL, 3, '2023-09-09 12:35:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:35:40', '2023-09-09 09:35:40'),
(1153, NULL, 3, '2023-09-09 12:35:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:35:50', '2023-09-09 09:35:50'),
(1154, NULL, 3, '2023-09-09 12:36:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:36:00', '2023-09-09 09:36:00'),
(1155, NULL, 3, '2023-09-09 12:36:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:36:10', '2023-09-09 09:36:10'),
(1156, NULL, 3, '2023-09-09 12:36:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:36:20', '2023-09-09 09:36:20'),
(1157, NULL, 3, '2023-09-09 12:36:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:36:30', '2023-09-09 09:36:30'),
(1158, NULL, 3, '2023-09-09 12:36:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:36:40', '2023-09-09 09:36:40'),
(1159, NULL, 3, '2023-09-09 12:36:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:36:50', '2023-09-09 09:36:50'),
(1160, NULL, 3, '2023-09-09 12:37:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:37:00', '2023-09-09 09:37:00'),
(1161, NULL, 3, '2023-09-09 12:37:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:37:10', '2023-09-09 09:37:10'),
(1162, NULL, 3, '2023-09-09 12:37:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:37:20', '2023-09-09 09:37:20'),
(1163, NULL, 3, '2023-09-09 12:37:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:37:30', '2023-09-09 09:37:30'),
(1164, NULL, 3, '2023-09-09 12:37:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:37:40', '2023-09-09 09:37:40'),
(1165, NULL, 3, '2023-09-09 12:37:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:37:50', '2023-09-09 09:37:50'),
(1166, NULL, 3, '2023-09-09 12:38:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:38:00', '2023-09-09 09:38:00'),
(1167, NULL, 3, '2023-09-09 12:38:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:38:10', '2023-09-09 09:38:10'),
(1168, NULL, 3, '2023-09-09 12:38:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:38:20', '2023-09-09 09:38:20'),
(1169, NULL, 3, '2023-09-09 12:38:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:38:30', '2023-09-09 09:38:30'),
(1170, NULL, 3, '2023-09-09 12:38:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:38:40', '2023-09-09 09:38:40'),
(1171, NULL, 3, '2023-09-09 12:38:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:38:50', '2023-09-09 09:38:50'),
(1172, NULL, 3, '2023-09-09 12:39:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:39:00', '2023-09-09 09:39:00'),
(1173, NULL, 3, '2023-09-09 12:39:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:39:10', '2023-09-09 09:39:10'),
(1174, NULL, 3, '2023-09-09 12:39:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:39:20', '2023-09-09 09:39:20'),
(1175, NULL, 3, '2023-09-09 12:39:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:39:30', '2023-09-09 09:39:30'),
(1176, NULL, 3, '2023-09-09 12:39:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:39:40', '2023-09-09 09:39:40'),
(1177, NULL, 3, '2023-09-09 12:39:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:39:50', '2023-09-09 09:39:50'),
(1178, NULL, 3, '2023-09-09 12:40:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:40:00', '2023-09-09 09:40:00'),
(1179, NULL, 3, '2023-09-09 12:40:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:40:10', '2023-09-09 09:40:10'),
(1180, NULL, 3, '2023-09-09 12:40:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:40:20', '2023-09-09 09:40:20'),
(1181, NULL, 3, '2023-09-09 12:40:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:40:30', '2023-09-09 09:40:30'),
(1182, NULL, 3, '2023-09-09 12:40:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:40:40', '2023-09-09 09:40:40'),
(1183, NULL, 3, '2023-09-09 12:40:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:40:50', '2023-09-09 09:40:50'),
(1184, NULL, 3, '2023-09-09 12:41:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:41:00', '2023-09-09 09:41:00'),
(1185, NULL, 3, '2023-09-09 12:41:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:41:10', '2023-09-09 09:41:10'),
(1186, NULL, 3, '2023-09-09 12:41:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:41:20', '2023-09-09 09:41:20'),
(1187, NULL, 3, '2023-09-09 12:41:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:41:30', '2023-09-09 09:41:30'),
(1188, NULL, 3, '2023-09-09 12:41:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:41:40', '2023-09-09 09:41:40'),
(1189, NULL, 3, '2023-09-09 12:41:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:41:50', '2023-09-09 09:41:50'),
(1190, NULL, 3, '2023-09-09 12:42:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:42:00', '2023-09-09 09:42:00'),
(1191, NULL, 3, '2023-09-09 12:42:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:42:10', '2023-09-09 09:42:10'),
(1192, NULL, 3, '2023-09-09 12:42:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:42:20', '2023-09-09 09:42:20'),
(1193, NULL, 3, '2023-09-09 12:42:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:42:30', '2023-09-09 09:42:30'),
(1194, NULL, 3, '2023-09-09 12:42:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:42:40', '2023-09-09 09:42:40'),
(1195, NULL, 3, '2023-09-09 12:42:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:42:50', '2023-09-09 09:42:50'),
(1196, NULL, 3, '2023-09-09 12:43:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:43:00', '2023-09-09 09:43:00'),
(1197, NULL, 3, '2023-09-09 12:43:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:43:10', '2023-09-09 09:43:10'),
(1198, NULL, 3, '2023-09-09 12:43:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:43:20', '2023-09-09 09:43:20'),
(1199, NULL, 3, '2023-09-09 12:43:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:43:30', '2023-09-09 09:43:30'),
(1200, NULL, 3, '2023-09-09 12:43:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:43:40', '2023-09-09 09:43:40'),
(1201, NULL, 3, '2023-09-09 12:43:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:43:50', '2023-09-09 09:43:50'),
(1202, NULL, 3, '2023-09-09 12:44:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:44:00', '2023-09-09 09:44:00'),
(1203, NULL, 3, '2023-09-09 12:44:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:44:10', '2023-09-09 09:44:10'),
(1204, NULL, 3, '2023-09-09 12:44:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:44:20', '2023-09-09 09:44:20'),
(1205, NULL, 3, '2023-09-09 12:44:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:44:30', '2023-09-09 09:44:30'),
(1206, NULL, 3, '2023-09-09 12:44:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:44:40', '2023-09-09 09:44:40'),
(1207, NULL, 3, '2023-09-09 12:44:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:44:50', '2023-09-09 09:44:50'),
(1208, NULL, 3, '2023-09-09 12:45:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:45:00', '2023-09-09 09:45:00'),
(1209, NULL, 3, '2023-09-09 12:45:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:45:10', '2023-09-09 09:45:10'),
(1210, NULL, 3, '2023-09-09 12:45:20', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:45:20', '2023-09-09 09:45:20'),
(1211, NULL, 3, '2023-09-09 12:45:30', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:45:30', '2023-09-09 09:45:30'),
(1212, NULL, 3, '2023-09-09 12:45:40', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:45:40', '2023-09-09 09:45:40'),
(1213, NULL, 3, '2023-09-09 12:45:50', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:45:50', '2023-09-09 09:45:50'),
(1214, NULL, 3, '2023-09-09 12:46:00', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:46:00', '2023-09-09 09:46:00'),
(1215, NULL, 3, '2023-09-09 12:46:18', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:46:18', '2023-09-09 09:46:18'),
(1216, NULL, 3, '2023-09-09 12:47:31', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:47:31', '2023-09-09 09:47:31'),
(1217, NULL, 3, '2023-09-09 12:48:53', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:48:53', '2023-09-09 09:48:53'),
(1218, NULL, 3, '2023-09-09 12:49:26', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:49:26', '2023-09-09 09:49:26'),
(1219, NULL, 3, '2023-09-09 12:52:38', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:52:38', '2023-09-09 09:52:38'),
(1220, NULL, 3, '2023-09-09 12:54:53', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:54:53', '2023-09-09 09:54:53'),
(1221, NULL, 3, '2023-09-09 12:55:03', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:55:03', '2023-09-09 09:55:03'),
(1222, NULL, 3, '2023-09-09 12:56:13', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:56:13', '2023-09-09 09:56:13'),
(1223, NULL, 3, '2023-09-09 12:56:23', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:56:23', '2023-09-09 09:56:23'),
(1224, NULL, 3, '2023-09-09 12:56:33', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:56:33', '2023-09-09 09:56:33'),
(1225, NULL, 3, '2023-09-09 12:56:43', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:56:43', '2023-09-09 09:56:43'),
(1226, NULL, 3, '2023-09-09 12:56:53', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:56:53', '2023-09-09 09:56:53'),
(1227, NULL, 3, '2023-09-09 12:57:03', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:57:03', '2023-09-09 09:57:03'),
(1228, NULL, 3, '2023-09-09 12:57:13', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:57:13', '2023-09-09 09:57:13'),
(1229, NULL, 3, '2023-09-09 12:57:23', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:57:23', '2023-09-09 09:57:23'),
(1230, NULL, 3, '2023-09-09 12:59:56', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 09:59:56', '2023-09-09 09:59:56'),
(1231, NULL, 3, '2023-09-09 13:00:18', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:00:18', '2023-09-09 10:00:18'),
(1232, NULL, 3, '2023-09-09 13:00:49', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:00:49', '2023-09-09 10:00:49'),
(1233, NULL, 3, '2023-09-09 13:01:39', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:01:39', '2023-09-09 10:01:39'),
(1234, NULL, 3, '2023-09-09 13:01:55', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:01:55', '2023-09-09 10:01:55'),
(1235, NULL, 3, '2023-09-09 13:02:05', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:02:05', '2023-09-09 10:02:05'),
(1236, NULL, 3, '2023-09-09 13:02:15', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:02:15', '2023-09-09 10:02:15'),
(1237, NULL, 3, '2023-09-09 13:02:25', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:02:25', '2023-09-09 10:02:25'),
(1238, NULL, 3, '2023-09-09 13:02:39', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:02:39', '2023-09-09 10:02:39'),
(1239, NULL, 3, '2023-09-09 13:04:51', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:04:51', '2023-09-09 10:04:51'),
(1240, NULL, 3, '2023-09-09 13:06:17', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:06:17', '2023-09-09 10:06:17'),
(1241, NULL, 3, '2023-09-09 13:06:45', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:06:45', '2023-09-09 10:06:45'),
(1242, NULL, 3, '2023-09-09 13:06:55', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:06:55', '2023-09-09 10:06:55'),
(1243, NULL, 3, '2023-09-09 13:07:05', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:07:05', '2023-09-09 10:07:05'),
(1244, NULL, 3, '2023-09-09 13:07:15', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:07:15', '2023-09-09 10:07:15'),
(1245, NULL, 3, '2023-09-09 13:07:25', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:07:25', '2023-09-09 10:07:25'),
(1246, NULL, 3, '2023-09-09 13:07:35', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:07:35', '2023-09-09 10:07:35'),
(1247, NULL, 3, '2023-09-09 13:07:45', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:07:45', '2023-09-09 10:07:45'),
(1248, NULL, 3, '2023-09-09 13:07:55', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:07:55', '2023-09-09 10:07:55'),
(1249, NULL, 3, '2023-09-09 13:08:05', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:08:05', '2023-09-09 10:08:05'),
(1250, NULL, 3, '2023-09-09 13:08:15', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:08:15', '2023-09-09 10:08:15'),
(1251, NULL, 3, '2023-09-09 13:08:25', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:08:25', '2023-09-09 10:08:25'),
(1252, NULL, 3, '2023-09-09 13:08:35', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:08:35', '2023-09-09 10:08:35'),
(1253, NULL, 3, '2023-09-09 13:08:45', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:08:45', '2023-09-09 10:08:45'),
(1254, NULL, 3, '2023-09-09 13:08:55', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:08:55', '2023-09-09 10:08:55'),
(1255, NULL, 3, '2023-09-09 13:09:05', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:09:05', '2023-09-09 10:09:05'),
(1256, NULL, 3, '2023-09-09 13:09:15', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:09:15', '2023-09-09 10:09:15'),
(1257, NULL, 3, '2023-09-09 13:09:25', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:09:25', '2023-09-09 10:09:25'),
(1258, NULL, 3, '2023-09-09 13:09:35', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:09:35', '2023-09-09 10:09:35'),
(1259, NULL, 3, '2023-09-09 13:09:45', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:09:45', '2023-09-09 10:09:45'),
(1260, NULL, 3, '2023-09-09 13:13:01', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:13:01', '2023-09-09 10:13:01'),
(1261, NULL, 3, '2023-09-09 13:16:01', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:16:01', '2023-09-09 10:16:01'),
(1262, NULL, 3, '2023-09-09 13:16:33', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:16:33', '2023-09-09 10:16:33'),
(1263, NULL, 3, '2023-09-09 13:16:43', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:16:43', '2023-09-09 10:16:43'),
(1264, NULL, 3, '2023-09-09 13:16:53', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:16:53', '2023-09-09 10:16:53'),
(1265, NULL, 3, '2023-09-09 13:17:03', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:17:03', '2023-09-09 10:17:03'),
(1266, NULL, 3, '2023-09-09 13:17:12', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:17:12', '2023-09-09 10:17:12'),
(1267, NULL, 3, '2023-09-09 13:17:22', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:17:22', '2023-09-09 10:17:22'),
(1268, NULL, 3, '2023-09-09 13:17:32', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:17:32', '2023-09-09 10:17:32'),
(1269, NULL, 3, '2023-09-09 13:17:42', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:17:42', '2023-09-09 10:17:42'),
(1270, NULL, 3, '2023-09-09 13:18:02', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:18:02', '2023-09-09 10:18:02'),
(1271, NULL, 3, '2023-09-09 13:19:18', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:19:18', '2023-09-09 10:19:18'),
(1272, NULL, 3, '2023-09-09 13:19:35', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:19:35', '2023-09-09 10:19:35'),
(1273, NULL, 3, '2023-09-09 13:19:54', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:19:54', '2023-09-09 10:19:54'),
(1274, NULL, 3, '2023-09-09 13:20:04', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:20:04', '2023-09-09 10:20:04'),
(1275, NULL, 3, '2023-09-09 13:20:14', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:20:14', '2023-09-09 10:20:14'),
(1276, NULL, 3, '2023-09-09 13:20:24', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:20:24', '2023-09-09 10:20:24'),
(1277, NULL, 3, '2023-09-09 13:20:34', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:20:34', '2023-09-09 10:20:34'),
(1278, NULL, 3, '2023-09-09 13:20:44', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:20:44', '2023-09-09 10:20:44'),
(1279, NULL, 3, '2023-09-09 13:20:56', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:20:56', '2023-09-09 10:20:56'),
(1280, NULL, 3, '2023-09-09 13:22:07', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:22:07', '2023-09-09 10:22:07'),
(1281, NULL, 3, '2023-09-09 13:24:27', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:24:27', '2023-09-09 10:24:27'),
(1282, NULL, 3, '2023-09-09 13:27:34', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:27:34', '2023-09-09 10:27:34'),
(1283, NULL, 3, '2023-09-09 13:27:44', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:27:44', '2023-09-09 10:27:44'),
(1284, NULL, 3, '2023-09-09 13:27:54', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:27:54', '2023-09-09 10:27:54'),
(1285, NULL, 3, '2023-09-09 13:28:04', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:28:04', '2023-09-09 10:28:04'),
(1286, NULL, 3, '2023-09-09 13:28:14', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:28:14', '2023-09-09 10:28:14'),
(1287, NULL, 3, '2023-09-09 13:28:24', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:28:24', '2023-09-09 10:28:24'),
(1288, NULL, 3, '2023-09-09 13:28:34', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:28:34', '2023-09-09 10:28:34'),
(1289, NULL, 3, '2023-09-09 13:28:44', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:28:44', '2023-09-09 10:28:44'),
(1290, NULL, 3, '2023-09-09 13:28:54', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:28:54', '2023-09-09 10:28:54'),
(1291, NULL, 3, '2023-09-09 13:29:04', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:29:04', '2023-09-09 10:29:04'),
(1292, NULL, 3, '2023-09-09 13:29:14', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:29:14', '2023-09-09 10:29:14'),
(1293, NULL, 3, '2023-09-09 13:29:24', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:29:24', '2023-09-09 10:29:24'),
(1294, NULL, 3, '2023-09-09 13:29:34', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:29:34', '2023-09-09 10:29:34'),
(1295, NULL, 3, '2023-09-09 13:29:44', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:29:44', '2023-09-09 10:29:44'),
(1296, NULL, 3, '2023-09-09 13:30:08', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:30:08', '2023-09-09 10:30:08'),
(1297, NULL, 3, '2023-09-09 13:30:33', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:30:33', '2023-09-09 10:30:33'),
(1298, NULL, 3, '2023-09-09 13:30:43', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:30:43', '2023-09-09 10:30:43'),
(1299, NULL, 3, '2023-09-09 13:31:52', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:31:52', '2023-09-09 10:31:52'),
(1300, NULL, 3, '2023-09-09 13:32:02', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:32:02', '2023-09-09 10:32:02'),
(1301, NULL, 3, '2023-09-09 13:32:12', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:32:12', '2023-09-09 10:32:12'),
(1302, NULL, 3, '2023-09-09 13:32:22', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:32:22', '2023-09-09 10:32:22'),
(1303, NULL, 3, '2023-09-09 13:32:32', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:32:32', '2023-09-09 10:32:32'),
(1304, NULL, 3, '2023-09-09 13:32:42', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:32:42', '2023-09-09 10:32:42'),
(1305, NULL, 3, '2023-09-09 13:32:52', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:32:52', '2023-09-09 10:32:52'),
(1306, NULL, 3, '2023-09-09 13:33:02', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:33:02', '2023-09-09 10:33:02'),
(1307, NULL, 3, '2023-09-09 13:33:12', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:33:12', '2023-09-09 10:33:12'),
(1308, NULL, 3, '2023-09-09 13:33:23', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:33:23', '2023-09-09 10:33:23'),
(1309, NULL, 3, '2023-09-09 13:33:32', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:33:32', '2023-09-09 10:33:32'),
(1310, NULL, 3, '2023-09-09 13:33:42', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:33:42', '2023-09-09 10:33:42'),
(1311, NULL, 3, '2023-09-09 13:34:21', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:34:21', '2023-09-09 10:34:21'),
(1312, NULL, 3, '2023-09-09 13:35:24', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:35:24', '2023-09-09 10:35:24'),
(1313, NULL, 3, '2023-09-09 13:36:21', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:36:21', '2023-09-09 10:36:21'),
(1314, NULL, 3, '2023-09-09 13:37:04', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:37:04', '2023-09-09 10:37:04'),
(1315, NULL, 3, '2023-09-09 13:37:53', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:37:53', '2023-09-09 10:37:53'),
(1316, NULL, 3, '2023-09-09 13:38:35', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:38:35', '2023-09-09 10:38:35'),
(1317, NULL, 3, '2023-09-09 13:39:45', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:39:45', '2023-09-09 10:39:45'),
(1318, NULL, 3, '2023-09-09 13:41:41', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:41:41', '2023-09-09 10:41:41'),
(1319, NULL, 3, '2023-09-09 13:46:13', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:46:13', '2023-09-09 10:46:13'),
(1320, NULL, 3, '2023-09-09 13:53:08', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:53:08', '2023-09-09 10:53:08'),
(1321, NULL, 3, '2023-09-09 13:53:41', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:53:41', '2023-09-09 10:53:41'),
(1322, NULL, 3, '2023-09-09 13:57:16', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:57:16', '2023-09-09 10:57:16'),
(1323, NULL, 3, '2023-09-09 13:57:31', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:57:31', '2023-09-09 10:57:31'),
(1324, NULL, 3, '2023-09-09 13:57:41', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:57:41', '2023-09-09 10:57:41'),
(1325, NULL, 3, '2023-09-09 13:57:51', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:57:51', '2023-09-09 10:57:51'),
(1326, NULL, 3, '2023-09-09 13:58:01', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:58:01', '2023-09-09 10:58:01'),
(1327, NULL, 3, '2023-09-09 13:58:11', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:58:11', '2023-09-09 10:58:11'),
(1328, NULL, 3, '2023-09-09 13:58:21', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:58:21', '2023-09-09 10:58:21'),
(1329, NULL, 3, '2023-09-09 13:58:31', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:58:31', '2023-09-09 10:58:31'),
(1330, NULL, 3, '2023-09-09 13:58:41', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:58:41', '2023-09-09 10:58:41'),
(1331, NULL, 3, '2023-09-09 13:59:14', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:59:14', '2023-09-09 10:59:14'),
(1332, NULL, 3, '2023-09-09 13:59:24', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:59:24', '2023-09-09 10:59:24'),
(1333, NULL, 3, '2023-09-09 13:59:34', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:59:34', '2023-09-09 10:59:34'),
(1334, NULL, 3, '2023-09-09 13:59:44', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:59:44', '2023-09-09 10:59:44'),
(1335, NULL, 3, '2023-09-09 13:59:54', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 10:59:54', '2023-09-09 10:59:54'),
(1336, NULL, 3, '2023-09-09 14:00:04', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 11:00:04', '2023-09-09 11:00:04'),
(1337, NULL, 3, '2023-09-09 14:00:14', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 11:00:14', '2023-09-09 11:00:14'),
(1338, NULL, 3, '2023-09-09 14:00:24', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 11:00:24', '2023-09-09 11:00:24'),
(1339, NULL, 3, '2023-09-09 14:00:41', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 11:00:41', '2023-09-09 11:00:41'),
(1340, NULL, 3, '2023-09-09 14:03:10', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 11:03:10', '2023-09-09 11:03:10'),
(1341, NULL, 3, '2023-09-09 14:05:52', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 11:05:52', '2023-09-09 11:05:52'),
(1342, NULL, 3, '2023-09-09 14:06:37', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 11:06:37', '2023-09-09 11:06:37'),
(1343, NULL, 3, '2023-09-09 14:07:16', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 11:07:16', '2023-09-09 11:07:16'),
(1344, NULL, 3, '2023-09-09 14:11:05', '48.0188618', '29.3301718', '82J9+3GQ, , KW', '2023-09-09 11:11:05', '2023-09-09 11:11:05'),
(1345, NULL, 3, '2023-09-09 14:13:27', '48.0188487', '29.3301557', '82J9+2HV, , KW', '2023-09-09 11:13:27', '2023-09-09 11:13:27'),
(1346, NULL, 3, '2023-09-09 14:13:37', '48.0188168', '29.3301814', '82J9+3GQ, , KW', '2023-09-09 11:13:37', '2023-09-09 11:13:37'),
(1347, NULL, 3, '2023-09-09 14:13:46', '48.0188332', '29.3302107', '82J9+3GQ, , KW', '2023-09-09 11:13:46', '2023-09-09 11:13:46'),
(1348, NULL, 3, '2023-09-09 14:13:56', '48.0188255', '29.3301879', '82J9+3GQ, , KW', '2023-09-09 11:13:56', '2023-09-09 11:13:56'),
(1349, NULL, 3, '2023-09-09 14:14:07', '48.0187856', '29.3302075', '82J9+3GQ, , KW', '2023-09-09 11:14:07', '2023-09-09 11:14:07'),
(1350, NULL, 3, '2023-09-09 14:14:16', '48.0188318', '29.3302105', '82J9+3GQ, , KW', '2023-09-09 11:14:16', '2023-09-09 11:14:16'),
(1351, NULL, 3, '2023-09-09 14:14:26', '48.0188285', '29.3302084', '82J9+3GQ, , KW', '2023-09-09 11:14:26', '2023-09-09 11:14:26'),
(1352, NULL, 3, '2023-09-09 14:14:36', '48.0188154', '29.3302034', '82J9+3GQ, , KW', '2023-09-09 11:14:36', '2023-09-09 11:14:36'),
(1353, NULL, 3, '2023-09-09 14:16:10', '48.0190351', '29.3300905', 'شارع عبدالله عبداللطيف العثمان, , KW', '2023-09-09 11:16:10', '2023-09-09 11:16:10'),
(1354, NULL, 3, '2023-09-09 14:17:07', '48.018149', '29.3298303', '82H9+V5H, , KW', '2023-09-09 11:17:07', '2023-09-09 11:17:07'),
(1355, NULL, 3, '2023-09-09 14:17:34', '48.0187958', '29.3299977', 'حولي, , KW', '2023-09-09 11:17:34', '2023-09-09 11:17:34'),
(1356, NULL, 3, '2023-09-09 14:22:17', '48.0188573', '29.3291504', '82H9+MHW, , KW', '2023-09-09 11:22:17', '2023-09-09 11:22:17'),
(1357, NULL, 3, '2023-09-09 14:28:10', '48.0187907', '29.3299562', 'حولي, , KW', '2023-09-09 11:28:10', '2023-09-09 11:28:10'),
(1358, NULL, 3, '2023-09-09 14:29:34', '48.0189555', '29.3301076', '82J9+2HV, , KW', '2023-09-09 11:29:34', '2023-09-09 11:29:34'),
(1359, NULL, 3, '2023-09-09 14:29:44', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:29:44', '2023-09-09 11:29:44'),
(1360, NULL, 3, '2023-09-09 14:29:52', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:29:52', '2023-09-09 11:29:52'),
(1361, NULL, 3, '2023-09-09 14:30:02', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:30:02', '2023-09-09 11:30:02'),
(1362, NULL, 3, '2023-09-09 14:30:12', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:30:12', '2023-09-09 11:30:12'),
(1363, NULL, 3, '2023-09-09 14:30:22', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:30:22', '2023-09-09 11:30:22'),
(1364, NULL, 3, '2023-09-09 14:30:32', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:30:32', '2023-09-09 11:30:32'),
(1365, NULL, 3, '2023-09-09 14:30:42', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:30:42', '2023-09-09 11:30:42'),
(1366, NULL, 3, '2023-09-09 14:32:37', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:32:37', '2023-09-09 11:32:37'),
(1367, NULL, 3, '2023-09-09 14:33:21', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:33:21', '2023-09-09 11:33:21'),
(1368, NULL, 3, '2023-09-09 14:33:44', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:33:44', '2023-09-09 11:33:44'),
(1369, NULL, 3, '2023-09-09 14:37:32', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:37:32', '2023-09-09 11:37:32'),
(1370, NULL, 3, '2023-09-09 14:37:33', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:37:33', '2023-09-09 11:37:33'),
(1371, NULL, 3, '2023-09-09 14:37:38', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:37:38', '2023-09-09 11:37:38'),
(1372, NULL, 3, '2023-09-09 14:39:41', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:39:41', '2023-09-09 11:39:41'),
(1373, NULL, 3, '2023-09-09 14:45:08', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:45:08', '2023-09-09 11:45:08'),
(1374, NULL, 3, '2023-09-09 14:45:52', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:45:52', '2023-09-09 11:45:52'),
(1375, NULL, 3, '2023-09-09 14:46:09', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:46:09', '2023-09-09 11:46:09'),
(1376, NULL, 3, '2023-09-09 14:48:44', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:48:44', '2023-09-09 11:48:44'),
(1377, NULL, 3, '2023-09-09 14:50:05', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:50:05', '2023-09-09 11:50:05'),
(1378, NULL, 3, '2023-09-09 14:51:48', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:51:48', '2023-09-09 11:51:48'),
(1379, NULL, 3, '2023-09-09 14:53:14', '48.0188923', '29.3301456', '82J9+2HV, , KW', '2023-09-09 11:53:14', '2023-09-09 11:53:14'),
(1380, NULL, 3, '2023-09-09 14:53:24', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 11:53:24', '2023-09-09 11:53:24'),
(1381, NULL, 3, '2023-09-09 14:53:34', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 11:53:34', '2023-09-09 11:53:34'),
(1382, NULL, 3, '2023-09-09 14:53:44', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 11:53:44', '2023-09-09 11:53:44'),
(1383, NULL, 3, '2023-09-09 14:54:48', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 11:54:48', '2023-09-09 11:54:48'),
(1384, NULL, 3, '2023-09-09 14:54:59', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 11:54:59', '2023-09-09 11:54:59'),
(1385, NULL, 3, '2023-09-09 14:56:28', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 11:56:28', '2023-09-09 11:56:28'),
(1386, NULL, 3, '2023-09-09 14:56:38', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 11:56:38', '2023-09-09 11:56:38'),
(1387, NULL, 3, '2023-09-09 14:56:48', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 11:56:48', '2023-09-09 11:56:48'),
(1388, NULL, 3, '2023-09-09 14:56:58', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 11:56:58', '2023-09-09 11:56:58'),
(1389, NULL, 3, '2023-09-09 14:57:08', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 11:57:08', '2023-09-09 11:57:08'),
(1390, NULL, 3, '2023-09-09 14:57:18', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 11:57:18', '2023-09-09 11:57:18'),
(1391, NULL, 3, '2023-09-09 14:57:28', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 11:57:28', '2023-09-09 11:57:28'),
(1392, NULL, 3, '2023-09-09 14:57:38', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 11:57:38', '2023-09-09 11:57:38'),
(1393, NULL, 3, '2023-09-09 14:59:53', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 11:59:53', '2023-09-09 11:59:53'),
(1394, NULL, 3, '2023-09-09 15:00:12', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:00:12', '2023-09-09 12:00:12'),
(1395, NULL, 3, '2023-09-09 15:00:37', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:00:37', '2023-09-09 12:00:37'),
(1396, NULL, 3, '2023-09-09 15:03:13', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:03:13', '2023-09-09 12:03:13'),
(1397, NULL, 3, '2023-09-09 15:05:09', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:05:09', '2023-09-09 12:05:09'),
(1398, NULL, 3, '2023-09-09 15:10:25', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:10:25', '2023-09-09 12:10:25'),
(1399, NULL, 3, '2023-09-09 15:13:45', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:13:45', '2023-09-09 12:13:45'),
(1400, NULL, 3, '2023-09-09 15:16:07', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:16:07', '2023-09-09 12:16:07'),
(1401, NULL, 3, '2023-09-09 15:16:17', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:16:17', '2023-09-09 12:16:17'),
(1402, NULL, 3, '2023-09-09 15:16:27', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:16:27', '2023-09-09 12:16:27'),
(1403, NULL, 3, '2023-09-09 15:16:37', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:16:37', '2023-09-09 12:16:37'),
(1404, NULL, 3, '2023-09-09 15:16:47', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:16:47', '2023-09-09 12:16:47'),
(1405, NULL, 3, '2023-09-09 15:16:57', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:16:57', '2023-09-09 12:16:57'),
(1406, NULL, 3, '2023-09-09 15:17:07', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:17:07', '2023-09-09 12:17:07'),
(1407, NULL, 3, '2023-09-09 15:17:17', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:17:17', '2023-09-09 12:17:17'),
(1408, NULL, 3, '2023-09-09 15:18:45', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:18:45', '2023-09-09 12:18:45'),
(1409, NULL, 3, '2023-09-09 15:19:20', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:19:20', '2023-09-09 12:19:20'),
(1410, NULL, 3, '2023-09-09 15:19:54', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:19:54', '2023-09-09 12:19:54'),
(1411, NULL, 3, '2023-09-09 15:20:45', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:20:45', '2023-09-09 12:20:45'),
(1412, NULL, 3, '2023-09-09 15:30:19', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:30:19', '2023-09-09 12:30:19'),
(1413, NULL, 3, '2023-09-09 15:40:10', '48.0188025', '29.330177', '82J9+3GQ, , KW', '2023-09-09 12:40:10', '2023-09-09 12:40:10'),
(1414, NULL, 3, '2023-09-09 15:40:31', '48.0191448', '29.3305302', '82J9+6J4, , KW', '2023-09-09 12:40:31', '2023-09-09 12:40:31'),
(1415, NULL, 3, '2023-09-09 15:41:36', '48.0188502', '29.3303514', '62, , KW', '2023-09-09 12:41:36', '2023-09-09 12:41:36'),
(1416, NULL, 3, '2023-09-09 15:41:50', '48.0188491', '29.3303577', '62, , KW', '2023-09-09 12:41:50', '2023-09-09 12:41:50'),
(1417, NULL, 3, '2023-09-09 15:44:24', '48.0234813', '29.3304106', 'شارع 246, , KW', '2023-09-09 12:44:24', '2023-09-09 12:44:24'),
(1418, NULL, 3, '2023-09-09 15:45:45', '48.0264231', '29.3331049', '82MG+7G4, , KW', '2023-09-09 12:45:45', '2023-09-09 12:45:45'),
(1419, NULL, 3, '2023-09-09 15:47:44', '48.0264232', '29.3332126', 'ماكدونالدز حولي قطعة رقم 8, , KW', '2023-09-09 12:47:44', '2023-09-09 12:47:44'),
(1420, NULL, 3, '2023-09-09 15:49:47', '48.0247934', '29.3296885', '82HF+WR5, , KW', '2023-09-09 12:49:47', '2023-09-09 12:49:47'),
(1421, NULL, 3, '2023-09-09 15:50:26', '48.0244106', '29.3289818', '82HF+FPR, , KW', '2023-09-09 12:50:26', '2023-09-09 12:50:26'),
(1422, NULL, 3, '2023-09-09 15:50:41', '48.0222611', '29.3281999', '82HC+9P5, , KW', '2023-09-09 12:50:41', '2023-09-09 12:50:41'),
(1423, NULL, 3, '2023-09-09 15:51:45', '48.0188294', '29.3260056', '196, , KW', '2023-09-09 12:51:45', '2023-09-09 12:51:45'),
(1424, NULL, 3, '2023-09-09 15:53:08', '48.0186709', '29.3258037', '82G9+9G6, , KW', '2023-09-09 12:53:08', '2023-09-09 12:53:08'),
(1425, NULL, 3, '2023-09-09 15:53:18', '48.0186709', '29.3258037', '82G9+9G6, , KW', '2023-09-09 12:53:18', '2023-09-09 12:53:18'),
(1426, NULL, 3, '2023-09-09 15:54:02', '48.0186709', '29.3258037', '82G9+9G6, , KW', '2023-09-09 12:54:02', '2023-09-09 12:54:02'),
(1427, NULL, 3, '2023-09-09 15:54:34', '48.0187232', '29.3261518', '196, , KW', '2023-09-09 12:54:34', '2023-09-09 12:54:34'),
(1428, NULL, 3, '2023-09-09 15:56:48', '48.0187054', '29.3261625', '82G9+FCP, , KW', '2023-09-09 12:56:48', '2023-09-09 12:56:48'),
(1429, NULL, 3, '2023-09-09 15:59:30', '48.0187246', '29.3261519', '196, , KW', '2023-09-09 12:59:30', '2023-09-09 12:59:30'),
(1430, NULL, 3, '2023-09-09 16:02:51', '48.0187521', '29.32611', '196, , KW', '2023-09-09 13:02:51', '2023-09-09 13:02:51'),
(1431, NULL, 3, '2023-09-09 16:04:05', '48.0187079', '29.3261506', '196, , KW', '2023-09-09 13:04:05', '2023-09-09 13:04:05'),
(1432, NULL, 3, '2023-09-09 16:04:39', '48.0187169', '29.3261601', '196, , KW', '2023-09-09 13:04:39', '2023-09-09 13:04:39'),
(1433, NULL, 3, '2023-09-09 16:08:40', '48.0187169', '29.3261601', '196, , KW', '2023-09-09 13:08:40', '2023-09-09 13:08:40'),
(1434, NULL, 3, '2023-09-09 16:13:07', '48.0187169', '29.3261601', '196, , KW', '2023-09-09 13:13:07', '2023-09-09 13:13:07'),
(1435, NULL, 3, '2023-09-09 16:15:54', '48.0187169', '29.3261601', '196, , KW', '2023-09-09 13:15:54', '2023-09-09 13:15:54'),
(1436, NULL, 3, '2023-09-09 16:16:07', '48.0187169', '29.3261601', '196, , KW', '2023-09-09 13:16:07', '2023-09-09 13:16:07'),
(1437, NULL, 3, '2023-09-09 16:19:00', '48.0187169', '29.3261601', '196, , KW', '2023-09-09 13:19:00', '2023-09-09 13:19:00'),
(1438, NULL, 3, '2023-09-09 16:22:35', '48.0187169', '29.3261601', '196, , KW', '2023-09-09 13:22:35', '2023-09-09 13:22:35'),
(1439, NULL, 3, '2023-09-09 16:29:28', '48.0187169', '29.3261601', '196, , KW', '2023-09-09 13:29:28', '2023-09-09 13:29:28'),
(1440, NULL, 3, '2023-09-09 16:34:39', '48.0187169', '29.3261601', '196, , KW', '2023-09-09 13:34:39', '2023-09-09 13:34:39'),
(1441, NULL, 3, '2023-09-09 16:34:49', '48.0187169', '29.3261601', '196, , KW', '2023-09-09 13:34:49', '2023-09-09 13:34:49'),
(1442, NULL, 3, '2023-09-09 16:34:59', '48.0187169', '29.3261601', '196, , KW', '2023-09-09 13:34:59', '2023-09-09 13:34:59'),
(1443, NULL, 3, '2023-09-09 16:35:10', '48.0186927', '29.3261316', '196, , KW', '2023-09-09 13:35:10', '2023-09-09 13:35:10'),
(1444, NULL, 3, '2023-09-09 16:35:19', '48.0186927', '29.3261316', '196, , KW', '2023-09-09 13:35:19', '2023-09-09 13:35:19'),
(1445, NULL, 3, '2023-09-09 16:35:29', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:35:29', '2023-09-09 13:35:29'),
(1446, NULL, 3, '2023-09-09 16:35:39', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:35:39', '2023-09-09 13:35:39'),
(1447, NULL, 3, '2023-09-09 16:35:49', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:35:49', '2023-09-09 13:35:49'),
(1448, NULL, 3, '2023-09-09 16:37:17', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:37:17', '2023-09-09 13:37:17'),
(1449, NULL, 3, '2023-09-09 16:37:27', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:37:27', '2023-09-09 13:37:27'),
(1450, NULL, 3, '2023-09-09 16:37:37', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:37:37', '2023-09-09 13:37:37'),
(1451, NULL, 3, '2023-09-09 16:37:47', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:37:47', '2023-09-09 13:37:47'),
(1452, NULL, 3, '2023-09-09 16:37:57', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:37:57', '2023-09-09 13:37:57'),
(1453, NULL, 3, '2023-09-09 16:38:07', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:38:07', '2023-09-09 13:38:07'),
(1454, NULL, 3, '2023-09-09 16:38:17', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:38:17', '2023-09-09 13:38:17'),
(1455, NULL, 3, '2023-09-09 16:38:27', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:38:27', '2023-09-09 13:38:27'),
(1456, NULL, 3, '2023-09-09 16:38:37', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:38:37', '2023-09-09 13:38:37'),
(1457, NULL, 3, '2023-09-09 16:38:47', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:38:47', '2023-09-09 13:38:47'),
(1458, NULL, 3, '2023-09-09 16:38:57', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:38:57', '2023-09-09 13:38:57'),
(1459, NULL, 3, '2023-09-09 16:39:10', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:39:10', '2023-09-09 13:39:10'),
(1460, NULL, 3, '2023-09-09 16:43:26', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:43:26', '2023-09-09 13:43:26'),
(1461, NULL, 3, '2023-09-09 16:43:55', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:43:55', '2023-09-09 13:43:55'),
(1462, NULL, 3, '2023-09-09 16:44:31', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:44:31', '2023-09-09 13:44:31'),
(1463, NULL, 3, '2023-09-09 16:54:48', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:54:48', '2023-09-09 13:54:48'),
(1464, NULL, 3, '2023-09-09 16:54:58', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:54:58', '2023-09-09 13:54:58'),
(1465, NULL, 3, '2023-09-09 16:56:48', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:56:48', '2023-09-09 13:56:48'),
(1466, NULL, 3, '2023-09-09 16:56:58', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:56:58', '2023-09-09 13:56:58'),
(1467, NULL, 3, '2023-09-09 16:57:16', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:57:16', '2023-09-09 13:57:16'),
(1468, NULL, 3, '2023-09-09 16:57:59', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:57:59', '2023-09-09 13:57:59'),
(1469, NULL, 3, '2023-09-09 16:58:12', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:58:12', '2023-09-09 13:58:12'),
(1470, NULL, 3, '2023-09-09 16:58:35', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:58:35', '2023-09-09 13:58:35'),
(1471, NULL, 3, '2023-09-09 16:59:00', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:59:00', '2023-09-09 13:59:00'),
(1472, NULL, 3, '2023-09-09 16:59:30', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 13:59:30', '2023-09-09 13:59:30'),
(1473, NULL, 3, '2023-09-09 17:05:08', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:05:08', '2023-09-09 14:05:08'),
(1474, NULL, 3, '2023-09-09 17:05:24', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:05:24', '2023-09-09 14:05:24'),
(1475, NULL, 3, '2023-09-09 17:06:16', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:06:16', '2023-09-09 14:06:16'),
(1476, NULL, 3, '2023-09-09 17:09:01', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:09:01', '2023-09-09 14:09:01'),
(1477, NULL, 3, '2023-09-09 17:10:16', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:10:16', '2023-09-09 14:10:16'),
(1478, NULL, 3, '2023-09-09 17:12:16', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:12:16', '2023-09-09 14:12:16'),
(1479, NULL, 3, '2023-09-09 17:14:03', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:14:03', '2023-09-09 14:14:03'),
(1480, NULL, 3, '2023-09-09 17:14:25', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:14:25', '2023-09-09 14:14:25'),
(1481, NULL, 3, '2023-09-09 17:14:35', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:14:35', '2023-09-09 14:14:35'),
(1482, NULL, 3, '2023-09-09 17:14:45', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:14:45', '2023-09-09 14:14:45'),
(1483, NULL, 3, '2023-09-09 17:14:55', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:14:55', '2023-09-09 14:14:55'),
(1484, NULL, 3, '2023-09-09 17:15:05', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:15:05', '2023-09-09 14:15:05'),
(1485, NULL, 3, '2023-09-09 17:15:15', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:15:15', '2023-09-09 14:15:15'),
(1486, NULL, 3, '2023-09-09 17:15:25', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:15:25', '2023-09-09 14:15:25'),
(1487, NULL, 3, '2023-09-09 17:15:35', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:15:35', '2023-09-09 14:15:35'),
(1488, NULL, 3, '2023-09-09 17:15:45', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:15:45', '2023-09-09 14:15:45'),
(1489, NULL, 3, '2023-09-09 17:15:55', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:15:55', '2023-09-09 14:15:55'),
(1490, NULL, 3, '2023-09-09 17:16:05', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:16:05', '2023-09-09 14:16:05'),
(1491, NULL, 3, '2023-09-09 17:16:15', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:16:15', '2023-09-09 14:16:15'),
(1492, NULL, 3, '2023-09-09 17:16:25', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:16:25', '2023-09-09 14:16:25'),
(1493, NULL, 3, '2023-09-09 17:16:34', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:16:34', '2023-09-09 14:16:34'),
(1494, NULL, 3, '2023-09-09 17:18:03', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:18:03', '2023-09-09 14:18:03');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(1495, NULL, 3, '2023-09-09 17:18:52', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:18:52', '2023-09-09 14:18:52'),
(1496, NULL, 3, '2023-09-09 17:28:31', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:28:31', '2023-09-09 14:28:31'),
(1497, NULL, 3, '2023-09-09 17:35:28', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:35:28', '2023-09-09 14:35:28'),
(1498, NULL, 3, '2023-09-09 17:35:38', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:35:38', '2023-09-09 14:35:38'),
(1499, NULL, 3, '2023-09-09 17:35:48', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:35:48', '2023-09-09 14:35:48'),
(1500, NULL, 3, '2023-09-09 17:35:58', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:35:58', '2023-09-09 14:35:58'),
(1501, NULL, 3, '2023-09-09 17:36:08', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:36:08', '2023-09-09 14:36:08'),
(1502, NULL, 3, '2023-09-09 17:36:18', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:36:18', '2023-09-09 14:36:18'),
(1503, NULL, 3, '2023-09-09 17:36:28', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:36:28', '2023-09-09 14:36:28'),
(1504, NULL, 3, '2023-09-09 17:36:38', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:36:38', '2023-09-09 14:36:38'),
(1505, NULL, 3, '2023-09-09 17:39:13', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:39:13', '2023-09-09 14:39:13'),
(1506, NULL, 3, '2023-09-09 17:39:37', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:39:37', '2023-09-09 14:39:37'),
(1507, NULL, 3, '2023-09-09 17:43:20', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:43:20', '2023-09-09 14:43:20'),
(1508, NULL, 3, '2023-09-09 17:43:29', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:43:29', '2023-09-09 14:43:29'),
(1509, NULL, 3, '2023-09-09 17:43:39', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:43:39', '2023-09-09 14:43:39'),
(1510, NULL, 3, '2023-09-09 17:43:49', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:43:49', '2023-09-09 14:43:49'),
(1511, NULL, 3, '2023-09-09 17:44:00', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:44:00', '2023-09-09 14:44:00'),
(1512, NULL, 3, '2023-09-09 17:44:10', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:44:10', '2023-09-09 14:44:10'),
(1513, NULL, 3, '2023-09-09 17:44:19', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:44:19', '2023-09-09 14:44:19'),
(1514, NULL, 3, '2023-09-09 17:44:29', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:44:29', '2023-09-09 14:44:29'),
(1515, NULL, 3, '2023-09-09 17:44:39', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:44:39', '2023-09-09 14:44:39'),
(1516, NULL, 3, '2023-09-09 17:44:49', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:44:49', '2023-09-09 14:44:49'),
(1517, NULL, 3, '2023-09-09 17:44:59', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:44:59', '2023-09-09 14:44:59'),
(1518, NULL, 3, '2023-09-09 17:45:11', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:45:11', '2023-09-09 14:45:11'),
(1519, NULL, 3, '2023-09-09 17:45:19', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:45:19', '2023-09-09 14:45:19'),
(1520, NULL, 3, '2023-09-09 17:45:29', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:45:29', '2023-09-09 14:45:29'),
(1521, NULL, 3, '2023-09-09 17:45:39', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:45:39', '2023-09-09 14:45:39'),
(1522, NULL, 3, '2023-09-09 17:45:49', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:45:49', '2023-09-09 14:45:49'),
(1523, NULL, 3, '2023-09-09 17:45:59', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:45:59', '2023-09-09 14:45:59'),
(1524, NULL, 3, '2023-09-09 17:46:09', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:46:09', '2023-09-09 14:46:09'),
(1525, NULL, 3, '2023-09-09 17:46:25', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:46:25', '2023-09-09 14:46:25'),
(1526, NULL, 3, '2023-09-09 17:46:35', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:46:35', '2023-09-09 14:46:35'),
(1527, NULL, 3, '2023-09-09 17:46:45', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:46:45', '2023-09-09 14:46:45'),
(1528, NULL, 3, '2023-09-09 17:46:55', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:46:55', '2023-09-09 14:46:55'),
(1529, NULL, 3, '2023-09-09 17:47:05', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:47:05', '2023-09-09 14:47:05'),
(1530, NULL, 3, '2023-09-09 17:49:48', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:49:48', '2023-09-09 14:49:48'),
(1531, NULL, 3, '2023-09-09 17:51:43', '48.0186933', '29.3261283', '196, , KW', '2023-09-09 14:51:43', '2023-09-09 14:51:43'),
(1532, NULL, 3, '2023-09-09 17:55:53', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 14:55:53', '2023-09-09 14:55:53'),
(1533, NULL, 3, '2023-09-09 17:56:03', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 14:56:03', '2023-09-09 14:56:03'),
(1534, NULL, 3, '2023-09-09 17:56:13', '48.0185897', '29.3258156', '82G9+893, , KW', '2023-09-09 14:56:13', '2023-09-09 14:56:13'),
(1535, NULL, 3, '2023-09-09 17:56:23', '48.0186103', '29.3257167', 'الكويت‎, , KW', '2023-09-09 14:56:23', '2023-09-09 14:56:23'),
(1536, NULL, 3, '2023-09-09 17:56:33', '48.0186121', '29.3257081', 'الكويت‎, , KW', '2023-09-09 14:56:33', '2023-09-09 14:56:33'),
(1537, NULL, 3, '2023-09-09 17:56:43', '48.0186017', '29.3257579', '82G9+893, , KW', '2023-09-09 14:56:43', '2023-09-09 14:56:43'),
(1538, NULL, 3, '2023-09-09 17:56:53', '48.018568', '29.3259199', '196, , KW', '2023-09-09 14:56:53', '2023-09-09 14:56:53'),
(1539, NULL, 3, '2023-09-09 17:57:03', '48.0185369', '29.3260694', '196, , KW', '2023-09-09 14:57:03', '2023-09-09 14:57:03'),
(1540, NULL, 3, '2023-09-09 18:01:11', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:01:11', '2023-09-09 15:01:11'),
(1541, NULL, 3, '2023-09-09 18:01:20', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:01:20', '2023-09-09 15:01:20'),
(1542, NULL, 3, '2023-09-09 18:01:30', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:01:30', '2023-09-09 15:01:30'),
(1543, NULL, 3, '2023-09-09 18:01:40', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:01:40', '2023-09-09 15:01:40'),
(1544, NULL, 3, '2023-09-09 18:01:50', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:01:50', '2023-09-09 15:01:50'),
(1545, NULL, 3, '2023-09-09 18:02:00', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:02:00', '2023-09-09 15:02:00'),
(1546, NULL, 3, '2023-09-09 18:02:10', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:02:10', '2023-09-09 15:02:10'),
(1547, NULL, 3, '2023-09-09 18:02:20', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:02:20', '2023-09-09 15:02:20'),
(1548, NULL, 3, '2023-09-09 18:02:30', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:02:30', '2023-09-09 15:02:30'),
(1549, NULL, 3, '2023-09-09 18:02:40', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:02:40', '2023-09-09 15:02:40'),
(1550, NULL, 3, '2023-09-09 18:02:50', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:02:50', '2023-09-09 15:02:50'),
(1551, NULL, 3, '2023-09-09 18:05:34', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:05:34', '2023-09-09 15:05:34'),
(1552, NULL, 3, '2023-09-09 18:05:54', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:05:54', '2023-09-09 15:05:54'),
(1553, NULL, 3, '2023-09-09 18:06:55', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:06:55', '2023-09-09 15:06:55'),
(1554, NULL, 3, '2023-09-09 18:15:18', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:15:18', '2023-09-09 15:15:18'),
(1555, NULL, 3, '2023-09-09 18:18:01', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:18:01', '2023-09-09 15:18:01'),
(1556, NULL, 3, '2023-09-09 18:18:11', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:18:11', '2023-09-09 15:18:11'),
(1557, NULL, 3, '2023-09-09 18:18:21', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:18:21', '2023-09-09 15:18:21'),
(1558, NULL, 3, '2023-09-09 18:22:04', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:22:04', '2023-09-09 15:22:04'),
(1559, NULL, 3, '2023-09-09 18:22:39', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:22:39', '2023-09-09 15:22:39'),
(1560, NULL, 3, '2023-09-09 18:29:24', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:29:24', '2023-09-09 15:29:24'),
(1561, NULL, 3, '2023-09-09 18:32:13', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:32:13', '2023-09-09 15:32:13'),
(1562, NULL, 3, '2023-09-09 18:32:23', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:32:23', '2023-09-09 15:32:23'),
(1563, NULL, 3, '2023-09-09 18:32:33', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:32:33', '2023-09-09 15:32:33'),
(1564, NULL, 3, '2023-09-09 18:32:43', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:32:43', '2023-09-09 15:32:43'),
(1565, NULL, 3, '2023-09-09 18:32:53', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:32:53', '2023-09-09 15:32:53'),
(1566, NULL, 3, '2023-09-09 18:33:03', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:33:03', '2023-09-09 15:33:03'),
(1567, NULL, 3, '2023-09-09 18:33:13', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:33:13', '2023-09-09 15:33:13'),
(1568, NULL, 3, '2023-09-09 18:33:23', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:33:23', '2023-09-09 15:33:23'),
(1569, NULL, 3, '2023-09-09 18:34:09', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 15:34:09', '2023-09-09 15:34:09'),
(1570, NULL, 3, '2023-09-09 18:35:34', '48.0185345', '29.3256231', 'الكويت‎, , KW', '2023-09-09 15:35:34', '2023-09-09 15:35:34'),
(1571, NULL, 3, '2023-09-09 18:35:48', '48.0192485', '29.3259426', '196, , KW', '2023-09-09 15:35:48', '2023-09-09 15:35:48'),
(1572, NULL, 3, '2023-09-09 18:37:12', '48.0189077', '29.3259522', '196, , KW', '2023-09-09 15:37:12', '2023-09-09 15:37:12'),
(1573, NULL, 3, '2023-09-09 18:37:29', '48.0186584', '29.3264959', '82G9+MGJ, , KW', '2023-09-09 15:37:29', '2023-09-09 15:37:29'),
(1574, NULL, 3, '2023-09-09 18:38:23', '48.0176614', '29.3287316', '82H9+C2M, , KW', '2023-09-09 15:38:23', '2023-09-09 15:38:23'),
(1575, NULL, 3, '2023-09-09 18:39:18', '48.0193601', '29.3294256', '82H9+QPV, , KW', '2023-09-09 15:39:18', '2023-09-09 15:39:18'),
(1576, NULL, 3, '2023-09-09 18:39:30', '48.0193121', '29.3297387', 'مجمع علياء, , KW', '2023-09-09 15:39:30', '2023-09-09 15:39:30'),
(1577, NULL, 3, '2023-09-09 18:40:25', '48.01944', '29.3299412', 'مجمع علياء, , KW', '2023-09-09 15:40:25', '2023-09-09 15:40:25'),
(1578, NULL, 3, '2023-09-09 18:44:27', '48.0194345', '29.3299425', 'مجمع علياء, , KW', '2023-09-09 15:44:27', '2023-09-09 15:44:27'),
(1579, NULL, 3, '2023-09-09 18:46:09', '48.0194345', '29.3299425', 'مجمع علياء, , KW', '2023-09-09 15:46:09', '2023-09-09 15:46:09'),
(1580, NULL, 3, '2023-09-09 18:50:15', '48.0194345', '29.3299425', 'مجمع علياء, , KW', '2023-09-09 15:50:15', '2023-09-09 15:50:15'),
(1581, NULL, 3, '2023-09-09 18:50:25', '48.0194345', '29.3299425', 'مجمع علياء, , KW', '2023-09-09 15:50:25', '2023-09-09 15:50:25'),
(1582, NULL, 3, '2023-09-09 18:50:35', '48.0194345', '29.3299425', 'مجمع علياء, , KW', '2023-09-09 15:50:35', '2023-09-09 15:50:35'),
(1583, NULL, 3, '2023-09-09 18:50:45', '48.0194345', '29.3299425', 'مجمع علياء, , KW', '2023-09-09 15:50:45', '2023-09-09 15:50:45'),
(1584, NULL, 3, '2023-09-09 18:50:55', '48.0194345', '29.3299425', 'مجمع علياء, , KW', '2023-09-09 15:50:55', '2023-09-09 15:50:55'),
(1585, NULL, 3, '2023-09-09 18:51:05', '48.0194345', '29.3299425', 'مجمع علياء, , KW', '2023-09-09 15:51:05', '2023-09-09 15:51:05'),
(1586, NULL, 3, '2023-09-09 18:51:15', '48.0194345', '29.3299425', 'مجمع علياء, , KW', '2023-09-09 15:51:15', '2023-09-09 15:51:15'),
(1587, NULL, 3, '2023-09-09 18:51:25', '48.0194345', '29.3299425', 'مجمع علياء, , KW', '2023-09-09 15:51:25', '2023-09-09 15:51:25'),
(1588, NULL, 3, '2023-09-09 18:51:52', '48.0193169', '29.3298036', 'مجمع علياء, , KW', '2023-09-09 15:51:52', '2023-09-09 15:51:52'),
(1589, NULL, 3, '2023-09-09 18:52:06', '48.0194174', '29.3298297', 'مجمع علياء, , KW', '2023-09-09 15:52:06', '2023-09-09 15:52:06'),
(1590, NULL, 3, '2023-09-09 18:52:19', '48.0194175', '29.3298175', 'مجمع علياء, , KW', '2023-09-09 15:52:19', '2023-09-09 15:52:19'),
(1591, NULL, 3, '2023-09-09 18:54:02', '48.0193346', '29.3293987', '82H9+QPF, , KW', '2023-09-09 15:54:02', '2023-09-09 15:54:02'),
(1592, NULL, 3, '2023-09-09 18:54:31', '48.0193346', '29.3293987', '82H9+QPF, , KW', '2023-09-09 15:54:31', '2023-09-09 15:54:31'),
(1593, NULL, 3, '2023-09-09 18:57:37', '48.0152442', '29.3238398', '82F8+H5X, , KW', '2023-09-09 15:57:37', '2023-09-09 15:57:37'),
(1594, NULL, 3, '2023-09-09 19:00:16', '48.015217', '29.3237982', '82F8+H5X, , KW', '2023-09-09 16:00:16', '2023-09-09 16:00:16'),
(1595, NULL, 3, '2023-09-09 19:01:42', '48.0074526', '29.3307501', '82J5+72X, , KW', '2023-09-09 16:01:42', '2023-09-09 16:01:42'),
(1596, NULL, 3, '2023-09-09 19:01:58', '48.0046975', '29.3346821', 'حولي, , KW', '2023-09-09 16:01:58', '2023-09-09 16:01:58'),
(1597, NULL, 3, '2023-09-09 19:02:14', '48.0046975', '29.3346821', 'حولي, , KW', '2023-09-09 16:02:14', '2023-09-09 16:02:14'),
(1598, NULL, 3, '2023-09-09 19:02:38', '47.9990155', '29.3424326', '8XRX+R29, , KW', '2023-09-09 16:02:38', '2023-09-09 16:02:38'),
(1599, NULL, 3, '2023-09-09 19:02:47', '47.9980867', '29.3480262', '2, , KW', '2023-09-09 16:02:47', '2023-09-09 16:02:47'),
(1600, NULL, 3, '2023-09-09 19:03:03', '47.9943714', '29.3501673', '9X2W+65H, , KW', '2023-09-09 16:03:03', '2023-09-09 16:03:03'),
(1601, NULL, 3, '2023-09-09 19:04:43', '47.9900372', '29.3654571', 'الكويت‎, , KW', '2023-09-09 16:04:43', '2023-09-09 16:04:43'),
(1602, NULL, 3, '2023-09-09 19:06:21', '47.9965386', '29.3715295', 'Balqees Street, , KW', '2023-09-09 16:06:21', '2023-09-09 16:06:21'),
(1603, NULL, 3, '2023-09-09 19:07:42', '47.9959194', '29.3724811', 'مدينة الكويت, , KW', '2023-09-09 16:07:42', '2023-09-09 16:07:42'),
(1604, NULL, 3, '2023-09-09 19:10:27', '47.9881237', '29.3721493', '9XCQ+V56, , KW', '2023-09-09 16:10:27', '2023-09-09 16:10:27'),
(1605, NULL, 3, '2023-09-09 19:13:14', '47.9900837', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:13:14', '2023-09-09 16:13:14'),
(1606, NULL, 3, '2023-09-09 19:14:55', '47.9900572', '29.3737592', '9XFR+F25, , KW', '2023-09-09 16:14:55', '2023-09-09 16:14:55'),
(1607, NULL, 3, '2023-09-09 19:21:40', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:21:40', '2023-09-09 16:21:40'),
(1608, NULL, 3, '2023-09-09 19:43:08', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:08', '2023-09-09 16:43:08'),
(1609, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1610, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1611, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1612, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1613, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1614, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1615, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1616, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1617, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1618, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1619, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1620, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1621, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1622, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1623, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1624, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1625, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1626, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1627, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1628, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1629, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1630, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1631, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1632, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1633, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1634, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1635, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1636, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1637, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1638, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1639, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1640, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1641, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1642, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1643, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1644, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1645, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1646, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1647, NULL, 3, '2023-09-09 19:43:09', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:09', '2023-09-09 16:43:09'),
(1648, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1649, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1650, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1651, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1652, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1653, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1654, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1655, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1656, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1657, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1658, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1659, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1660, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1661, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1662, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1663, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1664, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1665, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1666, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1667, NULL, 3, '2023-09-09 19:43:10', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:43:10', '2023-09-09 16:43:10'),
(1668, NULL, 3, '2023-09-09 19:44:17', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:44:17', '2023-09-09 16:44:17'),
(1669, NULL, 3, '2023-09-09 19:44:27', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:44:27', '2023-09-09 16:44:27'),
(1670, NULL, 3, '2023-09-09 19:44:42', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:44:42', '2023-09-09 16:44:42'),
(1671, NULL, 3, '2023-09-09 19:44:52', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:44:52', '2023-09-09 16:44:52'),
(1672, NULL, 3, '2023-09-09 19:45:02', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:45:02', '2023-09-09 16:45:02'),
(1673, NULL, 3, '2023-09-09 19:45:12', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:45:12', '2023-09-09 16:45:12'),
(1674, NULL, 3, '2023-09-09 19:45:22', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:45:22', '2023-09-09 16:45:22'),
(1675, NULL, 3, '2023-09-09 19:45:32', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:45:32', '2023-09-09 16:45:32'),
(1676, NULL, 3, '2023-09-09 19:45:42', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:45:42', '2023-09-09 16:45:42'),
(1677, NULL, 3, '2023-09-09 19:45:52', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:45:52', '2023-09-09 16:45:52'),
(1678, NULL, 3, '2023-09-09 19:46:02', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:46:02', '2023-09-09 16:46:02'),
(1679, NULL, 3, '2023-09-09 19:46:12', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:46:12', '2023-09-09 16:46:12'),
(1680, NULL, 3, '2023-09-09 19:46:22', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:46:22', '2023-09-09 16:46:22'),
(1681, NULL, 3, '2023-09-09 19:46:32', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:46:32', '2023-09-09 16:46:32'),
(1682, NULL, 3, '2023-09-09 19:46:42', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:46:42', '2023-09-09 16:46:42'),
(1683, NULL, 3, '2023-09-09 19:46:52', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:46:52', '2023-09-09 16:46:52'),
(1684, NULL, 3, '2023-09-09 19:47:02', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:47:02', '2023-09-09 16:47:02'),
(1685, NULL, 3, '2023-09-09 19:47:12', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:47:12', '2023-09-09 16:47:12'),
(1686, NULL, 3, '2023-09-09 19:47:22', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:47:22', '2023-09-09 16:47:22'),
(1687, NULL, 3, '2023-09-09 19:47:54', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:47:54', '2023-09-09 16:47:54'),
(1688, NULL, 3, '2023-09-09 19:48:04', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:48:04', '2023-09-09 16:48:04'),
(1689, NULL, 3, '2023-09-09 19:48:14', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:48:14', '2023-09-09 16:48:14'),
(1690, NULL, 3, '2023-09-09 19:48:24', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:48:24', '2023-09-09 16:48:24'),
(1691, NULL, 3, '2023-09-09 19:48:34', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:48:34', '2023-09-09 16:48:34'),
(1692, NULL, 3, '2023-09-09 19:48:44', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:48:44', '2023-09-09 16:48:44'),
(1693, NULL, 3, '2023-09-09 19:48:54', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:48:54', '2023-09-09 16:48:54'),
(1694, NULL, 3, '2023-09-09 19:49:04', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:49:04', '2023-09-09 16:49:04'),
(1695, NULL, 3, '2023-09-09 19:49:14', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:49:14', '2023-09-09 16:49:14'),
(1696, NULL, 3, '2023-09-09 19:49:24', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:49:24', '2023-09-09 16:49:24'),
(1697, NULL, 3, '2023-09-09 19:49:34', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:49:34', '2023-09-09 16:49:34'),
(1698, NULL, 3, '2023-09-09 19:49:44', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:49:44', '2023-09-09 16:49:44'),
(1699, NULL, 3, '2023-09-09 19:49:54', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:49:54', '2023-09-09 16:49:54'),
(1700, NULL, 3, '2023-09-09 19:50:04', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:50:04', '2023-09-09 16:50:04'),
(1701, NULL, 3, '2023-09-09 19:50:14', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:50:14', '2023-09-09 16:50:14'),
(1702, NULL, 3, '2023-09-09 19:50:24', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:50:24', '2023-09-09 16:50:24'),
(1703, NULL, 3, '2023-09-09 19:50:34', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:50:34', '2023-09-09 16:50:34'),
(1704, NULL, 3, '2023-09-09 19:50:44', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:50:44', '2023-09-09 16:50:44'),
(1705, NULL, 3, '2023-09-09 19:50:54', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:50:54', '2023-09-09 16:50:54'),
(1706, NULL, 3, '2023-09-09 19:51:04', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:51:04', '2023-09-09 16:51:04'),
(1707, NULL, 3, '2023-09-09 19:51:14', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:51:14', '2023-09-09 16:51:14'),
(1708, NULL, 3, '2023-09-09 19:53:52', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:53:52', '2023-09-09 16:53:52'),
(1709, NULL, 3, '2023-09-09 19:54:19', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:54:19', '2023-09-09 16:54:19'),
(1710, NULL, 3, '2023-09-09 19:54:31', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:54:31', '2023-09-09 16:54:31'),
(1711, NULL, 3, '2023-09-09 19:54:41', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:54:41', '2023-09-09 16:54:41'),
(1712, NULL, 3, '2023-09-09 19:54:51', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:54:51', '2023-09-09 16:54:51'),
(1713, NULL, 3, '2023-09-09 19:55:01', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:55:01', '2023-09-09 16:55:01'),
(1714, NULL, 3, '2023-09-09 19:55:11', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:55:11', '2023-09-09 16:55:11'),
(1715, NULL, 3, '2023-09-09 19:55:21', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:55:21', '2023-09-09 16:55:21'),
(1716, NULL, 3, '2023-09-09 19:55:31', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:55:31', '2023-09-09 16:55:31'),
(1717, NULL, 3, '2023-09-09 19:55:41', '47.9900587', '29.3737551', '9XFR+F25, , KW', '2023-09-09 16:55:41', '2023-09-09 16:55:41'),
(1718, NULL, 3, '2023-09-09 19:55:52', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 16:55:52', '2023-09-09 16:55:52'),
(1719, NULL, 3, '2023-09-09 19:56:01', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 16:56:01', '2023-09-09 16:56:01'),
(1720, NULL, 3, '2023-09-09 19:56:20', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 16:56:20', '2023-09-09 16:56:20'),
(1721, NULL, 3, '2023-09-09 19:56:57', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 16:56:57', '2023-09-09 16:56:57'),
(1722, NULL, 3, '2023-09-09 19:57:54', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 16:57:54', '2023-09-09 16:57:54'),
(1723, NULL, 3, '2023-09-09 19:58:44', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 16:58:44', '2023-09-09 16:58:44'),
(1724, NULL, 3, '2023-09-09 20:01:58', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:01:58', '2023-09-09 17:01:58'),
(1725, NULL, 3, '2023-09-09 20:02:08', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:02:08', '2023-09-09 17:02:08'),
(1726, NULL, 3, '2023-09-09 20:02:18', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:02:18', '2023-09-09 17:02:18'),
(1727, NULL, 3, '2023-09-09 20:02:28', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:02:28', '2023-09-09 17:02:28'),
(1728, NULL, 3, '2023-09-09 20:02:38', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:02:38', '2023-09-09 17:02:38'),
(1729, NULL, 3, '2023-09-09 20:02:48', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:02:48', '2023-09-09 17:02:48'),
(1730, NULL, 3, '2023-09-09 20:02:58', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:02:58', '2023-09-09 17:02:58'),
(1731, NULL, 3, '2023-09-09 20:03:08', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:03:08', '2023-09-09 17:03:08'),
(1732, NULL, 3, '2023-09-09 20:03:18', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:03:18', '2023-09-09 17:03:18'),
(1733, NULL, 3, '2023-09-09 20:03:28', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:03:28', '2023-09-09 17:03:28'),
(1734, NULL, 3, '2023-09-09 20:03:38', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:03:38', '2023-09-09 17:03:38'),
(1735, NULL, 3, '2023-09-09 20:04:34', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:04:34', '2023-09-09 17:04:34'),
(1736, NULL, 3, '2023-09-09 20:05:00', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:05:00', '2023-09-09 17:05:00'),
(1737, NULL, 3, '2023-09-09 20:05:19', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:05:19', '2023-09-09 17:05:19'),
(1738, NULL, 3, '2023-09-09 20:06:16', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:06:16', '2023-09-09 17:06:16'),
(1739, NULL, 3, '2023-09-09 20:06:43', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:06:43', '2023-09-09 17:06:43'),
(1740, NULL, 3, '2023-09-09 20:07:16', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:07:16', '2023-09-09 17:07:16'),
(1741, NULL, 3, '2023-09-09 20:07:26', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:07:26', '2023-09-09 17:07:26'),
(1742, NULL, 3, '2023-09-09 20:07:36', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:07:36', '2023-09-09 17:07:36'),
(1743, NULL, 3, '2023-09-09 20:07:46', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:07:46', '2023-09-09 17:07:46'),
(1744, NULL, 3, '2023-09-09 20:07:56', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:07:56', '2023-09-09 17:07:56'),
(1745, NULL, 3, '2023-09-09 20:08:06', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:08:06', '2023-09-09 17:08:06'),
(1746, NULL, 3, '2023-09-09 20:08:15', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:08:15', '2023-09-09 17:08:15'),
(1747, NULL, 3, '2023-09-09 20:08:26', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:08:26', '2023-09-09 17:08:26'),
(1748, NULL, 3, '2023-09-09 20:09:47', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:09:47', '2023-09-09 17:09:47'),
(1749, NULL, 3, '2023-09-09 20:10:00', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:10:00', '2023-09-09 17:10:00'),
(1750, NULL, 3, '2023-09-09 20:10:14', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:10:14', '2023-09-09 17:10:14'),
(1751, NULL, 3, '2023-09-09 20:10:37', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:10:37', '2023-09-09 17:10:37'),
(1752, NULL, 3, '2023-09-09 20:11:07', '48.0854665', '29.2484502', 'الكويت‎, , KW', '2023-09-09 17:11:07', '2023-09-09 17:11:07'),
(1753, NULL, 3, '2023-09-09 20:12:13', '48.068362', '29.2940583', 'ثانوية فهد السالم للبنين قطعة رقم 6, , KW', '2023-09-09 17:12:13', '2023-09-09 17:12:13'),
(1754, NULL, 3, '2023-09-09 20:12:24', '48.0671923', '29.2972097', 'سلوى, , KW', '2023-09-09 17:12:24', '2023-09-09 17:12:24'),
(1755, NULL, 3, '2023-09-09 20:12:33', '48.0671923', '29.2972097', 'سلوى, , KW', '2023-09-09 17:12:33', '2023-09-09 17:12:33'),
(1756, NULL, 3, '2023-09-09 20:12:43', '48.0671923', '29.2972097', 'سلوى, , KW', '2023-09-09 17:12:43', '2023-09-09 17:12:43'),
(1757, NULL, 3, '2023-09-09 20:12:53', '48.0671923', '29.2972097', 'سلوى, , KW', '2023-09-09 17:12:53', '2023-09-09 17:12:53'),
(1758, NULL, 3, '2023-09-09 20:13:04', '48.0582291', '29.3087835', '8355+FCX, , KW', '2023-09-09 17:13:04', '2023-09-09 17:13:04'),
(1759, NULL, 3, '2023-09-09 20:13:13', '48.0582279', '29.3087824', '8355+FCX, , KW', '2023-09-09 17:13:13', '2023-09-09 17:13:13'),
(1760, NULL, 3, '2023-09-09 20:13:23', '48.058227', '29.3087815', '8355+FCX, , KW', '2023-09-09 17:13:23', '2023-09-09 17:13:23'),
(1761, NULL, 3, '2023-09-09 20:13:34', '48.0582262', '29.3087808', '8355+FCX, , KW', '2023-09-09 17:13:34', '2023-09-09 17:13:34'),
(1762, NULL, 3, '2023-09-09 20:13:44', '48.0500024', '29.3160201', '2, , KW', '2023-09-09 17:13:44', '2023-09-09 17:13:44'),
(1763, NULL, 3, '2023-09-09 20:13:53', '48.0500024', '29.3160201', '2, , KW', '2023-09-09 17:13:53', '2023-09-09 17:13:53'),
(1764, NULL, 3, '2023-09-09 20:14:03', '48.0500024', '29.3160201', '2, , KW', '2023-09-09 17:14:03', '2023-09-09 17:14:03'),
(1765, NULL, 3, '2023-09-09 20:14:14', '48.0488879', '29.3187325', '6, , KW', '2023-09-09 17:14:14', '2023-09-09 17:14:14'),
(1766, NULL, 3, '2023-09-09 20:14:24', '48.0476846', '29.3218223', 'السالمية, , KW', '2023-09-09 17:14:24', '2023-09-09 17:14:24'),
(1767, NULL, 3, '2023-09-09 20:14:34', '48.0476846', '29.3218223', 'السالمية, , KW', '2023-09-09 17:14:34', '2023-09-09 17:14:34'),
(1768, NULL, 3, '2023-09-09 20:14:44', '48.0459181', '29.3240631', '82FW+P92, , KW', '2023-09-09 17:14:44', '2023-09-09 17:14:44'),
(1769, NULL, 3, '2023-09-09 20:14:54', '48.0453547', '29.324593', '82FW+R92, , KW', '2023-09-09 17:14:54', '2023-09-09 17:14:54'),
(1770, NULL, 3, '2023-09-09 20:15:04', '48.0446673', '29.3253886', '82GV+2XQ, , KW', '2023-09-09 17:15:04', '2023-09-09 17:15:04'),
(1771, NULL, 3, '2023-09-09 20:15:14', '48.0435275', '29.326198', '82GV+JMM, , KW', '2023-09-09 17:15:14', '2023-09-09 17:15:14'),
(1772, NULL, 3, '2023-09-09 20:15:24', '48.0426245', '29.3276139', '82HV+555, , KW', '2023-09-09 17:15:24', '2023-09-09 17:15:24'),
(1773, NULL, 3, '2023-09-09 20:15:34', '48.0417977', '29.3298759', '82HR+VQC, , KW', '2023-09-09 17:15:34', '2023-09-09 17:15:34'),
(1774, NULL, 3, '2023-09-09 20:15:44', '48.0423191', '29.3301284', '71, , KW', '2023-09-09 17:15:44', '2023-09-09 17:15:44'),
(1775, NULL, 3, '2023-09-09 20:15:54', '48.0438268', '29.3308365', '89, , KW', '2023-09-09 17:15:54', '2023-09-09 17:15:54'),
(1776, NULL, 3, '2023-09-09 20:16:04', '48.0448442', '29.3322231', '19, , KW', '2023-09-09 17:16:04', '2023-09-09 17:16:04'),
(1777, NULL, 3, '2023-09-09 20:16:14', '48.0479329', '29.3317809', 'السالمية, , KW', '2023-09-09 17:16:14', '2023-09-09 17:16:14'),
(1778, NULL, 3, '2023-09-09 20:16:24', '48.0485548', '29.3319423', 'السالمية, , KW', '2023-09-09 17:16:24', '2023-09-09 17:16:24'),
(1779, NULL, 3, '2023-09-09 20:16:34', '48.0499223', '29.3318763', '83J2+M3V, , KW', '2023-09-09 17:16:34', '2023-09-09 17:16:34'),
(1780, NULL, 3, '2023-09-09 20:16:45', '48.0508683', '29.3323068', '83J2+V6G, , KW', '2023-09-09 17:16:45', '2023-09-09 17:16:45'),
(1781, NULL, 3, '2023-09-09 20:16:54', '48.0505239', '29.3318938', '83J2+V6G, , KW', '2023-09-09 17:16:54', '2023-09-09 17:16:54'),
(1782, NULL, 3, '2023-09-09 20:17:04', '48.0504825', '29.331811', '83J2+M3V, , KW', '2023-09-09 17:17:04', '2023-09-09 17:17:04'),
(1783, NULL, 3, '2023-09-09 20:17:14', '48.058452', '29.3337288', '83M5+G98, , KW', '2023-09-09 17:17:14', '2023-09-09 17:17:14'),
(1784, NULL, 3, '2023-09-09 20:17:24', '48.058452', '29.3337288', '83M5+G98, , KW', '2023-09-09 17:17:24', '2023-09-09 17:17:24'),
(1785, NULL, 3, '2023-09-09 20:17:34', '48.0584494', '29.3337279', '83M5+G98, , KW', '2023-09-09 17:17:34', '2023-09-09 17:17:34'),
(1786, NULL, 3, '2023-09-09 20:17:43', '48.0584483', '29.3337264', '83M5+G98, , KW', '2023-09-09 17:17:43', '2023-09-09 17:17:43'),
(1787, NULL, 3, '2023-09-09 20:17:53', '48.058445', '29.3337257', '83M5+G98, , KW', '2023-09-09 17:17:53', '2023-09-09 17:17:53'),
(1788, NULL, 3, '2023-09-09 20:18:04', '48.0584447', '29.3337259', '83M5+G98, , KW', '2023-09-09 17:18:04', '2023-09-09 17:18:04'),
(1789, NULL, 3, '2023-09-09 20:18:14', '48.050315', '29.3317833', '83J2+M3V, , KW', '2023-09-09 17:18:14', '2023-09-09 17:18:14'),
(1790, NULL, 3, '2023-09-09 20:18:24', '48.0523375', '29.3334071', 'السالمية, , KW', '2023-09-09 17:18:24', '2023-09-09 17:18:24'),
(1791, NULL, 3, '2023-09-09 20:18:34', '48.0525903', '29.3334247', 'Fourth Ring Road, , KW', '2023-09-09 17:18:34', '2023-09-09 17:18:34'),
(1792, NULL, 3, '2023-09-09 20:18:44', '48.0584506', '29.3337268', '83M5+G98, , KW', '2023-09-09 17:18:44', '2023-09-09 17:18:44'),
(1793, NULL, 3, '2023-09-09 20:18:54', '48.0545349', '29.3332275', '83M3+7QQ, , KW', '2023-09-09 17:18:54', '2023-09-09 17:18:54'),
(1794, NULL, 3, '2023-09-09 20:19:03', '48.0584512', '29.3337271', '83M5+G98, , KW', '2023-09-09 17:19:03', '2023-09-09 17:19:03'),
(1795, NULL, 3, '2023-09-09 20:19:13', '48.0584482', '29.3337261', '83M5+G98, , KW', '2023-09-09 17:19:13', '2023-09-09 17:19:13'),
(1796, NULL, 3, '2023-09-09 20:19:27', '48.0532701', '29.3334709', 'الكويت‎, , KW', '2023-09-09 17:19:27', '2023-09-09 17:19:27'),
(1797, NULL, 3, '2023-09-09 20:20:34', '48.0584519', '29.3337284', '83M5+G98, , KW', '2023-09-09 17:20:34', '2023-09-09 17:20:34'),
(1798, NULL, 3, '2023-09-09 20:20:44', '48.058452', '29.3337283', '83M5+G98, , KW', '2023-09-09 17:20:44', '2023-09-09 17:20:44'),
(1799, NULL, 3, '2023-09-09 20:20:54', '48.058452', '29.3337282', '83M5+G98, , KW', '2023-09-09 17:20:54', '2023-09-09 17:20:54'),
(1800, NULL, 3, '2023-09-09 20:21:05', '48.0533588', '29.3335011', 'الكويت‎, , KW', '2023-09-09 17:21:05', '2023-09-09 17:21:05'),
(1801, NULL, 3, '2023-09-09 20:21:14', '48.0539793', '29.3333975', '83M3+7JQ, , KW', '2023-09-09 17:21:14', '2023-09-09 17:21:14'),
(1802, NULL, 3, '2023-09-09 20:21:24', '48.0539418', '29.334148', '83M3+JJX, , KW', '2023-09-09 17:21:24', '2023-09-09 17:21:24'),
(1803, NULL, 3, '2023-09-09 20:21:35', '48.0538241', '29.335102', 'شركة مروش للأغذية, , KW', '2023-09-09 17:21:35', '2023-09-09 17:21:35'),
(1804, NULL, 3, '2023-09-09 20:21:44', '48.0537473', '29.3355675', 'Etihad Medical Center, , KW', '2023-09-09 17:21:44', '2023-09-09 17:21:44'),
(1805, NULL, 3, '2023-09-09 20:22:04', '48.0551894', '29.336692', 'Leen Complex, , KW', '2023-09-09 17:22:04', '2023-09-09 17:22:04'),
(1806, NULL, 3, '2023-09-09 20:23:15', '48.062507', '29.3399308', 'الكويت‎, , KW', '2023-09-09 17:23:15', '2023-09-09 17:23:15'),
(1807, NULL, 3, '2023-09-09 20:27:19', '48.0810011', '29.344572', '83VJ+R9Q, , KW', '2023-09-09 17:27:19', '2023-09-09 17:27:19'),
(1808, NULL, 3, '2023-09-09 20:29:20', '48.081012', '29.3445592', '83VJ+R9Q, , KW', '2023-09-09 17:29:20', '2023-09-09 17:29:20'),
(1809, NULL, 3, '2023-09-09 20:29:29', '48.0810493', '29.3445193', '83VJ+R94, , KW', '2023-09-09 17:29:29', '2023-09-09 17:29:29'),
(1810, NULL, 3, '2023-09-09 20:29:39', '48.0810519', '29.3445745', '83VJ+R9Q, , KW', '2023-09-09 17:29:39', '2023-09-09 17:29:39'),
(1811, NULL, 3, '2023-09-09 20:29:48', '48.081', '29.3445847', '83VJ+R9Q, , KW', '2023-09-09 17:29:48', '2023-09-09 17:29:48'),
(1812, NULL, 3, '2023-09-09 20:29:58', '48.0809952', '29.3445623', '83VJ+R9Q, , KW', '2023-09-09 17:29:58', '2023-09-09 17:29:58'),
(1813, NULL, 3, '2023-09-09 20:30:09', '48.0809796', '29.3446082', '83VJ+R9Q, , KW', '2023-09-09 17:30:09', '2023-09-09 17:30:09'),
(1814, NULL, 3, '2023-09-09 20:30:18', '48.0810497', '29.3445626', '83VJ+R9Q, , KW', '2023-09-09 17:30:18', '2023-09-09 17:30:18'),
(1815, NULL, 3, '2023-09-09 20:30:29', '48.0809991', '29.3445941', '83VJ+R9Q, , KW', '2023-09-09 17:30:29', '2023-09-09 17:30:29'),
(1816, NULL, 3, '2023-09-09 20:31:19', '48.0809991', '29.3445941', '83VJ+R9Q, , KW', '2023-09-09 17:31:19', '2023-09-09 17:31:19'),
(1817, NULL, 3, '2023-09-09 20:32:38', '48.0809991', '29.3445941', '83VJ+R9Q, , KW', '2023-09-09 17:32:38', '2023-09-09 17:32:38'),
(1818, NULL, 3, '2023-09-09 20:33:15', '48.0809991', '29.3445941', '83VJ+R9Q, , KW', '2023-09-09 17:33:15', '2023-09-09 17:33:15'),
(1819, NULL, 3, '2023-09-09 20:34:25', '48.0809991', '29.3445941', '83VJ+R9Q, , KW', '2023-09-09 17:34:25', '2023-09-09 17:34:25'),
(1820, NULL, 3, '2023-09-09 20:36:47', '48.0809991', '29.3445941', '83VJ+R9Q, , KW', '2023-09-09 17:36:47', '2023-09-09 17:36:47'),
(1821, NULL, 3, '2023-09-09 20:36:57', '48.0809991', '29.3445941', '83VJ+R9Q, , KW', '2023-09-09 17:36:57', '2023-09-09 17:36:57'),
(1822, NULL, 3, '2023-09-09 20:37:07', '48.0809991', '29.3445941', '83VJ+R9Q, , KW', '2023-09-09 17:37:07', '2023-09-09 17:37:07'),
(1823, NULL, 3, '2023-09-09 20:37:17', '48.0809991', '29.3445941', '83VJ+R9Q, , KW', '2023-09-09 17:37:17', '2023-09-09 17:37:17'),
(1824, NULL, 3, '2023-09-09 20:37:27', '48.0809991', '29.3445941', '83VJ+R9Q, , KW', '2023-09-09 17:37:27', '2023-09-09 17:37:27'),
(1825, NULL, 3, '2023-09-09 20:37:37', '48.0809991', '29.3445941', '83VJ+R9Q, , KW', '2023-09-09 17:37:37', '2023-09-09 17:37:37'),
(1826, NULL, 3, '2023-09-09 20:37:47', '48.0809991', '29.3445941', '83VJ+R9Q, , KW', '2023-09-09 17:37:47', '2023-09-09 17:37:47'),
(1827, NULL, 3, '2023-09-09 20:37:57', '48.0809991', '29.3445941', '83VJ+R9Q, , KW', '2023-09-09 17:37:57', '2023-09-09 17:37:57'),
(1828, NULL, 3, '2023-09-09 20:38:36', '48.0809991', '29.3445941', '83VJ+R9Q, , KW', '2023-09-09 17:38:36', '2023-09-09 17:38:36'),
(1829, NULL, 3, '2023-09-09 20:40:41', '48.0809991', '29.3445941', '83VJ+R9Q, , KW', '2023-09-09 17:40:41', '2023-09-09 17:40:41'),
(1830, NULL, 3, '2023-09-09 20:44:45', '48.0809991', '29.3445941', '83VJ+R9Q, , KW', '2023-09-09 17:44:45', '2023-09-09 17:44:45'),
(1831, NULL, 3, '2023-09-09 20:48:00', '48.0740586', '29.3419127', 'Fashion Way, , KW', '2023-09-09 17:48:00', '2023-09-09 17:48:00'),
(1832, NULL, 3, '2023-09-09 20:48:18', '48.0739567', '29.3419091', '83RF+RJC, , KW', '2023-09-09 17:48:18', '2023-09-09 17:48:18'),
(1833, NULL, 3, '2023-09-09 20:50:29', '48.0708699', '29.3407158', '1, , KW', '2023-09-09 17:50:29', '2023-09-09 17:50:29'),
(1834, NULL, 3, '2023-09-09 20:50:39', '48.0708747', '29.3406815', 'Shaha Builidng, , KW', '2023-09-09 17:50:39', '2023-09-09 17:50:39'),
(1835, NULL, 3, '2023-09-09 20:50:48', '48.0708861', '29.3407055', 'Shaha Builidng, , KW', '2023-09-09 17:50:48', '2023-09-09 17:50:48'),
(1836, NULL, 3, '2023-09-09 20:50:58', '48.070874', '29.3407388', '1, , KW', '2023-09-09 17:50:58', '2023-09-09 17:50:58'),
(1837, NULL, 3, '2023-09-09 20:51:08', '48.0708718', '29.3407172', '1, , KW', '2023-09-09 17:51:08', '2023-09-09 17:51:08'),
(1838, NULL, 3, '2023-09-09 20:51:19', '48.0708437', '29.3406719', 'Shaha Builidng, , KW', '2023-09-09 17:51:19', '2023-09-09 17:51:19'),
(1839, NULL, 3, '2023-09-09 20:51:29', '48.0708401', '29.3406575', 'Shaha Builidng, , KW', '2023-09-09 17:51:29', '2023-09-09 17:51:29'),
(1840, NULL, 3, '2023-09-09 20:51:38', '48.0708635', '29.3407251', '1, , KW', '2023-09-09 17:51:38', '2023-09-09 17:51:38'),
(1841, NULL, 3, '2023-09-09 20:53:34', '48.0645559', '29.3364685', '83P7+HVV, , KW', '2023-09-09 17:53:34', '2023-09-09 17:53:34'),
(1842, NULL, 3, '2023-09-09 20:54:18', '48.0596803', '29.326402', '21902, , KW', '2023-09-09 17:54:18', '2023-09-09 17:54:18'),
(1843, NULL, 3, '2023-09-09 20:54:32', '48.0596798', '29.3264021', '21902, , KW', '2023-09-09 17:54:32', '2023-09-09 17:54:32'),
(1844, NULL, 3, '2023-09-09 20:58:38', '48.058798', '29.3339803', '15, , KW', '2023-09-09 17:58:38', '2023-09-09 17:58:38'),
(1845, NULL, 3, '2023-09-09 21:01:30', '48.0566599', '29.3323653', '13, , KW', '2023-09-09 18:01:30', '2023-09-09 18:01:30'),
(1846, NULL, 3, '2023-09-09 21:03:01', '48.048232', '29.332499', '82MX+369, , KW', '2023-09-09 18:03:01', '2023-09-09 18:03:01'),
(1847, NULL, 3, '2023-09-09 21:04:00', '48.0482317', '29.3324974', '82MX+369, , KW', '2023-09-09 18:04:00', '2023-09-09 18:04:00'),
(1848, NULL, 3, '2023-09-09 21:04:25', '48.0479582', '29.3323689', '82MX+369, , KW', '2023-09-09 18:04:25', '2023-09-09 18:04:25'),
(1849, NULL, 3, '2023-09-09 21:06:35', '48.0377323', '29.3302289', '82JP+9W4, , KW', '2023-09-09 18:06:35', '2023-09-09 18:06:35'),
(1850, NULL, 3, '2023-09-09 21:06:59', '48.0337044', '29.3298728', 'مقابل مستشفى مبارك الكبير, , KW', '2023-09-09 18:06:59', '2023-09-09 18:06:59'),
(1851, NULL, 3, '2023-09-09 21:07:19', '48.0281279', '29.3283262', '82HH+76M, , KW', '2023-09-09 18:07:19', '2023-09-09 18:07:19'),
(1852, NULL, 3, '2023-09-09 21:07:34', '48.0250881', '29.327079', 'مقابل مستشفى رويال حياة, , KW', '2023-09-09 18:07:34', '2023-09-09 18:07:34'),
(1853, NULL, 3, '2023-09-09 21:07:58', '48.0250881', '29.327079', 'مقابل مستشفى رويال حياة, , KW', '2023-09-09 18:07:58', '2023-09-09 18:07:58'),
(1854, NULL, 3, '2023-09-09 21:12:03', '48.014352', '29.3292497', '82H7+MQG, , KW', '2023-09-09 18:12:03', '2023-09-09 18:12:03'),
(1855, NULL, 3, '2023-09-09 21:16:07', '48.0146276', '29.3293327', '82H7+MRV, , KW', '2023-09-09 18:16:07', '2023-09-09 18:16:07'),
(1856, NULL, 3, '2023-09-09 21:16:49', '48.0147845', '29.3282436', 'الكويت‎, , KW', '2023-09-09 18:16:49', '2023-09-09 18:16:49'),
(1857, NULL, 3, '2023-09-09 21:17:09', '48.0151971', '29.327667', '82G8+V39, , KW', '2023-09-09 18:17:09', '2023-09-09 18:17:09'),
(1858, NULL, 3, '2023-09-09 21:17:26', '48.0158366', '29.3266649', '82G8+P76, , KW', '2023-09-09 18:17:26', '2023-09-09 18:17:26'),
(1859, NULL, 3, '2023-09-09 21:18:01', '48.0159753', '29.3262924', '82G8+F9M, , KW', '2023-09-09 18:18:01', '2023-09-09 18:18:01'),
(1860, NULL, 3, '2023-09-09 21:18:11', '48.0159446', '29.3262761', '82G8+F9M, , KW', '2023-09-09 18:18:11', '2023-09-09 18:18:11'),
(1861, NULL, 3, '2023-09-09 21:19:38', '48.0140006', '29.325388', 'شارع شرحبيل بن حسنة, , KW', '2023-09-09 18:19:38', '2023-09-09 18:19:38'),
(1862, NULL, 3, '2023-09-09 21:19:55', '48.0175816', '29.3268501', '82G8+PX9, , KW', '2023-09-09 18:19:55', '2023-09-09 18:19:55'),
(1863, NULL, 3, '2023-09-09 21:20:26', '48.0166239', '29.3263838', '82G8+JMF, , KW', '2023-09-09 18:20:26', '2023-09-09 18:20:26'),
(1864, NULL, 3, '2023-09-09 21:21:55', '48.0187034', '29.3263468', '82G9+FCP, , KW', '2023-09-09 18:21:55', '2023-09-09 18:21:55'),
(1865, NULL, 3, '2023-09-09 21:22:41', '48.0176363', '29.3281576', '82H9+525, , KW', '2023-09-09 18:22:41', '2023-09-09 18:22:41'),
(1866, NULL, 3, '2023-09-09 21:22:51', '48.0175657', '29.3284846', '196, , KW', '2023-09-09 18:22:51', '2023-09-09 18:22:51'),
(1867, NULL, 3, '2023-09-09 21:23:02', '48.0180089', '29.3289588', '82H9+H6R, , KW', '2023-09-09 18:23:02', '2023-09-09 18:23:02'),
(1868, NULL, 3, '2023-09-09 21:23:12', '48.0184351', '29.3293372', '82H9+P9W, , KW', '2023-09-09 18:23:12', '2023-09-09 18:23:12'),
(1869, NULL, 3, '2023-09-09 21:23:21', '48.0191841', '29.3295041', '82H9+QPR, , KW', '2023-09-09 18:23:21', '2023-09-09 18:23:21'),
(1870, NULL, 3, '2023-09-09 21:23:31', '48.0194929', '29.3294398', '82H9+QPV, , KW', '2023-09-09 18:23:31', '2023-09-09 18:23:31'),
(1871, NULL, 3, '2023-09-09 21:23:41', '48.0196732', '29.3297081', '82H9+WVG, , KW', '2023-09-09 18:23:41', '2023-09-09 18:23:41'),
(1872, NULL, 3, '2023-09-09 21:23:51', '48.0196727', '29.3296786', '82H9+WVG, , KW', '2023-09-09 18:23:51', '2023-09-09 18:23:51'),
(1873, NULL, 3, '2023-09-09 21:24:01', '48.0196662', '29.3296646', '82H9+WVG, , KW', '2023-09-09 18:24:01', '2023-09-09 18:24:01'),
(1874, NULL, 3, '2023-09-09 21:26:40', '48.019456', '29.3295699', 'حولي, , KW', '2023-09-09 18:26:40', '2023-09-09 18:26:40'),
(1875, NULL, 3, '2023-09-09 21:27:04', '48.0198638', '29.3297506', '82H9+WX9, , KW', '2023-09-09 18:27:04', '2023-09-09 18:27:04'),
(1876, NULL, 3, '2023-09-09 21:27:12', '48.0198994', '29.329769', '82H9+WX9, , KW', '2023-09-09 18:27:12', '2023-09-09 18:27:12'),
(1877, NULL, 3, '2023-09-09 23:25:27', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:27', '2023-09-09 20:25:27'),
(1878, NULL, 3, '2023-09-09 23:25:27', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:27', '2023-09-09 20:25:27'),
(1879, NULL, 3, '2023-09-09 23:25:27', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:27', '2023-09-09 20:25:27');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(1880, NULL, 3, '2023-09-09 23:25:27', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:27', '2023-09-09 20:25:27'),
(1881, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1882, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1883, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1884, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1885, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1886, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1887, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1888, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1889, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1890, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1891, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1892, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1893, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1894, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1895, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1896, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1897, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1898, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1899, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1900, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1901, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1902, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1903, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1904, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1905, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1906, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1907, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1908, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1909, NULL, 3, '2023-09-09 23:25:28', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:28', '2023-09-09 20:25:28'),
(1910, NULL, 3, '2023-09-09 23:25:29', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:29', '2023-09-09 20:25:29'),
(1911, NULL, 3, '2023-09-09 23:25:29', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:29', '2023-09-09 20:25:29'),
(1912, NULL, 3, '2023-09-09 23:25:29', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:29', '2023-09-09 20:25:29'),
(1913, NULL, 3, '2023-09-09 23:25:29', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:29', '2023-09-09 20:25:29'),
(1914, NULL, 3, '2023-09-09 23:25:29', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:29', '2023-09-09 20:25:29'),
(1915, NULL, 3, '2023-09-09 23:25:29', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:29', '2023-09-09 20:25:29'),
(1916, NULL, 3, '2023-09-09 23:25:29', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:29', '2023-09-09 20:25:29'),
(1917, NULL, 3, '2023-09-09 23:25:30', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:30', '2023-09-09 20:25:30'),
(1918, NULL, 3, '2023-09-09 23:25:30', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:30', '2023-09-09 20:25:30'),
(1919, NULL, 3, '2023-09-09 23:25:30', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:30', '2023-09-09 20:25:30'),
(1920, NULL, 3, '2023-09-09 23:25:30', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:30', '2023-09-09 20:25:30'),
(1921, NULL, 3, '2023-09-09 23:25:31', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:31', '2023-09-09 20:25:31'),
(1922, NULL, 3, '2023-09-09 23:25:31', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:31', '2023-09-09 20:25:31'),
(1923, NULL, 3, '2023-09-09 23:25:31', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:31', '2023-09-09 20:25:31'),
(1924, NULL, 3, '2023-09-09 23:25:31', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:31', '2023-09-09 20:25:31'),
(1925, NULL, 3, '2023-09-09 23:25:31', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:31', '2023-09-09 20:25:31'),
(1926, NULL, 3, '2023-09-09 23:25:31', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:31', '2023-09-09 20:25:31'),
(1927, NULL, 3, '2023-09-09 23:25:32', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:32', '2023-09-09 20:25:32'),
(1928, NULL, 3, '2023-09-09 23:25:32', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:32', '2023-09-09 20:25:32'),
(1929, NULL, 3, '2023-09-09 23:25:32', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:32', '2023-09-09 20:25:32'),
(1930, NULL, 3, '2023-09-09 23:25:32', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:32', '2023-09-09 20:25:32'),
(1931, NULL, 3, '2023-09-09 23:25:32', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:32', '2023-09-09 20:25:32'),
(1932, NULL, 3, '2023-09-09 23:25:32', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:32', '2023-09-09 20:25:32'),
(1933, NULL, 3, '2023-09-09 23:25:33', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:33', '2023-09-09 20:25:33'),
(1934, NULL, 3, '2023-09-09 23:25:33', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:33', '2023-09-09 20:25:33'),
(1935, NULL, 3, '2023-09-09 23:25:33', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:33', '2023-09-09 20:25:33'),
(1936, NULL, 3, '2023-09-09 23:25:33', '48.0187113', '29.3261625', '82G9+FCP, , KW', '2023-09-09 20:25:33', '2023-09-09 20:25:33'),
(1937, NULL, 3, '2023-09-09 23:28:02', '48.0184043', '29.3254167', '82G9+59R, , KW', '2023-09-09 20:28:02', '2023-09-09 20:28:02'),
(1938, NULL, 3, '2023-09-09 23:28:11', '48.0184061', '29.3254275', '82G9+59R, , KW', '2023-09-09 20:28:11', '2023-09-09 20:28:11'),
(1939, NULL, 3, '2023-09-09 23:28:22', '48.0185574', '29.3256543', 'الكويت‎, , KW', '2023-09-09 20:28:22', '2023-09-09 20:28:22'),
(1940, NULL, 3, '2023-09-09 23:28:32', '48.0186733', '29.3259691', '196, , KW', '2023-09-09 20:28:32', '2023-09-09 20:28:32'),
(1941, NULL, 3, '2023-09-09 23:28:41', '48.0187206', '29.3261048', '196, , KW', '2023-09-09 20:28:41', '2023-09-09 20:28:41'),
(1942, NULL, 3, '2023-09-09 23:28:52', '48.018733', '29.3261978', '82G9+FCP, , KW', '2023-09-09 20:28:52', '2023-09-09 20:28:52'),
(1943, NULL, 3, '2023-09-09 23:29:02', '48.0187706', '29.3263218', '82G9+FCP, , KW', '2023-09-09 20:29:02', '2023-09-09 20:29:02'),
(1944, NULL, 3, '2023-09-09 23:29:12', '48.0187281', '29.326225', '82G9+FCP, , KW', '2023-09-09 20:29:12', '2023-09-09 20:29:12'),
(1945, NULL, 3, '2023-09-09 23:29:22', '48.0187173', '29.3262014', '82G9+FCP, , KW', '2023-09-09 20:29:22', '2023-09-09 20:29:22'),
(1946, NULL, 3, '2023-09-09 23:29:31', '48.0187401', '29.3262229', '82G9+FCP, , KW', '2023-09-09 20:29:31', '2023-09-09 20:29:31'),
(1947, NULL, 3, '2023-09-09 23:29:41', '48.0187152', '29.3261729', '82G9+FCP, , KW', '2023-09-09 20:29:41', '2023-09-09 20:29:41'),
(1948, NULL, 3, '2023-09-09 23:29:51', '48.0186952', '29.3261324', '196, , KW', '2023-09-09 20:29:51', '2023-09-09 20:29:51'),
(1949, NULL, 3, '2023-09-09 23:30:01', '48.0186991', '29.3261457', '196, , KW', '2023-09-09 20:30:01', '2023-09-09 20:30:01'),
(1950, NULL, 3, '2023-09-09 23:30:11', '48.0186912', '29.3261393', '196, , KW', '2023-09-09 20:30:11', '2023-09-09 20:30:11'),
(1951, NULL, 3, '2023-09-09 23:30:22', '48.0186763', '29.3261324', '196, , KW', '2023-09-09 20:30:22', '2023-09-09 20:30:22'),
(1952, NULL, 3, '2023-09-09 23:30:31', '48.0186525', '29.3261256', '196, , KW', '2023-09-09 20:30:31', '2023-09-09 20:30:31'),
(1953, NULL, 3, '2023-09-09 23:30:42', '48.0186209', '29.3261199', '196, , KW', '2023-09-09 20:30:42', '2023-09-09 20:30:42'),
(1954, NULL, 3, '2023-09-09 23:30:52', '48.0184154', '29.3254807', '82G9+59R, , KW', '2023-09-09 20:30:52', '2023-09-09 20:30:52'),
(1955, NULL, 3, '2023-09-09 23:31:02', '48.0186455', '29.3260142', '196, , KW', '2023-09-09 20:31:02', '2023-09-09 20:31:02'),
(1956, NULL, 3, '2023-09-09 23:31:11', '48.0186972', '29.3261352', '196, , KW', '2023-09-09 20:31:11', '2023-09-09 20:31:11'),
(1957, NULL, 3, '2023-09-09 23:31:22', '48.0185358', '29.3262807', '82G9+FCP, , KW', '2023-09-09 20:31:22', '2023-09-09 20:31:22'),
(1958, NULL, 3, '2023-09-09 23:31:32', '48.0184875', '29.3263989', '82G9+G78, , KW', '2023-09-09 20:31:32', '2023-09-09 20:31:32'),
(1959, NULL, 3, '2023-09-09 23:31:42', '48.0184623', '29.3264989', '82G9+G78, , KW', '2023-09-09 20:31:42', '2023-09-09 20:31:42'),
(1960, NULL, 3, '2023-09-09 23:31:52', '48.0184684', '29.3265674', '82G9+G78, , KW', '2023-09-09 20:31:52', '2023-09-09 20:31:52'),
(1961, NULL, 3, '2023-09-09 23:32:01', '48.0186944', '29.326156', '82G9+FCP, , KW', '2023-09-09 20:32:01', '2023-09-09 20:32:01'),
(1962, NULL, 3, '2023-09-09 23:32:11', '48.0187129', '29.3261518', '196, , KW', '2023-09-09 20:32:11', '2023-09-09 20:32:11'),
(1963, NULL, 3, '2023-09-09 23:32:21', '48.0187323', '29.3261482', '196, , KW', '2023-09-09 20:32:21', '2023-09-09 20:32:21'),
(1964, NULL, 3, '2023-09-09 23:32:32', '48.0186541', '29.3258479', '82G9+9G6, , KW', '2023-09-09 20:32:32', '2023-09-09 20:32:32'),
(1965, NULL, 3, '2023-09-09 23:32:41', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:32:41', '2023-09-09 20:32:41'),
(1966, NULL, 3, '2023-09-09 23:32:50', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:32:50', '2023-09-09 20:32:50'),
(1967, NULL, 3, '2023-09-09 23:33:00', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:33:00', '2023-09-09 20:33:00'),
(1968, NULL, 3, '2023-09-09 23:33:10', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:33:10', '2023-09-09 20:33:10'),
(1969, NULL, 3, '2023-09-09 23:36:51', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:36:51', '2023-09-09 20:36:51'),
(1970, NULL, 3, '2023-09-09 23:37:20', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:37:20', '2023-09-09 20:37:20'),
(1971, NULL, 3, '2023-09-09 23:37:30', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:37:30', '2023-09-09 20:37:30'),
(1972, NULL, 3, '2023-09-09 23:37:40', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:37:40', '2023-09-09 20:37:40'),
(1973, NULL, 3, '2023-09-09 23:37:51', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:37:51', '2023-09-09 20:37:51'),
(1974, NULL, 3, '2023-09-09 23:38:00', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:38:00', '2023-09-09 20:38:00'),
(1975, NULL, 3, '2023-09-09 23:38:10', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:38:10', '2023-09-09 20:38:10'),
(1976, NULL, 3, '2023-09-09 23:38:20', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:38:20', '2023-09-09 20:38:20'),
(1977, NULL, 3, '2023-09-09 23:38:30', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:38:30', '2023-09-09 20:38:30'),
(1978, NULL, 3, '2023-09-09 23:38:40', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:38:40', '2023-09-09 20:38:40'),
(1979, NULL, 3, '2023-09-09 23:38:50', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:38:50', '2023-09-09 20:38:50'),
(1980, NULL, 3, '2023-09-09 23:39:00', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:39:00', '2023-09-09 20:39:00'),
(1981, NULL, 3, '2023-09-09 23:39:10', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:39:10', '2023-09-09 20:39:10'),
(1982, NULL, 3, '2023-09-09 23:39:20', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:39:20', '2023-09-09 20:39:20'),
(1983, NULL, 3, '2023-09-09 23:39:30', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:39:30', '2023-09-09 20:39:30'),
(1984, NULL, 3, '2023-09-09 23:39:40', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:39:40', '2023-09-09 20:39:40'),
(1985, NULL, 3, '2023-09-09 23:39:50', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:39:50', '2023-09-09 20:39:50'),
(1986, NULL, 3, '2023-09-09 23:40:00', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:40:00', '2023-09-09 20:40:00'),
(1987, NULL, 3, '2023-09-09 23:40:10', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:40:10', '2023-09-09 20:40:10'),
(1988, NULL, 3, '2023-09-09 23:40:20', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:40:20', '2023-09-09 20:40:20'),
(1989, NULL, 3, '2023-09-09 23:40:30', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:40:30', '2023-09-09 20:40:30'),
(1990, NULL, 3, '2023-09-09 23:40:40', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:40:40', '2023-09-09 20:40:40'),
(1991, NULL, 3, '2023-09-09 23:40:50', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:40:50', '2023-09-09 20:40:50'),
(1992, NULL, 3, '2023-09-09 23:41:00', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:41:00', '2023-09-09 20:41:00'),
(1993, NULL, 3, '2023-09-09 23:41:10', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:41:10', '2023-09-09 20:41:10'),
(1994, NULL, 3, '2023-09-09 23:41:20', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:41:20', '2023-09-09 20:41:20'),
(1995, NULL, 3, '2023-09-09 23:41:30', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:41:30', '2023-09-09 20:41:30'),
(1996, NULL, 3, '2023-09-09 23:41:40', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:41:40', '2023-09-09 20:41:40'),
(1997, NULL, 3, '2023-09-09 23:41:50', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:41:50', '2023-09-09 20:41:50'),
(1998, NULL, 3, '2023-09-09 23:42:00', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:42:00', '2023-09-09 20:42:00'),
(1999, NULL, 3, '2023-09-09 23:42:10', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:42:10', '2023-09-09 20:42:10'),
(2000, NULL, 3, '2023-09-09 23:42:20', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:42:20', '2023-09-09 20:42:20'),
(2001, NULL, 3, '2023-09-09 23:42:30', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:42:30', '2023-09-09 20:42:30'),
(2002, NULL, 3, '2023-09-09 23:42:39', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:42:39', '2023-09-09 20:42:39'),
(2003, NULL, 3, '2023-09-09 23:42:49', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:42:49', '2023-09-09 20:42:49'),
(2004, NULL, 3, '2023-09-09 23:43:00', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:43:00', '2023-09-09 20:43:00'),
(2005, NULL, 3, '2023-09-09 23:43:10', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:43:10', '2023-09-09 20:43:10'),
(2006, NULL, 3, '2023-09-09 23:43:20', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:43:20', '2023-09-09 20:43:20'),
(2007, NULL, 3, '2023-09-09 23:43:30', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:43:30', '2023-09-09 20:43:30'),
(2008, NULL, 3, '2023-09-09 23:43:40', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:43:40', '2023-09-09 20:43:40'),
(2009, NULL, 3, '2023-09-09 23:43:50', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:43:50', '2023-09-09 20:43:50'),
(2010, NULL, 3, '2023-09-09 23:44:00', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:44:00', '2023-09-09 20:44:00'),
(2011, NULL, 3, '2023-09-09 23:44:10', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:44:10', '2023-09-09 20:44:10'),
(2012, NULL, 3, '2023-09-09 23:44:20', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:44:20', '2023-09-09 20:44:20'),
(2013, NULL, 3, '2023-09-09 23:44:30', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:44:30', '2023-09-09 20:44:30'),
(2014, NULL, 3, '2023-09-09 23:44:40', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:44:40', '2023-09-09 20:44:40'),
(2015, NULL, 3, '2023-09-09 23:44:50', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:44:50', '2023-09-09 20:44:50'),
(2016, NULL, 3, '2023-09-09 23:45:00', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:45:00', '2023-09-09 20:45:00'),
(2017, NULL, 3, '2023-09-09 23:45:10', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:45:10', '2023-09-09 20:45:10'),
(2018, NULL, 3, '2023-09-09 23:45:20', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:45:20', '2023-09-09 20:45:20'),
(2019, NULL, 3, '2023-09-09 23:45:30', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:45:30', '2023-09-09 20:45:30'),
(2020, NULL, 3, '2023-09-09 23:45:40', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:45:40', '2023-09-09 20:45:40'),
(2021, NULL, 3, '2023-09-09 23:45:50', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:45:50', '2023-09-09 20:45:50'),
(2022, NULL, 3, '2023-09-09 23:46:00', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:46:00', '2023-09-09 20:46:00'),
(2023, NULL, 3, '2023-09-09 23:46:10', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:46:10', '2023-09-09 20:46:10'),
(2024, NULL, 3, '2023-09-09 23:46:20', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:46:20', '2023-09-09 20:46:20'),
(2025, NULL, 3, '2023-09-09 23:46:30', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:46:30', '2023-09-09 20:46:30'),
(2026, NULL, 3, '2023-09-09 23:48:25', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:48:25', '2023-09-09 20:48:25'),
(2027, NULL, 3, '2023-09-09 23:50:13', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:50:13', '2023-09-09 20:50:13'),
(2028, NULL, 3, '2023-09-09 23:56:14', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:56:14', '2023-09-09 20:56:14'),
(2029, NULL, 3, '2023-09-09 23:58:32', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 20:58:32', '2023-09-09 20:58:32'),
(2030, NULL, 3, '2023-09-10 00:00:34', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 21:00:34', '2023-09-09 21:00:34'),
(2031, NULL, 3, '2023-09-10 00:03:16', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 21:03:16', '2023-09-09 21:03:16'),
(2032, NULL, 3, '2023-09-10 00:05:23', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 21:05:23', '2023-09-09 21:05:23'),
(2033, NULL, 3, '2023-09-10 00:07:19', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 21:07:19', '2023-09-09 21:07:19'),
(2034, NULL, 3, '2023-09-10 00:08:32', '48.0186217', '29.3257372', 'الكويت‎, , KW', '2023-09-09 21:08:32', '2023-09-09 21:08:32'),
(2035, NULL, 3, '2023-09-10 00:12:21', '48.0173858', '29.3286098', '82H8+CW4, , KW', '2023-09-09 21:12:21', '2023-09-09 21:12:21'),
(2036, NULL, 3, '2023-09-10 00:12:33', '48.0187233', '29.3261555', '196, , KW', '2023-09-09 21:12:33', '2023-09-09 21:12:33'),
(2037, NULL, 3, '2023-09-10 00:19:07', '48.0185253', '29.3261253', '82G9+FCP, , KW', '2023-09-09 21:19:07', '2023-09-09 21:19:07'),
(2038, NULL, 3, '2023-09-10 00:19:17', '48.0187376', '29.3261242', '196, , KW', '2023-09-09 21:19:17', '2023-09-09 21:19:17'),
(2039, NULL, 3, '2023-09-10 00:19:27', '48.0187436', '29.3261299', '196, , KW', '2023-09-09 21:19:27', '2023-09-09 21:19:27'),
(2040, NULL, 3, '2023-09-10 00:19:37', '48.0187384', '29.326106', '196, , KW', '2023-09-09 21:19:37', '2023-09-09 21:19:37'),
(2041, NULL, 3, '2023-09-10 00:19:47', '48.0186957', '29.3261498', '196, , KW', '2023-09-09 21:19:47', '2023-09-09 21:19:47'),
(2042, NULL, 3, '2023-09-10 00:19:57', '48.0186878', '29.3261511', '82G9+FCP, , KW', '2023-09-09 21:19:57', '2023-09-09 21:19:57'),
(2043, NULL, 3, '2023-09-10 00:20:07', '48.0186869', '29.3261647', '82G9+FCP, , KW', '2023-09-09 21:20:07', '2023-09-09 21:20:07'),
(2044, NULL, 3, '2023-09-10 00:20:17', '48.0187028', '29.3261654', '82G9+FCP, , KW', '2023-09-09 21:20:17', '2023-09-09 21:20:17'),
(2045, NULL, 3, '2023-09-10 00:20:27', '48.0186996', '29.3261659', '82G9+FCP, , KW', '2023-09-09 21:20:27', '2023-09-09 21:20:27'),
(2046, NULL, 3, '2023-09-10 00:20:37', '48.0186995', '29.3261483', '196, , KW', '2023-09-09 21:20:37', '2023-09-09 21:20:37'),
(2047, NULL, 3, '2023-09-10 00:20:47', '48.0187174', '29.3261492', '196, , KW', '2023-09-09 21:20:47', '2023-09-09 21:20:47'),
(2048, NULL, 3, '2023-09-10 00:23:04', '48.0187121', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:23:04', '2023-09-09 21:23:04'),
(2049, NULL, 3, '2023-09-10 00:26:11', '48.018835', '29.326542', '82G9+MGJ, , KW', '2023-09-09 21:26:11', '2023-09-09 21:26:11'),
(2050, NULL, 3, '2023-09-10 00:26:20', '48.0187072', '29.3261601', '82G9+FCP, , KW', '2023-09-09 21:26:20', '2023-09-09 21:26:20'),
(2051, NULL, 3, '2023-09-10 00:26:31', '48.0187082', '29.3261422', '196, , KW', '2023-09-09 21:26:31', '2023-09-09 21:26:31'),
(2052, NULL, 3, '2023-09-10 00:26:41', '48.0186888', '29.3261489', '196, , KW', '2023-09-09 21:26:41', '2023-09-09 21:26:41'),
(2053, NULL, 3, '2023-09-10 00:26:51', '48.0187075', '29.326163', '82G9+FCP, , KW', '2023-09-09 21:26:51', '2023-09-09 21:26:51'),
(2054, NULL, 3, '2023-09-10 00:27:01', '48.0187145', '29.326162', '82G9+FCP, , KW', '2023-09-09 21:27:01', '2023-09-09 21:27:01'),
(2055, NULL, 3, '2023-09-10 00:27:11', '48.0187071', '29.3261624', '82G9+FCP, , KW', '2023-09-09 21:27:11', '2023-09-09 21:27:11'),
(2056, NULL, 3, '2023-09-10 00:27:21', '48.0187059', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:27:21', '2023-09-09 21:27:21'),
(2057, NULL, 3, '2023-09-10 00:27:31', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:27:31', '2023-09-09 21:27:31'),
(2058, NULL, 3, '2023-09-10 00:27:40', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:27:40', '2023-09-09 21:27:40'),
(2059, NULL, 3, '2023-09-10 00:27:50', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:27:50', '2023-09-09 21:27:50'),
(2060, NULL, 3, '2023-09-10 00:28:00', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:28:00', '2023-09-09 21:28:00'),
(2061, NULL, 3, '2023-09-10 00:28:10', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:28:10', '2023-09-09 21:28:10'),
(2062, NULL, 3, '2023-09-10 00:28:20', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:28:20', '2023-09-09 21:28:20'),
(2063, NULL, 3, '2023-09-10 00:28:30', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:28:30', '2023-09-09 21:28:30'),
(2064, NULL, 3, '2023-09-10 00:28:40', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:28:40', '2023-09-09 21:28:40'),
(2065, NULL, 3, '2023-09-10 00:28:50', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:28:50', '2023-09-09 21:28:50'),
(2066, NULL, 3, '2023-09-10 00:29:00', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:29:00', '2023-09-09 21:29:00'),
(2067, NULL, 3, '2023-09-10 00:29:10', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:29:10', '2023-09-09 21:29:10'),
(2068, NULL, 3, '2023-09-10 00:29:20', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:29:20', '2023-09-09 21:29:20'),
(2069, NULL, 3, '2023-09-10 00:29:30', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:29:30', '2023-09-09 21:29:30'),
(2070, NULL, 3, '2023-09-10 00:29:40', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:29:40', '2023-09-09 21:29:40'),
(2071, NULL, 3, '2023-09-10 00:29:50', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:29:50', '2023-09-09 21:29:50'),
(2072, NULL, 3, '2023-09-10 00:30:00', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:30:00', '2023-09-09 21:30:00'),
(2073, NULL, 3, '2023-09-10 00:30:10', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:30:10', '2023-09-09 21:30:10'),
(2074, NULL, 3, '2023-09-10 00:30:20', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:30:20', '2023-09-09 21:30:20'),
(2075, NULL, 3, '2023-09-10 00:30:30', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:30:30', '2023-09-09 21:30:30'),
(2076, NULL, 3, '2023-09-10 00:30:40', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:30:40', '2023-09-09 21:30:40'),
(2077, NULL, 3, '2023-09-10 00:30:50', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:30:50', '2023-09-09 21:30:50'),
(2078, NULL, 3, '2023-09-10 00:31:00', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:31:00', '2023-09-09 21:31:00'),
(2079, NULL, 3, '2023-09-10 00:31:11', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:31:11', '2023-09-09 21:31:11'),
(2080, NULL, 3, '2023-09-10 00:31:20', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:31:20', '2023-09-09 21:31:20'),
(2081, NULL, 3, '2023-09-10 00:31:33', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:31:33', '2023-09-09 21:31:33'),
(2082, NULL, 3, '2023-09-10 00:31:42', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:31:42', '2023-09-09 21:31:42'),
(2083, NULL, 3, '2023-09-10 00:31:51', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:31:51', '2023-09-09 21:31:51'),
(2084, NULL, 3, '2023-09-10 00:32:01', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:32:01', '2023-09-09 21:32:01'),
(2085, NULL, 3, '2023-09-10 00:32:10', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:32:10', '2023-09-09 21:32:10'),
(2086, NULL, 3, '2023-09-10 00:33:01', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:33:01', '2023-09-09 21:33:01'),
(2087, NULL, 3, '2023-09-10 00:33:30', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:33:30', '2023-09-09 21:33:30'),
(2088, NULL, 3, '2023-09-10 00:33:42', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:33:42', '2023-09-09 21:33:42'),
(2089, NULL, 3, '2023-09-10 00:33:52', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:33:52', '2023-09-09 21:33:52'),
(2090, NULL, 3, '2023-09-10 00:34:02', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:34:02', '2023-09-09 21:34:02'),
(2091, NULL, 3, '2023-09-10 00:34:12', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:34:12', '2023-09-09 21:34:12'),
(2092, NULL, 3, '2023-09-10 00:34:22', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:34:22', '2023-09-09 21:34:22'),
(2093, NULL, 3, '2023-09-10 00:34:52', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:34:52', '2023-09-09 21:34:52'),
(2094, NULL, 3, '2023-09-10 00:35:02', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:35:02', '2023-09-09 21:35:02'),
(2095, NULL, 3, '2023-09-10 00:35:14', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:35:14', '2023-09-09 21:35:14'),
(2096, NULL, 3, '2023-09-10 00:35:23', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:35:23', '2023-09-09 21:35:23'),
(2097, NULL, 3, '2023-09-10 00:35:33', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:35:33', '2023-09-09 21:35:33'),
(2098, NULL, 3, '2023-09-10 00:35:42', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:35:42', '2023-09-09 21:35:42'),
(2099, NULL, 3, '2023-09-10 00:35:52', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:35:52', '2023-09-09 21:35:52'),
(2100, NULL, 3, '2023-09-10 00:36:03', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:36:03', '2023-09-09 21:36:03'),
(2101, NULL, 3, '2023-09-10 00:36:12', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:36:12', '2023-09-09 21:36:12'),
(2102, NULL, 3, '2023-09-10 00:36:22', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:36:22', '2023-09-09 21:36:22'),
(2103, NULL, 3, '2023-09-10 00:36:32', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:36:32', '2023-09-09 21:36:32'),
(2104, NULL, 3, '2023-09-10 00:36:42', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:36:42', '2023-09-09 21:36:42'),
(2105, NULL, 3, '2023-09-10 00:36:52', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:36:52', '2023-09-09 21:36:52'),
(2106, NULL, 3, '2023-09-10 00:37:02', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:37:02', '2023-09-09 21:37:02'),
(2107, NULL, 3, '2023-09-10 00:37:12', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:37:12', '2023-09-09 21:37:12'),
(2108, NULL, 3, '2023-09-10 00:37:22', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:37:22', '2023-09-09 21:37:22'),
(2109, NULL, 3, '2023-09-10 00:37:47', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:37:47', '2023-09-09 21:37:47'),
(2110, NULL, 3, '2023-09-10 00:38:07', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:38:07', '2023-09-09 21:38:07'),
(2111, NULL, 3, '2023-09-10 00:39:16', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:39:16', '2023-09-09 21:39:16'),
(2112, NULL, 3, '2023-09-10 00:39:42', '48.018706', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:39:42', '2023-09-09 21:39:42'),
(2113, NULL, 3, '2023-09-10 00:40:07', '48.018688', '29.3261631', '82G9+FCP, , KW', '2023-09-09 21:40:07', '2023-09-09 21:40:07'),
(2114, NULL, 3, '2023-09-10 00:40:50', '48.0186998', '29.3261606', '82G9+FCP, , KW', '2023-09-09 21:40:50', '2023-09-09 21:40:50'),
(2115, NULL, 3, '2023-09-10 00:41:39', '48.0187103', '29.3261553', '196, , KW', '2023-09-09 21:41:39', '2023-09-09 21:41:39'),
(2116, NULL, 3, '2023-09-10 00:42:24', '48.0187262', '29.3261493', '196, , KW', '2023-09-09 21:42:24', '2023-09-09 21:42:24'),
(2117, NULL, 3, '2023-09-10 00:44:14', '48.0187062', '29.3261471', '196, , KW', '2023-09-09 21:44:14', '2023-09-09 21:44:14'),
(2118, NULL, 3, '2023-09-10 00:45:44', '48.0187116', '29.3261658', '82G9+FCP, , KW', '2023-09-09 21:45:44', '2023-09-09 21:45:44'),
(2119, NULL, 3, '2023-09-10 00:47:17', '48.0187224', '29.3261619', '196, , KW', '2023-09-09 21:47:17', '2023-09-09 21:47:17'),
(2120, NULL, 3, '2023-09-10 00:47:41', '48.0187122', '29.3261622', '82G9+FCP, , KW', '2023-09-09 21:47:41', '2023-09-09 21:47:41'),
(2121, NULL, 3, '2023-09-10 00:50:03', '48.0187244', '29.3261597', '196, , KW', '2023-09-09 21:50:03', '2023-09-09 21:50:03'),
(2122, NULL, 3, '2023-09-10 00:51:22', '48.0187017', '29.3261697', '82G9+FCP, , KW', '2023-09-09 21:51:22', '2023-09-09 21:51:22'),
(2123, NULL, 3, '2023-09-10 00:55:15', '48.0187153', '29.3261625', '82G9+FCP, , KW', '2023-09-09 21:55:15', '2023-09-09 21:55:15'),
(2124, NULL, 3, '2023-09-10 00:56:42', '48.0187054', '29.3261625', '82G9+FCP, , KW', '2023-09-09 21:56:42', '2023-09-09 21:56:42'),
(2125, NULL, 3, '2023-09-10 00:57:06', '48.0186865', '29.3261351', '196, , KW', '2023-09-09 21:57:06', '2023-09-09 21:57:06'),
(2126, NULL, 3, '2023-09-10 00:57:33', '48.0187141', '29.3261651', '82G9+FCP, , KW', '2023-09-09 21:57:33', '2023-09-09 21:57:33'),
(2127, NULL, 3, '2023-09-10 00:57:43', '48.018721', '29.3261622', '196, , KW', '2023-09-09 21:57:43', '2023-09-09 21:57:43'),
(2128, NULL, 3, '2023-09-10 00:57:53', '48.018707', '29.3261543', '196, , KW', '2023-09-09 21:57:53', '2023-09-09 21:57:53'),
(2129, NULL, 3, '2023-09-10 00:58:02', '48.018707', '29.3261543', '196, , KW', '2023-09-09 21:58:02', '2023-09-09 21:58:02'),
(2130, NULL, 3, '2023-09-10 00:58:12', '48.018707', '29.3261543', '196, , KW', '2023-09-09 21:58:12', '2023-09-09 21:58:12'),
(2131, NULL, 3, '2023-09-10 00:58:22', '48.018707', '29.3261543', '196, , KW', '2023-09-09 21:58:22', '2023-09-09 21:58:22'),
(2132, NULL, 3, '2023-09-10 01:00:43', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:00:43', '2023-09-09 22:00:43'),
(2133, NULL, 3, '2023-09-10 01:01:17', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:01:17', '2023-09-09 22:01:17'),
(2134, NULL, 3, '2023-09-10 01:02:26', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:02:26', '2023-09-09 22:02:26'),
(2135, NULL, 3, '2023-09-10 01:03:46', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:03:46', '2023-09-09 22:03:46'),
(2136, NULL, 3, '2023-09-10 01:10:03', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:10:03', '2023-09-09 22:10:03'),
(2137, NULL, 3, '2023-09-10 01:12:40', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:12:40', '2023-09-09 22:12:40'),
(2138, NULL, 3, '2023-09-10 01:12:50', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:12:50', '2023-09-09 22:12:50'),
(2139, NULL, 3, '2023-09-10 01:13:00', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:13:00', '2023-09-09 22:13:00'),
(2140, NULL, 3, '2023-09-10 01:13:10', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:13:10', '2023-09-09 22:13:10'),
(2141, NULL, 3, '2023-09-10 01:13:20', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:13:20', '2023-09-09 22:13:20'),
(2142, NULL, 3, '2023-09-10 01:13:30', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:13:30', '2023-09-09 22:13:30'),
(2143, NULL, 3, '2023-09-10 01:13:40', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:13:40', '2023-09-09 22:13:40'),
(2144, NULL, 3, '2023-09-10 01:13:50', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:13:50', '2023-09-09 22:13:50'),
(2145, NULL, 3, '2023-09-10 01:14:00', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:14:00', '2023-09-09 22:14:00'),
(2146, NULL, 3, '2023-09-10 01:14:10', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:14:10', '2023-09-09 22:14:10'),
(2147, NULL, 3, '2023-09-10 01:14:20', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:14:20', '2023-09-09 22:14:20'),
(2148, NULL, 3, '2023-09-10 01:14:30', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:14:30', '2023-09-09 22:14:30'),
(2149, NULL, 3, '2023-09-10 01:14:40', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:14:40', '2023-09-09 22:14:40'),
(2150, NULL, 3, '2023-09-10 01:14:50', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:14:50', '2023-09-09 22:14:50'),
(2151, NULL, 3, '2023-09-10 01:15:00', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:15:00', '2023-09-09 22:15:00'),
(2152, NULL, 3, '2023-09-10 01:15:10', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:15:10', '2023-09-09 22:15:10'),
(2153, NULL, 3, '2023-09-10 01:18:53', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:18:53', '2023-09-09 22:18:53'),
(2154, NULL, 3, '2023-09-10 01:19:51', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:19:51', '2023-09-09 22:19:51'),
(2155, NULL, 3, '2023-09-10 01:20:58', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:20:58', '2023-09-09 22:20:58'),
(2156, NULL, 3, '2023-09-10 01:21:08', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:21:08', '2023-09-09 22:21:08'),
(2157, NULL, 3, '2023-09-10 01:21:18', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:21:18', '2023-09-09 22:21:18'),
(2158, NULL, 3, '2023-09-10 01:21:28', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:21:28', '2023-09-09 22:21:28'),
(2159, NULL, 3, '2023-09-10 01:21:38', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:21:38', '2023-09-09 22:21:38'),
(2160, NULL, 3, '2023-09-10 01:21:48', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:21:48', '2023-09-09 22:21:48'),
(2161, NULL, 3, '2023-09-10 01:21:58', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:21:58', '2023-09-09 22:21:58'),
(2162, NULL, 3, '2023-09-10 01:22:08', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:22:08', '2023-09-09 22:22:08'),
(2163, NULL, 3, '2023-09-10 01:24:50', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:24:50', '2023-09-09 22:24:50'),
(2164, NULL, 3, '2023-09-10 01:34:41', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:34:41', '2023-09-09 22:34:41'),
(2165, NULL, 3, '2023-09-10 01:37:04', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:37:04', '2023-09-09 22:37:04'),
(2166, NULL, 3, '2023-09-10 01:37:13', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:37:13', '2023-09-09 22:37:13'),
(2167, NULL, 3, '2023-09-10 01:40:42', '48.018707', '29.3261543', '196, , KW', '2023-09-09 22:40:42', '2023-09-09 22:40:42'),
(2168, NULL, 3, '2023-09-10 01:43:08', '48.0187296', '29.3261492', '196, , KW', '2023-09-09 22:43:08', '2023-09-09 22:43:08'),
(2169, NULL, 3, '2023-09-10 01:45:11', '48.0188258', '29.3260944', '196, , KW', '2023-09-09 22:45:11', '2023-09-09 22:45:11'),
(2170, NULL, 3, '2023-09-10 01:45:21', '48.0187597', '29.3261072', '196, , KW', '2023-09-09 22:45:21', '2023-09-09 22:45:21'),
(2171, NULL, 3, '2023-09-10 01:45:31', '48.0186835', '29.3260505', '196, , KW', '2023-09-09 22:45:31', '2023-09-09 22:45:31'),
(2172, NULL, 3, '2023-09-10 01:45:41', '48.0187393', '29.3260897', '196, , KW', '2023-09-09 22:45:41', '2023-09-09 22:45:41'),
(2173, NULL, 3, '2023-09-10 01:45:50', '48.0188304', '29.3260988', '196, , KW', '2023-09-09 22:45:50', '2023-09-09 22:45:50'),
(2174, NULL, 3, '2023-09-10 01:46:00', '48.0186619', '29.3260027', '196, , KW', '2023-09-09 22:46:00', '2023-09-09 22:46:00'),
(2175, NULL, 3, '2023-09-10 01:46:11', '48.0188629', '29.3261064', '196, , KW', '2023-09-09 22:46:11', '2023-09-09 22:46:11'),
(2176, NULL, 3, '2023-09-10 01:46:20', '48.0187235', '29.3261879', '82G9+FCP, , KW', '2023-09-09 22:46:20', '2023-09-09 22:46:20'),
(2177, NULL, 3, '2023-09-10 01:46:30', '48.0187269', '29.3261408', '196, , KW', '2023-09-09 22:46:30', '2023-09-09 22:46:30'),
(2178, NULL, 3, '2023-09-10 01:46:41', '48.0186634', '29.3260939', '196, , KW', '2023-09-09 22:46:41', '2023-09-09 22:46:41'),
(2179, NULL, 3, '2023-09-10 01:46:50', '48.0187203', '29.326155', '196, , KW', '2023-09-09 22:46:50', '2023-09-09 22:46:50'),
(2180, NULL, 3, '2023-09-10 01:47:00', '48.0187524', '29.3261456', '196, , KW', '2023-09-09 22:47:00', '2023-09-09 22:47:00'),
(2181, NULL, 3, '2023-09-10 01:47:10', '48.0187083', '29.3261325', '196, , KW', '2023-09-09 22:47:10', '2023-09-09 22:47:10'),
(2182, NULL, 3, '2023-09-10 01:47:20', '48.0188556', '29.3261067', '196, , KW', '2023-09-09 22:47:20', '2023-09-09 22:47:20'),
(2183, NULL, 3, '2023-09-10 01:47:31', '48.0187973', '29.3261329', '196, , KW', '2023-09-09 22:47:31', '2023-09-09 22:47:31'),
(2184, NULL, 3, '2023-09-10 01:47:41', '48.0187533', '29.3260265', '196, , KW', '2023-09-09 22:47:41', '2023-09-09 22:47:41'),
(2185, NULL, 3, '2023-09-10 01:47:50', '48.0187098', '29.3261289', '196, , KW', '2023-09-09 22:47:50', '2023-09-09 22:47:50'),
(2186, NULL, 3, '2023-09-10 01:48:00', '48.0187875', '29.3261489', '196, , KW', '2023-09-09 22:48:00', '2023-09-09 22:48:00'),
(2187, NULL, 3, '2023-09-10 01:48:10', '48.0187196', '29.3261434', '196, , KW', '2023-09-09 22:48:10', '2023-09-09 22:48:10'),
(2188, NULL, 3, '2023-09-10 01:48:20', '48.0186667', '29.3260811', '196, , KW', '2023-09-09 22:48:20', '2023-09-09 22:48:20'),
(2189, NULL, 3, '2023-09-10 01:48:31', '48.0186349', '29.3260855', '196, , KW', '2023-09-09 22:48:31', '2023-09-09 22:48:31'),
(2190, NULL, 3, '2023-09-10 01:48:40', '48.0188455', '29.3261367', '196, , KW', '2023-09-09 22:48:40', '2023-09-09 22:48:40'),
(2191, NULL, 3, '2023-09-10 01:48:51', '48.0189233', '29.3261147', '196, , KW', '2023-09-09 22:48:51', '2023-09-09 22:48:51'),
(2192, NULL, 3, '2023-09-10 01:49:00', '48.0188019', '29.3261477', '196, , KW', '2023-09-09 22:49:00', '2023-09-09 22:49:00'),
(2193, NULL, 3, '2023-09-10 01:49:10', '48.0187246', '29.3261528', '196, , KW', '2023-09-09 22:49:10', '2023-09-09 22:49:10'),
(2194, NULL, 3, '2023-09-10 01:49:20', '48.0187463', '29.3261492', '196, , KW', '2023-09-09 22:49:20', '2023-09-09 22:49:20'),
(2195, NULL, 3, '2023-09-10 01:49:31', '48.0186926', '29.3260924', '196, , KW', '2023-09-09 22:49:31', '2023-09-09 22:49:31'),
(2196, NULL, 3, '2023-09-10 01:49:43', '48.0188759', '29.3261315', '196, , KW', '2023-09-09 22:49:43', '2023-09-09 22:49:43'),
(2197, NULL, 3, '2023-09-10 01:49:50', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:49:50', '2023-09-09 22:49:50'),
(2198, NULL, 3, '2023-09-10 01:49:59', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:49:59', '2023-09-09 22:49:59'),
(2199, NULL, 3, '2023-09-10 01:50:09', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:50:09', '2023-09-09 22:50:09'),
(2200, NULL, 3, '2023-09-10 01:50:19', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:50:19', '2023-09-09 22:50:19'),
(2201, NULL, 3, '2023-09-10 01:50:29', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:50:29', '2023-09-09 22:50:29'),
(2202, NULL, 3, '2023-09-10 01:50:39', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:50:39', '2023-09-09 22:50:39'),
(2203, NULL, 3, '2023-09-10 01:50:49', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:50:49', '2023-09-09 22:50:49'),
(2204, NULL, 3, '2023-09-10 01:50:59', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:50:59', '2023-09-09 22:50:59'),
(2205, NULL, 3, '2023-09-10 01:51:09', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:51:09', '2023-09-09 22:51:09'),
(2206, NULL, 3, '2023-09-10 01:51:19', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:51:19', '2023-09-09 22:51:19'),
(2207, NULL, 3, '2023-09-10 01:51:30', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:51:30', '2023-09-09 22:51:30'),
(2208, NULL, 3, '2023-09-10 01:51:40', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:51:40', '2023-09-09 22:51:40'),
(2209, NULL, 3, '2023-09-10 01:51:49', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:51:49', '2023-09-09 22:51:49'),
(2210, NULL, 3, '2023-09-10 01:51:59', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:51:59', '2023-09-09 22:51:59'),
(2211, NULL, 3, '2023-09-10 01:52:09', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:52:09', '2023-09-09 22:52:09'),
(2212, NULL, 3, '2023-09-10 01:52:19', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:52:19', '2023-09-09 22:52:19'),
(2213, NULL, 3, '2023-09-10 01:52:29', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:52:29', '2023-09-09 22:52:29'),
(2214, NULL, 3, '2023-09-10 01:52:39', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:52:39', '2023-09-09 22:52:39'),
(2215, NULL, 3, '2023-09-10 01:52:49', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:52:49', '2023-09-09 22:52:49'),
(2216, NULL, 3, '2023-09-10 01:52:59', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:52:59', '2023-09-09 22:52:59'),
(2217, NULL, 3, '2023-09-10 01:53:09', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:53:09', '2023-09-09 22:53:09'),
(2218, NULL, 3, '2023-09-10 01:53:19', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:53:19', '2023-09-09 22:53:19'),
(2219, NULL, 3, '2023-09-10 01:53:29', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:53:29', '2023-09-09 22:53:29'),
(2220, NULL, 3, '2023-09-10 01:53:39', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:53:39', '2023-09-09 22:53:39'),
(2221, NULL, 3, '2023-09-10 01:53:49', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:53:49', '2023-09-09 22:53:49'),
(2222, NULL, 3, '2023-09-10 01:53:59', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:53:59', '2023-09-09 22:53:59'),
(2223, NULL, 3, '2023-09-10 01:54:09', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:54:09', '2023-09-09 22:54:09'),
(2224, NULL, 3, '2023-09-10 01:54:23', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:54:23', '2023-09-09 22:54:23'),
(2225, NULL, 3, '2023-09-10 01:54:29', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:54:29', '2023-09-09 22:54:29'),
(2226, NULL, 3, '2023-09-10 01:54:39', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:54:39', '2023-09-09 22:54:39'),
(2227, NULL, 3, '2023-09-10 01:54:49', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:54:49', '2023-09-09 22:54:49'),
(2228, NULL, 3, '2023-09-10 01:54:59', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:54:59', '2023-09-09 22:54:59'),
(2229, NULL, 3, '2023-09-10 01:55:09', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:55:09', '2023-09-09 22:55:09'),
(2230, NULL, 3, '2023-09-10 01:55:19', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:55:19', '2023-09-09 22:55:19'),
(2231, NULL, 3, '2023-09-10 01:55:29', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:55:29', '2023-09-09 22:55:29'),
(2232, NULL, 3, '2023-09-10 01:55:39', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:55:39', '2023-09-09 22:55:39'),
(2233, NULL, 3, '2023-09-10 01:55:49', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:55:49', '2023-09-09 22:55:49'),
(2234, NULL, 3, '2023-09-10 01:55:59', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:55:59', '2023-09-09 22:55:59'),
(2235, NULL, 3, '2023-09-10 01:56:09', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:56:09', '2023-09-09 22:56:09'),
(2236, NULL, 3, '2023-09-10 01:56:19', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:56:19', '2023-09-09 22:56:19'),
(2237, NULL, 3, '2023-09-10 01:56:30', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:56:30', '2023-09-09 22:56:30'),
(2238, NULL, 3, '2023-09-10 01:56:39', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:56:39', '2023-09-09 22:56:39'),
(2239, NULL, 3, '2023-09-10 01:56:49', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:56:49', '2023-09-09 22:56:49'),
(2240, NULL, 3, '2023-09-10 01:56:59', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:56:59', '2023-09-09 22:56:59'),
(2241, NULL, 3, '2023-09-10 01:57:09', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:57:09', '2023-09-09 22:57:09'),
(2242, NULL, 3, '2023-09-10 01:57:19', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:57:19', '2023-09-09 22:57:19'),
(2243, NULL, 3, '2023-09-10 01:57:30', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:57:30', '2023-09-09 22:57:30'),
(2244, NULL, 3, '2023-09-10 01:57:39', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:57:39', '2023-09-09 22:57:39'),
(2245, NULL, 3, '2023-09-10 01:57:50', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:57:50', '2023-09-09 22:57:50'),
(2246, NULL, 3, '2023-09-10 01:57:59', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:57:59', '2023-09-09 22:57:59'),
(2247, NULL, 3, '2023-09-10 01:58:19', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:58:19', '2023-09-09 22:58:19'),
(2248, NULL, 3, '2023-09-10 01:58:29', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:58:29', '2023-09-09 22:58:29'),
(2249, NULL, 3, '2023-09-10 01:58:40', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:58:40', '2023-09-09 22:58:40'),
(2250, NULL, 3, '2023-09-10 01:58:50', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:58:50', '2023-09-09 22:58:50'),
(2251, NULL, 3, '2023-09-10 01:59:01', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:59:01', '2023-09-09 22:59:01'),
(2252, NULL, 3, '2023-09-10 01:59:09', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:59:09', '2023-09-09 22:59:09'),
(2253, NULL, 3, '2023-09-10 01:59:19', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:59:19', '2023-09-09 22:59:19'),
(2254, NULL, 3, '2023-09-10 01:59:29', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:59:29', '2023-09-09 22:59:29'),
(2255, NULL, 3, '2023-09-10 01:59:39', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:59:39', '2023-09-09 22:59:39'),
(2256, NULL, 3, '2023-09-10 01:59:56', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 22:59:56', '2023-09-09 22:59:56'),
(2257, NULL, 3, '2023-09-10 02:00:01', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:00:01', '2023-09-09 23:00:01'),
(2258, NULL, 3, '2023-09-10 02:00:21', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:00:21', '2023-09-09 23:00:21'),
(2259, NULL, 3, '2023-09-10 02:00:30', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:00:30', '2023-09-09 23:00:30'),
(2260, NULL, 3, '2023-09-10 02:00:39', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:00:39', '2023-09-09 23:00:39'),
(2261, NULL, 3, '2023-09-10 02:00:52', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:00:52', '2023-09-09 23:00:52'),
(2262, NULL, 3, '2023-09-10 02:01:00', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:01:00', '2023-09-09 23:01:00'),
(2263, NULL, 3, '2023-09-10 02:01:09', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:01:09', '2023-09-09 23:01:09'),
(2264, NULL, 3, '2023-09-10 02:01:19', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:01:19', '2023-09-09 23:01:19'),
(2265, NULL, 3, '2023-09-10 02:01:29', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:01:29', '2023-09-09 23:01:29'),
(2266, NULL, 3, '2023-09-10 02:01:39', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:01:39', '2023-09-09 23:01:39'),
(2267, NULL, 3, '2023-09-10 02:01:49', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:01:49', '2023-09-09 23:01:49'),
(2268, NULL, 3, '2023-09-10 02:02:00', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:02:00', '2023-09-09 23:02:00'),
(2269, NULL, 3, '2023-09-10 02:02:09', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:02:09', '2023-09-09 23:02:09'),
(2270, NULL, 3, '2023-09-10 02:02:19', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:02:19', '2023-09-09 23:02:19');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(2271, NULL, 3, '2023-09-10 02:02:30', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:02:30', '2023-09-09 23:02:30'),
(2272, NULL, 3, '2023-09-10 02:02:40', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:02:40', '2023-09-09 23:02:40'),
(2273, NULL, 3, '2023-09-10 02:02:49', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:02:49', '2023-09-09 23:02:49'),
(2274, NULL, 3, '2023-09-10 02:02:59', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:02:59', '2023-09-09 23:02:59'),
(2275, NULL, 3, '2023-09-10 02:03:09', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:03:09', '2023-09-09 23:03:09'),
(2276, NULL, 3, '2023-09-10 02:03:19', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:03:19', '2023-09-09 23:03:19'),
(2277, NULL, 3, '2023-09-10 02:03:29', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:03:29', '2023-09-09 23:03:29'),
(2278, NULL, 3, '2023-09-10 02:03:39', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:03:39', '2023-09-09 23:03:39'),
(2279, NULL, 3, '2023-09-10 02:03:49', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:03:49', '2023-09-09 23:03:49'),
(2280, NULL, 3, '2023-09-10 02:04:00', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:04:00', '2023-09-09 23:04:00'),
(2281, NULL, 3, '2023-09-10 02:04:09', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:04:09', '2023-09-09 23:04:09'),
(2282, NULL, 3, '2023-09-10 02:04:19', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:04:19', '2023-09-09 23:04:19'),
(2283, NULL, 3, '2023-09-10 02:04:29', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:04:29', '2023-09-09 23:04:29'),
(2284, NULL, 3, '2023-09-10 02:04:39', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:04:39', '2023-09-09 23:04:39'),
(2285, NULL, 3, '2023-09-10 02:04:50', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:04:50', '2023-09-09 23:04:50'),
(2286, NULL, 3, '2023-09-10 02:05:05', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:05:05', '2023-09-09 23:05:05'),
(2287, NULL, 3, '2023-09-10 02:05:15', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:05:15', '2023-09-09 23:05:15'),
(2288, NULL, 3, '2023-09-10 02:05:25', '48.0187233', '29.3261207', '196, , KW', '2023-09-09 23:05:25', '2023-09-09 23:05:25'),
(2289, NULL, 3, '2023-09-10 02:05:37', '48.0185253', '29.3267206', '82G9+MGJ, , KW', '2023-09-09 23:05:37', '2023-09-09 23:05:37'),
(2290, NULL, 3, '2023-09-10 02:05:46', '48.0187439', '29.326207', '82G9+FCP, , KW', '2023-09-09 23:05:46', '2023-09-09 23:05:46'),
(2291, NULL, 3, '2023-09-10 02:05:56', '48.0187529', '29.3261314', '196, , KW', '2023-09-09 23:05:56', '2023-09-09 23:05:56'),
(2292, NULL, 3, '2023-09-10 02:06:06', '48.0187445', '29.3261111', '196, , KW', '2023-09-09 23:06:06', '2023-09-09 23:06:06'),
(2293, NULL, 3, '2023-09-10 02:06:16', '48.0187389', '29.3261206', '196, , KW', '2023-09-09 23:06:16', '2023-09-09 23:06:16'),
(2294, NULL, 3, '2023-09-10 02:06:26', '48.0187464', '29.3261392', '196, , KW', '2023-09-09 23:06:26', '2023-09-09 23:06:26'),
(2295, NULL, 3, '2023-09-10 02:07:04', '48.0187272', '29.3259713', '196, , KW', '2023-09-09 23:07:04', '2023-09-09 23:07:04'),
(2296, NULL, 3, '2023-09-10 02:07:14', '48.0187426', '29.3261421', '196, , KW', '2023-09-09 23:07:14', '2023-09-09 23:07:14'),
(2297, NULL, 3, '2023-09-10 02:07:25', '48.018854', '29.3260776', '196, , KW', '2023-09-09 23:07:25', '2023-09-09 23:07:25'),
(2298, NULL, 3, '2023-09-10 02:07:34', '48.0188152', '29.3260613', '196, , KW', '2023-09-09 23:07:34', '2023-09-09 23:07:34'),
(2299, NULL, 3, '2023-09-10 02:07:45', '48.0188429', '29.3260469', '196, , KW', '2023-09-09 23:07:45', '2023-09-09 23:07:45'),
(2300, NULL, 3, '2023-09-10 02:07:54', '48.0187395', '29.3261433', '196, , KW', '2023-09-09 23:07:54', '2023-09-09 23:07:54'),
(2301, NULL, 3, '2023-09-10 02:08:04', '48.0188805', '29.3260667', '196, , KW', '2023-09-09 23:08:04', '2023-09-09 23:08:04'),
(2302, NULL, 3, '2023-09-10 02:08:14', '48.0188263', '29.3261158', '196, , KW', '2023-09-09 23:08:14', '2023-09-09 23:08:14'),
(2303, NULL, 3, '2023-09-10 02:08:24', '48.0188532', '29.3260446', '196, , KW', '2023-09-09 23:08:24', '2023-09-09 23:08:24'),
(2304, NULL, 3, '2023-09-10 02:08:34', '48.0188138', '29.3261023', '196, , KW', '2023-09-09 23:08:34', '2023-09-09 23:08:34'),
(2305, NULL, 3, '2023-09-10 02:08:45', '48.0187666', '29.3260721', '196, , KW', '2023-09-09 23:08:45', '2023-09-09 23:08:45'),
(2306, NULL, 3, '2023-09-10 02:08:54', '48.0188329', '29.326097', '196, , KW', '2023-09-09 23:08:54', '2023-09-09 23:08:54'),
(2307, NULL, 3, '2023-09-10 02:09:04', '48.018779', '29.3261177', '196, , KW', '2023-09-09 23:09:04', '2023-09-09 23:09:04'),
(2308, NULL, 3, '2023-09-10 02:09:14', '48.0187246', '29.326142', '196, , KW', '2023-09-09 23:09:14', '2023-09-09 23:09:14'),
(2309, NULL, 3, '2023-09-10 02:09:24', '48.0188379', '29.3261018', '196, , KW', '2023-09-09 23:09:24', '2023-09-09 23:09:24'),
(2310, NULL, 3, '2023-09-10 02:09:34', '48.0188929', '29.3260418', '196, , KW', '2023-09-09 23:09:34', '2023-09-09 23:09:34'),
(2311, NULL, 3, '2023-09-10 02:09:58', '48.0187734', '29.3260899', '196, , KW', '2023-09-09 23:09:58', '2023-09-09 23:09:58'),
(2312, NULL, 3, '2023-09-10 02:10:06', '48.0187707', '29.3260913', '196, , KW', '2023-09-09 23:10:06', '2023-09-09 23:10:06'),
(2313, NULL, 3, '2023-09-10 02:10:36', '48.0189099', '29.3260508', '196, , KW', '2023-09-09 23:10:36', '2023-09-09 23:10:36'),
(2314, NULL, 3, '2023-09-10 02:10:47', '48.0188398', '29.3261166', '196, , KW', '2023-09-09 23:10:47', '2023-09-09 23:10:47'),
(2315, NULL, 3, '2023-09-10 02:10:55', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:10:55', '2023-09-09 23:10:55'),
(2316, NULL, 3, '2023-09-10 02:11:06', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:11:06', '2023-09-09 23:11:06'),
(2317, NULL, 3, '2023-09-10 02:11:13', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:11:13', '2023-09-09 23:11:13'),
(2318, NULL, 3, '2023-09-10 02:11:25', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:11:25', '2023-09-09 23:11:25'),
(2319, NULL, 3, '2023-09-10 02:11:35', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:11:35', '2023-09-09 23:11:35'),
(2320, NULL, 3, '2023-09-10 02:11:43', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:11:43', '2023-09-09 23:11:43'),
(2321, NULL, 3, '2023-09-10 02:12:38', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:12:38', '2023-09-09 23:12:38'),
(2322, NULL, 3, '2023-09-10 02:13:26', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:13:26', '2023-09-09 23:13:26'),
(2323, NULL, 3, '2023-09-10 02:13:57', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:13:57', '2023-09-09 23:13:57'),
(2324, NULL, 3, '2023-09-10 02:14:58', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:14:58', '2023-09-09 23:14:58'),
(2325, NULL, 3, '2023-09-10 02:15:58', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:15:58', '2023-09-09 23:15:58'),
(2326, NULL, 3, '2023-09-10 02:17:08', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:17:08', '2023-09-09 23:17:08'),
(2327, NULL, 3, '2023-09-10 02:17:58', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:17:58', '2023-09-09 23:17:58'),
(2328, NULL, 3, '2023-09-10 02:18:58', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:18:58', '2023-09-09 23:18:58'),
(2329, NULL, 3, '2023-09-10 02:19:59', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:19:59', '2023-09-09 23:19:59'),
(2330, NULL, 3, '2023-09-10 02:21:00', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:21:00', '2023-09-09 23:21:00'),
(2331, NULL, 3, '2023-09-10 02:21:30', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:21:30', '2023-09-09 23:21:30'),
(2332, NULL, 3, '2023-09-10 02:22:31', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:22:31', '2023-09-09 23:22:31'),
(2333, NULL, 3, '2023-09-10 02:22:41', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:22:41', '2023-09-09 23:22:41'),
(2334, NULL, 3, '2023-09-10 02:22:51', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:22:51', '2023-09-09 23:22:51'),
(2335, NULL, 3, '2023-09-10 02:23:01', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:23:01', '2023-09-09 23:23:01'),
(2336, NULL, 3, '2023-09-10 02:23:11', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:23:11', '2023-09-09 23:23:11'),
(2337, NULL, 3, '2023-09-10 02:23:21', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:23:21', '2023-09-09 23:23:21'),
(2338, NULL, 3, '2023-09-10 02:23:31', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:23:31', '2023-09-09 23:23:31'),
(2339, NULL, 3, '2023-09-10 02:23:41', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:23:41', '2023-09-09 23:23:41'),
(2340, NULL, 3, '2023-09-10 02:24:12', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:24:12', '2023-09-09 23:24:12'),
(2341, NULL, 3, '2023-09-10 02:25:06', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:25:06', '2023-09-09 23:25:06'),
(2342, NULL, 3, '2023-09-10 02:25:55', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:25:55', '2023-09-09 23:25:55'),
(2343, NULL, 3, '2023-09-10 02:26:22', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:26:22', '2023-09-09 23:26:22'),
(2344, NULL, 3, '2023-09-10 02:27:06', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:27:06', '2023-09-09 23:27:06'),
(2345, NULL, 3, '2023-09-10 02:28:35', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:28:35', '2023-09-09 23:28:35'),
(2346, NULL, 3, '2023-09-10 02:29:37', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:29:37', '2023-09-09 23:29:37'),
(2347, NULL, 3, '2023-09-10 02:30:37', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:30:37', '2023-09-09 23:30:37'),
(2348, NULL, 3, '2023-09-10 02:31:22', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:31:22', '2023-09-09 23:31:22'),
(2349, NULL, 3, '2023-09-10 02:32:25', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:32:25', '2023-09-09 23:32:25'),
(2350, NULL, 3, '2023-09-10 02:33:15', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:33:15', '2023-09-09 23:33:15'),
(2351, NULL, 3, '2023-09-10 02:33:41', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:33:41', '2023-09-09 23:33:41'),
(2352, NULL, 3, '2023-09-10 02:34:52', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:34:52', '2023-09-09 23:34:52'),
(2353, NULL, 3, '2023-09-10 02:35:35', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:35:35', '2023-09-09 23:35:35'),
(2354, NULL, 3, '2023-09-10 02:36:31', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:36:31', '2023-09-09 23:36:31'),
(2355, NULL, 3, '2023-09-10 02:37:35', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:37:35', '2023-09-09 23:37:35'),
(2356, NULL, 3, '2023-09-10 02:38:03', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:38:03', '2023-09-09 23:38:03'),
(2357, NULL, 3, '2023-09-10 02:39:14', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:39:14', '2023-09-09 23:39:14'),
(2358, NULL, 3, '2023-09-10 02:40:16', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:40:16', '2023-09-09 23:40:16'),
(2359, NULL, 3, '2023-09-10 02:41:06', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:41:06', '2023-09-09 23:41:06'),
(2360, NULL, 3, '2023-09-10 02:41:39', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:41:39', '2023-09-09 23:41:39'),
(2361, NULL, 3, '2023-09-10 02:42:15', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:42:15', '2023-09-09 23:42:15'),
(2362, NULL, 3, '2023-09-10 02:42:48', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:42:48', '2023-09-09 23:42:48'),
(2363, NULL, 3, '2023-09-10 02:43:43', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:43:43', '2023-09-09 23:43:43'),
(2364, NULL, 3, '2023-09-10 02:44:55', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:44:55', '2023-09-09 23:44:55'),
(2365, NULL, 3, '2023-09-10 02:45:52', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:45:52', '2023-09-09 23:45:52'),
(2366, NULL, 3, '2023-09-10 02:47:03', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:47:03', '2023-09-09 23:47:03'),
(2367, NULL, 3, '2023-09-10 02:47:57', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:47:57', '2023-09-09 23:47:57'),
(2368, NULL, 3, '2023-09-10 02:49:07', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:49:07', '2023-09-09 23:49:07'),
(2369, NULL, 3, '2023-09-10 02:49:46', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:49:46', '2023-09-09 23:49:46'),
(2370, NULL, 3, '2023-09-10 02:50:09', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:50:09', '2023-09-09 23:50:09'),
(2371, NULL, 3, '2023-09-10 02:50:45', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:50:45', '2023-09-09 23:50:45'),
(2372, NULL, 3, '2023-09-10 02:51:28', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:51:28', '2023-09-09 23:51:28'),
(2373, NULL, 3, '2023-09-10 02:52:38', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:52:38', '2023-09-09 23:52:38'),
(2374, NULL, 3, '2023-09-10 02:53:05', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:53:05', '2023-09-09 23:53:05'),
(2375, NULL, 3, '2023-09-10 02:53:15', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:53:15', '2023-09-09 23:53:15'),
(2376, NULL, 3, '2023-09-10 02:53:25', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:53:25', '2023-09-09 23:53:25'),
(2377, NULL, 3, '2023-09-10 02:53:35', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:53:35', '2023-09-09 23:53:35'),
(2378, NULL, 3, '2023-09-10 02:53:45', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:53:45', '2023-09-09 23:53:45'),
(2379, NULL, 3, '2023-09-10 02:53:55', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:53:55', '2023-09-09 23:53:55'),
(2380, NULL, 3, '2023-09-10 02:54:05', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:54:05', '2023-09-09 23:54:05'),
(2381, NULL, 3, '2023-09-10 02:54:15', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:54:15', '2023-09-09 23:54:15'),
(2382, NULL, 3, '2023-09-10 02:54:25', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:54:25', '2023-09-09 23:54:25'),
(2383, NULL, 3, '2023-09-10 02:54:35', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:54:35', '2023-09-09 23:54:35'),
(2384, NULL, 3, '2023-09-10 02:54:45', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:54:45', '2023-09-09 23:54:45'),
(2385, NULL, 3, '2023-09-10 02:54:57', '48.0187321', '29.3261621', '196, , KW', '2023-09-09 23:54:57', '2023-09-09 23:54:57'),
(2386, NULL, 3, '2023-09-27 18:17:53', '47.9412778', '29.313865', '421, , KW', '2023-09-27 15:17:53', '2023-09-27 15:17:53'),
(2387, NULL, 3, '2023-09-27 18:18:01', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:18:01', '2023-09-27 15:18:01'),
(2388, NULL, 3, '2023-09-27 18:18:10', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:18:10', '2023-09-27 15:18:10'),
(2389, NULL, 3, '2023-09-27 18:18:20', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:18:20', '2023-09-27 15:18:20'),
(2390, NULL, 3, '2023-09-27 18:18:30', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:18:30', '2023-09-27 15:18:30'),
(2391, NULL, 3, '2023-09-27 18:18:40', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:18:40', '2023-09-27 15:18:40'),
(2392, NULL, 3, '2023-09-27 18:18:50', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:18:50', '2023-09-27 15:18:50'),
(2393, NULL, 3, '2023-09-27 18:19:00', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:19:00', '2023-09-27 15:19:00'),
(2394, NULL, 3, '2023-09-27 18:19:11', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:19:11', '2023-09-27 15:19:11'),
(2395, NULL, 3, '2023-09-27 18:19:20', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:19:20', '2023-09-27 15:19:20'),
(2396, NULL, 3, '2023-09-27 18:19:30', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:19:30', '2023-09-27 15:19:30'),
(2397, NULL, 3, '2023-09-27 18:19:40', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:19:40', '2023-09-27 15:19:40'),
(2398, NULL, 3, '2023-09-27 18:19:50', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:19:50', '2023-09-27 15:19:50'),
(2399, NULL, 3, '2023-09-27 18:20:00', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:20:00', '2023-09-27 15:20:00'),
(2400, NULL, 3, '2023-09-27 18:20:10', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:20:10', '2023-09-27 15:20:10'),
(2401, NULL, 3, '2023-09-27 18:20:20', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:20:20', '2023-09-27 15:20:20'),
(2402, NULL, 3, '2023-09-27 18:20:30', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:20:30', '2023-09-27 15:20:30'),
(2403, NULL, 3, '2023-09-27 18:20:41', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:20:41', '2023-09-27 15:20:41'),
(2404, NULL, 3, '2023-09-27 18:20:50', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:20:50', '2023-09-27 15:20:50'),
(2405, NULL, 3, '2023-09-27 18:21:10', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:21:10', '2023-09-27 15:21:10'),
(2406, NULL, 3, '2023-09-27 18:21:51', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:21:51', '2023-09-27 15:21:51'),
(2407, NULL, 3, '2023-09-27 18:23:25', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:23:25', '2023-09-27 15:23:25'),
(2408, NULL, 3, '2023-09-27 18:25:36', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:25:36', '2023-09-27 15:25:36'),
(2409, NULL, 3, '2023-09-27 18:25:46', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:25:46', '2023-09-27 15:25:46'),
(2410, NULL, 3, '2023-09-27 18:25:56', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:25:56', '2023-09-27 15:25:56'),
(2411, NULL, 3, '2023-09-27 18:26:06', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:26:06', '2023-09-27 15:26:06'),
(2412, NULL, 3, '2023-09-27 18:26:16', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:26:16', '2023-09-27 15:26:16'),
(2413, NULL, 3, '2023-09-27 18:26:26', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:26:26', '2023-09-27 15:26:26'),
(2414, NULL, 3, '2023-09-27 18:26:36', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:26:36', '2023-09-27 15:26:36'),
(2415, NULL, 3, '2023-09-27 18:26:47', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:26:47', '2023-09-27 15:26:47'),
(2416, NULL, 3, '2023-09-27 18:26:56', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:26:56', '2023-09-27 15:26:56'),
(2417, NULL, 3, '2023-09-27 18:27:06', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:27:06', '2023-09-27 15:27:06'),
(2418, NULL, 3, '2023-09-27 18:27:16', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:27:16', '2023-09-27 15:27:16'),
(2419, NULL, 3, '2023-09-27 18:27:26', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:27:26', '2023-09-27 15:27:26'),
(2420, NULL, 3, '2023-09-27 18:27:36', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:27:36', '2023-09-27 15:27:36'),
(2421, NULL, 3, '2023-09-27 18:27:46', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:27:46', '2023-09-27 15:27:46'),
(2422, NULL, 3, '2023-09-27 18:27:56', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:27:56', '2023-09-27 15:27:56'),
(2423, NULL, 3, '2023-09-27 18:28:06', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:28:06', '2023-09-27 15:28:06'),
(2424, NULL, 3, '2023-09-27 18:28:16', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:28:16', '2023-09-27 15:28:16'),
(2425, NULL, 3, '2023-09-27 18:28:26', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:28:26', '2023-09-27 15:28:26'),
(2426, NULL, 3, '2023-09-27 18:28:36', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:28:36', '2023-09-27 15:28:36'),
(2427, NULL, 3, '2023-09-27 18:28:46', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:28:46', '2023-09-27 15:28:46'),
(2428, NULL, 3, '2023-09-27 18:29:00', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:29:00', '2023-09-27 15:29:00'),
(2429, NULL, 3, '2023-09-27 18:29:12', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:29:12', '2023-09-27 15:29:12'),
(2430, NULL, 3, '2023-09-27 18:29:38', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:29:38', '2023-09-27 15:29:38'),
(2431, NULL, 3, '2023-09-27 18:31:26', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:31:26', '2023-09-27 15:31:26'),
(2432, NULL, 3, '2023-09-27 18:32:16', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:32:16', '2023-09-27 15:32:16'),
(2433, NULL, 3, '2023-09-27 18:32:27', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:32:27', '2023-09-27 15:32:27'),
(2434, NULL, 3, '2023-09-27 18:32:36', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:32:36', '2023-09-27 15:32:36'),
(2435, NULL, 3, '2023-09-27 18:32:47', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:32:47', '2023-09-27 15:32:47'),
(2436, NULL, 3, '2023-09-27 18:32:56', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:32:56', '2023-09-27 15:32:56'),
(2437, NULL, 3, '2023-09-27 18:33:06', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:33:06', '2023-09-27 15:33:06'),
(2438, NULL, 3, '2023-09-27 18:33:16', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:33:16', '2023-09-27 15:33:16'),
(2439, NULL, 3, '2023-09-27 18:33:26', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:33:26', '2023-09-27 15:33:26'),
(2440, NULL, 3, '2023-09-27 18:33:36', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:33:36', '2023-09-27 15:33:36'),
(2441, NULL, 3, '2023-09-27 18:33:46', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:33:46', '2023-09-27 15:33:46'),
(2442, NULL, 3, '2023-09-27 18:33:56', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:33:56', '2023-09-27 15:33:56'),
(2443, NULL, 3, '2023-09-27 18:34:06', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:34:06', '2023-09-27 15:34:06'),
(2444, NULL, 3, '2023-09-27 18:34:16', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:34:16', '2023-09-27 15:34:16'),
(2445, NULL, 3, '2023-09-27 18:34:26', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:34:26', '2023-09-27 15:34:26'),
(2446, NULL, 3, '2023-09-27 18:34:36', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:34:36', '2023-09-27 15:34:36'),
(2447, NULL, 3, '2023-09-27 18:34:46', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:34:46', '2023-09-27 15:34:46'),
(2448, NULL, 3, '2023-09-27 18:34:56', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:34:56', '2023-09-27 15:34:56'),
(2449, NULL, 3, '2023-09-27 18:35:06', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:35:06', '2023-09-27 15:35:06'),
(2450, NULL, 3, '2023-09-27 18:35:16', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:35:16', '2023-09-27 15:35:16'),
(2451, NULL, 3, '2023-09-27 18:35:26', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:35:26', '2023-09-27 15:35:26'),
(2452, NULL, 3, '2023-09-27 18:35:37', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:35:37', '2023-09-27 15:35:37'),
(2453, NULL, 3, '2023-09-27 18:37:45', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:37:45', '2023-09-27 15:37:45'),
(2454, NULL, 3, '2023-09-27 18:38:19', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:38:19', '2023-09-27 15:38:19'),
(2455, NULL, 3, '2023-09-27 18:39:15', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:39:15', '2023-09-27 15:39:15'),
(2456, NULL, 3, '2023-09-27 18:39:24', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:39:24', '2023-09-27 15:39:24'),
(2457, NULL, 3, '2023-09-27 18:39:34', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:39:34', '2023-09-27 15:39:34'),
(2458, NULL, 3, '2023-09-27 18:39:44', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:39:44', '2023-09-27 15:39:44'),
(2459, NULL, 3, '2023-09-27 18:39:54', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:39:54', '2023-09-27 15:39:54'),
(2460, NULL, 3, '2023-09-27 18:40:04', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:40:04', '2023-09-27 15:40:04'),
(2461, NULL, 3, '2023-09-27 18:40:14', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:40:14', '2023-09-27 15:40:14'),
(2462, NULL, 3, '2023-09-27 18:40:24', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:40:24', '2023-09-27 15:40:24'),
(2463, NULL, 3, '2023-09-27 18:40:34', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:40:34', '2023-09-27 15:40:34'),
(2464, NULL, 3, '2023-09-27 18:40:44', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:40:44', '2023-09-27 15:40:44'),
(2465, NULL, 3, '2023-09-27 18:40:54', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:40:54', '2023-09-27 15:40:54'),
(2466, NULL, 3, '2023-09-27 18:41:29', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:41:29', '2023-09-27 15:41:29'),
(2467, NULL, 3, '2023-09-27 18:42:34', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:42:34', '2023-09-27 15:42:34'),
(2468, NULL, 3, '2023-09-27 18:45:13', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:45:13', '2023-09-27 15:45:13'),
(2469, NULL, 3, '2023-09-27 18:48:54', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:48:54', '2023-09-27 15:48:54'),
(2470, NULL, 3, '2023-09-27 18:49:06', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:49:06', '2023-09-27 15:49:06'),
(2471, NULL, 3, '2023-09-27 18:53:17', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:53:17', '2023-09-27 15:53:17'),
(2472, NULL, 3, '2023-09-27 18:57:20', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:57:20', '2023-09-27 15:57:20'),
(2473, NULL, 3, '2023-09-27 18:57:46', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:57:46', '2023-09-27 15:57:46'),
(2474, NULL, 3, '2023-09-27 18:57:56', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:57:56', '2023-09-27 15:57:56'),
(2475, NULL, 3, '2023-09-27 18:58:06', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:58:06', '2023-09-27 15:58:06'),
(2476, NULL, 3, '2023-09-27 18:58:16', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:58:16', '2023-09-27 15:58:16'),
(2477, NULL, 3, '2023-09-27 18:58:26', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:58:26', '2023-09-27 15:58:26'),
(2478, NULL, 3, '2023-09-27 18:58:36', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:58:36', '2023-09-27 15:58:36'),
(2479, NULL, 3, '2023-09-27 18:58:46', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:58:46', '2023-09-27 15:58:46'),
(2480, NULL, 3, '2023-09-27 18:58:56', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:58:56', '2023-09-27 15:58:56'),
(2481, NULL, 3, '2023-09-27 18:59:06', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:59:06', '2023-09-27 15:59:06'),
(2482, NULL, 3, '2023-09-27 18:59:16', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:59:16', '2023-09-27 15:59:16'),
(2483, NULL, 3, '2023-09-27 18:59:26', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:59:26', '2023-09-27 15:59:26'),
(2484, NULL, 3, '2023-09-27 18:59:36', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:59:36', '2023-09-27 15:59:36'),
(2485, NULL, 3, '2023-09-27 18:59:46', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:59:46', '2023-09-27 15:59:46'),
(2486, NULL, 3, '2023-09-27 18:59:56', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 15:59:56', '2023-09-27 15:59:56'),
(2487, NULL, 3, '2023-09-27 19:00:07', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 16:00:07', '2023-09-27 16:00:07'),
(2488, NULL, 3, '2023-09-27 19:00:25', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 16:00:25', '2023-09-27 16:00:25'),
(2489, NULL, 3, '2023-09-27 19:00:53', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 16:00:53', '2023-09-27 16:00:53'),
(2490, NULL, 3, '2023-09-27 19:01:03', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 16:01:03', '2023-09-27 16:01:03'),
(2491, NULL, 3, '2023-09-27 19:01:13', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 16:01:13', '2023-09-27 16:01:13'),
(2492, NULL, 3, '2023-09-27 19:01:23', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 16:01:23', '2023-09-27 16:01:23'),
(2493, NULL, 3, '2023-09-27 19:01:33', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 16:01:33', '2023-09-27 16:01:33'),
(2494, NULL, 3, '2023-09-27 19:01:43', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 16:01:43', '2023-09-27 16:01:43'),
(2495, NULL, 3, '2023-09-27 19:01:53', '47.9412811', '29.3138676', '421, , KW', '2023-09-27 16:01:53', '2023-09-27 16:01:53'),
(2496, NULL, 3, '2023-09-27 19:02:05', '47.9412926', '29.3138577', '421, , KW', '2023-09-27 16:02:05', '2023-09-27 16:02:05'),
(2497, NULL, 3, '2023-09-27 19:02:18', '47.9412429', '29.3137658', '421, , KW', '2023-09-27 16:02:18', '2023-09-27 16:02:18'),
(2498, NULL, 3, '2023-09-27 19:03:06', '47.941298', '29.3138662', '421, , KW', '2023-09-27 16:03:06', '2023-09-27 16:03:06'),
(2499, NULL, 3, '2023-09-27 19:03:26', '47.9412993', '29.3134933', '421, , KW', '2023-09-27 16:03:26', '2023-09-27 16:03:26'),
(2500, NULL, 3, '2023-09-27 19:03:42', '47.9414496', '29.3132731', '421, , KW', '2023-09-27 16:03:42', '2023-09-27 16:03:42'),
(2501, NULL, 3, '2023-09-27 19:04:01', '47.9418481', '29.3128067', 'الكويت‎, , KW', '2023-09-27 16:04:01', '2023-09-27 16:04:01'),
(2502, NULL, 3, '2023-09-27 19:04:43', '47.9425615', '29.3104348', 'الكويت‎, , KW', '2023-09-27 16:04:43', '2023-09-27 16:04:43'),
(2503, NULL, 3, '2023-09-27 19:04:58', '47.9427689', '29.3099753', '8W5V+W3H, , KW', '2023-09-27 16:04:58', '2023-09-27 16:04:58'),
(2504, NULL, 3, '2023-09-27 19:06:59', '47.9470242', '29.2965435', '7WWW+RV9, , KW', '2023-09-27 16:06:59', '2023-09-27 16:06:59'),
(2505, NULL, 3, '2023-09-27 19:07:46', '47.9457869', '29.2892254', 'شارع الاردن, , KW', '2023-09-27 16:07:46', '2023-09-27 16:07:46'),
(2506, NULL, 3, '2023-09-27 19:08:08', '47.9499641', '29.280438', 'الكويت‎, , KW', '2023-09-27 16:08:08', '2023-09-27 16:08:08'),
(2507, NULL, 3, '2023-09-27 19:09:01', '47.9499641', '29.280438', 'الكويت‎, , KW', '2023-09-27 16:09:01', '2023-09-27 16:09:01'),
(2508, NULL, 3, '2023-09-27 19:09:20', '47.9499641', '29.280438', 'الكويت‎, , KW', '2023-09-27 16:09:20', '2023-09-27 16:09:20'),
(2509, NULL, 3, '2023-09-27 19:11:35', '47.9504268', '29.2669134', '34, , KW', '2023-09-27 16:11:35', '2023-09-27 16:11:35'),
(2510, NULL, 3, '2023-09-27 19:12:59', '47.9708473', '29.2661365', 'Airport Road, , KW', '2023-09-27 16:12:59', '2023-09-27 16:12:59'),
(2511, NULL, 3, '2023-09-27 19:13:17', '47.9717757', '29.2632199', 'Airport Road, , KW', '2023-09-27 16:13:17', '2023-09-27 16:13:17'),
(2512, NULL, 3, '2023-09-27 19:14:43', '47.9838462', '29.2580365', '7X5M+4W, , KW', '2023-09-27 16:14:43', '2023-09-27 16:14:43'),
(2513, NULL, 3, '2023-09-27 19:15:02', '48.0005637', '29.2650524', 'مقابل نادي الكويت للعلوم, , KW', '2023-09-27 16:15:02', '2023-09-27 16:15:02'),
(2514, NULL, 3, '2023-09-27 19:17:14', '48.020074', '29.2648008', 'طريق جاسم محمد الخرافي, , KW', '2023-09-27 16:17:14', '2023-09-27 16:17:14'),
(2515, NULL, 3, '2023-09-27 19:17:44', '48.0315209', '29.2656632', '63, , KW', '2023-09-27 16:17:44', '2023-09-27 16:17:44'),
(2516, NULL, 3, '2023-09-27 19:18:27', '48.0315209', '29.2656632', '63, , KW', '2023-09-27 16:18:27', '2023-09-27 16:18:27'),
(2517, NULL, 3, '2023-09-27 19:19:16', '48.0616008', '29.2638037', '7377+927, , KW', '2023-09-27 16:19:16', '2023-09-27 16:19:16'),
(2518, NULL, 3, '2023-09-27 19:23:10', '48.0779477', '29.2662625', 'Street 126, , KW', '2023-09-27 16:23:10', '2023-09-27 16:23:10'),
(2519, NULL, 3, '2023-09-27 19:25:23', '48.0829887', '29.2701533', '73CM+56P, , KW', '2023-09-27 16:25:23', '2023-09-27 16:25:23'),
(2520, NULL, 3, '2023-09-27 19:26:30', '48.0879507', '29.2571557', '734Q+V45, , KW', '2023-09-27 16:26:30', '2023-09-27 16:26:30'),
(2521, NULL, 3, '2023-09-27 19:27:29', '48.0872813', '29.2482751', '63XP+8W7, , KW', '2023-09-27 16:27:29', '2023-09-27 16:27:29'),
(2522, NULL, 3, '2023-09-27 19:29:27', '48.0852551', '29.2485432', '63XP+C39, , KW', '2023-09-27 16:29:27', '2023-09-27 16:29:27'),
(2523, NULL, 3, '2023-09-27 19:30:54', '48.0853833', '29.2484558', 'الكويت‎, , KW', '2023-09-27 16:30:54', '2023-09-27 16:30:54'),
(2524, NULL, 3, '2023-09-27 19:33:19', '48.0854267', '29.2484732', 'الكويت‎, , KW', '2023-09-27 16:33:19', '2023-09-27 16:33:19'),
(2525, NULL, 3, '2023-09-27 19:33:38', '48.0852345', '29.2487225', '63XP+F38, , KW', '2023-09-27 16:33:38', '2023-09-27 16:33:38'),
(2526, NULL, 3, '2023-09-27 19:34:15', '48.0854356', '29.2484388', 'الكويت‎, , KW', '2023-09-27 16:34:15', '2023-09-27 16:34:15'),
(2527, NULL, 3, '2023-09-27 19:44:08', '48.0854158', '29.2483899', 'الكويت‎, , KW', '2023-09-27 16:44:08', '2023-09-27 16:44:08'),
(2528, NULL, 3, '2023-09-27 19:44:08', '48.0854158', '29.2483899', 'الكويت‎, , KW', '2023-09-27 16:44:08', '2023-09-27 16:44:08'),
(2529, NULL, 3, '2023-09-27 19:44:08', '48.0854158', '29.2483899', 'الكويت‎, , KW', '2023-09-27 16:44:08', '2023-09-27 16:44:08'),
(2530, NULL, 3, '2023-09-27 19:44:08', '48.0854158', '29.2483899', 'الكويت‎, , KW', '2023-09-27 16:44:08', '2023-09-27 16:44:08'),
(2531, NULL, 3, '2023-09-27 19:44:09', '48.0854158', '29.2483899', 'الكويت‎, , KW', '2023-09-27 16:44:09', '2023-09-27 16:44:09'),
(2532, NULL, 3, '2023-09-27 19:44:11', '48.0854243', '29.2484053', 'الكويت‎, , KW', '2023-09-27 16:44:11', '2023-09-27 16:44:11'),
(2533, NULL, 3, '2023-09-27 19:48:08', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 16:48:08', '2023-09-27 16:48:08'),
(2534, NULL, 3, '2023-09-27 19:51:22', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 16:51:22', '2023-09-27 16:51:22'),
(2535, NULL, 3, '2023-09-27 19:54:16', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 16:54:16', '2023-09-27 16:54:16'),
(2536, NULL, 3, '2023-09-27 19:54:26', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 16:54:26', '2023-09-27 16:54:26'),
(2537, NULL, 3, '2023-09-27 19:54:36', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 16:54:36', '2023-09-27 16:54:36'),
(2538, NULL, 3, '2023-09-27 19:54:46', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 16:54:46', '2023-09-27 16:54:46'),
(2539, NULL, 3, '2023-09-27 19:54:56', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 16:54:56', '2023-09-27 16:54:56'),
(2540, NULL, 3, '2023-09-27 19:55:06', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 16:55:06', '2023-09-27 16:55:06'),
(2541, NULL, 3, '2023-09-27 19:55:16', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 16:55:16', '2023-09-27 16:55:16'),
(2542, NULL, 3, '2023-09-27 19:55:26', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 16:55:26', '2023-09-27 16:55:26'),
(2543, NULL, 3, '2023-09-27 19:55:36', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 16:55:36', '2023-09-27 16:55:36'),
(2544, NULL, 3, '2023-09-27 19:55:46', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 16:55:46', '2023-09-27 16:55:46'),
(2545, NULL, 3, '2023-09-27 19:55:56', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 16:55:56', '2023-09-27 16:55:56'),
(2546, NULL, 3, '2023-09-27 19:56:06', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 16:56:06', '2023-09-27 16:56:06'),
(2547, NULL, 3, '2023-09-27 19:58:41', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 16:58:41', '2023-09-27 16:58:41'),
(2548, NULL, 3, '2023-09-27 20:01:18', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:01:18', '2023-09-27 17:01:18'),
(2549, NULL, 3, '2023-09-27 20:04:48', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:04:48', '2023-09-27 17:04:48'),
(2550, NULL, 3, '2023-09-27 20:05:58', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:05:58', '2023-09-27 17:05:58'),
(2551, NULL, 3, '2023-09-27 20:08:33', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:08:33', '2023-09-27 17:08:33'),
(2552, NULL, 3, '2023-09-27 20:13:38', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:13:38', '2023-09-27 17:13:38'),
(2553, NULL, 3, '2023-09-27 20:13:38', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:13:38', '2023-09-27 17:13:38'),
(2554, NULL, 3, '2023-09-27 20:15:42', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:15:42', '2023-09-27 17:15:42'),
(2555, NULL, 3, '2023-09-27 20:20:00', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:20:00', '2023-09-27 17:20:00'),
(2556, NULL, 3, '2023-09-27 20:21:00', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:21:00', '2023-09-27 17:21:00'),
(2557, NULL, 3, '2023-09-27 20:21:57', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:21:57', '2023-09-27 17:21:57'),
(2558, NULL, 3, '2023-09-27 20:22:58', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:22:58', '2023-09-27 17:22:58'),
(2559, NULL, 3, '2023-09-27 20:23:25', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:23:25', '2023-09-27 17:23:25'),
(2560, NULL, 3, '2023-09-27 20:26:24', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:26:24', '2023-09-27 17:26:24'),
(2561, NULL, 3, '2023-09-27 20:27:40', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:27:40', '2023-09-27 17:27:40'),
(2562, NULL, 3, '2023-09-27 20:29:00', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:29:00', '2023-09-27 17:29:00'),
(2563, NULL, 3, '2023-09-27 20:30:07', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:30:07', '2023-09-27 17:30:07'),
(2564, NULL, 3, '2023-09-27 20:31:03', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:31:03', '2023-09-27 17:31:03'),
(2565, NULL, 3, '2023-09-27 20:32:42', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:32:42', '2023-09-27 17:32:42'),
(2566, NULL, 3, '2023-09-27 20:33:09', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:33:09', '2023-09-27 17:33:09'),
(2567, NULL, 3, '2023-09-27 20:33:19', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:33:19', '2023-09-27 17:33:19'),
(2568, NULL, 3, '2023-09-27 20:33:30', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:33:30', '2023-09-27 17:33:30'),
(2569, NULL, 3, '2023-09-27 20:33:39', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:33:39', '2023-09-27 17:33:39'),
(2570, NULL, 3, '2023-09-27 20:33:49', '48.0856398', '29.248439', '63XP+959, , KW', '2023-09-27 17:33:49', '2023-09-27 17:33:49'),
(2571, NULL, 3, '2023-09-27 20:34:06', '48.0189246', '29.3260238', 'Unknown Location Found', '2023-09-27 17:34:06', '2023-09-27 17:34:06'),
(2572, NULL, 3, '2023-09-27 20:34:11', '48.0190137', '29.3260177', '196, , KW', '2023-09-27 17:34:11', '2023-09-27 17:34:11'),
(2573, NULL, 3, '2023-09-27 20:34:22', '48.0186428', '29.3257549', 'الكويت‎, , KW', '2023-09-27 17:34:22', '2023-09-27 17:34:22'),
(2574, NULL, 3, '2023-09-27 20:34:31', '48.0184415', '29.3256077', 'الكويت‎, , KW', '2023-09-27 17:34:31', '2023-09-27 17:34:31'),
(2575, NULL, 3, '2023-09-27 20:34:41', '48.0183516', '29.3255435', '82G9+59R, , KW', '2023-09-27 17:34:41', '2023-09-27 17:34:41'),
(2576, NULL, 3, '2023-09-27 20:34:51', '48.0184941', '29.3258226', '82G9+893, , KW', '2023-09-27 17:34:51', '2023-09-27 17:34:51'),
(2577, NULL, 3, '2023-09-27 20:35:38', '48.0187278', '29.3261313', '196, , KW', '2023-09-27 17:35:38', '2023-09-27 17:35:38'),
(2578, NULL, 3, '2023-09-27 20:35:48', '48.0187388', '29.3261186', '196, , KW', '2023-09-27 17:35:48', '2023-09-27 17:35:48'),
(2579, NULL, 3, '2023-09-27 20:43:49', '48.0191448', '29.3263634', '196, , KW', '2023-09-27 17:43:49', '2023-09-27 17:43:49'),
(2580, NULL, 3, '2023-09-27 20:44:00', '48.0186318', '29.3261461', '82G9+FCP, , KW', '2023-09-27 17:44:00', '2023-09-27 17:44:00'),
(2581, NULL, 3, '2023-09-27 20:44:09', '48.018602', '29.326102', '196, , KW', '2023-09-27 17:44:09', '2023-09-27 17:44:09'),
(2582, NULL, 3, '2023-09-27 20:44:20', '48.0186562', '29.3261027', '196, , KW', '2023-09-27 17:44:20', '2023-09-27 17:44:20'),
(2583, NULL, 3, '2023-09-27 20:44:29', '48.0186764', '29.3261031', '196, , KW', '2023-09-27 17:44:29', '2023-09-27 17:44:29'),
(2584, NULL, 3, '2023-09-27 20:44:39', '48.0186423', '29.3260976', '196, , KW', '2023-09-27 17:44:39', '2023-09-27 17:44:39'),
(2585, NULL, 3, '2023-09-27 20:44:49', '48.0186837', '29.32611', '196, , KW', '2023-09-27 17:44:49', '2023-09-27 17:44:49'),
(2586, NULL, 3, '2023-09-27 20:44:59', '48.0187095', '29.3261212', '196, , KW', '2023-09-27 17:44:59', '2023-09-27 17:44:59'),
(2587, NULL, 3, '2023-09-27 20:45:09', '48.018725', '29.3261275', '196, , KW', '2023-09-27 17:45:09', '2023-09-27 17:45:09'),
(2588, NULL, 3, '2023-09-27 20:45:19', '48.0187359', '29.3261314', '196, , KW', '2023-09-27 17:45:19', '2023-09-27 17:45:19'),
(2589, NULL, 3, '2023-09-27 20:47:29', '48.0186861', '29.3261044', '196, , KW', '2023-09-27 17:47:29', '2023-09-27 17:47:29'),
(2590, NULL, 3, '2023-09-27 20:49:03', '48.0187314', '29.3261322', '196, , KW', '2023-09-27 17:49:03', '2023-09-27 17:49:03'),
(2591, NULL, 3, '2023-09-27 20:49:14', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 17:49:14', '2023-09-27 17:49:14'),
(2592, NULL, 3, '2023-09-27 20:51:11', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 17:51:11', '2023-09-27 17:51:11'),
(2593, NULL, 3, '2023-09-27 20:55:24', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 17:55:24', '2023-09-27 17:55:24'),
(2594, NULL, 3, '2023-09-27 20:57:05', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 17:57:05', '2023-09-27 17:57:05'),
(2595, NULL, 3, '2023-09-27 20:57:36', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 17:57:36', '2023-09-27 17:57:36'),
(2596, NULL, 3, '2023-09-27 21:01:12', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:01:12', '2023-09-27 18:01:12'),
(2597, NULL, 3, '2023-09-27 21:03:18', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:03:18', '2023-09-27 18:03:18'),
(2598, NULL, 3, '2023-09-27 21:06:44', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:06:44', '2023-09-27 18:06:44'),
(2599, NULL, 3, '2023-09-27 21:07:13', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:07:13', '2023-09-27 18:07:13'),
(2600, NULL, 3, '2023-09-27 21:07:31', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:07:31', '2023-09-27 18:07:31'),
(2601, NULL, 3, '2023-09-27 21:10:17', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:10:17', '2023-09-27 18:10:17'),
(2602, NULL, 3, '2023-09-27 21:10:25', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:10:25', '2023-09-27 18:10:25'),
(2603, NULL, 3, '2023-09-27 21:10:35', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:10:35', '2023-09-27 18:10:35'),
(2604, NULL, 3, '2023-09-27 21:10:49', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:10:49', '2023-09-27 18:10:49'),
(2605, NULL, 3, '2023-09-27 21:11:37', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:11:37', '2023-09-27 18:11:37'),
(2606, NULL, 3, '2023-09-27 21:13:36', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:13:36', '2023-09-27 18:13:36'),
(2607, NULL, 3, '2023-09-27 21:17:29', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:17:29', '2023-09-27 18:17:29'),
(2608, NULL, 3, '2023-09-27 21:18:43', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:18:43', '2023-09-27 18:18:43'),
(2609, NULL, 3, '2023-09-27 21:18:53', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:18:53', '2023-09-27 18:18:53'),
(2610, NULL, 3, '2023-09-27 21:19:04', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:19:04', '2023-09-27 18:19:04'),
(2611, NULL, 3, '2023-09-27 21:19:12', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:19:12', '2023-09-27 18:19:12'),
(2612, NULL, 3, '2023-09-27 21:19:22', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:19:22', '2023-09-27 18:19:22'),
(2613, NULL, 3, '2023-09-27 21:19:32', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:19:32', '2023-09-27 18:19:32'),
(2614, NULL, 3, '2023-09-27 21:19:42', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:19:42', '2023-09-27 18:19:42'),
(2615, NULL, 3, '2023-09-27 21:19:52', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:19:52', '2023-09-27 18:19:52'),
(2616, NULL, 3, '2023-09-27 21:20:02', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:20:02', '2023-09-27 18:20:02'),
(2617, NULL, 3, '2023-09-27 21:20:12', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:20:12', '2023-09-27 18:20:12'),
(2618, NULL, 3, '2023-09-27 21:20:22', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:20:22', '2023-09-27 18:20:22'),
(2619, NULL, 3, '2023-09-27 21:20:34', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:20:34', '2023-09-27 18:20:34'),
(2620, NULL, 3, '2023-09-27 21:20:42', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:20:42', '2023-09-27 18:20:42'),
(2621, NULL, 3, '2023-09-27 21:20:52', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:20:52', '2023-09-27 18:20:52'),
(2622, NULL, 3, '2023-09-27 21:21:02', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:21:02', '2023-09-27 18:21:02'),
(2623, NULL, 3, '2023-09-27 21:21:12', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:21:12', '2023-09-27 18:21:12'),
(2624, NULL, 3, '2023-09-27 21:21:22', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:21:22', '2023-09-27 18:21:22'),
(2625, NULL, 3, '2023-09-27 21:21:32', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:21:32', '2023-09-27 18:21:32'),
(2626, NULL, 3, '2023-09-27 21:21:42', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:21:42', '2023-09-27 18:21:42'),
(2627, NULL, 3, '2023-09-27 21:21:52', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:21:52', '2023-09-27 18:21:52'),
(2628, NULL, 3, '2023-09-27 21:22:02', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:22:02', '2023-09-27 18:22:02'),
(2629, NULL, 3, '2023-09-27 21:22:12', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:22:12', '2023-09-27 18:22:12'),
(2630, NULL, 3, '2023-09-27 21:22:22', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:22:22', '2023-09-27 18:22:22'),
(2631, NULL, 3, '2023-09-27 21:22:32', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:22:32', '2023-09-27 18:22:32'),
(2632, NULL, 3, '2023-09-27 21:22:42', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:22:42', '2023-09-27 18:22:42'),
(2633, NULL, 3, '2023-09-27 21:22:52', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:22:52', '2023-09-27 18:22:52'),
(2634, NULL, 3, '2023-09-27 21:23:02', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:23:02', '2023-09-27 18:23:02'),
(2635, NULL, 3, '2023-09-27 21:23:12', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:23:12', '2023-09-27 18:23:12'),
(2636, NULL, 3, '2023-09-27 21:23:22', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:23:22', '2023-09-27 18:23:22'),
(2637, NULL, 3, '2023-09-27 21:23:32', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:23:32', '2023-09-27 18:23:32'),
(2638, NULL, 3, '2023-09-27 21:24:09', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:24:09', '2023-09-27 18:24:09'),
(2639, NULL, 3, '2023-09-27 21:24:13', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:24:13', '2023-09-27 18:24:13'),
(2640, NULL, 3, '2023-09-27 21:24:26', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:24:26', '2023-09-27 18:24:26'),
(2641, NULL, 3, '2023-09-27 21:25:03', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:25:03', '2023-09-27 18:25:03'),
(2642, NULL, 3, '2023-09-27 21:25:41', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:25:41', '2023-09-27 18:25:41'),
(2643, NULL, 3, '2023-09-27 21:26:24', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:26:24', '2023-09-27 18:26:24'),
(2644, NULL, 3, '2023-09-27 21:26:53', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:26:53', '2023-09-27 18:26:53'),
(2645, NULL, 3, '2023-09-27 21:27:42', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:27:42', '2023-09-27 18:27:42'),
(2646, NULL, 3, '2023-09-27 21:28:23', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:28:23', '2023-09-27 18:28:23'),
(2647, NULL, 3, '2023-09-27 21:29:13', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:29:13', '2023-09-27 18:29:13'),
(2648, NULL, 3, '2023-09-27 21:31:37', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:31:37', '2023-09-27 18:31:37'),
(2649, NULL, 3, '2023-09-27 21:35:36', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:35:36', '2023-09-27 18:35:36'),
(2650, NULL, 3, '2023-09-27 21:37:50', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:37:50', '2023-09-27 18:37:50'),
(2651, NULL, 3, '2023-09-27 21:41:53', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:41:53', '2023-09-27 18:41:53'),
(2652, NULL, 3, '2023-09-27 21:45:56', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:45:56', '2023-09-27 18:45:56'),
(2653, NULL, 3, '2023-09-27 21:46:47', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:46:47', '2023-09-27 18:46:47'),
(2654, NULL, 3, '2023-09-27 21:46:57', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:46:57', '2023-09-27 18:46:57'),
(2655, NULL, 3, '2023-09-27 21:47:07', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:47:07', '2023-09-27 18:47:07'),
(2656, NULL, 3, '2023-09-27 21:47:47', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:47:47', '2023-09-27 18:47:47'),
(2657, NULL, 3, '2023-09-27 21:50:48', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:50:48', '2023-09-27 18:50:48'),
(2658, NULL, 3, '2023-09-27 21:51:06', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:51:06', '2023-09-27 18:51:06'),
(2659, NULL, 3, '2023-09-27 21:51:16', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:51:16', '2023-09-27 18:51:16'),
(2660, NULL, 3, '2023-09-27 21:51:51', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:51:51', '2023-09-27 18:51:51'),
(2661, NULL, 3, '2023-09-27 21:55:29', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:55:29', '2023-09-27 18:55:29'),
(2662, NULL, 3, '2023-09-27 21:57:55', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 18:57:55', '2023-09-27 18:57:55'),
(2663, NULL, 3, '2023-09-27 22:02:09', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 19:02:09', '2023-09-27 19:02:09'),
(2664, NULL, 3, '2023-09-27 22:03:15', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 19:03:15', '2023-09-27 19:03:15'),
(2665, NULL, 3, '2023-09-27 22:04:36', '48.0187415', '29.3261205', '196, , KW', '2023-09-27 19:04:36', '2023-09-27 19:04:36');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(2666, NULL, 3, '2023-09-27 22:04:48', '48.018729', '29.3261323', '196, , KW', '2023-09-27 19:04:48', '2023-09-27 19:04:48'),
(2667, NULL, 3, '2023-09-27 22:04:58', '48.0186941', '29.3260927', '196, , KW', '2023-09-27 19:04:58', '2023-09-27 19:04:58'),
(2668, NULL, 3, '2023-09-27 22:05:08', '48.0186425', '29.3260634', '196, , KW', '2023-09-27 19:05:08', '2023-09-27 19:05:08'),
(2669, NULL, 3, '2023-09-27 22:05:19', '48.0183892', '29.3258777', '82G9+893, , KW', '2023-09-27 19:05:19', '2023-09-27 19:05:19'),
(2670, NULL, 3, '2023-09-27 22:05:28', '48.01873', '29.3261057', '196, , KW', '2023-09-27 19:05:28', '2023-09-27 19:05:28'),
(2671, NULL, 3, '2023-09-27 22:05:38', '48.0186667', '29.3260725', '196, , KW', '2023-09-27 19:05:38', '2023-09-27 19:05:38'),
(2672, NULL, 3, '2023-09-27 22:05:49', '48.0188001', '29.3260783', '196, , KW', '2023-09-27 19:05:49', '2023-09-27 19:05:49'),
(2673, NULL, 3, '2023-09-27 22:05:58', '48.0187487', '29.3261116', '196, , KW', '2023-09-27 19:05:58', '2023-09-27 19:05:58'),
(2674, NULL, 3, '2023-09-27 22:06:08', '48.0187793', '29.3260923', '196, , KW', '2023-09-27 19:06:08', '2023-09-27 19:06:08'),
(2675, NULL, 3, '2023-09-27 22:06:18', '48.0188061', '29.3260807', '196, , KW', '2023-09-27 19:06:18', '2023-09-27 19:06:18'),
(2676, NULL, 3, '2023-09-27 22:06:29', '48.0188199', '29.3260695', '196, , KW', '2023-09-27 19:06:29', '2023-09-27 19:06:29'),
(2677, NULL, 3, '2023-09-27 22:06:38', '48.0187835', '29.3260828', '196, , KW', '2023-09-27 19:06:38', '2023-09-27 19:06:38'),
(2678, NULL, 3, '2023-09-27 22:06:48', '48.0187183', '29.3260686', '196, , KW', '2023-09-27 19:06:48', '2023-09-27 19:06:48'),
(2679, NULL, 3, '2023-09-27 22:06:58', '48.0186849', '29.3260936', '196, , KW', '2023-09-27 19:06:58', '2023-09-27 19:06:58'),
(2680, NULL, 3, '2023-09-27 22:07:08', '48.0187638', '29.3260932', '196, , KW', '2023-09-27 19:07:08', '2023-09-27 19:07:08'),
(2681, NULL, 3, '2023-09-27 22:07:19', '48.0187986', '29.3260813', '196, , KW', '2023-09-27 19:07:19', '2023-09-27 19:07:19'),
(2682, NULL, 3, '2023-09-27 22:07:28', '48.0188159', '29.3260573', '196, , KW', '2023-09-27 19:07:28', '2023-09-27 19:07:28'),
(2683, NULL, 3, '2023-09-27 22:07:38', '48.0187979', '29.3260746', '196, , KW', '2023-09-27 19:07:38', '2023-09-27 19:07:38'),
(2684, NULL, 3, '2023-09-27 22:07:48', '48.0188005', '29.3260701', '196, , KW', '2023-09-27 19:07:48', '2023-09-27 19:07:48'),
(2685, NULL, 3, '2023-09-27 22:07:58', '48.0188071', '29.3260659', '196, , KW', '2023-09-27 19:07:58', '2023-09-27 19:07:58'),
(2686, NULL, 3, '2023-09-27 22:08:09', '48.0188312', '29.3260372', '196, , KW', '2023-09-27 19:08:09', '2023-09-27 19:08:09'),
(2687, NULL, 3, '2023-09-27 22:08:19', '48.0188428', '29.3260349', '196, , KW', '2023-09-27 19:08:19', '2023-09-27 19:08:19'),
(2688, NULL, 3, '2023-09-27 22:08:29', '48.0187887', '29.3260784', '196, , KW', '2023-09-27 19:08:29', '2023-09-27 19:08:29'),
(2689, NULL, 3, '2023-09-27 22:08:38', '48.0187939', '29.3260855', '196, , KW', '2023-09-27 19:08:38', '2023-09-27 19:08:38'),
(2690, NULL, 3, '2023-09-27 22:08:49', '48.0187554', '29.3260886', '196, , KW', '2023-09-27 19:08:49', '2023-09-27 19:08:49'),
(2691, NULL, 3, '2023-09-27 22:08:58', '48.0187864', '29.3260818', '196, , KW', '2023-09-27 19:08:58', '2023-09-27 19:08:58'),
(2692, NULL, 3, '2023-09-27 22:09:08', '48.0188343', '29.3260354', '196, , KW', '2023-09-27 19:09:08', '2023-09-27 19:09:08'),
(2693, NULL, 3, '2023-09-27 22:09:21', '48.0187776', '29.3260914', '196, , KW', '2023-09-27 19:09:21', '2023-09-27 19:09:21'),
(2694, NULL, 3, '2023-09-27 22:09:33', '48.0187948', '29.3260813', '196, , KW', '2023-09-27 19:09:33', '2023-09-27 19:09:33'),
(2695, NULL, 3, '2023-09-27 22:09:38', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:09:38', '2023-09-27 19:09:38'),
(2696, NULL, 3, '2023-09-27 22:09:47', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:09:47', '2023-09-27 19:09:47'),
(2697, NULL, 3, '2023-09-27 22:09:57', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:09:57', '2023-09-27 19:09:57'),
(2698, NULL, 3, '2023-09-27 22:10:07', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:10:07', '2023-09-27 19:10:07'),
(2699, NULL, 3, '2023-09-27 22:10:17', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:10:17', '2023-09-27 19:10:17'),
(2700, NULL, 3, '2023-09-27 22:10:27', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:10:27', '2023-09-27 19:10:27'),
(2701, NULL, 3, '2023-09-27 22:11:05', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:11:05', '2023-09-27 19:11:05'),
(2702, NULL, 3, '2023-09-27 22:11:16', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:11:16', '2023-09-27 19:11:16'),
(2703, NULL, 3, '2023-09-27 22:11:21', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:11:21', '2023-09-27 19:11:21'),
(2704, NULL, 3, '2023-09-27 22:11:29', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:11:29', '2023-09-27 19:11:29'),
(2705, NULL, 3, '2023-09-27 22:11:52', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:11:52', '2023-09-27 19:11:52'),
(2706, NULL, 3, '2023-09-27 22:12:01', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:12:01', '2023-09-27 19:12:01'),
(2707, NULL, 3, '2023-09-27 22:12:10', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:12:10', '2023-09-27 19:12:10'),
(2708, NULL, 3, '2023-09-27 22:12:18', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:12:18', '2023-09-27 19:12:18'),
(2709, NULL, 3, '2023-09-27 22:12:27', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:12:27', '2023-09-27 19:12:27'),
(2710, NULL, 3, '2023-09-27 22:12:37', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:12:37', '2023-09-27 19:12:37'),
(2711, NULL, 3, '2023-09-27 22:12:48', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:12:48', '2023-09-27 19:12:48'),
(2712, NULL, 3, '2023-09-27 22:12:57', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:12:57', '2023-09-27 19:12:57'),
(2713, NULL, 3, '2023-09-27 22:13:07', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:13:07', '2023-09-27 19:13:07'),
(2714, NULL, 3, '2023-09-27 22:13:17', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:13:17', '2023-09-27 19:13:17'),
(2715, NULL, 3, '2023-09-27 22:13:27', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:13:27', '2023-09-27 19:13:27'),
(2716, NULL, 3, '2023-09-27 22:13:37', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:13:37', '2023-09-27 19:13:37'),
(2717, NULL, 3, '2023-09-27 22:13:58', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:13:58', '2023-09-27 19:13:58'),
(2718, NULL, 3, '2023-09-27 22:14:09', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:14:09', '2023-09-27 19:14:09'),
(2719, NULL, 3, '2023-09-27 22:14:31', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:14:31', '2023-09-27 19:14:31'),
(2720, NULL, 3, '2023-09-27 22:14:37', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:14:37', '2023-09-27 19:14:37'),
(2721, NULL, 3, '2023-09-27 22:14:47', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:14:47', '2023-09-27 19:14:47'),
(2722, NULL, 3, '2023-09-27 22:15:02', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:15:02', '2023-09-27 19:15:02'),
(2723, NULL, 3, '2023-09-27 22:15:11', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:15:11', '2023-09-27 19:15:11'),
(2724, NULL, 3, '2023-09-27 22:15:17', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:15:17', '2023-09-27 19:15:17'),
(2725, NULL, 3, '2023-09-27 22:15:27', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:15:27', '2023-09-27 19:15:27'),
(2726, NULL, 3, '2023-09-27 22:15:37', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:15:37', '2023-09-27 19:15:37'),
(2727, NULL, 3, '2023-09-27 22:15:47', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:15:47', '2023-09-27 19:15:47'),
(2728, NULL, 3, '2023-09-27 22:15:57', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:15:57', '2023-09-27 19:15:57'),
(2729, NULL, 3, '2023-09-27 22:16:07', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:16:07', '2023-09-27 19:16:07'),
(2730, NULL, 3, '2023-09-27 22:16:17', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:16:17', '2023-09-27 19:16:17'),
(2731, NULL, 3, '2023-09-27 22:16:27', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:16:27', '2023-09-27 19:16:27'),
(2732, NULL, 3, '2023-09-27 22:16:37', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:16:37', '2023-09-27 19:16:37'),
(2733, NULL, 3, '2023-09-27 22:16:47', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:16:47', '2023-09-27 19:16:47'),
(2734, NULL, 3, '2023-09-27 22:16:57', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:16:57', '2023-09-27 19:16:57'),
(2735, NULL, 3, '2023-09-27 22:17:07', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:17:07', '2023-09-27 19:17:07'),
(2736, NULL, 3, '2023-09-27 22:17:17', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:17:17', '2023-09-27 19:17:17'),
(2737, NULL, 3, '2023-09-27 22:17:27', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:17:27', '2023-09-27 19:17:27'),
(2738, NULL, 3, '2023-09-27 22:17:37', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:17:37', '2023-09-27 19:17:37'),
(2739, NULL, 3, '2023-09-27 22:17:48', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:17:48', '2023-09-27 19:17:48'),
(2740, NULL, 3, '2023-09-27 22:17:57', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:17:57', '2023-09-27 19:17:57'),
(2741, NULL, 3, '2023-09-27 22:18:07', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:18:07', '2023-09-27 19:18:07'),
(2742, NULL, 3, '2023-09-27 22:18:17', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:18:17', '2023-09-27 19:18:17'),
(2743, NULL, 3, '2023-09-27 22:18:27', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:18:27', '2023-09-27 19:18:27'),
(2744, NULL, 3, '2023-09-27 22:18:38', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:18:38', '2023-09-27 19:18:38'),
(2745, NULL, 3, '2023-09-27 22:18:47', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:18:47', '2023-09-27 19:18:47'),
(2746, NULL, 3, '2023-09-27 22:18:57', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:18:57', '2023-09-27 19:18:57'),
(2747, NULL, 3, '2023-09-27 22:19:07', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:19:07', '2023-09-27 19:19:07'),
(2748, NULL, 3, '2023-09-27 22:19:17', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:19:17', '2023-09-27 19:19:17'),
(2749, NULL, 3, '2023-09-27 22:19:37', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:19:37', '2023-09-27 19:19:37'),
(2750, NULL, 3, '2023-09-27 22:19:47', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:19:47', '2023-09-27 19:19:47'),
(2751, NULL, 3, '2023-09-27 22:19:59', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:19:59', '2023-09-27 19:19:59'),
(2752, NULL, 3, '2023-09-27 22:20:12', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:20:12', '2023-09-27 19:20:12'),
(2753, NULL, 3, '2023-09-27 22:20:22', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:20:22', '2023-09-27 19:20:22'),
(2754, NULL, 3, '2023-09-27 22:20:27', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:20:27', '2023-09-27 19:20:27'),
(2755, NULL, 3, '2023-09-27 22:20:38', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:20:38', '2023-09-27 19:20:38'),
(2756, NULL, 3, '2023-09-27 22:20:47', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:20:47', '2023-09-27 19:20:47'),
(2757, NULL, 3, '2023-09-27 22:20:58', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:20:58', '2023-09-27 19:20:58'),
(2758, NULL, 3, '2023-09-27 22:21:07', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:21:07', '2023-09-27 19:21:07'),
(2759, NULL, 3, '2023-09-27 22:21:17', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:21:17', '2023-09-27 19:21:17'),
(2760, NULL, 3, '2023-09-27 22:21:27', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:21:27', '2023-09-27 19:21:27'),
(2761, NULL, 3, '2023-09-27 22:21:37', '48.0187745', '29.3260878', '196, , KW', '2023-09-27 19:21:37', '2023-09-27 19:21:37');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_wallets`
--

CREATE TABLE `delivery_man_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT '0.00',
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `earning` tinyint(1) NOT NULL DEFAULT '1',
  `current_orders` int(11) NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zone_wise',
  `store_id` bigint(20) DEFAULT NULL,
  `application_status` enum('approved','denied','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `order_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `assigned_order_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `vehicle_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_men`
--

INSERT INTO `delivery_men` (`id`, `f_name`, `l_name`, `phone`, `email`, `identity_number`, `identity_type`, `identity_image`, `image`, `password`, `auth_token`, `fcm_token`, `zone_id`, `created_at`, `updated_at`, `status`, `active`, `earning`, `current_orders`, `type`, `store_id`, `application_status`, `order_count`, `assigned_order_count`, `vehicle_id`) VALUES
(3, 'ahmed', 'Hashim', '+96560635091', 'deliveryAhmed@gmail.com', '2954112032549', 'nid', '[\"2023-06-03-647baa479fe64.png\"]', '2023-06-03-647baa479c86c.png', '$2y$10$Q8OapQ1YSp1t.9p2k3/fOeouSKttaGeu9VnPVpi5amKtgcx4XhDYu', 'sS7QyuN4BBNefFIZ2bbJBoMTTgOnsGGP4TKXnTbIllCX6AqOql600WXn5C1BOEV9BgJrYaD6l0nG3XT4qlJnlSf5snqPrlW4UBa3wslQdgy12KIeQmRCTBvK', 'cCANdMy3Rw-J0pPqN8EHce:APA91bFZJhX3IaWg4HrffE_-plSZRo7dYJie4ZCzmBe6qucCgIsv2TB6uqlTZACknxfRov6yKoWREgx_fhFwxETT1ltNOawCEoWrEf3ze8RYpR6HiNm6dq50056feQkaJDRqS0T5J2ZN', 15, '2023-06-03 20:01:59', '2023-09-27 19:24:31', 1, 1, 1, 0, 'zone_wise', NULL, 'approved', 3, 3, 4),
(4, 'TEST', 'TEst', '+965123456789', 'admin@otlobne.com', '5531145', 'driving_license', '[]', '2023-09-27-6514801605d90.png', '$2y$10$/30FJ6rcHAYu4sukjfuP9.1TOLqtsfhO6XJz5UHosMNEId05caSUi', NULL, NULL, 15, '2023-09-27 19:18:46', '2023-10-05 08:59:39', 1, 0, 0, 0, 'zone_wise', NULL, 'approved', 0, 0, 4),
(5, 'sales', 'man', '+201226565013', 'salesman@gmail.com', '123456789', 'driving_license', '[\"2023-10-02-651aa5233b7ae.png\"]', '2023-10-02-651aa52338644.png', '$2y$10$ztqjUZx90yPzWCkgwzr4jOVFqqDAkQIbfoo/rnl70OcAiQUL/8PA6', NULL, NULL, 15, '2023-10-02 11:10:27', '2023-10-05 08:56:53', 1, 0, 1, 0, 'zone_wise', NULL, 'approved', 0, 0, 4),
(6, 's2', 's2', '+201226565031', 's2@s2.com', '1234567890', 'passport', '[\"2023-10-02-651aeae3551df.png\"]', '2023-10-02-651aeae350882.png', '$2y$10$DBCTMs34CIDv02SDideiqOWj.JLbkZuYHOXtPgCLmLmktwZhBiMzi', 'yh5EJhax4XHlwvN906O4e27JK3oPZLwWGLHg5SIdRsZHLD1IXb7kJGHsRhTZJNa9gK3SLG7nuDN4Ddrm0JK4VuT6VncxsrDLhHDuZ64jPkqJ012q2lWJZc09', 'fJm6nq7KS4SQ40CfNMNrdm:APA91bHZNbtWvVPHH7X3kdYbVTgfkUJkJbce1ABRz-1TAUaaoBiVs8PSOK8qN5m_dfh3LTOKmujvVtkAdwpqxJmfKH-6cbzuBa3LdkHUgKxsH6JLFilJRhZG87O3wkPYQTFy9iYURzk0', 15, '2023-10-02 16:08:03', '2023-10-08 05:01:39', 1, 0, 1, 0, 'zone_wise', NULL, 'approved', 0, 0, 4),
(7, 'D', 'M', '+96501226565020', 'D@M.com', '222222', 'passport', '[\"2023-10-03-651c26194edc5.png\"]', '2023-10-03-651c26194d34a.png', '$2y$10$n45HwRXLZGmk8b/FL4Uhzed6j1iFU.Y38B4EhkBugkzD4DOrWAKrW', NULL, NULL, 15, '2023-10-03 14:32:57', '2023-10-03 14:32:57', 1, 0, 1, 0, 'zone_wise', NULL, 'approved', 0, 0, 4),
(8, 'D', 'M', '+96501226565070', 'DM@DM.com', '2222222222', 'passport', '[\"2023-10-03-651c272f538bf.png\"]', '2023-10-03-651c272f51c68.png', '$2y$10$djdMquyQdeoJnWu810djku1nzWZ0l/oKYUopk8JD.TVoz6eRxTwoq', NULL, NULL, 15, '2023-10-03 14:37:35', '2023-10-03 14:37:35', 1, 0, 1, 0, 'zone_wise', NULL, 'approved', 0, 0, 4),
(9, 'Abdullah', 'Ahmed', '+201062550507', 'abdullahelbastamy112000@gmail.com', '9655', 'passport', '[]', '2024-01-14-65a3c8201a4ba.png', '$2y$10$x/72sf4D7qc4TRermlbrtuY5vpItDRhyAIqXGFpxIB3uoN.C6KNgC', NULL, NULL, 15, '2024-01-14 12:40:16', '2024-01-14 12:40:16', 0, 0, 0, 0, 'zone_wise', NULL, 'pending', 0, 0, 4),
(10, 'Ahmed', 'Mohammed', '+96560635090', 'bestbusiness.q8@gmail.com', '2854545455638', 'driving_license', '[\"2024-05-18-6647e55e1d3fb.png\",\"2024-05-18-6647e55e1d4d6.png\"]', '2024-05-18-6647e55e1bb29.png', '$2y$10$iWkgpcEI.SIwFZ6JjCSILOJhCSkJQfSwFtcYtthpeXEWHSpX3gK82', NULL, NULL, 15, '2024-05-17 23:16:46', '2024-05-17 23:16:46', 0, 0, 0, 0, 'zone_wise', NULL, 'pending', 0, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_m_reviews`
--

CREATE TABLE `d_m_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_m_vehicles`
--

CREATE TABLE `d_m_vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starting_coverage_area` double(16,2) NOT NULL,
  `maximum_coverage_area` double(16,2) NOT NULL,
  `extra_charges` double(16,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `d_m_vehicles`
--

INSERT INTO `d_m_vehicles` (`id`, `type`, `starting_coverage_area`, `maximum_coverage_area`, `extra_charges`, `status`, `created_at`, `updated_at`) VALUES
(4, 'موتوسيكل', 0.00, 1000.00, 0.00, 1, '2023-06-03 19:59:38', '2023-06-03 20:00:15');

-- --------------------------------------------------------

--
-- Table structure for table `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_roles`
--

CREATE TABLE `employee_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_roles`
--

INSERT INTO `employee_roles` (`id`, `name`, `modules`, `status`, `created_at`, `updated_at`, `store_id`) VALUES
(1, 'sales', '[\"item\",\"order\",\"wallet\",\"my_shop\",\"pos\"]', 1, '2023-08-19 08:54:12', '2023-08-19 08:54:12', 39);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'custom',
  `amount` decimal(23,3) NOT NULL DEFAULT '0.000',
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'admin',
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci,
  `add_ons` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `available_time_starts` time DEFAULT NULL,
  `available_time_ends` time DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_count` int(11) NOT NULL DEFAULT '0',
  `avg_rating` double(16,14) NOT NULL DEFAULT '0.00000000000000',
  `rating_count` int(11) NOT NULL DEFAULT '0',
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `stock` int(11) DEFAULT '0',
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `food_variations` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recommended` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `image`, `category_id`, `category_ids`, `variations`, `add_ons`, `attributes`, `choice_options`, `price`, `tax`, `tax_type`, `discount`, `discount_type`, `available_time_starts`, `available_time_ends`, `veg`, `status`, `store_id`, `created_at`, `updated_at`, `order_count`, `avg_rating`, `rating_count`, `rating`, `module_id`, `stock`, `unit_id`, `images`, `food_variations`, `slug`, `recommended`) VALUES
(4, 'Chicken', 'Chiken with tehina', '2023-09-29-6516762261922.png', 29, '[{\"id\":\"4\",\"position\":1},{\"id\":\"29\",\"position\":2}]', '[]', '[\"\"]', '[]', '[]', 200.00, 0.00, 'percent', 50.00, 'percent', '09:15:00', '03:15:00', 0, 1, 43, '2023-09-29 07:00:50', '2023-09-29 08:13:07', 0, 0.00000000000000, 0, NULL, 4, 0, NULL, '[\"2023-09-29-651676225f312.png\"]', '[]', 'frakh-mshoy', 0),
(5, 'Shawerma', 'Shawerma discription', '2023-09-29-65168e4527c8f.png', 28, '[{\"id\":\"4\",\"position\":1},{\"id\":\"28\",\"position\":2}]', '[]', '[\"1\",\"4\"]', '[]', '[]', 100.00, 0.00, 'percent', 40.00, 'amount', '09:30:00', '15:00:00', 0, 1, 43, '2023-09-29 08:41:21', '2023-10-02 15:10:06', 0, 0.00000000000000, 0, NULL, 4, 0, NULL, '[\"2023-09-29-65168e4527987.png\",\"2023-09-29-65168e4527ae1.png\"]', '[{\"name\":\"meet\",\"type\":\"single\",\"min\":\"20\",\"max\":\"20\",\"required\":\"off\",\"values\":[{\"label\":\"cheesecake\",\"optionPrice\":\"20\"},{\"label\":\"choclate\",\"optionPrice\":\"50\"}]}]', 'shawerma', 1),
(6, 'Grilled fish', 'Grilled fish with salad', '2023-10-01-65197148b37a1.png', 76, '[{\"id\":\"76\",\"position\":1}]', '[]', '[\"1\",\"4\"]', '[]', '[]', 250.00, 0.00, 'percent', 99.00, 'percent', '12:00:00', '11:25:00', 0, 1, 43, '2023-10-01 13:11:03', '2023-10-01 13:25:45', 0, 0.00000000000000, 0, NULL, 4, 0, NULL, '[\"2023-10-01-6519718a02aa4.png\"]', '[{\"name\":\"salamon\",\"type\":\"multi\",\"min\":\"2\",\"max\":\"3\",\"required\":\"on\",\"values\":[{\"label\":\"bread\",\"optionPrice\":\"5\"},{\"label\":\"tehina\",\"optionPrice\":\"10\"}]}]', 'grilled-fish', 0),
(7, 'Price', 'H', '2023-10-02-651abbb0ec101.png', 28, '[{\"id\":\"4\",\"position\":1},{\"id\":\"28\",\"position\":2}]', '[]', '[\"\"]', '[]', '[]', 100.00, 0.00, 'percent', 60.00, 'amount', '13:00:00', '23:55:00', 0, 0, 43, '2023-10-02 12:46:40', '2023-10-02 15:11:55', 0, 0.00000000000000, 0, NULL, 4, 0, NULL, '[\"2023-10-02-651abbb0e9a8f.png\"]', '[]', 'price', 1),
(8, 'Burger', 'Meet', '2023-10-02-651aee8d16861.png', 23, '[{\"id\":\"23\",\"position\":1}]', '[]', '[\"\"]', '[]', '[]', 200.00, 0.00, 'percent', 10.00, 'percent', NULL, NULL, 0, 1, 47, '2023-10-02 16:23:41', '2023-10-02 19:18:39', 0, 0.00000000000000, 0, NULL, 1, 10, 3, '[\"2023-10-02-651aee8d15cb4.png\"]', '[]', 'burger', 1),
(9, 'Potato', 'Hh', '2023-10-08-6522363a3affa.png', 271, '[{\"id\":\"1\",\"position\":1},{\"id\":\"271\",\"position\":2}]', '[]', '[\"\"]', '[]', '[]', 200.00, 0.00, 'percent', 10.00, 'percent', NULL, NULL, 0, 1, 48, '2023-10-08 04:55:22', '2023-10-08 04:55:22', 0, 0.00000000000000, 0, NULL, 1, 10, 3, '[\"2023-10-08-6522363a39ca4.png\",\"2023-10-08-6522363a3a23a.png\",\"2023-10-08-6522363a3ae5b.png\"]', '[]', 'potato', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_campaigns`
--

CREATE TABLE `item_campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci,
  `add_ons` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT '0',
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `stock` int(11) DEFAULT '0',
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `food_variations` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_tag`
--

CREATE TABLE `item_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_tag`
--

INSERT INTO `item_tag` (`id`, `item_id`, `tag_id`) VALUES
(1, 1, 7),
(5, 1, 10),
(6, 1, 11),
(7, 1, 12),
(8, 4, 13),
(9, 4, 14),
(10, 5, 15),
(11, 5, 16),
(12, 5, 13),
(13, 5, 17),
(14, 6, 18),
(15, 6, 19),
(16, 6, 20),
(17, 7, 18),
(18, 7, 19),
(19, 7, 20),
(20, 8, 21),
(21, 8, 22);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `debit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `balance` decimal(24,3) NOT NULL DEFAULT '0.000',
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `sender_id`, `message`, `file`, `is_seen`, `created_at`, `updated_at`) VALUES
(10, 7, 18, 'Hu', NULL, 0, '2023-09-28 14:46:34', '2023-09-28 14:46:34'),
(11, 7, 18, 'Hi', NULL, 0, '2023-09-28 14:46:40', '2023-09-28 14:46:40'),
(12, 8, 19, 'Ggg', NULL, 1, '2023-09-30 08:00:40', '2023-09-30 08:01:04'),
(13, 8, 19, 'Fff', NULL, 1, '2023-09-30 08:00:50', '2023-09-30 08:01:04'),
(14, 8, 20, 'الام', NULL, 1, '2023-09-30 08:01:01', '2023-10-02 07:08:21'),
(15, 8, 19, 'e', '[\"2023-10-02-651a6c619a3e9.png\"]', 0, '2023-10-02 07:08:17', '2023-10-02 07:08:17');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 30),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 30),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 30),
(4, '2016_06_01_000004_create_oauth_clients_table', 30),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 30),
(8, '2021_06_17_054551_create_soft_credentials_table', 31),
(9, '2022_04_10_030533_create_newsletters_table', 32),
(10, '2022_04_12_015827_create_social_media_table', 32),
(11, '2022_04_12_215009_create_jobs_table', 32),
(12, '2022_04_21_145207_add_column_to_modules_table', 32),
(13, '2022_05_12_170027_add_column_to_customer_addresses_table', 33),
(14, '2022_05_14_155444_add_all_zones_column_to_modules_table', 33),
(15, '2022_05_26_120821_change_data_column_to_user_notifiations_table', 33),
(16, '2022_03_31_103418_create_wallet_transactions_table', 34),
(17, '2022_03_31_103827_create_loyalty_point_transactions_table', 34),
(18, '2022_04_09_161150_add_wallet_point_columns_to_users_table', 34),
(19, '2022_05_14_122133_add_dm_tips_column_to_orders_table', 34),
(20, '2022_05_14_122603_add_dm_tips_column_to_order_transactions_table', 34),
(21, '2022_05_17_153333_add_ref_code_to_users_table', 34),
(22, '2022_07_31_103626_add_free_delivery_by_column_to_orders_table', 35),
(23, '2022_09_10_112137_create_user_infos_table', 36),
(24, '2022_09_10_112203_create_conversations_table', 36),
(25, '2022_09_10_112220_create_messages_table', 36),
(26, '2022_10_18_092639_create_refunds_table', 37),
(27, '2022_10_18_093323_add_refund_request_cancel_column_to_orders_table', 37),
(28, '2022_10_18_093529_create_refund_reasons_table', 37),
(29, '2022_10_19_150319_add_delivery_column_to_parcel_categories_table', 37),
(30, '2022_10_19_165501_add_default_link_column_to_banners_table', 37),
(31, '2022_10_20_105050_module_zone', 37),
(32, '2022_10_22_115553_add_is_logged_column_to_admins_table', 37),
(33, '2022_10_22_122336_add_is_logged_column_to_vendor_employees_table', 37),
(34, '2022_10_25_153214_add_payment_method_columns_to_zones_table', 37),
(35, '2022_10_31_165427_add_rename_delivery_charge_column_to_stores_table', 37),
(36, '2022_11_05_094404_add_delivery_fee_comission_to_order_transactions_table', 37),
(37, '2022_11_13_130054_create_contacts_table', 37),
(38, '2022_11_15_111925_create_expenses_table', 37),
(39, '2022_11_15_112413_add_expense_column_to_order_transactions_table', 37),
(40, '2022_12_20_104455_add_food_variations_column_to_items_table', 38),
(41, '2022_12_21_154227_alter_table_order_details_change_variation', 38),
(42, '2022_12_29_103803_add_order_id_column_to_expenses_table', 38),
(43, '2022_12_29_105321_add_maximum_cod_order_amount_column_to_module_zone_table', 38),
(44, '2022_12_29_114005_add_prescription_order_column_to_orders_table', 38),
(45, '2022_12_31_111437_create_notification_messages_table', 38),
(46, '2023_01_02_112948_create_tags_table', 38),
(47, '2023_01_02_113235_item_tag', 38),
(48, '2023_01_03_093510_add_current_language_key_column_to_users_table', 38),
(49, '2023_01_07_115354_add_prescription_order_to_stores_table', 38),
(50, '2023_01_07_180000_add_description_to_expenses_table', 38),
(51, '2023_01_10_124723_add_food_variations_column_to_item_campaigns_table', 38),
(52, '2023_01_10_145928_change_refund_amount_column_type', 38),
(53, '2023_01_10_150108_change_amount_column_type', 38),
(54, '2023_01_23_144828_add_tax_status_column_to_orders_table', 39),
(55, '2023_01_30_114113_change_delivery_charge_column_type_to_admin_wallets_table', 39),
(56, '2023_01_23_103943_add_slug_to_items_table', 40),
(57, '2023_01_23_144001_add_slug_to_categories_table', 40),
(58, '2023_01_23_144119_add_slug_to_item_campaigns_table', 40),
(59, '2023_01_23_144232_add_slug_to_stores_table', 40),
(60, '2023_02_25_133200_create_d_m_vehicles_table', 40),
(61, '2023_02_25_133302_add_vehicle_id_column_to_delivery_men_table', 40),
(62, '2023_02_25_133409_add_vehicle_id_column_to_orders_table', 40),
(63, '2023_02_25_163329_add_maximum_delivery_charge_column_to_module_zone_table', 40),
(64, '2023_02_25_175825_add_otp_hit_count_cols_in_phone_verifications_table', 40),
(65, '2023_02_25_175912_add_hit_count_at_col_in_password_resets_table', 40),
(66, '2023_02_26_144503_add_campaign_status_to_campaign_store_table', 40),
(67, '2023_02_26_162224_add_recommened_to_items_table', 40),
(68, '2023_02_27_102931_add_ref_by_col_to_users_table', 40),
(69, '2023_02_27_111635_create_order_cancel_reasons_table', 40),
(70, '2023_02_27_111937_add_cancellation_reason_col_to_orders_table', 40),
(71, '2023_02_27_161418_add_created_by_columns_to_coupons_table', 40),
(72, '2023_02_27_161533_add_created_by_columns_to_expenses_table', 40),
(73, '2023_02_27_162252_add_store_expense_columns_to_order_transactions_table', 40),
(74, '2023_02_27_162357_add_coupon_created_by_columns_to_orders_table', 40),
(75, '2023_03_01_154319_add_maximum_delivery_charge_column_to_stores_table', 40),
(76, '2023_03_02_103114_add_discount_on_product_by_column_to_orders_table', 40),
(77, '2023_03_02_143919_change_amount_column_to_expenses_table', 40),
(78, '2023_03_02_144258_add_discount_amount_by_store_col_to_order_transactions_table', 40),
(79, '2023_03_11_120645_add_temp_block_time_col_to_phone_verifications_table', 41),
(80, '2023_03_11_121000_add_temp_block_time_col_to_password_resets_table', 41),
(81, '2023_03_13_181502_add_temp_token_column_to_users_table', 41);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `stores_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_id` int(11) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `all_zone_service` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `module_type`, `thumbnail`, `status`, `stores_count`, `created_at`, `updated_at`, `icon`, `theme_id`, `description`, `all_zone_service`) VALUES
(1, 'Grocery', 'grocery', '2023-05-03-6452c6f54500c.png', 1, 8, '2023-05-03 19:41:25', '2023-10-08 04:52:03', '2023-05-03-6452c6f5420c5.png', 2, NULL, 0),
(2, 'Pharmacy', 'pharmacy', '2023-05-03-6452c760e0e28.png', 1, 2, '2023-05-03 19:43:12', '2023-10-02 11:24:46', '2023-05-03-6452c760e0a77.png', 1, '<p>Pharmacy</p>', 0),
(3, 'Ecommerce', 'ecommerce', '2023-05-03-6452c7fbe2fdc.png', 1, 4, '2023-05-03 19:45:47', '2024-05-17 23:21:21', '2023-05-03-6452c7fbdee66.png', 1, '<p>Ecommerce</p>', 0),
(4, 'Restaurants', 'food', '2023-05-03-6452c72d9bfed.png', 1, 3, '2023-05-03 19:42:21', '2023-09-27 15:30:59', '2023-05-03-6452c72d9bb0b.png', 2, '<p>Restaurants&nbsp;</p>', 0),
(5, 'Shipping', 'parcel', '2023-05-18-64664f4ef2fe9.png', 1, 0, '2023-05-03 19:46:51', '2023-07-14 01:48:19', '2023-05-18-64664f4ef2c93.png', 1, '<p>Shipping&nbsp;</p>', 0),
(6, 'Women\'s clothing', 'ecommerce', '2023-05-09-645a7b783f9fa.png', 0, 0, '2023-05-09 16:57:28', '2023-07-14 01:46:17', '2023-05-09-645a7b783daed.png', 1, NULL, 0),
(7, 'Smartphones', 'ecommerce', '2023-05-09-645a7d8d7374d.png', 0, 0, '2023-05-09 17:06:21', '2023-07-14 01:46:20', '2023-05-09-645a7d8d73529.png', 1, NULL, 0),
(8, 'Sweets', 'food', '2023-05-09-645aa5c91576a.png', 0, 0, '2023-05-09 19:58:01', '2023-07-14 01:45:29', '2023-05-09-645aa5c9152fd.png', 2, NULL, 0),
(9, 'car accessories', 'ecommerce', '2023-05-10-645bb73d921ac.png', 0, 0, '2023-05-10 15:24:45', '2023-07-14 01:40:21', '2023-05-10-645bb73d901dd.png', 1, NULL, 0),
(10, 'ice cream', 'food', '2023-05-15-64617ae316e58.png', 0, 0, '2023-05-15 00:20:51', '2023-07-14 01:45:30', '2023-05-15-64617ae316a69.png', 2, NULL, 0),
(11, 'fruits', 'grocery', '2023-05-15-64627fc220e05.png', 0, 0, '2023-05-15 18:53:54', '2023-07-14 01:40:27', '2023-05-15-64627fc2209ec.png', 2, NULL, 0),
(12, 'Wholesale foodstuffs', 'ecommerce', '2023-05-16-6462d9aee0486.png', 0, 0, '2023-05-16 01:17:34', '2023-07-14 01:40:31', '2023-05-16-6462d9aede5b5.png', 1, NULL, 0),
(13, 'Cosmetics', 'ecommerce', '2023-05-16-6463981b47458.png', 0, 1, '2023-05-16 14:50:03', '2023-07-14 01:40:33', '2023-05-16-6463981b46e7c.png', 2, NULL, 0),
(14, 'Home Needs', 'ecommerce', '2023-05-16-6463a32f9485a.png', 1, 1, '2023-05-16 15:37:19', '2023-07-14 01:45:17', '2023-05-16-6463a32f929f1.png', 1, NULL, 0),
(15, 'Men\'s barbershops', 'food', '2023-06-03-647bac9a716f4.png', 0, 0, '2023-06-03 20:11:54', '2023-07-14 01:40:44', '2023-06-03-647bac9a6e929.png', 1, '<pre>\r\nMen&#39;s barbershops\r\n</pre>', 0),
(16, 'Barbershops', 'food', '2023-07-14-64b0b6899c48f.png', 1, 0, '2023-06-03 20:14:38', '2023-07-14 01:44:25', '2023-07-14-64b0b6899b8bd.png', 1, '<pre>\r\nBarbershops For ladies and Men</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `module_types`
--

CREATE TABLE `module_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `module_zone`
--

CREATE TABLE `module_zone` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `per_km_shipping_charge` double(23,2) DEFAULT NULL,
  `minimum_shipping_charge` double(23,2) DEFAULT NULL,
  `maximum_cod_order_amount` double(23,2) DEFAULT NULL,
  `maximum_shipping_charge` double(23,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module_zone`
--

INSERT INTO `module_zone` (`id`, `module_id`, `zone_id`, `per_km_shipping_charge`, `minimum_shipping_charge`, `maximum_cod_order_amount`, `maximum_shipping_charge`) VALUES
(1, 1, 1, 10.00, 10.00, 5000.00, 50.00),
(2, 2, 1, 10.00, 10.00, 5000.00, 50.00),
(3, 3, 1, 10.00, 10.00, 5000.00, 50.00),
(4, 4, 1, 10.00, 10.00, 5000.00, 50.00),
(5, 5, 1, NULL, NULL, 5000.00, NULL),
(6, 1, 14, 1.00, 10.00, 2000.00, 100.00),
(7, 2, 14, 1.00, 10.00, 2000.00, 100.00),
(8, 3, 14, 1.00, 10.00, 2000.00, 100.00),
(9, 4, 14, 1.00, 10.00, 2000.00, 100.00),
(10, 5, 14, NULL, NULL, 2000.00, NULL),
(11, 1, 13, 1.00, 10.00, 2000.00, 100.00),
(12, 2, 13, 1.00, 10.00, 2000.00, 100.00),
(13, 3, 13, 1.00, 10.00, 2000.00, 100.00),
(14, 4, 13, 1.00, 10.00, 2000.00, 100.00),
(15, 5, 13, NULL, NULL, 2000.00, NULL),
(16, 6, 1, NULL, NULL, 5000.00, NULL),
(17, 7, 1, 10.00, 10.00, 5000.00, 50.00),
(18, 6, 14, 1.00, 10.00, 2000.00, 100.00),
(19, 7, 14, 1.00, 10.00, 2000.00, 100.00),
(20, 8, 14, 1.00, 10.00, 2000.00, 100.00),
(21, 9, 14, 1.00, 10.00, 2000.00, 100.00),
(22, 14, 2, 1.00, 1.00, 2000.00, 10.00),
(23, 1, 15, 1.00, 10.00, 5000.00, 100.00),
(24, 2, 15, 1.00, 10.00, 5000.00, 100.00),
(25, 3, 15, 1.00, 10.00, 5000.00, 100.00),
(26, 4, 15, 1.00, 10.00, 5000.00, 100.00),
(27, 5, 15, NULL, NULL, 5000.00, NULL),
(28, 6, 15, 1.00, 10.00, 5000.00, 100.00),
(29, 7, 15, 1.00, 10.00, 5000.00, 100.00),
(30, 8, 15, 1.00, 10.00, 5000.00, 100.00),
(31, 10, 15, 1.00, 10.00, 5000.00, 100.00),
(32, 9, 15, 1.00, 10.00, 5000.00, 100.00),
(33, 11, 15, 1.00, 10.00, 5000.00, 100.00),
(34, 13, 15, 1.00, 10.00, 5000.00, 100.00),
(35, 12, 15, 1.00, 10.00, 5000.00, 100.00),
(36, 14, 15, 1.00, 10.00, 5000.00, 100.00),
(37, 15, 15, 0.00, 0.00, 5000.00, 0.00),
(38, 16, 15, 0.00, 0.00, 5000.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Subscribers email',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'bestbusiness.q8@gmail.com', '2024-05-17 23:28:37', '2024-05-17 23:28:37');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tergat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_messages`
--

CREATE TABLE `notification_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0055150003c69139c373087d313c1e01433193bb97bb8752382ab9cf5afcc7c0e9bd4cd1794b1c66', 24, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-30 07:56:29', '2023-09-30 07:56:29', '2024-09-30 10:56:29'),
('005c47e3f0ff987beca84ab160a5b326205c527590f3117c884a1bdc4d594320fb32181402e75f24', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 13:28:08', '2023-09-28 13:28:08', '2024-09-28 16:28:08'),
('03344811120b7bc9bc39c6bbbc9c2d07eb11e33432be6b03eee1154485ea230bc0cb71185669f30d', 24, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 14:57:43', '2023-09-28 14:57:43', '2024-09-28 17:57:43'),
('040434048df22cbb6fd87ba880cdc468334aafd239c806158baaa8dd317037c92f1ddf60e7aaa102', 27, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-10-02 12:40:29', '2023-10-02 12:40:29', '2024-10-02 15:40:29'),
('0538acbb4a39d5d87dce27f4e8cf3e9f7bf56fe3c95757fb82890de29bbb38495324252052a0d7f6', 21, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 13:16:28', '2023-09-28 13:16:28', '2024-09-28 16:16:28'),
('09a1e9a3e0050276253b62ba90d0d80cd7a1f628fa06ea7c301dbd86ff505b81a520d8e7aff5635e', 24, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 14:54:41', '2023-09-28 14:54:41', '2024-09-28 17:54:41'),
('09ee92f47f12485a2d8c769e00e18be3c3113a7e45850f13246d6e97caa48e1d212d20c66595fb17', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 10:30:17', '2023-09-28 10:30:17', '2024-09-28 13:30:17'),
('0d05d7df974d87312f52636ef282735e0c7280536474076f4fa222691ed28a4a9eaa883dcd39d1da', 26, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-10-02 08:51:41', '2023-10-02 08:51:41', '2024-10-02 11:51:41'),
('0e192628b7b527b4a3d931d24dd01a8ece22d545ee0b60abe513f335b2e96b2daee169bb8832b7df', 26, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-10-02 08:51:50', '2023-10-02 08:51:50', '2024-10-02 11:51:50'),
('1a1a658ff6a562b5bd5dbca19b922308fd3afcde09d0ad326f49e5f27376724a856f336d0cf77e92', 7, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-17 17:50:42', '2023-05-17 17:50:42', '2024-05-17 20:50:42'),
('1d0d8ef0838200744cac98c4c61cd5d2c4bb5f0ee49c80ed42ac5280dc7a7cd7b10e1744ad61f5b9', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 10:32:08', '2023-09-28 10:32:08', '2024-09-28 13:32:08'),
('1dc7fb11495428c764a089f0b5851999239e97d5381293011a3c6c1ce8c2d28c2b9bcf329b520e5b', 28, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-10-02 15:57:05', '2023-10-02 15:57:05', '2024-10-02 18:57:05'),
('1fafd3390a8a8e6c30dc523cfb115d6d2a0b03646eff81653128adbddda72ebc5b281c18a63f611d', 14, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-06-20 20:15:49', '2023-06-20 20:15:49', '2024-06-20 23:15:49'),
('267cd995f6d2fef1e0e8ba363a316c42ec384da8350203d8d46cbe38256fdef255ee661329a34960', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 13:54:18', '2023-09-28 13:54:18', '2024-09-28 16:54:18'),
('27bd67699ec475084c3023326c8a8b35f7743eaec60d8361bef13e5aa0c56d21049e8e9c69299ab4', 21, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 13:20:55', '2023-09-28 13:20:55', '2024-09-28 16:20:55'),
('2b85ddbd043dd6028c86223b1fe86c3d2fe978f6401e87e32641481e9a5c755141117aa4b2f55913', 16, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-07-20 13:05:43', '2023-07-20 13:05:43', '2024-07-20 16:05:43'),
('2bb7ee4a6aea835a3ba13b108a1f70ea50e934d157c4e869653cc4c20a84422a858aff945f42454e', 13, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-06-19 19:47:22', '2023-06-19 19:47:22', '2024-06-19 22:47:22'),
('2dd1180a39c978026d3b9a1bc9b3f23cd2d791be2f6d26f6eea2aeb8a095e913f39d9d1b169f0830', 27, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-10-03 12:38:31', '2023-10-03 12:38:31', '2024-10-03 15:38:31'),
('2fd804ed67256f41451026b9f56083a7f5cd0ced3b870adc141f8f9bbb9ab8aa5ed5842bc233dfbc', 11, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-06-15 16:41:25', '2023-06-15 16:41:25', '2024-06-15 19:41:25'),
('3432208f6289022635b08f0723d09538fbaa08ed00b121db1f1c12b2698e750d2da1ebade0bcd803', 4, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-08 06:41:33', '2023-05-08 06:41:33', '2024-05-08 09:41:33'),
('3444e144c47e0725c520b9af6fe1fcc2d9e08d503d051332cfb1b9ac4a4d9969fb63e8929ac81f73', 23, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 14:45:42', '2023-09-28 14:45:42', '2024-09-28 17:45:42'),
('34d9bc0e40894d4515c97358bdc5c51bf9e40023fde5766793463d24310c707350e3acc998a188b4', 15, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-07-19 22:52:00', '2023-07-19 22:52:00', '2024-07-20 01:52:00'),
('353c5edf15f3d1818847f3c0b194e5160d74aabfb78bce2af9897256665b2df7fe2603ba494027cd', 21, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 13:57:00', '2023-09-28 13:57:00', '2024-09-28 16:57:00'),
('3601b07aacf86e74628165f0c9385b93a1dd7244ea1e053eaf21abbc7ae335ab51a5485b88914615', 3, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-15 11:13:25', '2023-05-15 11:13:25', '2024-05-15 14:13:25'),
('386068a3a514d9369d0f6c7be830c6e9bd32f4152683a273adca637681dee95c51a65bc20ef5fa45', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 08:59:29', '2023-09-28 08:59:29', '2024-09-28 11:59:29'),
('39233459e4986d1145ecdeb996b581f025d8c657462e91637bf8f9c0d90443cbc7f3fedb67846f43', 31, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-12-12 18:41:47', '2023-12-12 18:41:47', '2024-12-12 20:41:47'),
('395ab647b0d2f1b71d1b3684b045542a0989fc750d9a92644d87199a323cc81b7a8802e8aaff1a2a', 11, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-06-18 14:39:27', '2023-06-18 14:39:27', '2024-06-18 17:39:27'),
('3bd7da3a40d0fab0e70ced67c80243ac0f5beecf615f1f9e92bd57b4e3f4b485218a8b96a9a7f174', 23, 3, 'RestaurantCustomerAuth', '[]', 1, '2023-09-28 14:19:57', '2023-09-28 14:19:57', '2024-09-28 17:19:57'),
('3cb3f61caebf5b9e304b689e5c6357d7615c4dd3329b0ae6b6d9a2cab6da3499c4ce0533eb4e86a4', 21, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 14:10:08', '2023-09-28 14:10:08', '2024-09-28 17:10:08'),
('3d27009297dd537b3dddebb0e8c388fb1e482c75af4903a55a581ac6492905a24186f581109f46f0', 20, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 13:04:20', '2023-09-28 13:04:20', '2024-09-28 16:04:20'),
('45b4a57cd604b842319832d34631ebc3fcd2b891816e281a69375a5367289241520e7f209d3e6243', 26, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-10-08 04:57:09', '2023-10-08 04:57:09', '2024-10-08 07:57:09'),
('4878c346ea076878fc6f3257b79b9ec6f00ca68c701bd73fe46b7648d855991f5bb4503dac1f88a7', 10, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-06-19 19:48:54', '2023-06-19 19:48:54', '2024-06-19 22:48:54'),
('4feaa5768a1f37859621323dafc9812be7db715990d94b375b32674f1dc9c5aa3c7b3d51d9bbf77e', 27, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-10-03 07:31:50', '2023-10-03 07:31:50', '2024-10-03 10:31:50'),
('54363478fa2ce4ed3515db4be466ef4403276c099b5e6a6e3b7e41fdab899da126fb97ea87fa3965', 9, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-24 17:17:16', '2023-05-24 17:17:16', '2024-05-24 20:17:16'),
('546101c7a841fd64b37e27a79fad3429afc1c33e0b59856a0010b13f1fc8fd15621d73a12e243603', 17, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-08-07 01:04:24', '2023-08-07 01:04:24', '2024-08-07 04:04:24'),
('56a93b7610bbd0ff20781c2b73fa7b89bdbb4fc71e46b253e22a6fca58e832cd68a697d9ebacb531', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-27 15:23:09', '2023-09-27 15:23:09', '2024-09-27 18:23:09'),
('5ac9e602eb1f407a72ff90608ec4a7304a2b8dedbe8c1637aa52ae7720d57394dda09a9d59cf707f', 3, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-13 03:56:06', '2023-05-13 03:56:06', '2024-05-13 06:56:06'),
('5b846ad76d92ad84c41363b9870f178c2a0c503bead59e177449b18626c81eb1160ec36c43c4ec0b', 26, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-10-03 07:40:09', '2023-10-03 07:40:09', '2024-10-03 10:40:09'),
('5f55727e47eac90d4f2de7b01d2fbf28820e7a5df50353dd962d6c7ecd8097e2ee0ac94332c8cad9', 26, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-10-03 12:38:10', '2023-10-03 12:38:10', '2024-10-03 15:38:10'),
('62cc19f8a27182f7451f34e76ffcd00690f224cededd8a0d297e0403f8fff9e606f9f584cfcf5298', 30, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-12-12 11:15:37', '2023-12-12 11:15:37', '2024-12-12 13:15:37'),
('63680243a7ffd90527c1f43575de3705f909e490fda08a0b52a8c5fbe00dfbdcd48e71ab67c98dc0', 29, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-12-01 21:01:48', '2023-12-01 21:01:48', '2024-12-01 23:01:48'),
('652e8639beefee229992e9b4865a027352cd200fa5930e6fc0af2e25d485906ce50d827aeeb15949', 3, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-13 18:40:03', '2023-05-13 18:40:03', '2024-05-13 21:40:03'),
('65d3b468b9b145bd825e82a89e7a48b791a4dcb80258cce695ef2a4fbc784b7529a596c07ee7dee4', 24, 3, 'RestaurantCustomerAuth', '[]', 1, '2023-10-01 13:20:10', '2023-10-01 13:20:10', '2024-10-01 16:20:10'),
('6e026de03b01c2e5c965c1e8081e7f109db738486e5d3b40175686e56ff91e36aea99108f1f50c9a', 3, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-12 15:15:05', '2023-05-12 15:15:05', '2024-05-12 18:15:05'),
('71686c7d4218be83d0e4df837653f35dd8b585e23712ad5a795c8e18825bf53395dee105d8495841', 26, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-10-02 08:50:33', '2023-10-02 08:50:33', '2024-10-02 11:50:33'),
('721b9e412ee2a87ce25e19ef1f36a7370c5813e9edb33a15261896813f4ad463dee635caa4db9868', 33, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-05-03 10:43:46', '2024-05-03 10:43:46', '2025-05-03 13:43:46'),
('727a5b56ff8534d1da4d7a7532e9cead22664b77ef3a63eb5a0d4c1fe95a8e2564e7ffc836fcfc74', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-10-02 10:31:41', '2023-10-02 10:31:41', '2024-10-02 13:31:41'),
('759de707c460dfa16b9b85cc4c26b113498b94c5aed4574958de90d1d8eb85fb151cf6174bb50dd7', 27, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-10-02 10:34:25', '2023-10-02 10:34:25', '2024-10-02 13:34:25'),
('7ba007fe32ec4898428b1cf1d6e7d15ccba2b5c0c040fda99628fdd56034571c7e30a8f7e6eb3e36', 21, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 13:17:58', '2023-09-28 13:17:58', '2024-09-28 16:17:58'),
('7d41577728404e629c3c4afa3fedc3cacc0ea056d8e2e17cd3bab73be50b7827d4b1f5a01e00563d', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 11:39:37', '2023-09-28 11:39:37', '2024-09-28 14:39:37'),
('838f09af0aef7b6e950546d10b824854f2a5c2aaf6c32d73ba9be5b3679034b922055a8f8b185e01', 34, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-05-03 16:44:02', '2024-05-03 16:44:02', '2025-05-03 19:44:02'),
('841cd57f7a926bfa4fad673f2b28628949569d7744983435ca264b979c5faee272b6a040e5292346', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-27 15:11:26', '2023-09-27 15:11:26', '2024-09-27 18:11:26'),
('84ff01a9e25aee8f34cc8f7abfb85eb11a860eda6bfae51b03ec7f3b4be7b7266091c021edc0ae7b', 4, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-09 17:08:54', '2023-05-09 17:08:54', '2024-05-09 20:08:54'),
('869c7212311cb5cca97c818bc448b97cb8d14e93b275bdf5b775bce56da5e4cda3edd72288532d81', 21, 3, 'RestaurantCustomerAuth', '[]', 1, '2023-09-28 14:10:53', '2023-09-28 14:10:53', '2024-09-28 17:10:53'),
('8c566e92a78dbd6b689d92eba0c62271d90159f645d174308dda0ff9337817ee1bb37882d6ffec26', 24, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-29 08:16:11', '2023-09-29 08:16:11', '2024-09-29 11:16:11'),
('8e58cfe48e9b4559db09094c27079daa6e7ec080f7af70c09b383d067338254a60c2798cfd5a527f', 6, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-17 17:12:23', '2023-05-17 17:12:23', '2024-05-17 20:12:23'),
('925988f4c885c53b3161e4fa69d88595d470732e3cd250a4c9563953ac16131e1e2c2ab801b73e5a', 18, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-11 12:29:01', '2023-09-11 12:29:01', '2024-09-11 15:29:01'),
('9339818c28f55a46ab260fec941fb488e2331bc4b172b562ae0dcbe1a842b67029ad9c003a026824', 10, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-06-03 20:53:12', '2023-06-03 20:53:12', '2024-06-03 23:53:12'),
('9501b58a11b46c1ff368499578b716b6e04a1064ec9c413752213ccf0262fa009506fc620eef1d00', 11, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-06-15 22:04:16', '2023-06-15 22:04:16', '2024-06-16 01:04:16'),
('9a355e1c43cf5255f79b78633ede94312d0106a8f48777e9025a0fffe6dc9efa4b1fcac9f85e7d5f', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-27 15:23:27', '2023-09-27 15:23:27', '2024-09-27 18:23:27'),
('a12539f03f6804c711d8878e2e069d3f5602a8ad1bfb20eb969976cc580ca98720b60cfefe2d3922', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 10:17:27', '2023-09-28 10:17:27', '2024-09-28 13:17:27'),
('a3952325158a1ef98badb3c37877ae80d416f57128a446ebb823df9ef0aae9fc5c598b6d655ae668', 3, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-14 10:05:59', '2023-05-14 10:05:59', '2024-05-14 13:05:59'),
('a5a7e8d465148bc42010dd7a002078d80b8406e02f2ee26066d077bb179ed8ab1861a9d1b1d822b2', 25, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-29 10:11:34', '2023-09-29 10:11:34', '2024-09-29 13:11:34'),
('a5c319522d79d6d527cc38f4bc4d8cd378d90a0253ea4faad3b930234f2a76298f63e4d074fce976', 12, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-06-04 13:55:57', '2023-06-04 13:55:57', '2024-06-04 16:55:57'),
('aa3fa36c4cea446b5d6093f462d18bca2cb3a3faaaf16eb7d5e245ce1c15cd6fe4da34c93cb1a8ec', 8, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-18 21:03:04', '2023-05-18 21:03:04', '2024-05-19 00:03:04'),
('ac38084cb9bc5ed41b8376c29b5ee09c2eacd836d7e8c51155fcf6cf2a056f2b2e2ed51f5da94928', 26, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-10-03 08:04:57', '2023-10-03 08:04:57', '2024-10-03 11:04:57'),
('ad0a7ef7a41236974c1988d84880024de77eac46ff0d5ea38b2fa81aa617ea8669dd5d781aba5b48', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 13:24:51', '2023-09-28 13:24:51', '2024-09-28 16:24:51'),
('afdbbdbfc7205148b1aade47b5caa7f352a79d1b6f8e186c7cabb49942844da6a1f27548c51575a3', 23, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 14:29:54', '2023-09-28 14:29:54', '2024-09-28 17:29:54'),
('aff03bda8963b52420214552463fc66f6be35b0949e091b06f6ba9d31e811b60bd95f73c06c27c14', 21, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 13:56:07', '2023-09-28 13:56:07', '2024-09-28 16:56:07'),
('b1311b53a74b302d2904655ca5ec0c443ea418aeb58164b8a062f1fb89644cf714c883f6e837138f', 22, 3, 'RestaurantCustomerAuth', '[]', 1, '2023-09-28 14:17:24', '2023-09-28 14:17:24', '2024-09-28 17:17:24'),
('b36f2d7fb8faba5ef46bd1e654d6dbece49d6749c35723fcbda214f7b4e2d60765f815c254f9ae42', 3, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-23 13:34:53', '2023-05-23 13:34:53', '2024-05-23 16:34:53'),
('b43428cc0e3837364d61fcaed9e88c42042797e7a357b968136b87584e010e780f1b43758cafd42f', 21, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 14:03:11', '2023-09-28 14:03:11', '2024-09-28 17:03:11'),
('b5a0d06ed2190e743a0fd0186ffae9c42b485ec22ebdaea000237f0c77d1af7c041b0e0fce57aa79', 3, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-08 02:50:13', '2023-05-08 02:50:13', '2024-05-08 05:50:13'),
('bd5bc9c3c7686901d0e20cf4f852ce605f2b737705c74f6b08a62c5f955e666123b6475f7ec41774', 3, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-13 18:03:31', '2023-05-13 18:03:31', '2024-05-13 21:03:31'),
('c5ab01852038bcba1899c024708c271685ac1398fe85e834be078e2f3f9972cc7d39a6c52c496d0a', 32, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-03-09 23:54:24', '2024-03-09 23:54:24', '2025-03-10 01:54:24'),
('c6f9c5f903a18b9014439cdd528eac695c5aed759d2afb9beffca3c3e228ff3935b805c735dac6b1', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-03 20:43:25', '2023-05-03 20:43:25', '2024-05-03 23:43:25'),
('c710491b0281a7c9dbfaaea7b8044ec166791e6ed493c2411bdae27c452c7d82da70fb4c08ce0b28', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-03 22:50:08', '2023-05-03 22:50:08', '2024-05-04 01:50:08'),
('c8774f15ad6082277bc6e287092cc0169efb95260680311b2d2f635b9c6ce3b3aee3720f04cbefea', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-29 08:24:09', '2023-09-29 08:24:09', '2024-09-29 11:24:09'),
('c9d43a16d1a4cb4c668c75522132da581b2b32dfd7bb889c08a447507312d4f026317969c3af2b3a', 24, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-29 07:52:20', '2023-09-29 07:52:20', '2024-09-29 10:52:20'),
('ce37e6b80d159ea6b801b73e8f4697a0b2dd4f30420e751881d9e78c2dc3fcf87aef27d13bbcb83e', 26, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-10-04 10:20:18', '2023-10-04 10:20:18', '2024-10-04 13:20:18'),
('d245fa49dd0e3f81d41694a6ab0e4a75d4645adfa92975d117636993e9a89f01c232bcf3855e6978', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 13:25:56', '2023-09-28 13:25:56', '2024-09-28 16:25:56'),
('d5275f739f6a92760715d37c36fac27900c53d28fcded1a24ec104eb9889c189c59bf4fd6b70a05b', 11, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-06-03 20:19:23', '2023-06-03 20:19:23', '2024-06-03 23:19:23'),
('da4f06b76d703686ee85e17ba8682812064e908e6d37044dbe826c34b4cc8e9909165937a66abb53', 23, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 14:23:10', '2023-09-28 14:23:10', '2024-09-28 17:23:10'),
('dda391b61e7eb33f781d834467a45fdba3396e1a38561942316a54d1ab496bbefc259ef61186f332', 16, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-05-18 14:26:26', '2024-05-18 14:26:26', '2025-05-18 17:26:26'),
('e23a6f0369c287bc8c2e73b0d560681642843f8d92a031f5e8efd38f89279e39756a2ba0b9da0223', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-03 20:42:33', '2023-05-03 20:42:33', '2024-05-03 23:42:33'),
('e4176b1f3deed477529e2e40366974e27b5be58afdaf2513cc739c0fbd16379af32ff910715badce', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-30 08:36:12', '2023-09-30 08:36:12', '2024-09-30 11:36:12'),
('e645806d9f9ee711add7acbb9ad88362f074a512cc588a43d5e5143027a6a1bf719bde0ab981ab7e', 21, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 14:10:25', '2023-09-28 14:10:25', '2024-09-28 17:10:25'),
('ea1eb98952f8108df735a5275391e6bcef7b290513b97ee59a845f9bbb1e80e00885ef5d894eedd6', 21, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 13:19:03', '2023-09-28 13:19:03', '2024-09-28 16:19:03'),
('ed5bf07ec128543aa25b711d48de1dd13734304992572587b11d87c43c4ff701f7fcc782f1cf8338', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-27 19:28:48', '2023-09-27 19:28:48', '2024-09-27 22:28:48'),
('ee6a51eaac0646f44c9c14b8ae0567efd9a8af775efebec529d7e4b408536adc1b70335e92d6c78f', 5, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-05-08 09:58:38', '2023-05-08 09:58:38', '2024-05-08 12:58:38'),
('f16f65d4ee3a9c399daed97e25e31a37e3f09b33ae570f86bbc4b6cd61acea461266f97fb09a65f6', 10, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-06-03 17:18:25', '2023-06-03 17:18:25', '2024-06-03 20:18:25'),
('f23dbf330b8f866d043901d4cd15b5f7b6eccbd836f8f936994018158822a7db4b05cfe35098f25f', 19, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-09-28 11:54:18', '2023-09-28 11:54:18', '2024-09-28 14:54:18'),
('f31e3310ba2aebc24e5690939175be223d54afda8dca1898a5f0c372b02105eba494278f0fffdcdb', 17, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-08-07 04:24:54', '2023-08-07 04:24:54', '2024-08-07 07:24:54'),
('fa24ab1276f90147b6e3842e720039e6ab2111323881ad068b4c11dbbca9475b21631f36d0f48de7', 11, 3, 'RestaurantCustomerAuth', '[]', 0, '2023-06-15 15:15:13', '2023-06-15 15:15:13', '2024-06-15 18:15:13');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'qBN0j6SW6nIf47748tgxaKxnqKqCacTxa6gii8yc', NULL, 'http://localhost', 1, 0, 0, '2021-08-19 20:44:50', '2021-08-19 20:44:50'),
(2, NULL, 'Laravel Password Grant Client', 'oqQ90HOU0egjgQ01LRzHo9rADUavq16jzWm1TrjT', 'users', 'http://localhost', 0, 1, 0, '2021-08-19 20:44:50', '2021-08-19 20:44:50'),
(3, NULL, 'HekalStore Personal Access Client', 'iRxXixYp4CDo7TWbWNCMelAUwgtScaEMGudnbHQk', NULL, 'http://localhost', 1, 0, 0, '2022-01-05 10:22:36', '2022-01-05 10:22:36'),
(4, NULL, 'HekalStore Password Grant Client', 'FzGJ1vSlbfGP2mWqF6V575QgVCEfbBHVNA41ApeC', 'users', 'http://localhost', 0, 1, 0, '2022-01-05 10:22:36', '2022-01-05 10:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-08-19 20:44:50', '2021-08-19 20:44:50'),
(2, 3, '2022-01-05 10:22:36', '2022-01-05 10:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_tax_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_reference` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci,
  `order_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `schedule_at` timestamp NULL DEFAULT NULL,
  `callback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `confirmed` timestamp NULL DEFAULT NULL,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL,
  `refund_requested` timestamp NULL DEFAULT NULL,
  `refunded` timestamp NULL DEFAULT NULL,
  `delivery_address` text COLLATE utf8mb4_unicode_ci,
  `scheduled` tinyint(1) NOT NULL DEFAULT '0',
  `store_discount_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `failed` timestamp NULL DEFAULT NULL,
  `adjusment` decimal(24,2) NOT NULL DEFAULT '0.00',
  `edited` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `order_attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parcel_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `receiver_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `charge_payer` enum('sender','receiver') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` double(16,3) NOT NULL DEFAULT '0.000',
  `dm_tips` double(24,2) NOT NULL DEFAULT '0.00',
  `free_delivery_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_request_canceled` timestamp NULL DEFAULT NULL,
  `prescription_order` tinyint(1) NOT NULL DEFAULT '0',
  `tax_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dm_vehicle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cancellation_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canceled_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_on_product_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'vendor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_amount`, `coupon_discount_amount`, `coupon_discount_title`, `payment_status`, `order_status`, `total_tax_amount`, `payment_method`, `transaction_reference`, `delivery_address_id`, `delivery_man_id`, `coupon_code`, `order_note`, `order_type`, `checked`, `store_id`, `created_at`, `updated_at`, `delivery_charge`, `schedule_at`, `callback`, `otp`, `pending`, `accepted`, `confirmed`, `processing`, `handover`, `picked_up`, `delivered`, `canceled`, `refund_requested`, `refunded`, `delivery_address`, `scheduled`, `store_discount_amount`, `original_delivery_charge`, `failed`, `adjusment`, `edited`, `delivery_time`, `zone_id`, `module_id`, `order_attachment`, `parcel_category_id`, `receiver_details`, `charge_payer`, `distance`, `dm_tips`, `free_delivery_by`, `refund_request_canceled`, `prescription_order`, `tax_status`, `dm_vehicle_id`, `cancellation_reason`, `canceled_by`, `coupon_created_by`, `discount_on_product_by`) VALUES
(100001, 24, 451.00, 0.00, '', 'unpaid', 'canceled', 55.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'take_away', 1, 43, '2023-09-30 08:00:03', '2023-10-25 07:26:55', 0.00, '2023-09-30 08:00:03', NULL, '6616', '2023-09-30 08:00:03', NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-30 08:01:39', NULL, NULL, '{\"contact_person_name\":\"\\u0627\\u0633\\u0644\\u0627\\u0645 \\u0627\\u0644\\u0648\\u0643\\u064a\\u0644\",\"contact_person_number\":\"+201226565019\",\"address_type\":\"others\",\"address\":\"\\u0627\\u0644\\u0643\\u0648\\u064a\\u062a\\u200e\",\"floor\":null,\"road\":null,\"house\":null,\"longitude\":\"47.48175881803036\",\"latitude\":\"29.311666080851438\"}', 0, 7.00, 0.00, NULL, 0.00, 0, NULL, 15, 4, NULL, NULL, NULL, NULL, 11.001, 0.00, NULL, NULL, 0, 'excluded', NULL, 'تم الغاء الطلب من الادارة', 'store', NULL, 'vendor'),
(100002, 24, 820.00, 0.00, '', 'unpaid', 'canceled', 99.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 43, '2023-09-30 08:11:44', '2023-10-25 07:26:55', 11.00, '2023-09-30 08:11:44', NULL, '9903', '2023-09-30 08:11:44', NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-02 08:44:05', NULL, NULL, '{\"contact_person_name\":\"\\u0627\\u0633\\u0644\\u0627\\u0645 \\u0627\\u0644\\u0648\\u0643\\u064a\\u0644\",\"contact_person_number\":\"+201226565019\",\"address_type\":\"others\",\"address\":\"\\u0627\\u0644\\u0643\\u0648\\u064a\\u062a\\u200e\",\"floor\":null,\"road\":null,\"house\":null,\"longitude\":\"47.48175881803036\",\"latitude\":\"29.311666080851438\"}', 0, 340.00, 11.00, NULL, 0.00, 0, NULL, 15, 4, NULL, NULL, NULL, NULL, 11.001, 0.00, NULL, NULL, 0, 'excluded', 4, 'لا اريد الطلب', 'customer', NULL, 'vendor');

-- --------------------------------------------------------

--
-- Table structure for table `order_cancel_reasons`
--

CREATE TABLE `order_cancel_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_cancel_reasons`
--

INSERT INTO `order_cancel_reasons` (`id`, `reason`, `user_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'الطلب غير صحيح', 'customer', 1, '2023-05-03 20:03:41', '2023-05-03 20:03:41'),
(2, 'لا اريد الطلب', 'customer', 1, '2023-05-03 20:03:51', '2023-05-03 20:03:51'),
(3, 'العميل غير موجود', 'deliveryman', 1, '2023-05-03 20:04:00', '2023-05-03 20:04:00'),
(4, 'العميل لا يريد استلام الطلب', 'deliveryman', 1, '2023-05-03 20:04:13', '2023-05-03 20:04:13'),
(5, 'المندوب تاخر باستلام الطلب', 'deliveryman', 1, '2023-05-03 20:04:24', '2023-05-03 20:04:24'),
(6, 'تم الغاء الطلب من الادارة', 'store', 1, '2023-05-03 20:04:35', '2023-05-03 20:04:35'),
(7, 'تم الغاء الطلب من العميل', 'admin', 1, '2023-05-03 20:04:45', '2023-05-03 20:04:45');

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery_histories`
--

CREATE TABLE `order_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `item_details` text COLLATE utf8mb4_unicode_ci,
  `variation` text COLLATE utf8mb4_unicode_ci,
  `add_ons` text COLLATE utf8mb4_unicode_ci,
  `discount_on_item` decimal(24,2) DEFAULT NULL,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `quantity` int(11) NOT NULL DEFAULT '1',
  `tax_amount` decimal(24,2) NOT NULL DEFAULT '1.00',
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_add_on_price` decimal(24,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `item_id`, `order_id`, `price`, `item_details`, `variation`, `add_ons`, `discount_on_item`, `discount_type`, `quantity`, `tax_amount`, `variant`, `created_at`, `updated_at`, `item_campaign_id`, `total_add_on_price`) VALUES
(5, 5, 100001, 201.00, '{\"id\":5,\"name\":\"\\u0634\\u0627\\u0648\\u0631\\u0645\\u0627\",\"description\":\"\\u062a\\u0641\\u0627\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0634\\u0627\\u0648\\u0631\\u0645\\u0627 \\u062a\\u0641\\u0627\\u0635\\u064a\\u0644 2 \\u062a\\u0641\\u0627\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0634\\u0627\\u0648\\u0631\\u0645\\u0627 \\u062a\\u0641\\u0627\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0634\\u0627\\u0648\\u0631\\u0645\\u0627 \\u062a\\u0641\\u0627\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0634\\u0627\\u0648\\u0631\\u0645\\u0627 \\u062a\\u0641\\u0627\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0634\\u0627\\u0648\\u0631\\u0645\\u0627 \\u062a\\u0641\\u0627\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0634\\u0627\\u0648\\u0631\\u0645\\u0627 \\u062a\\u0641\\u0627\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0634\\u0627\\u0648\\u0631\\u0645\\u0627 \\u062a\\u0641\\u0627\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0634\\u0627\\u0648\\u0631\\u0645\\u0627 \\u062a\\u0641\\u0627\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0634\\u0627\\u0648\\u0631\\u0645\\u0627 \\u062a\\u0641\\u0627\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0634\\u0627\\u0648\\u0631\\u0645\\u0627 \\u062a\\u0641\\u0627\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0634\\u0627\\u0648\\u0631\\u0645\\u0627 \\u062a\\u0641\\u0627\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0634\\u0627\\u0648\\u0631\\u0645\\u0627 \\u062a\\u0641\\u0627\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0634\\u0627\\u0648\\u0631\\u0645\\u0627\",\"image\":\"2023-09-29-65168e4527c8f.png\",\"category_id\":28,\"category_ids\":[{\"id\":\"4\",\"position\":1},{\"id\":\"28\",\"position\":2}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":150.9,\"tax\":14,\"tax_type\":\"percent\",\"discount\":3.3,\"discount_type\":\"amount\",\"available_time_starts\":\"09:30:00\",\"available_time_ends\":\"15:00:00\",\"veg\":0,\"status\":1,\"store_id\":43,\"created_at\":\"2023-09-29T08:41:21.000000Z\",\"updated_at\":\"2023-09-30T06:45:53.000000Z\",\"order_count\":0,\"avg_rating\":0,\"rating_count\":0,\"module_id\":4,\"stock\":0,\"unit_id\":null,\"images\":[\"2023-09-29-65168e4527987.png\",\"2023-09-29-65168e4527ae1.png\"],\"food_variations\":[{\"name\":\"meet\",\"type\":\"single\",\"min\":\"20\",\"max\":\"20\",\"required\":\"off\",\"values\":[{\"label\":\"cheesecake\",\"optionPrice\":\"20\"},{\"label\":\"choclate\",\"optionPrice\":\"50\"}]}],\"slug\":\"shawerma\",\"recommended\":0,\"store_name\":\"Elwakil store\",\"module_type\":\"food\",\"zone_id\":15,\"store_discount\":0,\"schedule_order\":false,\"unit_type\":null,\"module\":{\"id\":4,\"module_name\":\"Restaurants\",\"module_type\":\"food\",\"thumbnail\":\"2023-05-03-6452c72d9bfed.png\",\"status\":\"1\",\"stores_count\":3,\"created_at\":\"2023-05-03T19:42:21.000000Z\",\"updated_at\":\"2023-09-27T15:30:59.000000Z\",\"icon\":\"2023-05-03-6452c72d9bb0b.png\",\"theme_id\":2,\"description\":\"<p>Restaurants&nbsp;<\\/p>\",\"all_zone_service\":0,\"translations\":[{\"id\":7,\"translationable_type\":\"App\\\\Models\\\\Module\",\"translationable_id\":4,\"locale\":\"ar\",\"key\":\"module_name\",\"value\":\"\\u0645\\u0637\\u0627\\u0639\\u0645 \\u0648 \\u0645\\u0623\\u0643\\u0648\\u0644\\u0627\\u062a\",\"created_at\":null,\"updated_at\":null},{\"id\":8,\"translationable_type\":\"App\\\\Models\\\\Module\",\"translationable_id\":4,\"locale\":\"ar\",\"key\":\"description\",\"value\":\"<p>\\u0645\\u0637\\u0627\\u0639\\u0645 \\u0648 \\u0645\\u0623\\u0643\\u0648\\u0644\\u0627\\u062a<\\/p>\\r\\n\\r\\n<div class=\\\"simple-translate-system-theme\\\" id=\\\"simple-translate\\\">\\r\\n<div>\\r\\n<div class=\\\"simple-translate-button isShow\\\" style=\\\"background-image: url(&quot;chrome-extension:\\/\\/ibplnjkanclpjokhdolnendpplpjiace\\/icons\\/512.png&quot;); height: 22px; width: 22px; top: 58px; left: 151px;\\\">&nbsp;<\\/div>\\r\\n\\r\\n<div class=\\\"simple-translate-panel \\\" style=\\\"width: 300px; height: 200px; top: 0px; left: 0px; font-size: 13px;\\\">\\r\\n<div class=\\\"simple-translate-result-wrapper\\\" style=\\\"overflow: hidden;\\\">\\r\\n<div class=\\\"simple-translate-move\\\" draggable=\\\"true\\\">&nbsp;<\\/div>\\r\\n\\r\\n<div class=\\\"simple-translate-result-contents\\\">\\r\\n<p class=\\\"simple-translate-result\\\" dir=\\\"auto\\\">&nbsp;<\\/p>\\r\\n\\r\\n<p class=\\\"simple-translate-candidate\\\" dir=\\\"auto\\\">&nbsp;<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\",\"created_at\":null,\"updated_at\":null}]},\"unit\":null}', '[{\"name\":\"meet\",\"type\":\"single\",\"min\":\"20\",\"max\":\"20\",\"required\":\"off\",\"values\":[{\"label\":\"choclate\",\"optionPrice\":\"50\"}]}]', '[]', 3.30, 'discount_on_product', 2, 28.00, '\"\"', '2023-09-30 08:00:03', '2023-09-30 08:00:03', NULL, 0.00),
(6, 4, 100002, 200.00, '{\"id\":4,\"name\":\"Chicken\",\"description\":\"Chiken with tehina\",\"image\":\"2023-09-29-6516762261922.png\",\"category_id\":29,\"category_ids\":[{\"id\":\"4\",\"position\":1},{\"id\":\"29\",\"position\":2}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":200,\"tax\":14,\"tax_type\":\"percent\",\"discount\":50,\"discount_type\":\"percent\",\"available_time_starts\":\"09:15:00\",\"available_time_ends\":\"03:15:00\",\"veg\":0,\"status\":1,\"store_id\":43,\"created_at\":\"2023-09-29T07:00:50.000000Z\",\"updated_at\":\"2023-09-29T08:13:07.000000Z\",\"order_count\":0,\"avg_rating\":0,\"rating_count\":0,\"module_id\":4,\"stock\":0,\"unit_id\":null,\"images\":[\"2023-09-29-651676225f312.png\"],\"food_variations\":[],\"slug\":\"frakh-mshoy\",\"recommended\":0,\"store_name\":\"Elwakil store\",\"module_type\":\"food\",\"zone_id\":15,\"store_discount\":0,\"schedule_order\":false,\"unit_type\":null,\"module\":{\"id\":4,\"module_name\":\"Restaurants\",\"module_type\":\"food\",\"thumbnail\":\"2023-05-03-6452c72d9bfed.png\",\"status\":\"1\",\"stores_count\":3,\"created_at\":\"2023-05-03T19:42:21.000000Z\",\"updated_at\":\"2023-09-27T15:30:59.000000Z\",\"icon\":\"2023-05-03-6452c72d9bb0b.png\",\"theme_id\":2,\"description\":\"<p>Restaurants&nbsp;<\\/p>\",\"all_zone_service\":0,\"translations\":[]},\"unit\":null}', '[]', '[]', 100.00, 'discount_on_product', 1, 28.00, '\"\"', '2023-09-30 08:11:44', '2023-09-30 08:11:44', NULL, 0.00),
(7, 5, 100002, 150.00, '{\"id\":5,\"name\":\"Shawerma\",\"description\":\"Shawerma discription\",\"image\":\"2023-09-29-65168e4527c8f.png\",\"category_id\":28,\"category_ids\":[{\"id\":\"4\",\"position\":1},{\"id\":\"28\",\"position\":2}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":100,\"tax\":14,\"tax_type\":\"percent\",\"discount\":40,\"discount_type\":\"amount\",\"available_time_starts\":\"09:30:00\",\"available_time_ends\":\"15:00:00\",\"veg\":0,\"status\":1,\"store_id\":43,\"created_at\":\"2023-09-29T08:41:21.000000Z\",\"updated_at\":\"2023-09-30T08:03:06.000000Z\",\"order_count\":0,\"avg_rating\":0,\"rating_count\":0,\"module_id\":4,\"stock\":0,\"unit_id\":null,\"images\":[\"2023-09-29-65168e4527987.png\",\"2023-09-29-65168e4527ae1.png\"],\"food_variations\":[{\"name\":\"meet\",\"type\":\"single\",\"min\":\"20\",\"max\":\"20\",\"required\":\"off\",\"values\":[{\"label\":\"cheesecake\",\"optionPrice\":\"20\"},{\"label\":\"choclate\",\"optionPrice\":\"50\"}]}],\"slug\":\"shawerma\",\"recommended\":0,\"store_name\":\"Elwakil store\",\"module_type\":\"food\",\"zone_id\":15,\"store_discount\":0,\"schedule_order\":false,\"unit_type\":null,\"module\":{\"id\":4,\"module_name\":\"Restaurants\",\"module_type\":\"food\",\"thumbnail\":\"2023-05-03-6452c72d9bfed.png\",\"status\":\"1\",\"stores_count\":3,\"created_at\":\"2023-05-03T19:42:21.000000Z\",\"updated_at\":\"2023-09-27T15:30:59.000000Z\",\"icon\":\"2023-05-03-6452c72d9bb0b.png\",\"theme_id\":2,\"description\":\"<p>Restaurants&nbsp;<\\/p>\",\"all_zone_service\":0,\"translations\":[]},\"unit\":null}', '[{\"name\":\"meet\",\"type\":\"single\",\"min\":\"20\",\"max\":\"20\",\"required\":\"off\",\"values\":[{\"label\":\"choclate\",\"optionPrice\":\"50\"}]}]', '[]', 40.00, 'discount_on_product', 2, 21.00, '\"\"', '2023-09-30 08:11:44', '2023-09-30 08:11:44', NULL, 0.00),
(8, 5, 100002, 150.00, '{\"id\":5,\"name\":\"Shawerma\",\"description\":\"Shawerma discription\",\"image\":\"2023-09-29-65168e4527c8f.png\",\"category_id\":28,\"category_ids\":[{\"id\":\"4\",\"position\":1},{\"id\":\"28\",\"position\":2}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":100,\"tax\":14,\"tax_type\":\"percent\",\"discount\":40,\"discount_type\":\"amount\",\"available_time_starts\":\"09:30:00\",\"available_time_ends\":\"15:00:00\",\"veg\":0,\"status\":1,\"store_id\":43,\"created_at\":\"2023-09-29T08:41:21.000000Z\",\"updated_at\":\"2023-09-30T08:03:06.000000Z\",\"order_count\":0,\"avg_rating\":0,\"rating_count\":0,\"module_id\":4,\"stock\":0,\"unit_id\":null,\"images\":[\"2023-09-29-65168e4527987.png\",\"2023-09-29-65168e4527ae1.png\"],\"food_variations\":[{\"name\":\"meet\",\"type\":\"single\",\"min\":\"20\",\"max\":\"20\",\"required\":\"off\",\"values\":[{\"label\":\"cheesecake\",\"optionPrice\":\"20\"},{\"label\":\"choclate\",\"optionPrice\":\"50\"}]}],\"slug\":\"shawerma\",\"recommended\":0,\"store_name\":\"Elwakil store\",\"module_type\":\"food\",\"zone_id\":15,\"store_discount\":0,\"schedule_order\":false,\"unit_type\":null,\"module\":{\"id\":4,\"module_name\":\"Restaurants\",\"module_type\":\"food\",\"thumbnail\":\"2023-05-03-6452c72d9bfed.png\",\"status\":\"1\",\"stores_count\":3,\"created_at\":\"2023-05-03T19:42:21.000000Z\",\"updated_at\":\"2023-09-27T15:30:59.000000Z\",\"icon\":\"2023-05-03-6452c72d9bb0b.png\",\"theme_id\":2,\"description\":\"<p>Restaurants&nbsp;<\\/p>\",\"all_zone_service\":0,\"translations\":[]},\"unit\":null}', '[{\"name\":\"meet\",\"type\":\"single\",\"min\":\"20\",\"max\":\"20\",\"required\":\"off\",\"values\":[{\"label\":\"choclate\",\"optionPrice\":\"50\"}]}]', '[]', 40.00, 'discount_on_product', 1, 21.00, '\"\"', '2023-09-30 08:11:44', '2023-09-30 08:11:44', NULL, 0.00),
(9, 5, 100002, 150.00, '{\"id\":5,\"name\":\"Shawerma\",\"description\":\"Shawerma discription\",\"image\":\"2023-09-29-65168e4527c8f.png\",\"category_id\":28,\"category_ids\":[{\"id\":\"4\",\"position\":1},{\"id\":\"28\",\"position\":2}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":100,\"tax\":14,\"tax_type\":\"percent\",\"discount\":40,\"discount_type\":\"amount\",\"available_time_starts\":\"09:30:00\",\"available_time_ends\":\"15:00:00\",\"veg\":0,\"status\":1,\"store_id\":43,\"created_at\":\"2023-09-29T08:41:21.000000Z\",\"updated_at\":\"2023-09-30T08:03:06.000000Z\",\"order_count\":0,\"avg_rating\":0,\"rating_count\":0,\"module_id\":4,\"stock\":0,\"unit_id\":null,\"images\":[\"2023-09-29-65168e4527987.png\",\"2023-09-29-65168e4527ae1.png\"],\"food_variations\":[{\"name\":\"meet\",\"type\":\"single\",\"min\":\"20\",\"max\":\"20\",\"required\":\"off\",\"values\":[{\"label\":\"cheesecake\",\"optionPrice\":\"20\"},{\"label\":\"choclate\",\"optionPrice\":\"50\"}]}],\"slug\":\"shawerma\",\"recommended\":0,\"store_name\":\"Elwakil store\",\"module_type\":\"food\",\"zone_id\":15,\"store_discount\":0,\"schedule_order\":false,\"unit_type\":null,\"module\":{\"id\":4,\"module_name\":\"Restaurants\",\"module_type\":\"food\",\"thumbnail\":\"2023-05-03-6452c72d9bfed.png\",\"status\":\"1\",\"stores_count\":3,\"created_at\":\"2023-05-03T19:42:21.000000Z\",\"updated_at\":\"2023-09-27T15:30:59.000000Z\",\"icon\":\"2023-05-03-6452c72d9bb0b.png\",\"theme_id\":2,\"description\":\"<p>Restaurants&nbsp;<\\/p>\",\"all_zone_service\":0,\"translations\":[]},\"unit\":null}', '[{\"name\":\"meet\",\"type\":\"single\",\"min\":\"20\",\"max\":\"20\",\"required\":\"off\",\"values\":[{\"label\":\"choclate\",\"optionPrice\":\"50\"}]}]', '[]', 40.00, 'discount_on_product', 2, 21.00, '\"\"', '2023-09-30 08:11:44', '2023-09-30 08:11:44', NULL, 0.00),
(10, 5, 100002, 100.00, '{\"id\":5,\"name\":\"Shawerma\",\"description\":\"Shawerma discription\",\"image\":\"2023-09-29-65168e4527c8f.png\",\"category_id\":28,\"category_ids\":[{\"id\":\"4\",\"position\":1},{\"id\":\"28\",\"position\":2}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":100,\"tax\":14,\"tax_type\":\"percent\",\"discount\":40,\"discount_type\":\"amount\",\"available_time_starts\":\"09:30:00\",\"available_time_ends\":\"15:00:00\",\"veg\":0,\"status\":1,\"store_id\":43,\"created_at\":\"2023-09-29T08:41:21.000000Z\",\"updated_at\":\"2023-09-30T08:03:06.000000Z\",\"order_count\":0,\"avg_rating\":0,\"rating_count\":0,\"module_id\":4,\"stock\":0,\"unit_id\":null,\"images\":[\"2023-09-29-65168e4527987.png\",\"2023-09-29-65168e4527ae1.png\"],\"food_variations\":[{\"name\":\"meet\",\"type\":\"single\",\"min\":\"20\",\"max\":\"20\",\"required\":\"off\",\"values\":[{\"label\":\"cheesecake\",\"optionPrice\":\"20\"},{\"label\":\"choclate\",\"optionPrice\":\"50\"}]}],\"slug\":\"shawerma\",\"recommended\":0,\"store_name\":\"Elwakil store\",\"module_type\":\"food\",\"zone_id\":15,\"store_discount\":0,\"schedule_order\":false,\"unit_type\":null,\"module\":{\"id\":4,\"module_name\":\"Restaurants\",\"module_type\":\"food\",\"thumbnail\":\"2023-05-03-6452c72d9bfed.png\",\"status\":\"1\",\"stores_count\":3,\"created_at\":\"2023-05-03T19:42:21.000000Z\",\"updated_at\":\"2023-09-27T15:30:59.000000Z\",\"icon\":\"2023-05-03-6452c72d9bb0b.png\",\"theme_id\":2,\"description\":\"<p>Restaurants&nbsp;<\\/p>\",\"all_zone_service\":0,\"translations\":[]},\"unit\":null}', '[]', '[]', 40.00, 'discount_on_product', 1, 14.00, '\"\"', '2023-09-30 08:11:44', '2023-09-30 08:11:44', NULL, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_amount` decimal(24,2) NOT NULL,
  `store_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `admin_commission` decimal(24,2) NOT NULL,
  `received_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `parcel_catgory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dm_tips` double(24,2) NOT NULL DEFAULT '0.00',
  `delivery_fee_comission` double(24,2) NOT NULL DEFAULT '0.00',
  `admin_expense` decimal(23,3) DEFAULT '0.000',
  `store_expense` double(23,3) DEFAULT '0.000',
  `discount_amount_by_store` double(23,3) DEFAULT '0.000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parcel_categories`
--

CREATE TABLE `parcel_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parcel_per_km_shipping_charge` double(23,2) DEFAULT NULL,
  `parcel_minimum_shipping_charge` double(23,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parcel_categories`
--

INSERT INTO `parcel_categories` (`id`, `image`, `name`, `description`, `status`, `orders_count`, `module_id`, `created_at`, `updated_at`, `parcel_per_km_shipping_charge`, `parcel_minimum_shipping_charge`) VALUES
(1, '2023-06-15-648b80be746e5.png', 'Documents', 'مستندات ورقية', 1, 0, 5, '2023-06-15 20:21:02', '2023-06-15 20:21:02', 1.00, 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint(4) NOT NULL DEFAULT '0',
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `temp_block_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`, `otp_hit_count`, `is_blocked`, `is_temp_blocked`, `temp_block_time`) VALUES
('mo@gmail.com', '1586', '2023-06-03 17:00:21', 0, 0, 0, NULL),
('Ranadammarammar@gmail.com', '4871', '2023-06-19 04:41:52', 0, 0, 0, NULL),
('Ranadammarammar@gmail.com', '6298', '2023-06-19 19:46:43', 0, 0, 0, NULL),
('Ranadammarammar@gmail.com', '9956', '2023-06-19 19:46:50', 0, 0, 0, NULL),
('Ranadammarammar@gmail.com', '9364', '2023-06-19 19:47:08', 0, 0, 0, NULL),
('Ranadammarammar@gmail.com', '7156', '2023-06-19 19:47:16', 0, 0, 0, NULL),
('eslamelwakil24@gmail.com', '3293', '2023-09-28 13:09:31', 0, 0, 0, NULL),
('eslamelwakil24@gmail.com', '5014', '2023-09-28 13:10:51', 0, 0, 0, NULL),
('eslamelwakil24@gmail.com', '5961', '2023-09-28 13:11:03', 0, 0, 0, NULL),
('eslamelwakil24@gmail.com', '7767', '2023-09-28 13:11:10', 0, 0, 0, NULL),
('eslamelwakil24@gmail.com', '6265', '2023-09-28 13:11:15', 0, 0, 0, NULL),
('eslamelwakil24@gmail.com', '7506', '2023-09-28 13:12:49', 0, 0, 0, NULL),
('eslamelwakil24@gmail.com', '7524', '2023-09-28 13:12:54', 0, 0, 0, NULL),
('eslamelwakil24@gmail.com', '6538', '2023-09-28 13:12:58', 0, 0, 0, NULL),
('eslamelwakil24@gmail.com', '2130', '2023-10-02 08:48:28', 0, 0, 0, NULL),
('eslamelwakil24@gmail.com', '4074', '2023-10-02 08:48:33', 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `phone_verifications`
--

CREATE TABLE `phone_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint(4) NOT NULL DEFAULT '0',
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `temp_block_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provide_d_m_earnings`
--

CREATE TABLE `provide_d_m_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_note` text COLLATE utf8mb4_unicode_ci,
  `admin_note` text COLLATE utf8mb4_unicode_ci,
  `refund_amount` decimal(23,3) NOT NULL DEFAULT '0.000',
  `refund_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refund_method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_reasons`
--

CREATE TABLE `refund_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `module_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_media`
--

INSERT INTO `social_media` (`id`, `name`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'facebook', 'https://www.facebook.com/otllobni?mibextid=LQQJ4d', 1, NULL, '2023-06-03 15:46:04');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `minimum_order` decimal(24,2) NOT NULL DEFAULT '0.00',
  `comission` decimal(24,2) DEFAULT NULL,
  `schedule_order` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `free_delivery` tinyint(1) NOT NULL DEFAULT '0',
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT '1',
  `take_away` tinyint(1) NOT NULL DEFAULT '1',
  `item_section` tinyint(1) NOT NULL DEFAULT '1',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reviews_section` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `off_day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `gst` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `self_delivery_system` tinyint(1) NOT NULL DEFAULT '0',
  `pos_system` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_shipping_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `delivery_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '30-40',
  `veg` tinyint(1) NOT NULL DEFAULT '1',
  `non_veg` tinyint(1) NOT NULL DEFAULT '1',
  `order_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `order_place_to_schedule_interval` int(11) DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `per_km_shipping_charge` double(16,3) UNSIGNED NOT NULL DEFAULT '0.000',
  `prescription_order` tinyint(1) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maximum_shipping_charge` double(23,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `phone`, `email`, `logo`, `latitude`, `longitude`, `address`, `footer_text`, `minimum_order`, `comission`, `schedule_order`, `status`, `vendor_id`, `created_at`, `updated_at`, `free_delivery`, `rating`, `cover_photo`, `delivery`, `take_away`, `item_section`, `tax`, `zone_id`, `reviews_section`, `active`, `off_day`, `gst`, `self_delivery_system`, `pos_system`, `minimum_shipping_charge`, `delivery_time`, `veg`, `non_veg`, `order_count`, `total_order`, `module_id`, `order_place_to_schedule_interval`, `featured`, `per_km_shipping_charge`, `prescription_order`, `slug`, `maximum_shipping_charge`) VALUES
(39, 'Carefour', '96560635091', 'grocery@Otlobne.com', '2023-06-15-648b7f036f4df.png', '29.115040650098102', '47.666400845358226', 'Minia', NULL, 0.00, NULL, 0, 1, 41, '2023-06-15 20:13:39', '2023-09-17 17:55:03', 0, '{\"1\":0,\"2\":0,\"3\":0,\"4\":1,\"5\":0}', '2023-06-15-648b7f03766e4.png', 1, 1, 1, 10.00, 15, 1, 0, ' ', NULL, 0, 0, 0.00, '5-10 min', 1, 1, 3, 4, 1, 0, 1, 0.000, 0, 'carefour', NULL),
(40, 'صيدلية دكتور احمد سعيد', '0110000002', 'pharmacy@Otlobne.com', '2023-06-15-648b7f81558f0.png', '27.749050528148114', '30.84149937803329', 'ملوي الكويت', NULL, 0.00, NULL, 0, 1, 42, '2023-06-15 20:15:45', '2023-06-15 20:15:49', 0, NULL, '2023-06-15-648b7f815b1a5.png', 1, 1, 1, 0.00, 15, 1, 1, ' ', NULL, 0, 0, 0.00, '5-10 min', 1, 1, 0, 0, 2, 0, 1, 0.000, 0, 'sydly-dktor-ahmd-saayd', NULL),
(41, 'ماركت فرج', '0110000003', 'ecommerce@Otlobne.com', '2023-06-15-648b8008e356b.png', '27.740542702704563', '30.831199695416103', 'ملوي', NULL, 0.00, NULL, 0, 1, 43, '2023-06-15 20:18:00', '2023-06-15 20:18:03', 0, NULL, '2023-06-15-648b8008e6c1f.png', 1, 1, 1, 0.00, 15, 1, 1, ' ', NULL, 0, 0, 0.00, '5-10 min', 1, 1, 0, 0, 3, 0, 1, 0.000, 0, 'markt-frg', NULL),
(42, 'مطعم كرم الشام', '0110000004', 'karam@Otlobne.com', '2023-06-15-648b807d626f2.png', '27.73218719462733', '30.846951428860734', 'ملوي الكويت', NULL, 0.00, NULL, 0, 1, 44, '2023-06-15 20:19:57', '2023-06-15 20:19:59', 0, NULL, '2023-06-15-648b807d658b4.png', 1, 1, 1, 0.00, 15, 1, 1, ' ', NULL, 0, 0, 0.00, '5-10 min', 1, 1, 0, 0, 4, 0, 1, 0.000, 0, 'mtaam-krm-alsham', NULL),
(43, 'Elwakil store', '01000272192', 'eslamelwakil24@gmail.com', '2023-09-27-65144ab31f3df.png', '29.323328156603964', '47.57912334054708', 'elwakil address', NULL, 0.00, NULL, 0, 1, 45, '2023-09-27 15:30:59', '2023-09-30 08:11:44', 0, NULL, '2023-09-27-65144ab31f666.png', 1, 1, 1, 14.00, 15, 1, 1, ' ', NULL, 0, 0, 0.00, '30-90 minute', 1, 1, 0, 2, 4, 0, 0, 0.000, 0, 'elwakil-store', NULL),
(44, 'trademan store', '01226565014', 'trademan@gmail.com', '2023-10-02-651aa61569372.png', '29.33859609350246', '48.024249968261714', 'kuwite', NULL, 0.00, NULL, 0, 1, 46, '2023-10-02 11:14:29', '2023-10-10 09:40:58', 0, NULL, '2023-10-02-651aa6156bfbf.png', 1, 1, 1, 14.00, 15, 1, 1, ' ', NULL, 0, 0, 0.00, '60-120 minute', 1, 1, 0, 0, 1, 0, 1, 0.000, 0, 'trademan-store', NULL),
(45, '1', '11111111111', 'ee@ee.com', '2023-10-02-651aa87df354f.png', '29.33859609350246', '48.024249968261714', 'sdf', NULL, 0.00, NULL, 0, 0, 47, '2023-10-02 11:24:46', '2023-10-02 11:24:46', 0, NULL, '2023-10-02-651aa87e01ca5.png', 1, 1, 1, 22.00, 15, 1, 1, ' ', NULL, 0, 0, 0.00, '2-2 minute', 1, 1, 0, 0, 2, 0, 0, 0.000, 0, '1', NULL),
(46, 'store1', '0100272199', 'M@1.com', '2023-10-02-651ae99c30b1c.png', '29.33859609350246', '48.024249968261714', '1', NULL, 0.00, NULL, 0, 1, 48, '2023-10-02 16:02:36', '2023-10-10 09:39:52', 0, NULL, '2023-10-02-651ae99c3381a.png', 1, 1, 1, 10.00, 15, 1, 1, ' ', NULL, 0, 0, 0.00, '30-60 minute', 1, 1, 0, 0, 1, 0, 0, 0.000, 0, 'store1', NULL),
(47, 'first store', '1226565021', 't1@t1.com', '2023-10-02-651aea4c811de.png', '29.33859609350246', '48.024249968261714', '1', NULL, 0.00, NULL, 0, 1, 49, '2023-10-02 16:05:32', '2023-10-02 17:27:01', 0, NULL, '2023-10-02-651aea4c83a9f.png', 1, 1, 1, 10.00, 15, 1, 1, ' ', NULL, 0, 0, 0.00, '30-60 minute', 1, 1, 0, 0, 1, 0, 1, 0.000, 0, 'first-store', NULL),
(48, 'Elwakil Goo', '01226565040', 'eslam@eslam.com', '2023-10-08-6522357336077.png', '29.311659941488795', '47.48175881803036', 'Vv', NULL, 0.00, NULL, 0, 1, 50, '2023-10-08 04:52:03', '2023-10-10 09:40:51', 0, NULL, '2023-10-08-6522357338e72.png', 1, 1, 1, 10.00, 15, 1, 1, ' ', NULL, 0, 0, 0.00, '30-60 minute', 1, 1, 0, 0, 1, 0, 1, 0.000, 0, 'elwakil-goo', NULL),
(49, 'Alwan Al-Swifey', '0096590001860', 'a.elswife1983@gmail.com', '2024-05-18-6647e67130ccb.png', '29.33631468966452', '48.019647002220154', 'Hawally - Kuwait', NULL, 0.00, NULL, 0, 0, 51, '2024-05-17 23:21:21', '2024-05-17 23:21:21', 0, NULL, '2024-05-18-6647e67130f3d.png', 1, 1, 1, 5.00, 15, 1, 1, ' ', NULL, 0, 0, 0.00, '25-45 minute', 1, 1, 0, 0, 3, 0, 0, 0.000, 0, 'alwan-al-swifey', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `store_schedule`
--

CREATE TABLE `store_schedule` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `day` int(11) NOT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `store_schedule`
--

INSERT INTO `store_schedule` (`id`, `store_id`, `day`, `opening_time`, `closing_time`, `created_at`, `updated_at`) VALUES
(246, 41, 0, '00:00:00', '23:59:59', '2023-06-15 20:18:00', '2023-06-15 20:18:00'),
(247, 41, 1, '00:00:00', '23:59:59', '2023-06-15 20:18:00', '2023-06-15 20:18:00'),
(248, 41, 2, '00:00:00', '23:59:59', '2023-06-15 20:18:00', '2023-06-15 20:18:00'),
(249, 41, 3, '00:00:00', '23:59:59', '2023-06-15 20:18:00', '2023-06-15 20:18:00'),
(250, 41, 4, '00:00:00', '23:59:59', '2023-06-15 20:18:00', '2023-06-15 20:18:00'),
(251, 41, 5, '00:00:00', '23:59:59', '2023-06-15 20:18:00', '2023-06-15 20:18:00'),
(252, 41, 6, '00:00:00', '23:59:59', '2023-06-15 20:18:00', '2023-06-15 20:18:00'),
(253, 39, 1, '00:00:00', '23:59:59', '2023-06-15 22:12:33', '2023-06-15 22:12:33'),
(254, 39, 2, '00:00:00', '23:59:59', '2023-06-15 22:12:35', '2023-06-15 22:12:35'),
(255, 39, 3, '00:00:00', '23:59:59', '2023-06-15 22:12:37', '2023-06-15 22:12:37'),
(256, 39, 4, '00:00:00', '23:59:59', '2023-06-15 22:12:39', '2023-06-15 22:12:39'),
(257, 39, 5, '00:00:00', '23:59:59', '2023-06-15 22:12:41', '2023-06-15 22:12:41'),
(258, 39, 6, '00:00:00', '23:59:59', '2023-06-15 22:12:43', '2023-06-15 22:12:43'),
(259, 39, 0, '00:00:00', '23:59:59', '2023-06-15 22:12:45', '2023-06-15 22:12:45'),
(262, 43, 1, '10:00:00', '11:00:00', NULL, NULL),
(263, 43, 2, '11:00:00', '12:00:00', NULL, NULL),
(264, 43, 3, '12:00:00', '13:00:00', NULL, NULL),
(265, 43, 4, '13:00:00', '14:00:00', NULL, NULL),
(266, 43, 5, '09:00:00', '21:23:00', NULL, NULL),
(267, 43, 6, '11:00:00', '11:24:00', NULL, NULL),
(268, 47, 0, '06:32:00', '18:44:00', NULL, NULL),
(269, 43, 0, '06:00:00', '18:00:00', NULL, NULL),
(270, 49, 0, '00:00:00', '23:59:59', '2024-05-17 23:21:21', '2024-05-17 23:21:21'),
(271, 49, 1, '00:00:00', '23:59:59', '2024-05-17 23:21:21', '2024-05-17 23:21:21'),
(272, 49, 2, '00:00:00', '23:59:59', '2024-05-17 23:21:21', '2024-05-17 23:21:21'),
(273, 49, 3, '00:00:00', '23:59:59', '2024-05-17 23:21:21', '2024-05-17 23:21:21'),
(274, 49, 4, '00:00:00', '23:59:59', '2024-05-17 23:21:21', '2024-05-17 23:21:21'),
(275, 49, 5, '00:00:00', '23:59:59', '2024-05-17 23:21:21', '2024-05-17 23:21:21'),
(276, 49, 6, '00:00:00', '23:59:59', '2024-05-17 23:21:21', '2024-05-17 23:21:21');

-- --------------------------------------------------------

--
-- Table structure for table `store_wallets`
--

CREATE TABLE `store_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT '0.00',
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT '0.00',
  `collected_cash` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `store_wallets`
--

INSERT INTO `store_wallets` (`id`, `vendor_id`, `total_earning`, `total_withdrawn`, `pending_withdraw`, `collected_cash`, `created_at`, `updated_at`) VALUES
(1, 41, 120.00, 0.00, 0.00, 0.00, '2023-06-15 22:05:27', '2023-06-16 00:28:49'),
(2, 45, 0.00, 0.00, 0.00, 0.00, '2023-09-27 19:37:21', '2023-09-27 19:37:21'),
(3, 49, 0.00, 0.00, 0.00, 0.00, '2023-10-02 19:24:04', '2023-10-02 19:24:04');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag`, `created_at`, `updated_at`) VALUES
(1, 'تفاح', '2023-05-03 21:22:28', '2023-05-03 21:22:28'),
(2, 'فاكهة', '2023-05-03 21:22:28', '2023-05-03 21:22:28'),
(3, '  فاكهة', '2023-05-03 21:22:48', '2023-05-03 21:22:48'),
(4, '    فاكهة', '2023-05-03 21:23:27', '2023-05-03 21:23:27'),
(5, '      فاكهة', '2023-05-16 01:24:13', '2023-05-16 01:24:13'),
(6, 'الفواكه', '2023-05-16 01:33:49', '2023-05-16 01:33:49'),
(7, 'apple', '2023-06-15 22:07:30', '2023-06-15 22:07:30'),
(8, 'تفاح بلدي', '2023-06-15 22:07:30', '2023-06-15 22:07:30'),
(9, 'تفاح احمر', '2023-06-15 22:07:30', '2023-06-15 22:07:30'),
(10, '  تفاح بلدي', '2023-06-15 22:08:01', '2023-06-15 22:08:01'),
(11, '  تفاح', '2023-06-15 22:08:01', '2023-06-15 22:08:01'),
(12, '  تفاح احمر', '2023-06-15 22:08:01', '2023-06-15 22:08:01'),
(13, 'Chicken', '2023-09-29 08:13:07', '2023-09-29 08:13:07'),
(14, 'فراخ', '2023-09-29 08:13:07', '2023-09-29 08:13:07'),
(15, 'شاورما', '2023-09-29 08:41:20', '2023-09-29 08:41:20'),
(16, 'shawerma', '2023-09-29 08:41:20', '2023-09-29 08:41:20'),
(17, 'tag', '2023-09-29 08:43:49', '2023-09-29 08:43:49'),
(18, 'sea', '2023-10-01 13:11:03', '2023-10-01 13:11:03'),
(19, 'seafood', '2023-10-01 13:11:03', '2023-10-01 13:11:03'),
(20, 'fish', '2023-10-01 13:11:03', '2023-10-01 13:11:03'),
(21, 'meet', '2023-10-02 16:23:41', '2023-10-02 16:23:41'),
(22, 'لحم', '2023-10-02 16:23:41', '2023-10-02 16:23:41');

-- --------------------------------------------------------

--
-- Table structure for table `track_deliverymen`
--

CREATE TABLE `track_deliverymen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `translationable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `translationable_type`, `translationable_id`, `locale`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Module', 1, 'ar', 'module_name', 'بقالة', NULL, NULL),
(2, 'App\\Models\\Module', 1, 'ar', 'description', '<p>خضراوات و فواكه</p>', NULL, NULL),
(3, 'App\\Models\\Module', 2, 'ar', 'module_name', 'صيدليات', NULL, NULL),
(4, 'App\\Models\\Module', 2, 'ar', 'description', '<p>صيدليات</p>', NULL, NULL),
(5, 'App\\Models\\Module', 3, 'ar', 'module_name', 'متاجر و محلات', NULL, NULL),
(6, 'App\\Models\\Module', 3, 'ar', 'description', '<p>متاجر و محلات</p>\r\n\r\n<div class=\"simple-translate-system-theme\" id=\"simple-translate\">\r\n<div>\r\n<div class=\"simple-translate-button isShow\" style=\"background-image: url(&quot;chrome-extension://ibplnjkanclpjokhdolnendpplpjiace/icons/512.png&quot;); height: 22px; width: 22px; top: 30px; left: 112px;\">&nbsp;</div>\r\n\r\n<div class=\"simple-translate-panel \" style=\"width: 300px; height: 200px; top: 0px; left: 0px; font-size: 13px;\">\r\n<div class=\"simple-translate-result-wrapper\" style=\"overflow: hidden;\">\r\n<div class=\"simple-translate-move\" draggable=\"true\">&nbsp;</div>\r\n\r\n<div class=\"simple-translate-result-contents\">\r\n<p class=\"simple-translate-result\" dir=\"auto\">&nbsp;</p>\r\n\r\n<p class=\"simple-translate-candidate\" dir=\"auto\">&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, NULL),
(7, 'App\\Models\\Module', 4, 'ar', 'module_name', 'مطاعم و مأكولات', NULL, NULL),
(8, 'App\\Models\\Module', 4, 'ar', 'description', '<p>مطاعم و مأكولات</p>\r\n\r\n<div class=\"simple-translate-system-theme\" id=\"simple-translate\">\r\n<div>\r\n<div class=\"simple-translate-button isShow\" style=\"background-image: url(&quot;chrome-extension://ibplnjkanclpjokhdolnendpplpjiace/icons/512.png&quot;); height: 22px; width: 22px; top: 58px; left: 151px;\">&nbsp;</div>\r\n\r\n<div class=\"simple-translate-panel \" style=\"width: 300px; height: 200px; top: 0px; left: 0px; font-size: 13px;\">\r\n<div class=\"simple-translate-result-wrapper\" style=\"overflow: hidden;\">\r\n<div class=\"simple-translate-move\" draggable=\"true\">&nbsp;</div>\r\n\r\n<div class=\"simple-translate-result-contents\">\r\n<p class=\"simple-translate-result\" dir=\"auto\">&nbsp;</p>\r\n\r\n<p class=\"simple-translate-candidate\" dir=\"auto\">&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, NULL),
(9, 'App\\Models\\Module', 5, 'ar', 'module_name', 'توصيل', NULL, NULL),
(10, 'App\\Models\\Module', 5, 'ar', 'description', '<p>شحن و توصيل</p>', NULL, NULL),
(11, 'App\\Models\\Category', 33, 'ar', 'name', 'فكهاني', NULL, NULL),
(12, 'App\\Models\\Item', 55, 'ar', 'name', 'تفاح', NULL, NULL),
(13, 'App\\Models\\Item', 55, 'ar', 'description', 'تفاح', NULL, NULL),
(14, 'App\\Models\\Module', 3, 'fr', 'module_name', 'Ecommerce', NULL, NULL),
(15, 'App\\Models\\Module', 3, 'fr', 'description', '<p>Ecommerce</p>', NULL, NULL),
(16, 'App\\Models\\NotificationMessage', 1, 'ar', 'order_pending_message', 'تم تقديم طلبك بنجاح', NULL, NULL),
(17, 'App\\Models\\NotificationMessage', 2, 'ar', 'order_confirmation_msg', 'تم الموافقة علي طلبك ، شكرا لك', NULL, NULL),
(18, 'App\\Models\\NotificationMessage', 3, 'ar', 'order_processing_message', 'طلبك قيد التحضير يرجي الانتظار قليلا', NULL, NULL),
(19, 'App\\Models\\NotificationMessage', 4, 'ar', 'order_handover_message', 'تم التحرك بالطلب و في الطريق اليك', NULL, NULL),
(20, 'App\\Models\\NotificationMessage', 5, 'ar', 'order_refunded_message', 'تم استرداد أموال الطلب بنجاح', NULL, NULL),
(21, 'App\\Models\\NotificationMessage', 6, 'ar', 'refund_request_canceled', 'تم إلغاء طلب استرداد الأموال بنجاح', NULL, NULL),
(22, 'App\\Models\\NotificationMessage', 7, 'ar', 'out_for_delivery_message', 'طلبك في الطريق اليك .. من فضلك انتظرر قليلا', NULL, NULL),
(23, 'App\\Models\\NotificationMessage', 8, 'ar', 'order_delivered_message', 'تم تسليم طلبك بنجاح ، شكرا لك', NULL, NULL),
(24, 'App\\Models\\NotificationMessage', 9, 'ar', 'delivery_boy_assign_message', 'تم تعين مندوب لتوصيل طلبك في اسرع وقت', NULL, NULL),
(25, 'App\\Models\\NotificationMessage', 10, 'ar', 'delivery_boy_delivered_message', 'تم تسليم طلبك بنجاح ، شكرا لك', NULL, NULL),
(26, 'App\\Models\\NotificationMessage', 11, 'ar', 'order_cancled_message', 'تم إلغاء الطلب بناءً على طلبك', NULL, NULL),
(27, 'App\\Models\\Module', 6, 'ar', 'module_name', 'ملابس نسائية', NULL, NULL),
(28, 'App\\Models\\Module', 6, 'fr', 'module_name', 'Vêtements pour femmes', NULL, NULL),
(29, 'App\\Models\\Module', 7, 'ar', 'module_name', 'الهواتف الذكية', NULL, NULL),
(30, 'App\\Models\\Module', 7, 'fr', 'module_name', 'Téléphones intelligents', NULL, NULL),
(31, 'App\\Models\\Module', 8, 'ar', 'module_name', 'الحلويات', NULL, NULL),
(32, 'App\\Models\\Module', 8, 'fr', 'module_name', 'Sucreries', NULL, NULL),
(33, 'App\\Models\\Module', 9, 'ar', 'module_name', 'اكسسوارات السيارات', NULL, NULL),
(34, 'App\\Models\\Module', 9, 'fr', 'module_name', 'accessoires auto', NULL, NULL),
(35, 'App\\Models\\Module', 10, 'ar', 'module_name', 'المثلاجات', NULL, NULL),
(36, 'App\\Models\\Module', 10, 'fr', 'module_name', 'glace', NULL, NULL),
(37, 'App\\Models\\Category', 41, 'ar', 'name', 'إلكترونيات', NULL, NULL),
(38, 'App\\Models\\Category', 41, 'fr', 'name', 'Électronique', NULL, NULL),
(39, 'App\\Models\\Category', 42, 'ar', 'name', 'الأجهزة المنزلية', NULL, NULL),
(40, 'App\\Models\\Category', 42, 'fr', 'name', 'Appareils ménagers', NULL, NULL),
(41, 'App\\Models\\Category', 40, 'ar', 'name', 'كتب', NULL, NULL),
(42, 'App\\Models\\Category', 40, 'fr', 'name', 'Livres', NULL, NULL),
(43, 'App\\Models\\Category', 43, 'ar', 'name', 'أثاث', NULL, NULL),
(44, 'App\\Models\\Category', 43, 'fr', 'name', 'Furniture', NULL, NULL),
(45, 'App\\Models\\Category', 44, 'ar', 'name', 'ألعاب الأطفال', NULL, NULL),
(46, 'App\\Models\\Category', 44, 'fr', 'name', 'Jouets', NULL, NULL),
(47, 'App\\Models\\Category', 47, 'ar', 'name', 'اللوازم المكتبية', NULL, NULL),
(48, 'App\\Models\\Category', 47, 'fr', 'name', 'Fournitures de bureau', NULL, NULL),
(49, 'App\\Models\\Category', 46, 'ar', 'name', 'مستلزمات الحيوانات الأليفة', NULL, NULL),
(50, 'App\\Models\\Category', 46, 'fr', 'name', 'Fournitures pour animaux', NULL, NULL),
(51, 'App\\Models\\Category', 25, 'ar', 'name', 'الأدوية', NULL, NULL),
(52, 'App\\Models\\Category', 25, 'fr', 'name', 'Médicaments', NULL, NULL),
(53, 'App\\Models\\Category', 26, 'ar', 'name', 'فيتامينات', NULL, NULL),
(54, 'App\\Models\\Category', 26, 'fr', 'name', 'Vitamines', NULL, NULL),
(55, 'App\\Models\\Category', 27, 'ar', 'name', 'المكملات', NULL, NULL),
(56, 'App\\Models\\Category', 27, 'fr', 'name', 'Suppléments', NULL, NULL),
(57, 'App\\Models\\Category', 34, 'ar', 'name', 'رعاية شخصية', NULL, NULL),
(58, 'App\\Models\\Category', 34, 'fr', 'name', 'Soins personnels', NULL, NULL),
(59, 'App\\Models\\Category', 36, 'ar', 'name', 'إسعافات أولية', NULL, NULL),
(60, 'App\\Models\\Category', 36, 'fr', 'name', 'PREMIERS SECOURS', NULL, NULL),
(61, 'App\\Models\\Category', 35, 'ar', 'name', 'عناية الطفل', NULL, NULL),
(62, 'App\\Models\\Category', 35, 'fr', 'name', 'Soins bébé', NULL, NULL),
(63, 'App\\Models\\Category', 37, 'ar', 'name', 'ماكياج', NULL, NULL),
(64, 'App\\Models\\Category', 37, 'fr', 'name', 'Se maquiller', NULL, NULL),
(65, 'App\\Models\\Category', 38, 'ar', 'name', 'العناية بالبشرة', NULL, NULL),
(66, 'App\\Models\\Category', 38, 'fr', 'name', 'Soins de la peau', NULL, NULL),
(67, 'App\\Models\\Category', 39, 'ar', 'name', 'العناية بالشعر', NULL, NULL),
(68, 'App\\Models\\Category', 39, 'fr', 'name', 'Soin des cheveux', NULL, NULL),
(69, 'App\\Models\\Category', 2, 'ar', 'name', 'صيدالية', NULL, NULL),
(70, 'App\\Models\\Category', 2, 'fr', 'name', 'Pharmacie', NULL, NULL),
(71, 'App\\Models\\Module', 11, 'ar', 'module_name', 'الفواكه', NULL, NULL),
(72, 'App\\Models\\Module', 11, 'fr', 'module_name', 'Les fruits', NULL, NULL),
(73, 'App\\Models\\Module', 12, 'ar', 'module_name', 'مواد غذائية بالجملة', NULL, NULL),
(74, 'App\\Models\\Module', 12, 'fr', 'module_name', 'Denrées alimentaires en gros', NULL, NULL),
(75, 'App\\Models\\Item', 55, 'fr', 'name', 'pommes', NULL, NULL),
(76, 'App\\Models\\Item', 55, 'fr', 'description', 'pommes', NULL, NULL),
(77, 'App\\Models\\Item', 56, 'ar', 'name', 'برتقال مستور', NULL, NULL),
(78, 'App\\Models\\Item', 56, 'ar', 'description', 'البرتقال هو ثمرة أنواع الحمضيات Citrus × sinensis في عائلة Rutaceae ، موطنها الصين. ويسمى أيضا البرتقال الحلو', NULL, NULL),
(79, 'App\\Models\\Item', 56, 'fr', 'name', 'Orange Importée (± 50 g)', NULL, NULL),
(80, 'App\\Models\\Item', 56, 'fr', 'description', 'L\'orange est le fruit de l\'espèce d\'agrumes Citrus × sinensis de la famille des Rutacées, originaire de Chine. On l\'appelle aussi orange douce', NULL, NULL),
(81, 'App\\Models\\Item', 85, 'ar', 'name', 'أكياس شاي ليبتون العلامة الصفراء', NULL, NULL),
(82, 'App\\Models\\Item', 85, 'ar', 'description', '.رشفة وعش: احصل على بداية صباحية مثالية مع شاي ليبتون الأسود. مع طعمها الطبيعي الغني ونكهتها الجريئة ، اجعل كل رشفة مفعمة بالحيوية', NULL, NULL),
(83, 'App\\Models\\Item', 85, 'fr', 'name', 'Sachet de thé Lipton Yellow Label', NULL, NULL),
(84, 'App\\Models\\Module', 13, 'ar', 'module_name', 'مواد التجميل', NULL, NULL),
(85, 'App\\Models\\Module', 13, 'fr', 'module_name', 'Produits de beauté', NULL, NULL),
(86, 'App\\Models\\Module', 14, 'ar', 'module_name', 'مستلزمات منزلية', NULL, NULL),
(87, 'App\\Models\\Module', 14, 'ar', 'description', '<p>&nbsp;</p>\r\n\r\n<div class=\"simple-translate-system-theme\" id=\"simple-translate\">\r\n<div>\r\n<div class=\"simple-translate-button isShow\" style=\"background-image: url(&quot;chrome-extension://ibplnjkanclpjokhdolnendpplpjiace/icons/512.png&quot;); height: 22px; width: 22px; top: 36px; left: 129px;\">&nbsp;</div>\r\n\r\n<div class=\"simple-translate-panel \" style=\"width: 300px; height: 200px; top: 0px; left: 0px; font-size: 13px;\">\r\n<div class=\"simple-translate-result-wrapper\" style=\"overflow: hidden;\">\r\n<div class=\"simple-translate-move\" draggable=\"true\">&nbsp;</div>\r\n\r\n<div class=\"simple-translate-result-contents\">\r\n<p class=\"simple-translate-result\" dir=\"auto\">&nbsp;</p>\r\n\r\n<p class=\"simple-translate-candidate\" dir=\"auto\">&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, NULL),
(88, 'App\\Models\\Module', 14, 'fr', 'module_name', 'articles d\'hygiène', NULL, NULL),
(89, 'App\\Models\\Module', 5, 'fr', 'module_name', 'livraison', NULL, NULL),
(90, 'App\\Models\\Module', 5, 'fr', 'description', '<p>livraison</p>', NULL, NULL),
(91, 'App\\Models\\Category', 513, 'ar', 'name', 'للاواني', NULL, NULL),
(92, 'App\\Models\\Category', 513, 'fr', 'name', 'marmites', NULL, NULL),
(93, 'App\\Models\\Category', 514, 'ar', 'name', 'منظف الارضيات', NULL, NULL),
(94, 'App\\Models\\Category', 514, 'fr', 'name', 'Nettoyant pour sols', NULL, NULL),
(95, 'App\\Models\\Category', 515, 'ar', 'name', 'جافيل', NULL, NULL),
(96, 'App\\Models\\Category', 515, 'fr', 'name', 'Javel', NULL, NULL),
(97, 'App\\Models\\Item', 110, 'ar', 'name', 'طاجين مغربي', NULL, NULL),
(98, 'App\\Models\\Item', 110, 'ar', 'description', 'يوجد به بصل لحم او دجاج جزار بطاطس فلفل اخضر وفلفل حار وبعض من الفت والتوابل مطبوخ بالزيت النباتي.', NULL, NULL),
(99, 'App\\Models\\Item', 110, 'fr', 'name', 'طاجين مغربي بمذاق مجبنة  تفوكت', NULL, NULL),
(100, 'App\\Models\\Item', 110, 'fr', 'description', 'يوجد به بصل لحم او دجاج جزار بطاطس فلفل اخضر وفلفل حار وبعض من الفت والتوابل مطبوخ بالزيت النباتي', NULL, NULL),
(101, 'App\\Models\\Category', 3, 'ar', 'name', 'التجارة الإلكترونية', NULL, NULL),
(102, 'App\\Models\\Category', 3, 'fr', 'name', 'commerce électronique', NULL, NULL),
(103, 'App\\Models\\Category', 5, 'ar', 'name', 'ملابس نسائية', NULL, NULL),
(104, 'App\\Models\\Category', 5, 'fr', 'name', 'Vêtements pour femmes', NULL, NULL),
(105, 'App\\Models\\Category', 13, 'ar', 'name', 'فساتين', NULL, NULL),
(106, 'App\\Models\\Category', 13, 'fr', 'name', 'Robes', NULL, NULL),
(107, 'App\\Models\\Category', 14, 'ar', 'name', 'بلايز', NULL, NULL),
(108, 'App\\Models\\Category', 14, 'fr', 'name', 'Hauts', NULL, NULL),
(109, 'App\\Models\\Category', 15, 'ar', 'name', 'السروال', NULL, NULL),
(110, 'App\\Models\\Category', 15, 'fr', 'name', 'Pantalon', NULL, NULL),
(111, 'App\\Models\\Item', 111, 'ar', 'name', 'عصير زعزع عادي', NULL, NULL),
(112, 'App\\Models\\Item', 111, 'ar', 'description', 'افوكا فواكه جافة اوريو فلان بعد من الفواكه كريمة واشياء اخري', NULL, NULL),
(113, 'App\\Models\\Item', 111, 'fr', 'name', 'عصير زعزع عادي', NULL, NULL),
(114, 'App\\Models\\Item', 111, 'fr', 'description', 'افوكا فواكه جافة اوريو فلان بعد من الفواكه كريمة واشياء اخري', NULL, NULL),
(115, 'App\\Models\\Item', 112, 'ar', 'name', 'معجون 1كغ', NULL, NULL),
(116, 'App\\Models\\Item', 112, 'ar', 'description', 'معجون 1كغ', NULL, NULL),
(117, 'App\\Models\\Item', 112, 'fr', 'name', 'معجون 1كغ', NULL, NULL),
(118, 'App\\Models\\Item', 112, 'fr', 'description', 'معجون 1كغ', NULL, NULL),
(119, 'App\\Models\\Module', 15, 'ar', 'module_name', 'صالونات حلاقة رجالي', NULL, NULL),
(120, 'App\\Models\\Module', 15, 'ar', 'description', '<p>صالونات حلاقة رجالي</p>', NULL, NULL),
(121, 'App\\Models\\Module', 16, 'ar', 'module_name', 'صالونات حلاقة', NULL, NULL),
(122, 'App\\Models\\Module', 16, 'ar', 'description', '<p>صالونات حلاقة للسيدات و الرجال&nbsp;</p>\r\n\r\n<div class=\"simple-translate-system-theme\" id=\"simple-translate\">\r\n<div>\r\n<div class=\"simple-translate-button isShow\" style=\"background-image: url(&quot;chrome-extension://ibplnjkanclpjokhdolnendpplpjiace/icons/512.png&quot;); height: 22px; width: 22px; top: 72px; left: 256px;\">&nbsp;</div>\r\n\r\n<div class=\"simple-translate-panel \" style=\"width: 300px; height: 200px; top: 0px; left: 0px; font-size: 13px;\">\r\n<div class=\"simple-translate-result-wrapper\" style=\"overflow: hidden;\">\r\n<div class=\"simple-translate-move\" draggable=\"true\">&nbsp;</div>\r\n\r\n<div class=\"simple-translate-result-contents\">\r\n<p class=\"simple-translate-result\" dir=\"auto\">&nbsp;</p>\r\n\r\n<p class=\"simple-translate-candidate\" dir=\"auto\">&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, NULL),
(123, 'App\\Models\\ParcelCategory', 1, 'ar', 'name', 'مستندات ورقية', NULL, NULL),
(124, 'App\\Models\\ParcelCategory', 1, 'ar', 'description', 'مستندات ورقية', NULL, NULL),
(127, 'App\\Models\\Item', 4, 'ar', 'name', 'فراخ مشوية', NULL, NULL),
(128, 'App\\Models\\Item', 4, 'ar', 'description', 'فرخة جامبو معها ساطة طحينة', NULL, NULL),
(129, 'App\\Models\\AddOn', 1, 'en', 'name', 'Elwakil Addon', NULL, NULL),
(130, 'App\\Models\\AddOn', 1, 'ar', 'name', 'الوكيل اد اون', NULL, NULL),
(133, 'App\\Models\\AddOn', 3, 'en', 'name', '4', NULL, NULL),
(134, 'App\\Models\\AddOn', 3, 'ar', 'name', 'Elwakil', NULL, NULL),
(135, 'App\\Models\\AddOn', 4, 'en', 'name', 'Rashw', NULL, NULL),
(136, 'App\\Models\\AddOn', 4, 'ar', 'name', 'رشوان', NULL, NULL),
(137, 'App\\Models\\Item', 5, 'ar', 'name', 'شاورما', NULL, NULL),
(138, 'App\\Models\\Item', 5, 'ar', 'description', 'تفاصيل الشاورما تفاصيل 2 تفاصيل الشاورما تفاصيل الشاورما تفاصيل الشاورما تفاصيل الشاورما تفاصيل الشاورما تفاصيل الشاورما تفاصيل الشاورما تفاصيل الشاورما تفاصيل الشاورما تفاصيل الشاورما تفاصيل الشاورما تفاصيل الشاورما', NULL, NULL),
(139, 'App\\Models\\Item', 6, 'ar', 'name', 'Grilled fish', NULL, NULL),
(140, 'App\\Models\\Item', 6, 'ar', 'description', 'Grilled fish with salad', NULL, NULL),
(141, 'App\\Models\\Item', 7, 'ar', 'name', 'H', NULL, NULL),
(142, 'App\\Models\\Item', 7, 'ar', 'description', 'G', NULL, NULL),
(143, 'App\\Models\\Item', 8, 'ar', 'name', 'برجر', NULL, NULL),
(144, 'App\\Models\\Item', 8, 'ar', 'description', 'لحم', NULL, NULL),
(145, 'App\\Models\\Item', 9, 'ar', 'name', 'Potato', NULL, NULL),
(146, 'App\\Models\\Item', 9, 'ar', 'description', 'Hh', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit`, `created_at`, `updated_at`) VALUES
(2, 'kg', '2023-05-03 21:22:37', '2023-05-03 21:22:37'),
(3, 'pcs / قطعة', '2023-05-06 13:10:33', '2023-05-06 13:10:33'),
(4, 'Pack', '2023-05-06 13:10:43', '2023-05-06 13:10:43'),
(5, 'Ltr', '2023-05-14 12:15:08', '2023-05-14 12:15:08'),
(7, 'غرم', '2023-05-16 14:36:32', '2023-05-16 14:36:32'),
(8, 'g', '2023-05-16 14:37:10', '2023-05-16 14:37:10'),
(9, 'Ml', '2023-05-16 14:37:27', '2023-05-16 14:37:27'),
(10, 'M', '2023-05-16 14:37:36', '2023-05-16 14:37:36'),
(11, 'Cm', '2023-05-16 14:37:42', '2023-05-16 14:37:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `order_count` int(11) NOT NULL DEFAULT '0',
  `login_medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `wallet_balance` decimal(24,3) NOT NULL DEFAULT '0.000',
  `loyalty_point` decimal(24,3) NOT NULL DEFAULT '0.000',
  `ref_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_language_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `ref_by` bigint(20) UNSIGNED DEFAULT NULL,
  `temp_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `is_phone_verified`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `interest`, `cm_firebase_token`, `status`, `order_count`, `login_medium`, `social_id`, `zone_id`, `wallet_balance`, `loyalty_point`, `ref_code`, `current_language_key`, `ref_by`, `temp_token`) VALUES
(1, 'mohamed', 'hekal', '+201101013284', 'mo@gmail.com', NULL, 0, NULL, '$2y$10$V2eFKoAAMIxPqYtcDE2qPebGjWu44zEbmaxRVlKDH.PRsjxhat5BW', NULL, '2023-05-03 20:42:33', '2023-05-15 04:19:30', NULL, 'dvw-qEd-Rheotn1wpSIjO6:APA91bGQGMoexqBfZe40TAH2cW8WUjj1hHvKwtoHLEEbB6JxXB7RuQMBxyC6BSX0nMGGkxm5kfIN2AQwOE-AjY-4IMBOsHUUBPQlLYAK721RSeL7q9Eb3RY6JR1AdRNhAzHVn4i6I76N', 1, 2, NULL, NULL, 1, 0.000, 15.000, 'LZKN4UF6DM', 'en', NULL, NULL),
(2, 'Saror', 'Salah', '+20667048193', 'sarorsalah@gmail.com', NULL, 0, NULL, '$2y$10$0m4ksGwZqoOhfEOvX7YSneZeEWeYp280PZdCosQ96gCbcDvmHmn3q', NULL, '2023-05-03 22:50:08', '2023-05-03 22:50:33', NULL, 'f1UcWDIFRiaLfCrWXKdVBN:APA91bE6j-7mzQuy7qPV7X-_jY9wYJoy1WeOQHgYFUpPcyjeIxsNTUZJ7Zx-rKH0-8bwlLG8n2YIB1oOErV7Sq8r1TWgm7KkpFhATlWAi3MemFg2IuFKMc9ufbxdQQAs11DNp5zWXwjP', 1, 0, NULL, NULL, 0, 0.000, 0.000, 'KTPQLX2YXK', 'ar', NULL, NULL),
(3, 'mohamed', 'Hekal', '+212667048192', 'mm@mm.com', NULL, 0, NULL, '$2y$10$fW1PyCKvEwrOq2YEpxak3.e1JnT1tkdpHZOBDTVfZS0DwcfaeQ9iW', NULL, '2023-05-08 02:50:13', '2023-05-23 13:44:46', '[33]', 'fOTQnvTVQE2KPMjrGTwoeg:APA91bGEeUPaQ-UAaGI0DUoKr9hKXmL5-7IT1FjGuYTIrDXI1RAiBgU66GZZJcgRsaMUupp-tWoi6w9go1u9_wHSobnLCuFySJKyOeUSnRTur7LWuyajJq87V7h1_nh8fwV6Bm4RT7hO', 1, 1, NULL, NULL, 14, 0.000, 7.000, 'OMS9EHXN84', 'en', NULL, NULL),
(4, 'صلاح', 'سرور', '+212667048193', 'sarorsalah2@gmail.com', '2023-05-17-64640e404a249.png', 0, NULL, '$2y$10$IfRtNobA8m5/I2hEx1Xok.wjbc9HGDdVVojO4i6gl8eyV441P52se', NULL, '2023-05-08 06:41:33', '2023-05-20 12:00:16', '[33]', 'c38USvGMSLKNzp6VT5hw0X:APA91bFZZ4RH3rjeZCl0kgi5TbwZmR9srPl84aYSd0u0elPDrbrHazOwcB7cunS1matOwkUk_lK_7nIsfnWCXXyfrX6ctwMV2ae8Lwm9yGclWgyeDmvDHHr8cWcIK5WSyAhPZ1gjCTIY', 1, 0, NULL, NULL, 14, 0.000, 0.000, 'FYQFU5ILS6', 'ar', NULL, NULL),
(5, 'الحيان', 'تمراة', '+212661442583', 'alhya@gmail.com', NULL, 0, NULL, '$2y$10$90yw.jvfXb6ZGPub5MK9o.fDvk0ZFXnUKr6M31Zd4YkHH/0/7CLtG', NULL, '2023-05-08 09:58:38', '2023-05-08 09:59:18', '[33]', 'e5scr9iMQ_uWBk9Vp8ud8s:APA91bFcxqIkxmSnBRT_J4B95WBAQpVxFsFJyqsUqjy7WZ0p2U15dPGen58SvXrJlojRtlDCZwW0O0GgIWPCQxr5CExeT0VFHC1Rgo4ZlPN3Dn6I9-bz-ljNz0w2oXDOXBnxgekZ5kEi', 1, 0, NULL, NULL, 0, 0.000, 0.000, 'SMXOCRIKPA', 'ar', NULL, NULL),
(6, 'Smail', 'Aboulouafa', '+212677339411', 'abouloufa0@gmail.com', NULL, 0, NULL, '$2y$10$DGfCKKhX8SIBD0Mq6cPGHez/D2F5SAZ2YaI/S8eXN0xYNrtrXEl0G', NULL, '2023-05-17 17:12:23', '2023-05-17 17:14:55', '[6,37,38,39,40,42,43,47]', 'e7kQgIawTqWGzsbR7Kuy71:APA91bGdGEfgE1Y7dtSxCdHVcvjOv_svlEyqgCa0RKdCvU5WBYLR7PVUDqqqtfHq01-Xw9biCQLAKaT4bfabTDkm_n3VW2xJCX45Ow45vTLekgUw-32tHF1tLSPAsCuTEU_jI5EkFSgs', 1, 0, NULL, NULL, 14, 0.000, 0.000, 'QM79RCMXKX', 'ar', NULL, NULL),
(7, 'جلالي', 'رشيد', '+212682893232', 'rachidjallali2@gmail.com', NULL, 0, NULL, '$2y$10$nxzguf9rziTASIMEe4y.cO/71thiU3vsFoaqTPCxQpvPlQ2/w6CnS', NULL, '2023-05-17 17:50:42', '2023-05-17 17:51:10', '[2]', 'eWCODOFhR6msogy-bZcLtu:APA91bElB_iKqwZukWs3Qmc8qzSBLbyUJcfDugelzvyIT-hYgKB7JuRJCNNBB2wyzczfA2hcvT_Tql2Ge_gTBG5tM1kQOBGjdj62nDNhwWtymQDu2ohhQJDcqByF6i8v62JV1wG9bIU_', 1, 0, NULL, NULL, 0, 0.000, 0.000, 'MZC1FQTVVD', 'ar', NULL, NULL),
(8, 'Abdelaoui', 'Mstapha', '+212662332632', 'madtapha@saror.com', NULL, 0, NULL, '$2y$10$H11ZOTcFD9vLSPSUSUoSh.YOefCHCd6Vp/Gs0kZB5ycKrgD6CkQpa', NULL, '2023-05-18 21:03:04', '2023-05-18 21:05:44', '[513,2,514,515,11,12,25,26,27,28,33,34,35,36,37,38,39,40,41,42,43,44,46,47,67,68,69]', 'cw2aP6TGREKlC8gYPOUebK:APA91bHHUYzbf0VTe-lUxSuahzhJ3rI7h2s0XK-LnzBSMI-ewhBBzb8eAB3tsdNec8HOmSBWx7WH9Y2hJ_vFqQPl6hWYMw2LkuvrmMTD6Cw0N4paTorSIUn5C6J4J3KOCNh-D6XctVC6', 1, 0, NULL, NULL, 0, 0.000, 0.000, 'B0FRV4V4ON', 'ar', NULL, NULL),
(9, 'Hamid', 'Okaha', '+212668024172', 'hamid@bhh.com', NULL, 0, NULL, '$2y$10$QRiGyMP3Z/vxvzDImpWUQ.Kz9.Ku6SHsar/JRcpB4QJrSKcY5lt1m', NULL, '2023-05-24 17:17:16', '2023-05-24 17:17:58', '[513,2,514,3,515,5,11,12,13,14,15,25,26,27,34,35,36,37,38,39,40,41,42,43,44]', 'f8VfUQ8HTgS0HyZRLhR9Cm:APA91bGlNVS6DYB_XI1UHrcz0DtSxzD6T5yJ9bF9-t7nD6aTu4EGYOqYWQijaE0OVSG8nnsw8uviR0jcbXFJ7yWioWaSRfBa6OF0IWlhVl3qq15Yi8twweVI64RgxGziklBlOtVNnmBb', 1, 0, NULL, NULL, 0, 0.000, 0.000, 'E6J18IVRDQ', 'ar', NULL, NULL),
(10, 'عمار', 'محسن', '+201004433037', 'Ranadammarammar@gmail.com', NULL, 0, NULL, '$2y$10$6MNrEhf/BWrZwl0ZkGHczeolPJ1znHLtkp1Kpdsv4eucRpZuXhgJ.', NULL, '2023-06-03 17:18:25', '2023-06-03 17:19:40', '[2]', 'fRyLcOTQQxCzxBL_-mg6Vs:APA91bENaJ7j7vVPkLq4E9M5nffoFzXxVeW3sIZhX-oufVSQC9OETMzOvUt_XVtVuEf8U5fVEhDXx5Agkk7IuRK0Yez37OUSjxrVpSdAZfGzSAHGCV9vAXsCSj4GJgZoRYoB1d06m2cu', 1, 0, NULL, NULL, 0, 0.000, 0.000, 'KOQJMKMP3Q', 'ar', NULL, NULL),
(11, 'mohamed', 'Ahmed', '+201093854603', 'mohamed.k.hekal@gmail.com', NULL, 0, NULL, '$2y$10$PEkGIfPoeSaQE8VfZxXuQulKaoOg/T/xxA/76YlG.5L1HeJH0FRla', NULL, '2023-06-03 20:19:22', '2023-06-18 14:39:29', '[513,2,514,515,5,44,46,47]', 'dIdQ0-8LQRqzYSYvtF6qfq:APA91bE8Za8muJdr6bAKMFgm03vdy_7b4oZv6hTU_TpDov01F8vKO7LRzW3ixaIj6ZHt0l--jUO1JgIh0AL7UyVYC-6yduVLPstSbduEWueFEyzYM52zmsJQ_L1CXuoUIlaNLEw_qbiZ', 1, 3, NULL, NULL, 15, 0.000, 16.000, 'BSUWSHDTOY', 'en', NULL, NULL),
(12, 'Kda', 'Udus', '+201115060140', 'hdhd@gmail.com', NULL, 0, NULL, '$2y$10$yw0osPmkRUJPOyWHXNUJGObozvu.Jv7/c7YebxaL.wm22imDKN54a', NULL, '2023-06-04 13:55:57', '2023-06-04 13:57:25', '[513,2,514,515,5,11,12,13,14,15,25,26,27,34,35,36,37,38,39,40,41,42,43,44,46,47]', 'cLzu353gQHuRjNxrFegoQh:APA91bETtOyI4El7pNStYy_deiYCDMaQev7XD5-7QdQHNHNXbGq3Igo2a89Phtir0ZFo0CnjdVU_ahjykZlzdIHBr39YlCm-KhfbNa_0OlcVXE83t1oiZ6QxQzVlhrRe_Vw3oHNj0dwa', 1, 0, NULL, NULL, 0, 0.000, 0.000, 'Q1ZBRZATXV', 'ar', NULL, NULL),
(13, 'عاصم أحمد', 'مؤنس', '+201114921021', 'asemyoussuf@gmail.com', NULL, 0, NULL, '$2y$10$PcP3WEarujtXmNhA8XeKKOxQNQs6z06trxfoH99l9GUAbZnzkEmF2', NULL, '2023-06-19 19:47:22', '2023-06-19 19:48:46', '[3,11,27]', 'ebIm53CbS9CASEFF71TgK5:APA91bGRIc1r69G0K-uPiy-ozkPWiXIL89dEEquHLUaZJhyszi9Na-y5zS_aKRfcZhRaBZrbH7JZhBXVI-KM-2a7LNnFp5I4iJTTOy8-O4vpch-uR7kbr_PaFpkBF2u75asiWgwpYN0p', 1, 0, NULL, NULL, 0, 0.000, 0.000, 'FIIAU4PO08', 'ar', NULL, NULL),
(14, 'جمال', 'مسعد', '+201011032955', 'gamalmossad12@yahoo.com', NULL, 0, NULL, '$2y$10$8bzpT6eA3aZ19iZbszFiwusvWGzPiIVJpTviqigAzsPBdXJEWaide', NULL, '2023-06-20 20:15:49', '2023-06-20 20:18:28', '[2,25,26,27,33,36,42,43]', 'cbm-fZ6ESNKuyXuqm_p0PW:APA91bHMo1O7vR9ofIX9cnsc1ptgD2uhGh2DF9ljmQGnT02bm6o7SX7-3MBwrru0sRvVw2LpJ2VRX5fSydgooKk4KlJt8UiQnjkf45BsQfXrzplpENuO6UUxV29M5i3rU2_XNj6dSL29', 1, 0, NULL, NULL, 0, 0.000, 0.000, 'R6YPTIUGGF', 'ar', NULL, NULL),
(15, 'Hamdy', 'Ahmed', '+96560606060', 'hamdy@ahmed.com', NULL, 0, NULL, '$2y$10$0ZDyOldG.g3o29d4tT2HCOX1mcVRU1Nofuqw9sNlSJMHE1pkN/HTK', NULL, '2023-07-19 22:52:00', '2023-07-20 13:10:42', '[256,1,258,515,4,7]', 'flPkAv8FSDSNVUnkJkoUu0:APA91bEjuyuq3zwj17Ja_c1YQcfROd6sIDP7IE3JsJkgC8hf1QHO6N9p5XDy3IQt-re5cdcU2AO8ASZb3C76FK3M7rdnZmGKCReFqT1YTL-1ITtlmUpAGRVuR6X7c_w4eLN0DFZgNWol', 1, 0, NULL, NULL, 15, 0.000, 0.000, '9ODUBIHKLJ', 'ar', NULL, NULL),
(16, 'Ahmed', 'Elswife', '+96560635090', 'ahmedelswife@gmail.com', NULL, 0, NULL, '$2y$10$uKOsrZeylKgWTYOUAk0mGudLeGxhn7uTTTjDnzOoLVk9VUiJDKX82', NULL, '2023-07-20 13:05:43', '2023-07-20 13:06:07', NULL, 'f12F144kRRq6vRIPrSf1IE:APA91bH73RMC7RAxTVu3Zry3fXG43ooaSnUHIZamBj6jtzbjoW6QvmaGFGbqtzjEQxzW3qq5PTK3EYU5Yxp4ocvkEeZgg483kXy6wutnDrdgKR1Pua1M05Ve0iz4e3ipABZpgVqIdmSn', 1, 0, NULL, NULL, 0, 0.000, 0.000, 'HUOULQX2OI', 'ar', NULL, NULL),
(17, 'Mohamed', 'Hekal', '+96560630000', 'lailaadel2311@gmail.com', NULL, 0, NULL, '$2y$10$pRYkMn2eSm5lgDDRYZj9AuPzHdc2icELzcqbe1llMRCqLRdD5oVA6', NULL, '2023-08-07 01:04:24', '2023-08-07 04:24:56', NULL, 'efW2ovCLTXmdgKElGWF6-J:APA91bGbaR60Iop8UX0ydhw9OQLQnvj0KxjvDMzgAeIWdHMBdrfgxtE8IjqN4ot9vGB9JskmjkVfbmdPCFeT5S1vZFsT4juCeAcClaVGJAKVPmVaQK0GwjLT_iemHQb_2yxHZFJQ8J5m', 1, 0, NULL, NULL, 0, 0.000, 0.000, 'OSCJFCGHU9', 'ar', NULL, NULL),
(18, 'marina', 'Zaki', '+201276543554', 'marinazaki08@gmail.com', NULL, 0, NULL, '$2y$10$vVPS7ww72iVEovN9gAg1VudU07eddXwW07sz6h0nOHbZIk0wPliqi', NULL, '2023-09-11 12:29:01', '2023-09-11 12:29:03', NULL, 'cUM1gCIwReiCrCYuIUv3eJ:APA91bE_AgzvXa8DiqRUMTUeAupG_ItmDPBX1CaTf8THn1hG7LKHxX8gbXLnnsiHTd596BhExOTZKB4VqEqc6K-f8OPHHb_MOOyCy1gPbligrBH5UX67VlD34UVnHKwkPRfhPISzbExw', 1, 0, NULL, NULL, NULL, 0.000, 0.000, 'PB8XSRFYSI', 'ar', NULL, NULL),
(19, 'Eslam', 'Elwakil', '+201000272192', 'eslamelwakil24@gmail.com', '2023-09-27-65144898dc7e6.png', 0, NULL, '$2y$10$/cPb5Zuh5SpvstmAAycNaOfWiUIB49L6BEKeajtDgIYiWrFMzlCam', NULL, '2023-09-27 15:11:26', '2023-09-30 06:32:21', '[14]', '@', 1, 0, NULL, NULL, 0, 0.000, 0.000, 'DKUPW7L8PZ', 'ar', NULL, NULL),
(20, 'EslaM', 'Elwakil', '+201000272195', 'elwakil@elwakil.com', NULL, 0, NULL, '$2y$10$dtn2Ts4hze.pWIL7Cfy1Vut9/6T/mI8qP/MxFHs6QdvxVu4Yw6qSa', NULL, '2023-09-28 13:04:20', '2023-09-28 13:04:20', NULL, 'cETIzW6eS36yM0wkk1yu_P:APA91bH6hhCdDQnwXRQYMlwBYwk1hjPNaOFmcqCP-hvG1eYNMNlNnfHun8zLjw9QF0a2NTwLwfghFaLyTt_RjC9qJedZ7fT2CpyUc0XBOvwXnKqdaUeYc28eZJVMg5wIpxo2ZEK0k57u', 1, 0, NULL, NULL, NULL, 0.000, 0.000, 'FURVWFJ6N1', 'en', NULL, NULL),
(25, 'Eillaf', 'Kateb', '+967778090936', 'eillaf612@gmail.com', NULL, 0, NULL, '$2y$10$Bzwt1kkK.ouG.n2razElA.3gHd4CVt7mqm8OzM2W4E1ocSP15f2Vm', NULL, '2023-09-29 10:11:34', '2023-09-29 10:11:38', NULL, 'elb2d_fqSWa5pf3Le4nVyQ:APA91bFNvic5mm6hpEE0uGwA8UZoq06hJJoH974KY_6sIlEKQZFirJ6yrRJpTneDQ0ij0zgR4Te6T_gouGyKFbi35VmCemwYhWIxHfOLMJEl2MSE9DgFzdYmkmZMerANkH0EIvBwN0iE', 1, 0, NULL, NULL, NULL, 0.000, 0.000, 'QGAKL1IFSF', 'ar', NULL, NULL),
(26, 'customer', 'one', '+201226565011', 'customerone@gmail.com', '2023-10-02-651a86154f8bc.png', 0, NULL, '$2y$10$IWomz.4vGjy.mHUFtSJXaO94kSBMNav/vgo86DM/OC1UY4PPK7J/q', NULL, '2023-10-02 08:50:33', '2023-10-10 13:13:45', NULL, 'e3wfsvg7SmK03_FRsjoZuU:APA91bGLk_FfxKRJ8SbAficGcObOdF4XcxNqWTAulzdj-waN6iB3T64XrDmr-nTIz82gxTh_4j1urLPuLk2Q0aXZchI7jcLElrCvKUmVOqO3bwlfW7j1v9OiTayvPvGh0fSZOguk7aLx', 1, 0, NULL, NULL, 0, 0.000, 0.000, 'NLSPODLJYP', 'ar', NULL, NULL),
(27, 'customer', 'two', '+201226565012', 'customertwo@gmail.com', NULL, 0, NULL, '$2y$10$6OJh76w8/lft.UFCQzyjGOTVXbwZESVa1GkB333QJwQPmGfffvqBK', NULL, '2023-10-02 10:34:25', '2023-10-02 12:20:36', NULL, '@', 1, 0, NULL, NULL, 0, 0.000, 0.000, 'P7XJNVA3C4', 'ar', 26, NULL),
(28, 'C10', 'C10', '+201226565020', 'C10@C10.com', NULL, 0, NULL, '$2y$10$.ivVqgYpyyG7IM9PYq3pQuqZ6HDAV80kGuOfB8C6VxmniIuybvPG2', NULL, '2023-10-02 15:57:05', '2023-10-02 15:57:39', '[4]', '@', 1, 0, NULL, NULL, 0, 0.000, 0.000, '8UB4LYS16I', 'ar', NULL, NULL),
(29, 'عمرو', 'محمد مجدي', '+201069963990', 'ameermagdy077@gmail.com', NULL, 0, NULL, '$2y$10$9M/62gr21It3AXTDV9cV8.g6f9S7WRUrMroS.aAIIQ7FbByBjODG2', NULL, '2023-12-01 21:01:48', '2023-12-01 21:01:51', NULL, 'dJzFRwLOT5-8HiN0-kaGp1:APA91bGbirtmqzVA2tcbJon9p1H7mros_--SggDmVL9ke8RXr4RxJgxV5OTHHdOiGkXs-tq4movS8dpOYxJY9E5P-dkViYGoEBo4JgGV1ZKsD3CM7g6zeLTWwfm1RVc6Ct-K70EfDqOQ', 1, 0, NULL, NULL, NULL, 0.000, 0.000, 'GP2SFW3C0W', 'ar', NULL, NULL),
(30, 'عمار', 'السيد', '+9647512074690', 'ammaralsayed434@gmail.com', NULL, 0, NULL, '$2y$10$3NDtNZhXfMSS2FOLo90NFe4MaS/A8r1cy9iYITI3YueXOok4P//Zu', NULL, '2023-12-12 11:15:37', '2023-12-12 11:15:40', NULL, 'cE5dAJylRJ6JfZQ9ymrLaW:APA91bFFhoWa4NTx2iwLelvkvCNMo0KMev-AF8Uv118j8izIhYcbDd-7jCbRCt9HrX1A-qt_scqECp-SGLP1kfEcTvq-yL1Vs0cHVP-RxJB7B_uI_OvVUZWFCcmXpKIg2UnPzWnwIj3_', 1, 0, NULL, NULL, NULL, 0.000, 0.000, 'DUYPEXDG2X', 'ar', NULL, NULL),
(31, 'عاصم', 'الدبعي', '+967770536980', 'asem73739@gmail.com', NULL, 0, NULL, '$2y$10$CG.u5wEAbLgMXPpTaHErl.R.vm2qATTVfmvGMTj/.wWNlyi1BPo.a', NULL, '2023-12-12 18:41:47', '2023-12-12 18:41:50', NULL, 'e1frfGoSQoKL25yewpuIpW:APA91bGumWex9VPfKIqsq9haE_XPj8A_IHkZHn8rHN5WrE2HtbBLlFwg1BZeo_nt1QCcipF8TIJs1zWFpHLRZjLIQ_yoikw7UbMwoBPP-PZTaevy9YEic5uSHdYtoOcFAf5BX4v5fR6d', 1, 0, NULL, NULL, NULL, 0.000, 0.000, 'MQWKOY5HFL', 'ar', NULL, NULL),
(32, 'Ahmed', 'Ahmed', '+218926686593', 'nusserahmed@gmail.com', NULL, 0, NULL, '$2y$10$peM52BYajHNCjSL/pn2RdOyqCKyagd99ymol8GoN2u348l4vRX72y', NULL, '2024-03-09 23:54:24', '2024-03-09 23:54:24', NULL, 'epkHb-6NTNODdHTXAJbHEb:APA91bFD036na7fYJ6Eb-Dh78GTr9xjfKoefMSVkLUw8nONCaMSUy15XD_CUQNsEWcOl7_8tb9oc_7N0HUmeZgPBeqcHMYwRVQd0C935jmfa-WXP89JEnO2DdxVYbzZ7hmMrEBV3-aDv', 1, 0, NULL, NULL, NULL, 0.000, 0.000, 'QCOCIEKHHO', 'en', NULL, NULL),
(33, 'Fatma', 'Ali', '+967774063741', 'fatma.alshasani@yahoo.com', NULL, 0, NULL, '$2y$10$RmQO/IccM2jvnHehzrByne3EdpA63pNKKOApNHxYFF4sXt7mrhGiK', NULL, '2024-05-03 10:43:46', '2024-05-03 10:43:49', NULL, 'fRvRmeYhQz6QnZN-q7K2pR:APA91bEhtwHc2lezeIlO5AaHV2r-lmjgUtvrEyQn9jUgL5DFJmYea30QeiskgsukLSob1kWnQSceiQtb_d2F5M2wtdCTo4DvBkdVIw0bTYxFTrkix52QmtjFqRuOmj5N74Xnrc6Y-Saf', 1, 0, NULL, NULL, NULL, 0.000, 0.000, 'N8FXBJCKQ8', 'ar', NULL, NULL),
(34, 'Subhia', 'Elgdier', '+218912205602', 'sasa67306@gmail.com', NULL, 0, NULL, '$2y$10$6P2pxF8glxivKFu/3vQWPuZkDKLQ7H292L1W2QZwGB9wtrBKjlqoi', NULL, '2024-05-03 16:44:02', '2024-05-03 16:44:02', NULL, 'eRwmRIpbT_CAx4Pyw7OdBM:APA91bFu-bQDflzceC-gcUFEgkKoEjrCmw5NBI16n9BUhc4R18J05-p-fA4z_5xmGqvxXqtIEIIbFpbzYWwLbiheAZmjUFIIWK4DldFokgwMAl-u2g-iI2bLeb3CehPeksuD-KADSIQM', 1, 0, NULL, NULL, NULL, 0.000, 0.000, 'LWCBLSWOGJ', 'en', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_infos`
--

CREATE TABLE `user_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deliveryman_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_infos`
--

INSERT INTO `user_infos` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `admin_id`, `user_id`, `vendor_id`, `deliveryman_id`, `created_at`, `updated_at`) VALUES
(1, 'mohamed', 'hekal', '+201101013284', 'mo@gmail.com', NULL, NULL, 1, NULL, NULL, '2023-05-03 21:26:26', '2023-05-03 21:26:26'),
(2, 'خضراوات', '', '0110155879', 'grocery@store.com', '2023-05-04-6452ddb71aa75.png', NULL, NULL, 16, NULL, '2023-05-03 21:26:26', '2023-05-03 21:26:26'),
(3, 'Saror', 'Salah', '+20667048193', 'sarorsalah@gmail.com', NULL, NULL, 2, NULL, NULL, '2023-05-05 18:22:11', '2023-05-05 18:22:11'),
(4, 'سرور', 'صلاح', '+212667048000', 'sarorsalah2@gmail.com', '2023-05-03-6452d2847530c.png', NULL, NULL, NULL, 1, '2023-05-08 03:58:36', '2023-05-08 23:03:32'),
(5, 'mohamed', 'Hekal', '+212667048192', 'mm@mm.com', NULL, NULL, 3, NULL, NULL, '2023-05-13 03:56:56', '2023-05-13 03:56:56'),
(6, 'صلاح', 'سرور', '+212667048193', 'sarorsalah2@gmail.com', '2023-05-17-64640e404a249.png', NULL, 4, NULL, NULL, '2023-05-16 23:14:31', '2023-05-16 23:14:31'),
(7, 'Zakia cosmétiques', '', '0679739166', 'zakia@gmail.com', '2023-05-18-646639ab138a4.png', NULL, NULL, 37, NULL, '2023-05-19 13:40:27', '2023-05-19 13:40:27'),
(8, 'Hekal', 'Mohamed', '+212667099999', 'delivery@gmail.com', '2023-05-25-646f4aad97b75.png', NULL, NULL, NULL, 2, '2023-05-31 15:13:16', '2023-05-31 15:13:16'),
(9, 'ahmed', 'Hashim', '+201101013281', 'deliveryAhmed@gmail.com', '2023-06-03-647baa479c86c.png', NULL, NULL, NULL, 3, '2023-06-03 20:02:52', '2023-06-03 20:02:52'),
(10, 'mohamed', 'Ahmed', '+201093854603', 'mohamed.k.hekal@gmail.com', NULL, NULL, 11, NULL, NULL, '2023-06-15 15:52:44', '2023-06-15 15:52:44'),
(11, 'عمار', 'محسن', '+201004433037', 'Ranadammarammar@gmail.com', NULL, NULL, 10, NULL, NULL, '2023-06-15 17:05:06', '2023-06-15 17:05:06'),
(12, 'عاصم أحمد', 'مؤنس', '+201114921021', 'asemyoussuf@gmail.com', NULL, NULL, 13, NULL, NULL, '2023-06-19 19:50:51', '2023-06-19 19:50:51'),
(13, 'Hamdy', 'Ahmed', '+96560606060', 'hamdy@ahmed.com', NULL, NULL, 15, NULL, NULL, '2023-07-19 23:12:28', '2023-07-19 23:12:28'),
(14, 'Mohamed', 'Hekal', '+96560630000', 'lailaadel2311@gmail.com', NULL, NULL, 17, NULL, NULL, '2023-08-07 01:24:19', '2023-08-07 01:24:19'),
(15, 'Carefour', '', '96560635091', 'grocery@Otlobne.com', '2023-06-15-648b7f036f4df.png', NULL, NULL, 41, NULL, '2023-08-13 04:42:19', '2023-08-13 04:42:19'),
(16, 'eslam', 'elwakil', '+201000272192', 'eslamelwakil24@gmail.com', NULL, NULL, 19, NULL, NULL, '2023-09-27 15:13:08', '2023-09-27 15:13:08'),
(19, 'Elwakil store', '', '01000272192', 'eslamelwakil24@gmail.com', '2023-09-27-65144ab31f3df.png', NULL, NULL, 45, NULL, '2023-09-30 08:00:36', '2023-09-30 08:00:36'),
(21, 'customer', 'one', '+201226565011', 'customerone@gmail.com', '2023-10-02-651a86154f8bc.png', NULL, 26, NULL, NULL, '2023-10-02 10:30:30', '2023-10-02 10:30:30'),
(22, 'customer', 'two', '+201226565012', 'customertwo@gmail.com', NULL, NULL, 27, NULL, NULL, '2023-10-02 12:27:08', '2023-10-02 12:27:08'),
(23, 'first store', '', '1226565021', 't1@t1.com', '2023-10-02-651aea4c811de.png', NULL, NULL, 49, NULL, '2023-10-03 12:43:52', '2023-10-03 12:43:52'),
(24, 's2', 's2', '+201226565031', 's2@s2.com', '2023-10-02-651aeae350882.png', NULL, NULL, NULL, 6, '2023-10-06 07:33:20', '2023-10-08 04:58:58');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `data`, `status`, `user_id`, `vendor_id`, `delivery_man_id`, `created_at`, `updated_at`) VALUES
(1, '{\"title\":\"\\u0637\\u0644\\u0628\",\"description\":\"\\u062a\\u0645 \\u062a\\u0642\\u062f\\u064a\\u0645 \\u0637\\u0644\\u0628 \\u062c\\u062f\\u064a\\u062f\",\"order_id\":100001,\"module_id\":1,\"order_type\":\"delivery\",\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 41, NULL, '2023-06-15 22:15:10', '2023-06-15 22:15:10'),
(2, '{\"title\":\"Order\",\"description\":\"You are assigned to a order\",\"order_id\":100001,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 3, '2023-06-15 22:28:58', '2023-06-15 22:28:58'),
(3, '{\"title\":\"Order\",\"description\":false,\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 41, NULL, '2023-06-16 00:28:31', '2023-06-16 00:28:31'),
(4, '{\"title\":\"Order\",\"description\":false,\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 41, NULL, '2023-06-16 00:31:50', '2023-06-16 00:31:50'),
(5, '{\"title\":\"\\u0637\\u0644\\u0628\",\"description\":\"\\u062a\\u0645 \\u062a\\u0642\\u062f\\u064a\\u0645 \\u0637\\u0644\\u0628 \\u062c\\u062f\\u064a\\u062f\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 45, NULL, '2023-09-30 08:00:05', '2023-09-30 08:00:05');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `f_name`, `l_name`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `holder_name`, `account_no`, `image`, `status`, `firebase_token`, `auth_token`) VALUES
(41, 'Ahmed', 'Fahmy', '96560635091', 'grocery@Otlobne.com', NULL, '$2y$10$EKtmbRUY2WU.wx7R7g3D9eLYG72a1SH7H4U5Fvanb2dsDZrZ3.CbC', NULL, '2023-06-15 20:13:39', '2024-03-14 00:57:13', NULL, NULL, NULL, NULL, NULL, 1, 'f0swqsFeTZSTQ9ZxNK4m2l:APA91bFOyUxv9vYTIHlB0OBoSGsA0uav7VYGVNqkB5ZLiZWq84eLahfoNhDbfXcd8iKN8nXcmIyO5ZRX7ABlY0dTebTUoXQo4BgiUgGnUR-a7YOPkEfa5YUomhM1H-NxdJBvtEdm5fCW', 'xoY3vqkwIiavwoze2C3uGVa0B6mNK59JVeQOIqzKLBFM3ZcE5Wgc6HqwctclQ5ki3K08cJrvtX5HqLSzqiew60OX0IeEXB1Wk8PB09sf3oEXwyUuYxEAGYml'),
(42, 'Ahmed', 'Saeed', '0110000002', 'pharmacy@Otlobne.com', NULL, '$2y$10$CY.UtbrwxJTyXc5djlyTo.ilgHcOiQ9jK0Ou.DlXhHrddeqOvefYy', NULL, '2023-06-15 20:15:45', '2023-06-15 20:15:45', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(43, 'Farrag', 'Ahmed', '0110000003', 'ecommerce@Otlobne.com', NULL, '$2y$10$HAvIe.S1FN3J9ju62Pro1uxyF8A5TJcsWBVK2KeWhX95sG9zkx72C', NULL, '2023-06-15 20:18:00', '2023-06-15 20:18:00', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(44, 'كرم', 'الشام', '0110000004', 'karam@Otlobne.com', NULL, '$2y$10$pBV3aWeh1Nq025wZUCK9uuEh9AjXnV4OZZW8rv6lLoMa4B1Fofluy', NULL, '2023-06-15 20:19:57', '2023-06-15 20:19:57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(45, 'اسلام', 'الوكيل', '01000272192', 'eslamelwakil24@gmail.com', NULL, '$2y$10$QoO3JJK/YrDE1VoV8SeZ5eqez0BmTRrjjiDYR1AXsLrHgE/0fk90.', NULL, '2023-09-27 15:30:59', '2023-10-08 04:48:59', 'CIB', 'Alex', 'Elwakil', '83766738377', NULL, 1, '@', 'kdszK3mz7rQmHE0VUdSK25rM0TpHRWEFLcG6KFTKiiMcYC5s8drvMWAAEb4SyxsQNQydp0mQiaKWcRYkScEFNccoDCklfZLHfB6fAJCIzZQSrHJdgwaLwXPC'),
(46, 'eslam', 'elwakil', '01226565014', 'trademan@gmail.com', NULL, '$2y$10$Jxekl6iYL5JnBwqmSUf8me7KFlKq1MnuTPjh/Yw/sBpyi6uqJhKbu', NULL, '2023-10-02 11:14:29', '2023-10-10 09:40:03', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(47, '2', '2', '11111111111', 'ee@ee.com', NULL, '$2y$10$m2bdFKS023lVqvJI4kQuoeneVIbCelr/iFM2XZTuoZL5.lDbHSksq', NULL, '2023-10-02 11:24:45', '2023-10-02 11:24:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'المالك', '1', '0100272199', 'M@1.com', NULL, '$2y$10$2mMSJFHPHd4KTZTDF6yXveH/gG7Rm9k/MkZs8/tA4Ue7upvKUkZiC', NULL, '2023-10-02 16:02:36', '2023-10-10 09:39:52', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(49, 't1', 't1', '1226565021', 't1@t1.com', NULL, '$2y$10$SyWI7p/CF/UFrttWclXS2Orwh6JqwQ5mCratyAO938iX/9aQnhD1a', NULL, '2023-10-02 16:05:32', '2023-10-08 04:42:05', 'CIB', 'alex', 'elwakil', '32514141', NULL, 1, 'fdOPPx1DRvKiJ6CUZSs3po:APA91bECjHvDsMaB5X3OFd3GBDd8vgbSoivSuUhTKqh7wc6LDvU0OfZwiuHyedwo2adr2Eu4aT0nmUVYGHtQDCOuQT0P-lMlsbaaWjhB5DwO8o0cExkLeZeryMhMRW4uDOnxNa9b8IFP', 'CmplAkLYzTl7AQRaQN2rcV8Y0c1zkx3Vrb406njeMxsJ5aV0JVMvtWokVlzecO5sdlxiD6xJeyimyeLTFr7Vlxkh5HNBCMCFu71tcPa0gKrEaPDWgIJgwiOd'),
(50, 'Esl', 'Am', '01226565040', 'eslam@eslam.com', NULL, '$2y$10$Fud4HCy87pyGJc4OdMB2cOcrxxlL16kZzbZtkupgKPYESXBfd1//S', NULL, '2023-10-08 04:52:03', '2023-10-08 04:53:41', NULL, NULL, NULL, NULL, NULL, 1, 'eVfGrw1jSFW-xf81bgmDFg:APA91bGVWbG4HMfBQOb6UA5Y6i4K-9ywQtZ3X_lF-zOyQYD6YpGh-vyB_7Nw7eSfR74GzHx5r92qhCPk-twQoKPDI9fgPJY2SlQTQUe45Q5oKHAzvpELXpduFS4GcVvZ4OKwt7yN2ZFk', 'slHSSFsPvoXWh3xVH9MiUGskfNSlfURWSA4fkkI40HcerivRuUy8legYVHXm4IGppeH4gsFQ51MUb42ZvgQfE1xY91vtU00X00I3qupsZzfFua44mWotBaH9'),
(51, 'احمد', 'احمد', '0096590001860', 'a.elswife1983@gmail.com', NULL, '$2y$10$n2.OTNcXs2eiUijkrXrtU.Dlc/D9290uom.6jPXvHiKwhPviU32zm', NULL, '2024-05-17 23:21:21', '2024-05-17 23:21:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_employees`
--

CREATE TABLE `vendor_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_role_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_logged_in` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_employees`
--

INSERT INTO `vendor_employees` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `employee_role_id`, `vendor_id`, `store_id`, `password`, `status`, `remember_token`, `firebase_token`, `auth_token`, `created_at`, `updated_at`, `is_logged_in`) VALUES
(1, 'ahmed', 'saker', '96560635777', 'ahmedsaker007@gmail.com', '2023-08-19-64e0841919333.png', 1, 41, 39, '$2y$10$MK7hNEKTeqLBH/XQnC3aduAdimYVnI/Ze6bB2kI39RsTApr89/3F2', 1, NULL, NULL, 'EoV4ureW4SqcBlvE7IvrM4DeAp2kTJGGIsYNUZetrb1K9qH7fZ6pQ0WYYSsyNxsuwdalRANiF3ugEU48TmHAbbNnt6onjY8B4wgN31BSt9RNkduWc0zERvW9', '2023-08-19 08:58:01', '2023-08-19 09:30:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `debit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT '0.000',
  `balance` decimal(24,3) NOT NULL DEFAULT '0.000',
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `item_id`, `created_at`, `updated_at`, `store_id`) VALUES
(4, 19, NULL, '2023-09-27 15:37:41', '2023-09-27 15:37:41', 39),
(8, 23, NULL, '2023-09-28 14:46:59', '2023-09-28 14:46:59', 41),
(9, 23, NULL, '2023-09-28 14:47:02', '2023-09-28 14:47:02', 40),
(10, 23, NULL, '2023-09-28 14:47:34', '2023-09-28 14:47:34', 43),
(12, 23, NULL, '2023-09-28 14:48:43', '2023-09-28 14:48:43', 39),
(14, 19, NULL, '2023-09-30 06:35:34', '2023-09-30 06:35:34', 43),
(15, 19, 5, '2023-09-30 06:35:48', '2023-09-30 06:35:48', NULL),
(17, 24, 6, '2023-10-01 13:22:49', '2023-10-01 13:22:49', NULL),
(18, 27, NULL, '2023-10-02 12:41:35', '2023-10-02 12:41:35', 43),
(19, 27, 7, '2023-10-02 12:54:44', '2023-10-02 12:54:44', NULL),
(20, 28, NULL, '2023-10-02 17:18:57', '2023-10-02 17:18:57', 47),
(21, 28, 8, '2023-10-02 17:19:29', '2023-10-02 17:19:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(23,3) NOT NULL DEFAULT '0.000',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` polygon NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryman_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cash_on_delivery` tinyint(1) NOT NULL DEFAULT '0',
  `digital_payment` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `name`, `coordinates`, `status`, `created_at`, `updated_at`, `store_wise_topic`, `customer_wise_topic`, `deliveryman_wise_topic`, `cash_on_delivery`, `digital_payment`) VALUES
(15, 'الكويت', 0x00000000010300000001000000080000006c56c34840694840bb556a7433e53d406c56c348a0dc4740efcf772b655c3e406c56c348307a4740b97db149c91a3e406c56c348302047409ed94c0797323d406c56c348881347402dc47f37aad23c406c56c34810b84740c3680328a7593c406c56c34840964840e7c2bc7cfa363c406c56c34840694840bb556a7433e53d40, 1, '2023-06-03 15:43:59', '2023-07-20 23:37:53', 'zone_15_store', 'zone_15_customer', 'zone_15_delivery_man', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_ons`
--
ALTER TABLE `add_ons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_module_id_foreign` (`module_id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaigns_module_id_foreign` (`module_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_module_id_foreign` (`module_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_module_id_foreign` (`module_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_m_vehicles`
--
ALTER TABLE `d_m_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_roles`
--
ALTER TABLE `employee_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_module_id_foreign` (`module_id`);

--
-- Indexes for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_campaigns_module_id_foreign` (`module_id`);

--
-- Indexes for table `item_tag`
--
ALTER TABLE `item_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_types`
--
ALTER TABLE `module_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_zone`
--
ALTER TABLE `module_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletters_email_unique` (`email`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_messages`
--
ALTER TABLE `notification_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone_id` (`zone_id`),
  ADD KEY `orders_module_id_foreign` (`module_id`);

--
-- Indexes for table `order_cancel_reasons`
--
ALTER TABLE `order_cancel_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_transactions_zone_id_index` (`zone_id`),
  ADD KEY `order_transactions_module_id_foreign` (`module_id`);

--
-- Indexes for table `parcel_categories`
--
ALTER TABLE `parcel_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parcel_categories_name_unique` (`name`),
  ADD KEY `parcel_categories_module_id_foreign` (`module_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_verifications_phone_unique` (`phone`);

--
-- Indexes for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_reasons`
--
ALTER TABLE `refund_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_module_id_foreign` (`module_id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restaurants_phone_unique` (`phone`),
  ADD KEY `stores_module_id_foreign` (`module_id`);

--
-- Indexes for table `store_schedule`
--
ALTER TABLE `store_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_wallets`
--
ALTER TABLE `store_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_ref_code_unique` (`ref_code`),
  ADD KEY `users_zone_id_index` (`zone_id`);

--
-- Indexes for table `user_infos`
--
ALTER TABLE `user_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_phone_unique` (`phone`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`);

--
-- Indexes for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendor_employees_email_unique` (`email`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `add_ons`
--
ALTER TABLE `add_ons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=516;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2762;

--
-- AUTO_INCREMENT for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `d_m_vehicles`
--
ALTER TABLE `d_m_vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_roles`
--
ALTER TABLE `employee_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_tag`
--
ALTER TABLE `item_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `module_types`
--
ALTER TABLE `module_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module_zone`
--
ALTER TABLE `module_zone`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_messages`
--
ALTER TABLE `notification_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100005;

--
-- AUTO_INCREMENT for table `order_cancel_reasons`
--
ALTER TABLE `order_cancel_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `parcel_categories`
--
ALTER TABLE `parcel_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_reasons`
--
ALTER TABLE `refund_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `store_schedule`
--
ALTER TABLE `store_schedule`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT for table `store_wallets`
--
ALTER TABLE `store_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user_infos`
--
ALTER TABLE `user_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD CONSTRAINT `campaigns_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  ADD CONSTRAINT `item_campaigns_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD CONSTRAINT `order_transactions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `parcel_categories`
--
ALTER TABLE `parcel_categories`
  ADD CONSTRAINT `parcel_categories_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
