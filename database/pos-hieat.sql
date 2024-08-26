/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100432
 Source Host           : localhost:3306
 Source Schema         : pos

 Target Server Type    : MySQL
 Target Server Version : 100432
 File Encoding         : 65001

 Date: 23/08/2024 13:54:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adjustment_items
-- ----------------------------
DROP TABLE IF EXISTS `adjustment_items`;
CREATE TABLE `adjustment_items`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `adjustment_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` double NULL DEFAULT NULL,
  `method_type` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `adjustment_items_adjustment_id_foreign`(`adjustment_id`) USING BTREE,
  INDEX `adjustment_items_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `adjustment_items_adjustment_id_foreign` FOREIGN KEY (`adjustment_id`) REFERENCES `adjustments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `adjustment_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adjustment_items
-- ----------------------------

-- ----------------------------
-- Table structure for adjustments
-- ----------------------------
DROP TABLE IF EXISTS `adjustments`;
CREATE TABLE `adjustments`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `reference_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `total_products` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `adjustments_warehouse_id_foreign`(`warehouse_id`) USING BTREE,
  CONSTRAINT `adjustments_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adjustments
-- ----------------------------

-- ----------------------------
-- Table structure for base_units
-- ----------------------------
DROP TABLE IF EXISTS `base_units`;
CREATE TABLE `base_units`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `base_units_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_units
-- ----------------------------
INSERT INTO `base_units` VALUES (1, 'piece', 1, '2024-03-27 15:30:30', '2024-03-27 15:30:31');
INSERT INTO `base_units` VALUES (2, 'meter', 1, '2024-03-27 15:30:31', '2024-03-27 15:30:31');
INSERT INTO `base_units` VALUES (3, 'kilogram', 1, '2024-03-27 15:30:31', '2024-03-27 15:30:31');

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `brands_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brands
-- ----------------------------

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(170) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_code` varchar(170) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone_code` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `countries_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `countries_short_code_unique`(`short_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 247 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES (1, 'Afghanistan', 'AF', 93, NULL, NULL);
INSERT INTO `countries` VALUES (2, 'Albania', 'AL', 355, NULL, NULL);
INSERT INTO `countries` VALUES (3, 'Algeria', 'DZ', 213, NULL, NULL);
INSERT INTO `countries` VALUES (4, 'American Samoa', 'AS', 1684, NULL, NULL);
INSERT INTO `countries` VALUES (5, 'Andorra', 'AD', 376, NULL, NULL);
INSERT INTO `countries` VALUES (6, 'Angola', 'AO', 244, NULL, NULL);
INSERT INTO `countries` VALUES (7, 'Anguilla', 'AI', 1264, NULL, NULL);
INSERT INTO `countries` VALUES (8, 'Antarctica', 'AQ', 0, NULL, NULL);
INSERT INTO `countries` VALUES (9, 'Antigua And Barbuda', 'AG', 1268, NULL, NULL);
INSERT INTO `countries` VALUES (10, 'Argentina', 'AR', 54, NULL, NULL);
INSERT INTO `countries` VALUES (11, 'Armenia', 'AM', 374, NULL, NULL);
INSERT INTO `countries` VALUES (12, 'Aruba', 'AW', 297, NULL, NULL);
INSERT INTO `countries` VALUES (13, 'Australia', 'AU', 61, NULL, NULL);
INSERT INTO `countries` VALUES (14, 'Austria', 'AT', 43, NULL, NULL);
INSERT INTO `countries` VALUES (15, 'Azerbaijan', 'AZ', 994, NULL, NULL);
INSERT INTO `countries` VALUES (16, 'Bahamas The', 'BS', 1242, NULL, NULL);
INSERT INTO `countries` VALUES (17, 'Bahrain', 'BH', 973, NULL, NULL);
INSERT INTO `countries` VALUES (18, 'Bangladesh', 'BD', 880, NULL, NULL);
INSERT INTO `countries` VALUES (19, 'Barbados', 'BB', 1246, NULL, NULL);
INSERT INTO `countries` VALUES (20, 'Belarus', 'BY', 375, NULL, NULL);
INSERT INTO `countries` VALUES (21, 'Belgium', 'BE', 32, NULL, NULL);
INSERT INTO `countries` VALUES (22, 'Belize', 'BZ', 501, NULL, NULL);
INSERT INTO `countries` VALUES (23, 'Benin', 'BJ', 229, NULL, NULL);
INSERT INTO `countries` VALUES (24, 'Bermuda', 'BM', 1441, NULL, NULL);
INSERT INTO `countries` VALUES (25, 'Bhutan', 'BT', 975, NULL, NULL);
INSERT INTO `countries` VALUES (26, 'Bolivia', 'BO', 591, NULL, NULL);
INSERT INTO `countries` VALUES (27, 'Bosnia and Herzegovina', 'BA', 387, NULL, NULL);
INSERT INTO `countries` VALUES (28, 'Botswana', 'BW', 267, NULL, NULL);
INSERT INTO `countries` VALUES (29, 'Bouvet Island', 'BV', 0, NULL, NULL);
INSERT INTO `countries` VALUES (30, 'Brazil', 'BR', 55, NULL, NULL);
INSERT INTO `countries` VALUES (31, 'British Indian Ocean Territory', 'IO', 246, NULL, NULL);
INSERT INTO `countries` VALUES (32, 'Brunei', 'BN', 673, NULL, NULL);
INSERT INTO `countries` VALUES (33, 'Bulgaria', 'BG', 359, NULL, NULL);
INSERT INTO `countries` VALUES (34, 'Burkina Faso', 'BF', 226, NULL, NULL);
INSERT INTO `countries` VALUES (35, 'Burundi', 'BI', 257, NULL, NULL);
INSERT INTO `countries` VALUES (36, 'Cambodia', 'KH', 855, NULL, NULL);
INSERT INTO `countries` VALUES (37, 'Cameroon', 'CM', 237, NULL, NULL);
INSERT INTO `countries` VALUES (38, 'Canada', 'CA', 1, NULL, NULL);
INSERT INTO `countries` VALUES (39, 'Cape Verde', 'CV', 238, NULL, NULL);
INSERT INTO `countries` VALUES (40, 'Cayman Islands', 'KY', 1345, NULL, NULL);
INSERT INTO `countries` VALUES (41, 'Central African Republic', 'CF', 236, NULL, NULL);
INSERT INTO `countries` VALUES (42, 'Chad', 'TD', 235, NULL, NULL);
INSERT INTO `countries` VALUES (43, 'Chile', 'CL', 56, NULL, NULL);
INSERT INTO `countries` VALUES (44, 'China', 'CN', 86, NULL, NULL);
INSERT INTO `countries` VALUES (45, 'Christmas Island', 'CX', 61, NULL, NULL);
INSERT INTO `countries` VALUES (46, 'Cocos (Keeling) Islands', 'CC', 672, NULL, NULL);
INSERT INTO `countries` VALUES (47, 'Colombia', 'CO', 57, NULL, NULL);
INSERT INTO `countries` VALUES (48, 'Comoros', 'KM', 269, NULL, NULL);
INSERT INTO `countries` VALUES (49, 'Republic Of The Congo', 'CG', 242, NULL, NULL);
INSERT INTO `countries` VALUES (50, 'Democratic Republic Of The Congo', 'CD', 242, NULL, NULL);
INSERT INTO `countries` VALUES (51, 'Cook Islands', 'CK', 682, NULL, NULL);
INSERT INTO `countries` VALUES (52, 'Costa Rica', 'CR', 506, NULL, NULL);
INSERT INTO `countries` VALUES (53, 'Cote D\'\'Ivoire (Ivory Coast)', 'CI', 225, NULL, NULL);
INSERT INTO `countries` VALUES (54, 'Croatia (Hrvatska)', 'HR', 385, NULL, NULL);
INSERT INTO `countries` VALUES (55, 'Cuba', 'CU', 53, NULL, NULL);
INSERT INTO `countries` VALUES (56, 'Cyprus', 'CY', 357, NULL, NULL);
INSERT INTO `countries` VALUES (57, 'Czech Republic', 'CZ', 420, NULL, NULL);
INSERT INTO `countries` VALUES (58, 'Denmark', 'DK', 45, NULL, NULL);
INSERT INTO `countries` VALUES (59, 'Djibouti', 'DJ', 253, NULL, NULL);
INSERT INTO `countries` VALUES (60, 'Dominica', 'DM', 1767, NULL, NULL);
INSERT INTO `countries` VALUES (61, 'Dominican Republic', 'DO', 1809, NULL, NULL);
INSERT INTO `countries` VALUES (62, 'East Timor', 'TP', 670, NULL, NULL);
INSERT INTO `countries` VALUES (63, 'Ecuador', 'EC', 593, NULL, NULL);
INSERT INTO `countries` VALUES (64, 'Egypt', 'EG', 20, NULL, NULL);
INSERT INTO `countries` VALUES (65, 'El Salvador', 'SV', 503, NULL, NULL);
INSERT INTO `countries` VALUES (66, 'Equatorial Guinea', 'GQ', 240, NULL, NULL);
INSERT INTO `countries` VALUES (67, 'Eritrea', 'ER', 291, NULL, NULL);
INSERT INTO `countries` VALUES (68, 'Estonia', 'EE', 372, NULL, NULL);
INSERT INTO `countries` VALUES (69, 'Ethiopia', 'ET', 251, NULL, NULL);
INSERT INTO `countries` VALUES (70, 'External Territories of Australia', 'XA', 61, NULL, NULL);
INSERT INTO `countries` VALUES (71, 'Falkland Islands', 'FK', 500, NULL, NULL);
INSERT INTO `countries` VALUES (72, 'Faroe Islands', 'FO', 298, NULL, NULL);
INSERT INTO `countries` VALUES (73, 'Fiji Islands', 'FJ', 679, NULL, NULL);
INSERT INTO `countries` VALUES (74, 'Finland', 'FI', 358, NULL, NULL);
INSERT INTO `countries` VALUES (75, 'France', 'FR', 33, NULL, NULL);
INSERT INTO `countries` VALUES (76, 'French Guiana', 'GF', 594, NULL, NULL);
INSERT INTO `countries` VALUES (77, 'French Polynesia', 'PF', 689, NULL, NULL);
INSERT INTO `countries` VALUES (78, 'French Southern Territories', 'TF', 0, NULL, NULL);
INSERT INTO `countries` VALUES (79, 'Gabon', 'GA', 241, NULL, NULL);
INSERT INTO `countries` VALUES (80, 'Gambia The', 'GM', 220, NULL, NULL);
INSERT INTO `countries` VALUES (81, 'Georgia', 'GE', 995, NULL, NULL);
INSERT INTO `countries` VALUES (82, 'Germany', 'DE', 49, NULL, NULL);
INSERT INTO `countries` VALUES (83, 'Ghana', 'GH', 233, NULL, NULL);
INSERT INTO `countries` VALUES (84, 'Gibraltar', 'GI', 350, NULL, NULL);
INSERT INTO `countries` VALUES (85, 'Greece', 'GR', 30, NULL, NULL);
INSERT INTO `countries` VALUES (86, 'Greenland', 'GL', 299, NULL, NULL);
INSERT INTO `countries` VALUES (87, 'Grenada', 'GD', 1473, NULL, NULL);
INSERT INTO `countries` VALUES (88, 'Guadeloupe', 'GP', 590, NULL, NULL);
INSERT INTO `countries` VALUES (89, 'Guam', 'GU', 1671, NULL, NULL);
INSERT INTO `countries` VALUES (90, 'Guatemala', 'GT', 502, NULL, NULL);
INSERT INTO `countries` VALUES (91, 'Guernsey and Alderney', 'XU', 44, NULL, NULL);
INSERT INTO `countries` VALUES (92, 'Guinea', 'GN', 224, NULL, NULL);
INSERT INTO `countries` VALUES (93, 'Guinea-Bissau', 'GW', 245, NULL, NULL);
INSERT INTO `countries` VALUES (94, 'Guyana', 'GY', 592, NULL, NULL);
INSERT INTO `countries` VALUES (95, 'Haiti', 'HT', 509, NULL, NULL);
INSERT INTO `countries` VALUES (96, 'Heard and McDonald Islands', 'HM', 0, NULL, NULL);
INSERT INTO `countries` VALUES (97, 'Honduras', 'HN', 504, NULL, NULL);
INSERT INTO `countries` VALUES (98, 'Hong Kong S.A.R.', 'HK', 852, NULL, NULL);
INSERT INTO `countries` VALUES (99, 'Hungary', 'HU', 36, NULL, NULL);
INSERT INTO `countries` VALUES (100, 'Iceland', 'IS', 354, NULL, NULL);
INSERT INTO `countries` VALUES (101, 'India', 'IN', 91, NULL, NULL);
INSERT INTO `countries` VALUES (102, 'Indonesia', 'ID', 62, NULL, NULL);
INSERT INTO `countries` VALUES (103, 'Iran', 'IR', 98, NULL, NULL);
INSERT INTO `countries` VALUES (104, 'Iraq', 'IQ', 964, NULL, NULL);
INSERT INTO `countries` VALUES (105, 'Ireland', 'IE', 353, NULL, NULL);
INSERT INTO `countries` VALUES (106, 'Israel', 'IL', 972, NULL, NULL);
INSERT INTO `countries` VALUES (107, 'Italy', 'IT', 39, NULL, NULL);
INSERT INTO `countries` VALUES (108, 'Jamaica', 'JM', 1876, NULL, NULL);
INSERT INTO `countries` VALUES (109, 'Japan', 'JP', 81, NULL, NULL);
INSERT INTO `countries` VALUES (110, 'Jersey', 'XJ', 44, NULL, NULL);
INSERT INTO `countries` VALUES (111, 'Jordan', 'JO', 962, NULL, NULL);
INSERT INTO `countries` VALUES (112, 'Kazakhstan', 'KZ', 7, NULL, NULL);
INSERT INTO `countries` VALUES (113, 'Kenya', 'KE', 254, NULL, NULL);
INSERT INTO `countries` VALUES (114, 'Kiribati', 'KI', 686, NULL, NULL);
INSERT INTO `countries` VALUES (115, 'Korea North', 'KP', 850, NULL, NULL);
INSERT INTO `countries` VALUES (116, 'Korea South', 'KR', 82, NULL, NULL);
INSERT INTO `countries` VALUES (117, 'Kuwait', 'KW', 965, NULL, NULL);
INSERT INTO `countries` VALUES (118, 'Kyrgyzstan', 'KG', 996, NULL, NULL);
INSERT INTO `countries` VALUES (119, 'Laos', 'LA', 856, NULL, NULL);
INSERT INTO `countries` VALUES (120, 'Latvia', 'LV', 371, NULL, NULL);
INSERT INTO `countries` VALUES (121, 'Lebanon', 'LB', 961, NULL, NULL);
INSERT INTO `countries` VALUES (122, 'Lesotho', 'LS', 266, NULL, NULL);
INSERT INTO `countries` VALUES (123, 'Liberia', 'LR', 231, NULL, NULL);
INSERT INTO `countries` VALUES (124, 'Libya', 'LY', 218, NULL, NULL);
INSERT INTO `countries` VALUES (125, 'Liechtenstein', 'LI', 423, NULL, NULL);
INSERT INTO `countries` VALUES (126, 'Lithuania', 'LT', 370, NULL, NULL);
INSERT INTO `countries` VALUES (127, 'Luxembourg', 'LU', 352, NULL, NULL);
INSERT INTO `countries` VALUES (128, 'Macau S.A.R.', 'MO', 853, NULL, NULL);
INSERT INTO `countries` VALUES (129, 'Macedonia', 'MK', 389, NULL, NULL);
INSERT INTO `countries` VALUES (130, 'Madagascar', 'MG', 261, NULL, NULL);
INSERT INTO `countries` VALUES (131, 'Malawi', 'MW', 265, NULL, NULL);
INSERT INTO `countries` VALUES (132, 'Malaysia', 'MY', 60, NULL, NULL);
INSERT INTO `countries` VALUES (133, 'Maldives', 'MV', 960, NULL, NULL);
INSERT INTO `countries` VALUES (134, 'Mali', 'ML', 223, NULL, NULL);
INSERT INTO `countries` VALUES (135, 'Malta', 'MT', 356, NULL, NULL);
INSERT INTO `countries` VALUES (136, 'Man (Isle of)', 'XM', 44, NULL, NULL);
INSERT INTO `countries` VALUES (137, 'Marshall Islands', 'MH', 692, NULL, NULL);
INSERT INTO `countries` VALUES (138, 'Martinique', 'MQ', 596, NULL, NULL);
INSERT INTO `countries` VALUES (139, 'Mauritania', 'MR', 222, NULL, NULL);
INSERT INTO `countries` VALUES (140, 'Mauritius', 'MU', 230, NULL, NULL);
INSERT INTO `countries` VALUES (141, 'Mayotte', 'YT', 269, NULL, NULL);
INSERT INTO `countries` VALUES (142, 'Mexico', 'MX', 52, NULL, NULL);
INSERT INTO `countries` VALUES (143, 'Micronesia', 'FM', 691, NULL, NULL);
INSERT INTO `countries` VALUES (144, 'Moldova', 'MD', 373, NULL, NULL);
INSERT INTO `countries` VALUES (145, 'Monaco', 'MC', 377, NULL, NULL);
INSERT INTO `countries` VALUES (146, 'Mongolia', 'MN', 976, NULL, NULL);
INSERT INTO `countries` VALUES (147, 'Montserrat', 'MS', 1664, NULL, NULL);
INSERT INTO `countries` VALUES (148, 'Morocco', 'MA', 212, NULL, NULL);
INSERT INTO `countries` VALUES (149, 'Mozambique', 'MZ', 258, NULL, NULL);
INSERT INTO `countries` VALUES (150, 'Myanmar', 'MM', 95, NULL, NULL);
INSERT INTO `countries` VALUES (151, 'Namibia', 'NA', 264, NULL, NULL);
INSERT INTO `countries` VALUES (152, 'Nauru', 'NR', 674, NULL, NULL);
INSERT INTO `countries` VALUES (153, 'Nepal', 'NP', 977, NULL, NULL);
INSERT INTO `countries` VALUES (154, 'Netherlands Antilles', 'AN', 599, NULL, NULL);
INSERT INTO `countries` VALUES (155, 'Netherlands The', 'NL', 31, NULL, NULL);
INSERT INTO `countries` VALUES (156, 'New Caledonia', 'NC', 687, NULL, NULL);
INSERT INTO `countries` VALUES (157, 'New Zealand', 'NZ', 64, NULL, NULL);
INSERT INTO `countries` VALUES (158, 'Nicaragua', 'NI', 505, NULL, NULL);
INSERT INTO `countries` VALUES (159, 'Niger', 'NE', 227, NULL, NULL);
INSERT INTO `countries` VALUES (160, 'Nigeria', 'NG', 234, NULL, NULL);
INSERT INTO `countries` VALUES (161, 'Niue', 'NU', 683, NULL, NULL);
INSERT INTO `countries` VALUES (162, 'Norfolk Island', 'NF', 672, NULL, NULL);
INSERT INTO `countries` VALUES (163, 'Northern Mariana Islands', 'MP', 1670, NULL, NULL);
INSERT INTO `countries` VALUES (164, 'Norway', 'NO', 47, NULL, NULL);
INSERT INTO `countries` VALUES (165, 'Oman', 'OM', 968, NULL, NULL);
INSERT INTO `countries` VALUES (166, 'Pakistan', 'PK', 92, NULL, NULL);
INSERT INTO `countries` VALUES (167, 'Palau', 'PW', 680, NULL, NULL);
INSERT INTO `countries` VALUES (168, 'Palestinian Territory Occupied', 'PS', 970, NULL, NULL);
INSERT INTO `countries` VALUES (169, 'Panama', 'PA', 507, NULL, NULL);
INSERT INTO `countries` VALUES (170, 'Papua new Guinea', 'PG', 675, NULL, NULL);
INSERT INTO `countries` VALUES (171, 'Paraguay', 'PY', 595, NULL, NULL);
INSERT INTO `countries` VALUES (172, 'Peru', 'PE', 51, NULL, NULL);
INSERT INTO `countries` VALUES (173, 'Philippines', 'PH', 63, NULL, NULL);
INSERT INTO `countries` VALUES (174, 'Pitcairn Island', 'PN', 0, NULL, NULL);
INSERT INTO `countries` VALUES (175, 'Poland', 'PL', 48, NULL, NULL);
INSERT INTO `countries` VALUES (176, 'Portugal', 'PT', 351, NULL, NULL);
INSERT INTO `countries` VALUES (177, 'Puerto Rico', 'PR', 1787, NULL, NULL);
INSERT INTO `countries` VALUES (178, 'Qatar', 'QA', 974, NULL, NULL);
INSERT INTO `countries` VALUES (179, 'Reunion', 'RE', 262, NULL, NULL);
INSERT INTO `countries` VALUES (180, 'Romania', 'RO', 40, NULL, NULL);
INSERT INTO `countries` VALUES (181, 'Russia', 'RU', 70, NULL, NULL);
INSERT INTO `countries` VALUES (182, 'Rwanda', 'RW', 250, NULL, NULL);
INSERT INTO `countries` VALUES (183, 'Saint Helena', 'SH', 290, NULL, NULL);
INSERT INTO `countries` VALUES (184, 'Saint Kitts And Nevis', 'KN', 1869, NULL, NULL);
INSERT INTO `countries` VALUES (185, 'Saint Lucia', 'LC', 1758, NULL, NULL);
INSERT INTO `countries` VALUES (186, 'Saint Pierre and Miquelon', 'PM', 508, NULL, NULL);
INSERT INTO `countries` VALUES (187, 'Saint Vincent And The Grenadines', 'VC', 1784, NULL, NULL);
INSERT INTO `countries` VALUES (188, 'Samoa', 'WS', 684, NULL, NULL);
INSERT INTO `countries` VALUES (189, 'San Marino', 'SM', 378, NULL, NULL);
INSERT INTO `countries` VALUES (190, 'Sao Tome and Principe', 'ST', 239, NULL, NULL);
INSERT INTO `countries` VALUES (191, 'Saudi Arabia', 'SA', 966, NULL, NULL);
INSERT INTO `countries` VALUES (192, 'Senegal', 'SN', 221, NULL, NULL);
INSERT INTO `countries` VALUES (193, 'Serbia', 'RS', 381, NULL, NULL);
INSERT INTO `countries` VALUES (194, 'Seychelles', 'SC', 248, NULL, NULL);
INSERT INTO `countries` VALUES (195, 'Sierra Leone', 'SL', 232, NULL, NULL);
INSERT INTO `countries` VALUES (196, 'Singapore', 'SG', 65, NULL, NULL);
INSERT INTO `countries` VALUES (197, 'Slovakia', 'SK', 421, NULL, NULL);
INSERT INTO `countries` VALUES (198, 'Slovenia', 'SI', 386, NULL, NULL);
INSERT INTO `countries` VALUES (199, 'Smaller Territories of the UK', 'XG', 44, NULL, NULL);
INSERT INTO `countries` VALUES (200, 'Solomon Islands', 'SB', 677, NULL, NULL);
INSERT INTO `countries` VALUES (201, 'Somalia', 'SO', 252, NULL, NULL);
INSERT INTO `countries` VALUES (202, 'South Africa', 'ZA', 27, NULL, NULL);
INSERT INTO `countries` VALUES (203, 'South Georgia', 'GS', 0, NULL, NULL);
INSERT INTO `countries` VALUES (204, 'South Sudan', 'SS', 211, NULL, NULL);
INSERT INTO `countries` VALUES (205, 'Spain', 'ES', 34, NULL, NULL);
INSERT INTO `countries` VALUES (206, 'Sri Lanka', 'LK', 94, NULL, NULL);
INSERT INTO `countries` VALUES (207, 'Sudan', 'SD', 249, NULL, NULL);
INSERT INTO `countries` VALUES (208, 'Suriname', 'SR', 597, NULL, NULL);
INSERT INTO `countries` VALUES (209, 'Svalbard And Jan Mayen Islands', 'SJ', 47, NULL, NULL);
INSERT INTO `countries` VALUES (210, 'Swaziland', 'SZ', 268, NULL, NULL);
INSERT INTO `countries` VALUES (211, 'Sweden', 'SE', 46, NULL, NULL);
INSERT INTO `countries` VALUES (212, 'Switzerland', 'CH', 41, NULL, NULL);
INSERT INTO `countries` VALUES (213, 'Syria', 'SY', 963, NULL, NULL);
INSERT INTO `countries` VALUES (214, 'Taiwan', 'TW', 886, NULL, NULL);
INSERT INTO `countries` VALUES (215, 'Tajikistan', 'TJ', 992, NULL, NULL);
INSERT INTO `countries` VALUES (216, 'Tanzania', 'TZ', 255, NULL, NULL);
INSERT INTO `countries` VALUES (217, 'Thailand', 'TH', 66, NULL, NULL);
INSERT INTO `countries` VALUES (218, 'Togo', 'TG', 228, NULL, NULL);
INSERT INTO `countries` VALUES (219, 'Tokelau', 'TK', 690, NULL, NULL);
INSERT INTO `countries` VALUES (220, 'Tonga', 'TO', 676, NULL, NULL);
INSERT INTO `countries` VALUES (221, 'Trinidad And Tobago', 'TT', 1868, NULL, NULL);
INSERT INTO `countries` VALUES (222, 'Tunisia', 'TN', 216, NULL, NULL);
INSERT INTO `countries` VALUES (223, 'Turkey', 'TR', 90, NULL, NULL);
INSERT INTO `countries` VALUES (224, 'Turkmenistan', 'TM', 7370, NULL, NULL);
INSERT INTO `countries` VALUES (225, 'Turks And Caicos Islands', 'TC', 1649, NULL, NULL);
INSERT INTO `countries` VALUES (226, 'Tuvalu', 'TV', 688, NULL, NULL);
INSERT INTO `countries` VALUES (227, 'Uganda', 'UG', 256, NULL, NULL);
INSERT INTO `countries` VALUES (228, 'Ukraine', 'UA', 380, NULL, NULL);
INSERT INTO `countries` VALUES (229, 'United Arab Emirates', 'AE', 971, NULL, NULL);
INSERT INTO `countries` VALUES (230, 'United Kingdom', 'GB', 44, NULL, NULL);
INSERT INTO `countries` VALUES (231, 'United States', 'US', 1, NULL, NULL);
INSERT INTO `countries` VALUES (232, 'United States Minor Outlying Islands', 'UM', 1, NULL, NULL);
INSERT INTO `countries` VALUES (233, 'Uruguay', 'UY', 598, NULL, NULL);
INSERT INTO `countries` VALUES (234, 'Uzbekistan', 'UZ', 998, NULL, NULL);
INSERT INTO `countries` VALUES (235, 'Vanuatu', 'VU', 678, NULL, NULL);
INSERT INTO `countries` VALUES (236, 'Vatican City State (Holy See)', 'VA', 39, NULL, NULL);
INSERT INTO `countries` VALUES (237, 'Venezuela', 'VE', 58, NULL, NULL);
INSERT INTO `countries` VALUES (238, 'Vietnam', 'VN', 84, NULL, NULL);
INSERT INTO `countries` VALUES (239, 'Virgin Islands (British)', 'VG', 1284, NULL, NULL);
INSERT INTO `countries` VALUES (240, 'Virgin Islands (US)', 'VI', 1340, NULL, NULL);
INSERT INTO `countries` VALUES (241, 'Wallis And Futuna Islands', 'WF', 681, NULL, NULL);
INSERT INTO `countries` VALUES (242, 'Western Sahara', 'EH', 212, NULL, NULL);
INSERT INTO `countries` VALUES (243, 'Yemen', 'YE', 967, NULL, NULL);
INSERT INTO `countries` VALUES (244, 'Yugoslavia', 'YU', 38, NULL, NULL);
INSERT INTO `countries` VALUES (245, 'Zambia', 'ZM', 260, NULL, NULL);
INSERT INTO `countries` VALUES (246, 'Zimbabwe', 'ZW', 26, NULL, NULL);

-- ----------------------------
-- Table structure for coupon_codes
-- ----------------------------
DROP TABLE IF EXISTS `coupon_codes`;
CREATE TABLE `coupon_codes`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `how_many_time_can_use` int NOT NULL,
  `discount_type` int NOT NULL,
  `discount` double NOT NULL,
  `how_many_time_used` int NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `coupon_codes_code_unique`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupon_codes
-- ----------------------------

-- ----------------------------
-- Table structure for coupon_product
-- ----------------------------
DROP TABLE IF EXISTS `coupon_product`;
CREATE TABLE `coupon_product`  (
  `coupon_code_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  INDEX `coupon_product_coupon_code_id_foreign`(`coupon_code_id`) USING BTREE,
  INDEX `coupon_product_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `coupon_product_coupon_code_id_foreign` FOREIGN KEY (`coupon_code_id`) REFERENCES `coupon_codes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coupon_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupon_product
-- ----------------------------

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `currencies_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of currencies
-- ----------------------------
INSERT INTO `currencies` VALUES (1, 'US Dollar', 'USD', '$', '2024-03-27 15:30:32', '2024-07-10 07:54:13');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `customers_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (1, 'walk-in-customer', 'customer@infypos.com', '123456789', NULL, 'india', 'mumbai', 'Dr Deshmukh Marg , mumbai', '2024-03-27 15:30:32', '2024-03-27 15:30:32');

-- ----------------------------
-- Table structure for expense_categories
-- ----------------------------
DROP TABLE IF EXISTS `expense_categories`;
CREATE TABLE `expense_categories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expense_categories
-- ----------------------------

-- ----------------------------
-- Table structure for expenses
-- ----------------------------
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `expense_category_id` bigint UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `reference_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `expenses_warehouse_id_foreign`(`warehouse_id`) USING BTREE,
  INDEX `expenses_expense_category_id_foreign`(`expense_category_id`) USING BTREE,
  CONSTRAINT `expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenses_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expenses
-- ----------------------------

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for hold_items
-- ----------------------------
DROP TABLE IF EXISTS `hold_items`;
CREATE TABLE `hold_items`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `hold_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `product_price` double NULL DEFAULT NULL,
  `net_unit_price` double NULL DEFAULT NULL,
  `tax_type` int NOT NULL,
  `tax_value` double NULL DEFAULT NULL,
  `tax_amount` double NULL DEFAULT NULL,
  `discount_type` int NOT NULL,
  `discount_value` double NULL DEFAULT NULL,
  `discount_amount` double NULL DEFAULT NULL,
  `sale_unit` int NOT NULL,
  `quantity` double NULL DEFAULT NULL,
  `sub_total` double NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hold_items_hold_id_foreign`(`hold_id`) USING BTREE,
  INDEX `hold_items_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `hold_items_hold_id_foreign` FOREIGN KEY (`hold_id`) REFERENCES `holds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hold_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hold_items
-- ----------------------------

-- ----------------------------
-- Table structure for holds
-- ----------------------------
DROP TABLE IF EXISTS `holds`;
CREATE TABLE `holds`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `reference_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date` date NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `tax_rate` double NULL DEFAULT NULL,
  `tax_amount` double NULL DEFAULT NULL,
  `discount` double NULL DEFAULT NULL,
  `shipping` double NULL DEFAULT NULL,
  `grand_total` double NULL DEFAULT NULL,
  `received_amount` double NULL DEFAULT NULL,
  `paid_amount` double NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `holds_customer_id_foreign`(`customer_id`) USING BTREE,
  INDEX `holds_warehouse_id_foreign`(`warehouse_id`) USING BTREE,
  CONSTRAINT `holds_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `holds_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of holds
-- ----------------------------

-- ----------------------------
-- Table structure for languages
-- ----------------------------
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `languages_iso_code_unique`(`iso_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of languages
-- ----------------------------
INSERT INTO `languages` VALUES (1, 'Arabic', 'ar', 0, '2024-03-27 15:30:31', '2024-03-27 15:30:31');
INSERT INTO `languages` VALUES (2, 'Chinese', 'cn', 0, '2024-03-27 15:30:31', '2024-03-27 15:30:31');
INSERT INTO `languages` VALUES (3, 'English', 'en', 1, '2024-03-27 15:30:31', '2024-03-27 15:30:31');
INSERT INTO `languages` VALUES (4, 'French', 'fr', 0, '2024-03-27 15:30:31', '2024-03-27 15:30:31');
INSERT INTO `languages` VALUES (5, 'German', 'gr', 0, '2024-03-27 15:30:31', '2024-03-27 15:30:31');
INSERT INTO `languages` VALUES (6, 'Spanish', 'sp', 0, '2024-03-27 15:30:31', '2024-03-27 15:30:31');
INSERT INTO `languages` VALUES (7, 'Turkish', 'tr', 0, '2024-03-27 15:30:31', '2024-03-27 15:30:31');
INSERT INTO `languages` VALUES (8, 'vietnamese', 'vi', 0, '2024-03-27 15:30:31', '2024-03-27 15:30:31');

-- ----------------------------
-- Table structure for mail_templates
-- ----------------------------
DROP TABLE IF EXISTS `mail_templates`;
CREATE TABLE `mail_templates`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `template_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mail_templates
-- ----------------------------
INSERT INTO `mail_templates` VALUES (1, 'GREETING TO CUSTOMER ON SALES !', '<p>Hi, {customer_name}</p><p>Your sales Id is {sales_id}</p><p>Sales Date: {sales_date}</p><p>Total Amount: {sales_amount}</p><p>You have paid: {paid_amount}</p><p>Due amount: {due_amount}</p><p>Regards,  {app_name}</p>', '1', '2024-03-27 15:30:28', '2024-03-27 15:30:28', 0);
INSERT INTO `mail_templates` VALUES (2, 'GREETING TO CUSTOMER ON SALES RETURN !', '<p>Hi, {customer_name}</p><p>Your sales return Id is {sales_return_id}</p><p>Sales return Date: {sales_return_date}</p><p>Total Amount: {sales_return_amount}</p><p>Regards,  {app_name}</p>', '2', '2024-03-27 15:30:28', '2024-03-27 15:30:28', 0);

-- ----------------------------
-- Table structure for main_products
-- ----------------------------
DROP TABLE IF EXISTS `main_products`;
CREATE TABLE `main_products`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_type` tinyint NOT NULL COMMENT '1=Single, 2=Variable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of main_products
-- ----------------------------

-- ----------------------------
-- Table structure for manage_stocks
-- ----------------------------
DROP TABLE IF EXISTS `manage_stocks`;
CREATE TABLE `manage_stocks`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `alert` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `manage_stocks_warehouse_id_foreign`(`warehouse_id`) USING BTREE,
  INDEX `manage_stocks_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `manage_stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `manage_stocks_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manage_stocks
-- ----------------------------

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `collection_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_column` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `media_uuid_unique`(`uuid`) USING BTREE,
  INDEX `media_model_type_model_id_index`(`model_type`, `model_id`) USING BTREE,
  INDEX `media_order_column_index`(`order_column`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES (1, 'App\\Models\\Setting', 36, '494d64a0-7a55-417c-b508-2f2e26390dea', 'settings', 'ichiban', 'ichiban.jpg', 'image/jpeg', 'public', 'public', 212635, '[]', '[]', '[]', '[]', 1, '2024-07-11 09:31:13', '2024-07-11 09:31:13');
INSERT INTO `media` VALUES (2, 'App\\Models\\Setting', 36, '051c6a70-bdc3-4a71-9b3f-351d5b030eed', 'settings', 'FRIED CHICKEN SPICY 5 PCS', 'FRIED-CHICKEN-SPICY-5-PCS.jpg', 'image/jpeg', 'public', 'public', 74485, '[]', '[]', '[]', '[]', 2, '2024-07-19 07:24:11', '2024-07-19 07:24:11');
INSERT INTO `media` VALUES (3, 'App\\Models\\Setting', 36, '5050b792-b773-442a-94b1-aaf508850f3b', 'settings', 'ichiban', 'ichiban.jpg', 'image/jpeg', 'public', 'public', 212635, '[]', '[]', '[]', '[]', 3, '2024-07-19 07:25:08', '2024-07-19 07:25:08');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2022_02_18_051026_create_brands', 1);
INSERT INTO `migrations` VALUES (6, '2022_02_18_063507_create_media_table', 1);
INSERT INTO `migrations` VALUES (7, '2022_02_21_073634_create_permission_tables', 1);
INSERT INTO `migrations` VALUES (8, '2022_03_01_045721_add_display_name_into_permissions_and_roles', 1);
INSERT INTO `migrations` VALUES (9, '2022_03_02_042109_create_currencies_table', 1);
INSERT INTO `migrations` VALUES (10, '2022_03_02_050637_create_product_categories_table', 1);
INSERT INTO `migrations` VALUES (11, '2022_03_02_071803_create_units_table', 1);
INSERT INTO `migrations` VALUES (12, '2022_03_02_125151_create_warehouse_table', 1);
INSERT INTO `migrations` VALUES (13, '2022_03_03_094656_create_product_table', 1);
INSERT INTO `migrations` VALUES (14, '2022_03_04_112848_create_customer_table', 1);
INSERT INTO `migrations` VALUES (15, '2022_03_05_045741_create_suppliers_table', 1);
INSERT INTO `migrations` VALUES (16, '2022_03_05_064104_add_columns_in_users_table', 1);
INSERT INTO `migrations` VALUES (17, '2022_03_08_051830_create_sales_table', 1);
INSERT INTO `migrations` VALUES (18, '2022_03_08_055549_creat_sale_items_table', 1);
INSERT INTO `migrations` VALUES (19, '2022_03_09_095426_create_expense_categories_table', 1);
INSERT INTO `migrations` VALUES (20, '2022_03_09_105321_create_expenses_table', 1);
INSERT INTO `migrations` VALUES (21, '2022_03_10_101744_create_settings_table', 1);
INSERT INTO `migrations` VALUES (22, '2022_03_14_101110_create_purchases_table', 1);
INSERT INTO `migrations` VALUES (23, '2022_03_15_072023_create_purchase_items_table', 1);
INSERT INTO `migrations` VALUES (24, '2022_03_15_122143_add_column_barcode_symbol_products_table', 1);
INSERT INTO `migrations` VALUES (25, '2022_03_16_050519_change_description_filed_type_expense_category_table', 1);
INSERT INTO `migrations` VALUES (26, '2022_05_10_104622_add_language_field_in_users', 1);
INSERT INTO `migrations` VALUES (27, '2022_05_13_111052_add_title_field_in_expenses', 1);
INSERT INTO `migrations` VALUES (28, '2022_05_20_093240_add_new_field_to_sales_table', 1);
INSERT INTO `migrations` VALUES (29, '2022_05_23_061225_create_sales_return_table', 1);
INSERT INTO `migrations` VALUES (30, '2022_05_23_065104_create_sale_return_items_table', 1);
INSERT INTO `migrations` VALUES (31, '2022_05_24_045822_create_purchases_return_table', 1);
INSERT INTO `migrations` VALUES (32, '2022_05_24_050431_create_purchases_return_items_table', 1);
INSERT INTO `migrations` VALUES (33, '2022_05_31_123143_remove_warehouse_id_field_into_products_table', 1);
INSERT INTO `migrations` VALUES (34, '2022_06_01_100610_create_manage_stocks_table', 1);
INSERT INTO `migrations` VALUES (35, '2022_07_12_102722_add_new_filed_to_manage_stocks_table', 1);
INSERT INTO `migrations` VALUES (36, '2022_07_29_085151_create_sales_payments_table', 1);
INSERT INTO `migrations` VALUES (37, '2022_08_04_061313_add_reference_field_to_sales_payments_table', 1);
INSERT INTO `migrations` VALUES (38, '2022_08_04_114100_add_received_amount_field_to_sales_payments_table', 1);
INSERT INTO `migrations` VALUES (39, '2022_08_05_105849_create_adjustments_table', 1);
INSERT INTO `migrations` VALUES (40, '2022_08_05_110241_create_adjustment_items_table', 1);
INSERT INTO `migrations` VALUES (41, '2022_08_29_093912_create_transfers_table', 1);
INSERT INTO `migrations` VALUES (42, '2022_08_29_094749_create_transfer_items_table', 1);
INSERT INTO `migrations` VALUES (43, '2022_09_06_113032_version_1_3_0_seeder', 1);
INSERT INTO `migrations` VALUES (44, '2022_09_10_075820_create_mail_templates_table', 1);
INSERT INTO `migrations` VALUES (45, '2022_09_12_041933_add_email_template_seeder', 1);
INSERT INTO `migrations` VALUES (46, '2022_09_14_050339_create_countries_table', 1);
INSERT INTO `migrations` VALUES (47, '2022_09_14_050458_create_states_table', 1);
INSERT INTO `migrations` VALUES (48, '2022_09_14_065609_assign_all_permission_seeder', 1);
INSERT INTO `migrations` VALUES (49, '2022_09_14_071523_countries_seeder', 1);
INSERT INTO `migrations` VALUES (50, '2022_09_15_052207_create_quotations_table', 1);
INSERT INTO `migrations` VALUES (51, '2022_09_15_053604_create_quotation_items_table', 1);
INSERT INTO `migrations` VALUES (52, '2022_09_15_100204_add_post_code_seeder_migration', 1);
INSERT INTO `migrations` VALUES (53, '2022_09_15_104720_add_date_format_seeder_migration', 1);
INSERT INTO `migrations` VALUES (54, '2022_09_15_113413_default_email_report_quotation_seeder_migration', 1);
INSERT INTO `migrations` VALUES (55, '2022_09_16_062735_add_setting_prefix_code_seeder', 1);
INSERT INTO `migrations` VALUES (56, '2022_09_27_103942_add_new_field_in_sales', 1);
INSERT INTO `migrations` VALUES (57, '2022_09_27_115534_add_new_field_in_quotations', 1);
INSERT INTO `migrations` VALUES (58, '2022_10_03_074141_create_sms_templates_table', 1);
INSERT INTO `migrations` VALUES (59, '2022_10_03_090646_add_sms_template_seeder', 1);
INSERT INTO `migrations` VALUES (60, '2022_10_03_095418_create_sms_settings_table', 1);
INSERT INTO `migrations` VALUES (61, '2022_10_03_102421_add_sms_settings_seeder', 1);
INSERT INTO `migrations` VALUES (62, '2022_10_08_074726_add_status_to_mail_templates_table', 1);
INSERT INTO `migrations` VALUES (63, '2022_10_08_074912_add_status_to_sms_templates_table', 1);
INSERT INTO `migrations` VALUES (64, '2022_10_11_110325_add_default_currency_right_setting_seeder', 1);
INSERT INTO `migrations` VALUES (65, '2022_10_14_041746_add_sms_permissions_seeder', 1);
INSERT INTO `migrations` VALUES (66, '2022_10_15_044226_add_sale_id_to_sales_return_table', 1);
INSERT INTO `migrations` VALUES (67, '2022_10_17_052105_add_is_return_field_to_sales_table', 1);
INSERT INTO `migrations` VALUES (68, '2022_10_17_062353_add_sold_quantity_field_to_sale_return_items_table', 1);
INSERT INTO `migrations` VALUES (69, '2022_11_08_050601_create_holds_table', 1);
INSERT INTO `migrations` VALUES (70, '2022_11_08_051309_create_hold_items_table', 1);
INSERT INTO `migrations` VALUES (71, '2022_11_10_105949_add_quantity_limit_to_products_table', 1);
INSERT INTO `migrations` VALUES (72, '2022_11_29_070305_create_base_units_table', 1);
INSERT INTO `migrations` VALUES (73, '2022_11_30_071556_add_base_units_seeder', 1);
INSERT INTO `migrations` VALUES (74, '2022_12_20_044834_add_dob_field_to_customers_table', 1);
INSERT INTO `migrations` VALUES (75, '2022_12_22_000000_add_expires_at_to_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (76, '2023_01_06_052856_create_languages_table', 1);
INSERT INTO `migrations` VALUES (77, '2023_01_06_053950_language_table_seeder', 1);
INSERT INTO `migrations` VALUES (78, '2023_01_09_103904_add_is_default_to_base_units_table', 1);
INSERT INTO `migrations` VALUES (79, '2023_01_09_104123_add_base_unit_default_seeder', 1);
INSERT INTO `migrations` VALUES (80, '2023_01_09_112217_change_datatype_base_unit_field_to_units_table', 1);
INSERT INTO `migrations` VALUES (81, '2023_06_13_112717_add_pos_register_table', 1);
INSERT INTO `migrations` VALUES (82, '2023_06_16_115153_add_new_field_into_sales_table', 1);
INSERT INTO `migrations` VALUES (83, '2023_07_07_064405_create_coupon_codes_table', 1);
INSERT INTO `migrations` VALUES (84, '2023_07_07_083655_create_coupon_product_table', 1);
INSERT INTO `migrations` VALUES (85, '2023_09_16_000000_rename_password_resets_table', 1);
INSERT INTO `migrations` VALUES (86, '2023_11_21_115157_add_manage_variations_permission', 1);
INSERT INTO `migrations` VALUES (87, '2023_11_21_123327_create_variations_table', 1);
INSERT INTO `migrations` VALUES (88, '2023_11_21_123338_create_variation_types_table', 1);
INSERT INTO `migrations` VALUES (89, '2023_12_21_065548_add_product_code_field_in_products_table', 1);
INSERT INTO `migrations` VALUES (90, '2023_12_21_090730_add_variation_products_table', 1);
INSERT INTO `migrations` VALUES (91, '2023_12_22_064744_create_main_products_table', 1);
INSERT INTO `migrations` VALUES (92, '2023_12_22_065109_add_main_product_id_field_in_variation_products_table', 1);
INSERT INTO `migrations` VALUES (93, '2023_12_22_065227_fill_up_product_code', 1);
INSERT INTO `migrations` VALUES (94, '2023_12_29_064841_add_main_product_id_field_in_products_table', 1);
INSERT INTO `migrations` VALUES (95, '2023_12_29_065039_fill_up_main_product_table_data', 1);
INSERT INTO `migrations` VALUES (96, '2024_01_12_093843_move_product_images_to_main_product', 1);
INSERT INTO `migrations` VALUES (97, '2024_03_01_085230_add_new_field_in_settings_table', 1);
INSERT INTO `migrations` VALUES (98, '2024_03_13_103510_add_new_setting_value_in_settings_table', 1);
INSERT INTO `migrations` VALUES (101, '2024_05_20_124629_add_new_field_in_settings_table', 2);
INSERT INTO `migrations` VALUES (102, '2024_07_17_075142_create_stores_table', 2);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 1);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'manage_adjustments', 'Manage Adjustments', 'web', '2024-03-27 15:30:28', '2024-03-27 15:30:28');
INSERT INTO `permissions` VALUES (2, 'manage_transfers', 'Manage Transfers', 'web', '2024-03-27 15:30:28', '2024-03-27 15:30:28');
INSERT INTO `permissions` VALUES (3, 'manage_roles', 'Manage Roles', 'web', '2024-03-27 15:30:28', '2024-03-27 15:30:28');
INSERT INTO `permissions` VALUES (4, 'manage_brands', 'Manage Brands', 'web', '2024-03-27 15:30:28', '2024-03-27 15:30:28');
INSERT INTO `permissions` VALUES (5, 'manage_currency', 'Manage Currency', 'web', '2024-03-27 15:30:28', '2024-03-27 15:30:28');
INSERT INTO `permissions` VALUES (6, 'manage_warehouses', 'Manage Warehouses', 'web', '2024-03-27 15:30:28', '2024-03-27 15:30:28');
INSERT INTO `permissions` VALUES (7, 'manage_units', 'Manage Units', 'web', '2024-03-27 15:30:28', '2024-03-27 15:30:28');
INSERT INTO `permissions` VALUES (8, 'manage_product_categories', 'Manage Product Categories', 'web', '2024-03-27 15:30:28', '2024-03-27 15:30:28');
INSERT INTO `permissions` VALUES (9, 'manage_products', 'Manage Products ', 'web', '2024-03-27 15:30:28', '2024-03-27 15:30:28');
INSERT INTO `permissions` VALUES (10, 'manage_suppliers', 'Manage Suppliers', 'web', '2024-03-27 15:30:28', '2024-03-27 15:30:28');
INSERT INTO `permissions` VALUES (11, 'manage_customers', 'Manage Customers', 'web', '2024-03-27 15:30:29', '2024-03-27 15:30:29');
INSERT INTO `permissions` VALUES (12, 'manage_users', 'Manage Users', 'web', '2024-03-27 15:30:29', '2024-03-27 15:30:29');
INSERT INTO `permissions` VALUES (13, 'manage_expense_categories', 'Manage Expense Categories', 'web', '2024-03-27 15:30:29', '2024-03-27 15:30:29');
INSERT INTO `permissions` VALUES (14, 'manage_expenses', 'Manage Expenses', 'web', '2024-03-27 15:30:29', '2024-03-27 15:30:29');
INSERT INTO `permissions` VALUES (15, 'manage_setting', 'Manage Setting', 'web', '2024-03-27 15:30:29', '2024-03-27 15:30:29');
INSERT INTO `permissions` VALUES (16, 'manage_dashboard', 'Manage Dashboard', 'web', '2024-03-27 15:30:29', '2024-03-27 15:30:29');
INSERT INTO `permissions` VALUES (17, 'manage_pos_screen', 'Manage Pos Screen', 'web', '2024-03-27 15:30:29', '2024-03-27 15:30:29');
INSERT INTO `permissions` VALUES (18, 'manage_purchase', 'Manage Purchase', 'web', '2024-03-27 15:30:29', '2024-03-27 15:30:29');
INSERT INTO `permissions` VALUES (19, 'manage_sale', 'Manage Sale', 'web', '2024-03-27 15:30:29', '2024-03-27 15:30:29');
INSERT INTO `permissions` VALUES (20, 'manage_purchase_return', 'Manage Purchase Return', 'web', '2024-03-27 15:30:29', '2024-03-27 15:30:29');
INSERT INTO `permissions` VALUES (21, 'manage_sale_return', 'Manage Sale Return', 'web', '2024-03-27 15:30:29', '2024-03-27 15:30:29');
INSERT INTO `permissions` VALUES (22, 'manage_email_templates', 'Manage Email Templates', 'web', '2024-03-27 15:30:29', '2024-03-27 15:30:29');
INSERT INTO `permissions` VALUES (23, 'manage_reports', 'Manage Reports', 'web', '2024-03-27 15:30:29', '2024-03-27 15:30:29');
INSERT INTO `permissions` VALUES (24, 'manage_quotations', 'Manage Quotations', 'web', '2024-03-27 15:30:30', '2024-03-27 15:30:30');
INSERT INTO `permissions` VALUES (25, 'manage_sms_templates', 'Manage Sms Templates', 'web', '2024-03-27 15:30:30', '2024-03-27 15:30:30');
INSERT INTO `permissions` VALUES (26, 'manage_sms_apis', 'Manage Sms Apis', 'web', '2024-03-27 15:30:30', '2024-03-27 15:30:30');
INSERT INTO `permissions` VALUES (27, 'manage_language', 'Manage Language', 'web', '2024-03-27 15:30:31', '2024-03-27 15:30:31');
INSERT INTO `permissions` VALUES (28, 'manage_variations', 'Manage Variations', 'web', '2024-03-27 15:30:31', '2024-03-27 15:30:31');
INSERT INTO `permissions` VALUES (29, 'manage_stores', 'Manage Stores', 'web', '2024-03-27 15:30:31', '2024-03-27 15:30:31');

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', 1, 'token', '0c1a960e1f561e3367f77559102bbb4695d4329b3ab1283f9bd05ccc689a8be8', '[\"*\"]', '2024-07-10 08:06:10', NULL, '2024-07-10 07:52:26', '2024-07-10 08:06:10');
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\Models\\User', 1, 'token', '8d076c2ecb4968965a255e0ba86cbf840bd96ce95ccc73d8a5cec7c56d854cf8', '[\"*\"]', '2024-07-10 08:37:33', NULL, '2024-07-10 08:34:06', '2024-07-10 08:37:33');
INSERT INTO `personal_access_tokens` VALUES (3, 'App\\Models\\User', 1, 'token', 'c8781727d080af739d4a641619b2ef0b8633adff7df58d8709566fe2bc3416f7', '[\"*\"]', NULL, NULL, '2024-07-10 08:54:49', '2024-07-10 08:54:49');
INSERT INTO `personal_access_tokens` VALUES (4, 'App\\Models\\User', 1, 'token', '8fb08899f8cec2c74a5fb077c7a3e4544e703afa2297b56f5abccabf6927c5a0', '[\"*\"]', '2024-07-10 09:20:26', NULL, '2024-07-10 09:06:35', '2024-07-10 09:20:26');
INSERT INTO `personal_access_tokens` VALUES (5, 'App\\Models\\User', 1, 'token', '6fd46976762592927eeea3c4c84e35be478c0e90f71a64e73a3fcd66eb832110', '[\"*\"]', '2024-07-11 02:10:18', NULL, '2024-07-11 02:09:59', '2024-07-11 02:10:18');
INSERT INTO `personal_access_tokens` VALUES (6, 'App\\Models\\User', 1, 'token', 'ef0431ad6b32b3914a5db0f0b16e716ca33f1437e34cff502b307c62bff286c0', '[\"*\"]', '2024-07-11 09:35:01', NULL, '2024-07-11 08:41:39', '2024-07-11 09:35:01');
INSERT INTO `personal_access_tokens` VALUES (13, 'App\\Models\\User', 1, 'token', 'c1e4f90f8698b77ffdc9eae522ef9c65f9ac604d047b85185dd59b38b93f4d2d', '[\"*\"]', '2024-07-12 04:32:22', NULL, '2024-07-12 02:56:31', '2024-07-12 04:32:22');
INSERT INTO `personal_access_tokens` VALUES (14, 'App\\Models\\User', 1, 'token', '0ca7651d32f36e3c6d3b32389b862e791998afd3182357ed270a03d80cabd57f', '[\"*\"]', '2024-07-12 09:06:27', NULL, '2024-07-12 07:07:02', '2024-07-12 09:06:27');
INSERT INTO `personal_access_tokens` VALUES (15, 'App\\Models\\User', 1, 'token', 'b08f443c1a40afdcfa2a712cfc195f41a68564c6c7c62f3a01bab7cd51eedc48', '[\"*\"]', '2024-07-12 09:10:01', NULL, '2024-07-12 09:09:59', '2024-07-12 09:10:01');
INSERT INTO `personal_access_tokens` VALUES (16, 'App\\Models\\User', 1, 'token', 'cd65b952167cb72d3a8eb1b75db79e3cbf617e1650bb2a4641673a77db9fde64', '[\"*\"]', '2024-07-15 03:49:46', NULL, '2024-07-15 01:51:11', '2024-07-15 03:49:46');
INSERT INTO `personal_access_tokens` VALUES (17, 'App\\Models\\User', 1, 'token', 'dc949db3d6f08b19dbffbbd39d3cd2d3cbeb960422967a0cfd65678b9b0a7da7', '[\"*\"]', '2024-07-17 09:14:18', NULL, '2024-07-17 08:40:43', '2024-07-17 09:14:18');
INSERT INTO `personal_access_tokens` VALUES (18, 'App\\Models\\User', 1, 'token', 'b063afffd2d9c836fc34c8da673f16752d745acb2afec08a5029bea0f883a250', '[\"*\"]', '2024-07-18 04:15:17', NULL, '2024-07-18 02:17:43', '2024-07-18 04:15:17');
INSERT INTO `personal_access_tokens` VALUES (19, 'App\\Models\\User', 1, 'token', '5a1afb5fa14203ea47138a063ffe3d2d835900bed3f5cbe66ac9f17af0e16836', '[\"*\"]', '2024-07-18 04:34:58', NULL, '2024-07-18 04:21:27', '2024-07-18 04:34:58');
INSERT INTO `personal_access_tokens` VALUES (20, 'App\\Models\\User', 1, 'token', '0f5f1c5ea66ffd6af0e899bd765ef8ac6544d5e73ee8764bb0f9d66d326264f8', '[\"*\"]', '2024-07-18 09:18:58', NULL, '2024-07-18 07:24:07', '2024-07-18 09:18:58');
INSERT INTO `personal_access_tokens` VALUES (21, 'App\\Models\\User', 1, 'token', 'bab17356684de4ca721cf3b10693601e4b11e6652e4d323240d300455278741f', '[\"*\"]', '2024-07-18 09:14:59', NULL, '2024-07-18 07:34:02', '2024-07-18 09:14:59');
INSERT INTO `personal_access_tokens` VALUES (22, 'App\\Models\\User', 1, 'token', '4c0df8cb4f6ef4d16e9f3b186f539c66414d78359b24b2f426ef0e3db5884266', '[\"*\"]', '2024-07-19 04:08:51', NULL, '2024-07-19 02:09:10', '2024-07-19 04:08:51');
INSERT INTO `personal_access_tokens` VALUES (23, 'App\\Models\\User', 1, 'token', 'd091ca7c9aba1ebc68fa8fbc91581acab80adf37e3ec0d6619e714fa0e0b2565', '[\"*\"]', '2024-07-19 04:29:43', NULL, '2024-07-19 03:01:33', '2024-07-19 04:29:43');
INSERT INTO `personal_access_tokens` VALUES (24, 'App\\Models\\User', 1, 'token', 'f397bed87fd5d1b32dd07560d79bd0834dadefa83d39631d33289a95a1ce390e', '[\"*\"]', '2024-07-19 05:02:41', NULL, '2024-07-19 04:17:42', '2024-07-19 05:02:41');
INSERT INTO `personal_access_tokens` VALUES (25, 'App\\Models\\User', 1, 'token', '3f34d969d43599b0fee664637d2e8a4512a00175609f90b4f55ae47ea7618b11', '[\"*\"]', '2024-07-19 08:51:07', NULL, '2024-07-19 06:53:36', '2024-07-19 08:51:07');
INSERT INTO `personal_access_tokens` VALUES (26, 'App\\Models\\User', 1, 'token', 'ef79c255c42cd49333f6e2c5f0d7d7ec02398d9ab222051cdb47a9e45060670f', '[\"*\"]', '2024-07-19 10:08:58', NULL, '2024-07-19 08:56:15', '2024-07-19 10:08:58');
INSERT INTO `personal_access_tokens` VALUES (27, 'App\\Models\\User', 1, 'token', '363bdd7356c91d84f1ab093eee6d5b17d7497e72f93d9fbb0f8ff863be7a0a9f', '[\"*\"]', '2024-07-19 09:40:54', NULL, '2024-07-19 09:30:05', '2024-07-19 09:40:54');
INSERT INTO `personal_access_tokens` VALUES (28, 'App\\Models\\User', 1, 'token', '9dc2acabee41b358f8274f8741fcc3808d0ad6a2e2bbb942b1bc67e8269d5399', '[\"*\"]', '2024-07-22 02:37:29', NULL, '2024-07-22 02:28:57', '2024-07-22 02:37:29');
INSERT INTO `personal_access_tokens` VALUES (29, 'App\\Models\\User', 1, 'token', '4d7024065082b9b89e959e487f4b0ed0b5eab405cdd71e01d72973f55e04b979', '[\"*\"]', '2024-07-22 04:34:19', NULL, '2024-07-22 02:54:04', '2024-07-22 04:34:19');
INSERT INTO `personal_access_tokens` VALUES (30, 'App\\Models\\User', 1, 'token', '671abc6665ebc28540f1c29260280173281bfa576d4d823483533489e694dfa7', '[\"*\"]', '2024-07-29 03:54:08', NULL, '2024-07-29 02:48:16', '2024-07-29 03:54:08');
INSERT INTO `personal_access_tokens` VALUES (31, 'App\\Models\\User', 1, 'token', '24516b30d114fe61580222c1a770e18d3e2c3e7865d2f00b22ab8e708741b710', '[\"*\"]', '2024-07-29 04:49:02', NULL, '2024-07-29 02:49:40', '2024-07-29 04:49:02');
INSERT INTO `personal_access_tokens` VALUES (32, 'App\\Models\\User', 1, 'token', 'fb87fc8b6121ace2e8200fc247e7527e0b4dab780a1fb0318462a917afefe39e', '[\"*\"]', '2024-07-29 05:04:25', NULL, '2024-07-29 04:55:39', '2024-07-29 05:04:25');
INSERT INTO `personal_access_tokens` VALUES (33, 'App\\Models\\User', 1, 'token', '0ac4078f334f8a857afe50c3ec6fca5f6ad41744ee06228ff9591a9e078201c2', '[\"*\"]', '2024-07-29 09:14:12', NULL, '2024-07-29 08:59:36', '2024-07-29 09:14:12');
INSERT INTO `personal_access_tokens` VALUES (34, 'App\\Models\\User', 1, 'token', '7f8751b2d9d575da6fa8d3b62a135cfd8f770b791c2e918685a0230d0820c482', '[\"*\"]', '2024-08-06 02:53:19', NULL, '2024-08-06 02:44:56', '2024-08-06 02:53:19');
INSERT INTO `personal_access_tokens` VALUES (35, 'App\\Models\\User', 1, 'token', '2b0137062dabe5e9e8991b18fc10b1030bb64ebc04e6a7545e291e5d98783d78', '[\"*\"]', '2024-08-23 04:03:37', NULL, '2024-08-23 02:51:27', '2024-08-23 04:03:37');

-- ----------------------------
-- Table structure for pos_register
-- ----------------------------
DROP TABLE IF EXISTS `pos_register`;
CREATE TABLE `pos_register`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cash_in_hand` double NOT NULL,
  `closed_at` datetime NULL DEFAULT NULL,
  `cash_in_hand_while_closing` double NULL DEFAULT NULL,
  `bank_transfer` double NULL DEFAULT NULL,
  `cheque` double NULL DEFAULT NULL,
  `other` double NULL DEFAULT NULL,
  `total_sale` double NULL DEFAULT NULL,
  `total_return` double NULL DEFAULT NULL,
  `total_amount` double NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pos_register_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `pos_register_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pos_register
-- ----------------------------
INSERT INTO `pos_register` VALUES (1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-07-10 07:56:15', '2024-07-10 07:56:15');

-- ----------------------------
-- Table structure for product_categories
-- ----------------------------
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_categories_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_categories
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `main_product_id` bigint UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_symbol` int NOT NULL DEFAULT 1,
  `product_category_id` bigint UNSIGNED NOT NULL,
  `brand_id` bigint UNSIGNED NOT NULL,
  `product_cost` double NOT NULL,
  `product_price` double NOT NULL,
  `product_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `purchase_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stock_alert` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quantity_limit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_tax` double NULL DEFAULT NULL,
  `tax_type` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_code_unique`(`code`) USING BTREE,
  INDEX `products_product_category_id_foreign`(`product_category_id`) USING BTREE,
  INDEX `products_brand_id_foreign`(`brand_id`) USING BTREE,
  INDEX `products_main_product_id_foreign`(`main_product_id`) USING BTREE,
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_main_product_id_foreign` FOREIGN KEY (`main_product_id`) REFERENCES `main_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `products_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------

-- ----------------------------
-- Table structure for purchase_items
-- ----------------------------
DROP TABLE IF EXISTS `purchase_items`;
CREATE TABLE `purchase_items`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `product_cost` double NULL DEFAULT NULL,
  `net_unit_cost` double NULL DEFAULT NULL,
  `tax_type` int NOT NULL,
  `tax_value` double NULL DEFAULT NULL,
  `tax_amount` double NULL DEFAULT NULL,
  `discount_type` int NOT NULL,
  `discount_value` double NULL DEFAULT NULL,
  `discount_amount` double NULL DEFAULT NULL,
  `purchase_unit` int NOT NULL,
  `quantity` double NULL DEFAULT NULL,
  `sub_total` double NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `purchase_items_purchase_id_foreign`(`purchase_id`) USING BTREE,
  INDEX `purchase_items_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `purchase_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchase_items
-- ----------------------------

-- ----------------------------
-- Table structure for purchases
-- ----------------------------
DROP TABLE IF EXISTS `purchases`;
CREATE TABLE `purchases`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `tax_rate` double NULL DEFAULT NULL,
  `tax_amount` double NULL DEFAULT NULL,
  `discount` double NULL DEFAULT NULL,
  `shipping` double NULL DEFAULT NULL,
  `grand_total` double NULL DEFAULT NULL,
  `received_amount` double NULL DEFAULT NULL,
  `paid_amount` double NULL DEFAULT NULL,
  `payment_type` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `reference_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `purchases_supplier_id_foreign`(`supplier_id`) USING BTREE,
  INDEX `purchases_warehouse_id_foreign`(`warehouse_id`) USING BTREE,
  CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchases_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchases
-- ----------------------------

-- ----------------------------
-- Table structure for purchases_return
-- ----------------------------
DROP TABLE IF EXISTS `purchases_return`;
CREATE TABLE `purchases_return`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `tax_rate` double NULL DEFAULT NULL,
  `tax_amount` double NULL DEFAULT NULL,
  `discount` double NULL DEFAULT NULL,
  `shipping` double NULL DEFAULT NULL,
  `grand_total` double NULL DEFAULT NULL,
  `received_amount` double NULL DEFAULT NULL,
  `paid_amount` double NULL DEFAULT NULL,
  `payment_type` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `payment_status` int NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `reference_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `purchases_return_supplier_id_foreign`(`supplier_id`) USING BTREE,
  INDEX `purchases_return_warehouse_id_foreign`(`warehouse_id`) USING BTREE,
  CONSTRAINT `purchases_return_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchases_return_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchases_return
-- ----------------------------

-- ----------------------------
-- Table structure for purchases_return_items
-- ----------------------------
DROP TABLE IF EXISTS `purchases_return_items`;
CREATE TABLE `purchases_return_items`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_return_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `product_cost` double NULL DEFAULT NULL,
  `net_unit_cost` double NULL DEFAULT NULL,
  `tax_type` int NOT NULL,
  `tax_value` double NULL DEFAULT NULL,
  `tax_amount` double NULL DEFAULT NULL,
  `discount_type` int NOT NULL,
  `discount_value` double NULL DEFAULT NULL,
  `discount_amount` double NULL DEFAULT NULL,
  `purchase_unit` int NOT NULL,
  `quantity` double NULL DEFAULT NULL,
  `sub_total` double NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `purchases_return_items_purchase_return_id_foreign`(`purchase_return_id`) USING BTREE,
  INDEX `purchases_return_items_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `purchases_return_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchases_return_items_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchases_return` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchases_return_items
-- ----------------------------

-- ----------------------------
-- Table structure for quotation_items
-- ----------------------------
DROP TABLE IF EXISTS `quotation_items`;
CREATE TABLE `quotation_items`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `quotation_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `product_price` double NULL DEFAULT NULL,
  `net_unit_price` double NULL DEFAULT NULL,
  `tax_type` int NOT NULL,
  `tax_value` double NULL DEFAULT NULL,
  `tax_amount` double NULL DEFAULT NULL,
  `discount_type` int NOT NULL,
  `discount_value` double NULL DEFAULT NULL,
  `discount_amount` double NULL DEFAULT NULL,
  `sale_unit` int NOT NULL,
  `quantity` double NULL DEFAULT NULL,
  `sub_total` double NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `quotation_items_quotation_id_foreign`(`quotation_id`) USING BTREE,
  INDEX `quotation_items_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `quotation_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotation_items_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quotation_items
-- ----------------------------

-- ----------------------------
-- Table structure for quotations
-- ----------------------------
DROP TABLE IF EXISTS `quotations`;
CREATE TABLE `quotations`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `tax_rate` double NULL DEFAULT NULL,
  `tax_amount` double NULL DEFAULT NULL,
  `discount` double NULL DEFAULT NULL,
  `shipping` double NULL DEFAULT NULL,
  `grand_total` double NULL DEFAULT NULL,
  `received_amount` double NULL DEFAULT NULL,
  `paid_amount` double NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `is_sale_created` tinyint(1) NOT NULL DEFAULT 0,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `reference_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `quotations_customer_id_foreign`(`customer_id`) USING BTREE,
  INDEX `quotations_warehouse_id_foreign`(`warehouse_id`) USING BTREE,
  CONSTRAINT `quotations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotations_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quotations
-- ----------------------------

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES (1, 1);
INSERT INTO `role_has_permissions` VALUES (2, 1);
INSERT INTO `role_has_permissions` VALUES (3, 1);
INSERT INTO `role_has_permissions` VALUES (4, 1);
INSERT INTO `role_has_permissions` VALUES (5, 1);
INSERT INTO `role_has_permissions` VALUES (6, 1);
INSERT INTO `role_has_permissions` VALUES (7, 1);
INSERT INTO `role_has_permissions` VALUES (8, 1);
INSERT INTO `role_has_permissions` VALUES (9, 1);
INSERT INTO `role_has_permissions` VALUES (10, 1);
INSERT INTO `role_has_permissions` VALUES (11, 1);
INSERT INTO `role_has_permissions` VALUES (12, 1);
INSERT INTO `role_has_permissions` VALUES (13, 1);
INSERT INTO `role_has_permissions` VALUES (14, 1);
INSERT INTO `role_has_permissions` VALUES (15, 1);
INSERT INTO `role_has_permissions` VALUES (16, 1);
INSERT INTO `role_has_permissions` VALUES (17, 1);
INSERT INTO `role_has_permissions` VALUES (18, 1);
INSERT INTO `role_has_permissions` VALUES (19, 1);
INSERT INTO `role_has_permissions` VALUES (20, 1);
INSERT INTO `role_has_permissions` VALUES (21, 1);
INSERT INTO `role_has_permissions` VALUES (22, 1);
INSERT INTO `role_has_permissions` VALUES (23, 1);
INSERT INTO `role_has_permissions` VALUES (24, 1);
INSERT INTO `role_has_permissions` VALUES (25, 1);
INSERT INTO `role_has_permissions` VALUES (26, 1);
INSERT INTO `role_has_permissions` VALUES (27, 1);
INSERT INTO `role_has_permissions` VALUES (28, 1);
INSERT INTO `role_has_permissions` VALUES (29, 1);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', ' Admin', 'web', '2024-03-27 15:30:28', '2024-03-27 15:30:28');

-- ----------------------------
-- Table structure for sale_items
-- ----------------------------
DROP TABLE IF EXISTS `sale_items`;
CREATE TABLE `sale_items`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sale_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `product_price` double NULL DEFAULT NULL,
  `net_unit_price` double NULL DEFAULT NULL,
  `tax_type` int NOT NULL,
  `tax_value` double NULL DEFAULT NULL,
  `tax_amount` double NULL DEFAULT NULL,
  `discount_type` int NOT NULL,
  `discount_value` double NULL DEFAULT NULL,
  `discount_amount` double NULL DEFAULT NULL,
  `sale_unit` int NOT NULL,
  `quantity` double NULL DEFAULT NULL,
  `sub_total` double NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sale_items_sale_id_foreign`(`sale_id`) USING BTREE,
  INDEX `sale_items_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `sale_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_items_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_items
-- ----------------------------

-- ----------------------------
-- Table structure for sale_return_items
-- ----------------------------
DROP TABLE IF EXISTS `sale_return_items`;
CREATE TABLE `sale_return_items`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sale_return_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `product_price` double NULL DEFAULT NULL,
  `net_unit_price` double NULL DEFAULT NULL,
  `tax_type` int NOT NULL,
  `tax_value` double NULL DEFAULT NULL,
  `tax_amount` double NULL DEFAULT NULL,
  `discount_type` int NOT NULL,
  `discount_value` double NULL DEFAULT NULL,
  `discount_amount` double NULL DEFAULT NULL,
  `sale_unit` int NOT NULL,
  `quantity` double NULL DEFAULT NULL,
  `sold_quantity` double NULL DEFAULT NULL,
  `sub_total` double NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sale_return_items_sale_return_id_foreign`(`sale_return_id`) USING BTREE,
  INDEX `sale_return_items_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `sale_return_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_return_items_sale_return_id_foreign` FOREIGN KEY (`sale_return_id`) REFERENCES `sales_return` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_return_items
-- ----------------------------

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT 0,
  `customer_id` bigint UNSIGNED NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `tax_rate` double NULL DEFAULT NULL,
  `tax_amount` double NULL DEFAULT NULL,
  `discount` double NULL DEFAULT NULL,
  `shipping` double NULL DEFAULT NULL,
  `grand_total` double NULL DEFAULT NULL,
  `received_amount` double NULL DEFAULT NULL,
  `paid_amount` double NULL DEFAULT NULL,
  `payment_type` int NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `reference_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `payment_status` int NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sales_customer_id_foreign`(`customer_id`) USING BTREE,
  INDEX `sales_warehouse_id_foreign`(`warehouse_id`) USING BTREE,
  INDEX `sales_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sales
-- ----------------------------

-- ----------------------------
-- Table structure for sales_payments
-- ----------------------------
DROP TABLE IF EXISTS `sales_payments`;
CREATE TABLE `sales_payments`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sale_id` bigint UNSIGNED NOT NULL,
  `reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_date` date NOT NULL,
  `payment_type` int NULL DEFAULT NULL,
  `amount` double NULL DEFAULT NULL,
  `received_amount` double NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sales_payments_sale_id_foreign`(`sale_id`) USING BTREE,
  CONSTRAINT `sales_payments_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sales_payments
-- ----------------------------

-- ----------------------------
-- Table structure for sales_return
-- ----------------------------
DROP TABLE IF EXISTS `sales_return`;
CREATE TABLE `sales_return`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `sale_id` bigint UNSIGNED NULL DEFAULT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `tax_rate` double NULL DEFAULT NULL,
  `tax_amount` double NULL DEFAULT NULL,
  `discount` double NULL DEFAULT NULL,
  `shipping` double NULL DEFAULT NULL,
  `grand_total` double NULL DEFAULT NULL,
  `paid_amount` double NULL DEFAULT NULL,
  `payment_type` int NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `reference_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sales_return_customer_id_foreign`(`customer_id`) USING BTREE,
  INDEX `sales_return_warehouse_id_foreign`(`warehouse_id`) USING BTREE,
  INDEX `sales_return_sale_id_foreign`(`sale_id`) USING BTREE,
  CONSTRAINT `sales_return_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_return_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_return_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sales_return
-- ----------------------------

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'show_version_on_footer', '1', '2024-03-27 15:30:28', '2024-03-27 15:30:28');
INSERT INTO `settings` VALUES (2, 'country', 'Cambodia', '2024-03-27 15:30:29', '2024-07-12 02:33:13');
INSERT INTO `settings` VALUES (3, 'state', 'Phnum Penh', '2024-03-27 15:30:29', '2024-07-12 02:33:13');
INSERT INTO `settings` VALUES (4, 'city', 'Surat', '2024-03-27 15:30:29', '2024-03-27 15:30:29');
INSERT INTO `settings` VALUES (5, 'postcode', '395007', '2024-03-27 15:30:29', '2024-03-27 15:30:29');
INSERT INTO `settings` VALUES (6, 'date_format', 'y-m-d', '2024-03-27 15:30:29', '2024-03-27 15:30:29');
INSERT INTO `settings` VALUES (7, 'purchase_code', 'PU', '2024-03-27 15:30:30', '2024-03-27 15:30:30');
INSERT INTO `settings` VALUES (8, 'purchase_return_code', 'PR', '2024-03-27 15:30:30', '2024-03-27 15:30:30');
INSERT INTO `settings` VALUES (9, 'sale_code', 'SA', '2024-03-27 15:30:30', '2024-03-27 15:30:30');
INSERT INTO `settings` VALUES (10, 'sale_return_code', 'SR', '2024-03-27 15:30:30', '2024-03-27 15:30:30');
INSERT INTO `settings` VALUES (11, 'expense_code', 'EX', '2024-03-27 15:30:30', '2024-03-27 15:30:30');
INSERT INTO `settings` VALUES (12, 'is_currency_right', 'false', '2024-03-27 15:30:30', '2024-07-10 07:53:30');
INSERT INTO `settings` VALUES (13, 'show_logo_in_receipt', '1', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (14, 'show_app_name_in_sidebar', '1', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (15, 'currency', '1', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (16, 'email', 'support@infypos.com', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (17, 'company_name', 'HiEAT POS', '2024-03-27 15:30:32', '2024-07-10 07:53:30');
INSERT INTO `settings` VALUES (18, 'phone', '1234567890', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (19, 'developed', 'infyom', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (20, 'footer', '2022 Developed by Infy-pos All rights reserved - v1.1.0', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (21, 'default_language', '1', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (22, 'default_customer', '1', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (23, 'default_warehouse', '1', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (24, 'address', 'C-303, Atlanta Shopping Mall, Nr. Sudama Chowk, Mota Varachha, Surat, Gujarat, India.', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (25, 'stripe_key', 'pu_test_yBzA1qI1PcfRBAVn1vJG2VuS00HcyhQX9LASERTFDDS', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (26, 'stripe_secret', 'pu_test_yBzA1qI1PcfRBAVn1vJG2VuS00HcyhQX9LASERTFDDS', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (27, 'sms_gateway', '1', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (28, 'twillo_sid', 'asd', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (29, 'twillo_token', 'asd', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (30, 'twillo_from', 'asd', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (31, 'smtp_host', 'mailtrap.io', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (32, 'smtp_port', '2525', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (33, 'smtp_username', 'test', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (34, 'smtp_password', 'test', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (35, 'smtp_Encryption', 'tls', '2024-03-27 15:30:32', '2024-03-27 15:30:32');
INSERT INTO `settings` VALUES (36, 'logo', 'http://pos.local/uploads/settings\\3\\ichiban.jpg', '2024-03-27 15:30:32', '2024-07-19 07:25:08');
INSERT INTO `settings` VALUES (49, 'show_note', '1', '2024-07-17 08:14:19', '2024-07-17 08:14:19');
INSERT INTO `settings` VALUES (50, 'show_phone', '1', '2024-07-17 08:14:19', '2024-07-17 08:14:19');
INSERT INTO `settings` VALUES (51, 'show_customer', '1', '2024-07-17 08:14:19', '2024-07-17 08:14:19');
INSERT INTO `settings` VALUES (52, 'show_address', '1', '2024-07-17 08:14:19', '2024-07-17 08:14:19');
INSERT INTO `settings` VALUES (53, 'show_email', '1', '2024-07-17 08:14:19', '2024-07-17 08:14:19');
INSERT INTO `settings` VALUES (54, 'show_warehouse', '1', '2024-07-17 08:14:19', '2024-07-17 08:14:19');
INSERT INTO `settings` VALUES (55, 'show_tax_discount_shipping', '1', '2024-07-17 08:14:19', '2024-07-17 08:14:19');
INSERT INTO `settings` VALUES (56, 'show_barcode_in_receipt', '1', '2024-07-17 08:14:19', '2024-07-17 08:14:19');
INSERT INTO `settings` VALUES (57, 'notes', 'Thanks for order', '2024-07-17 08:14:19', '2024-07-17 08:14:19');
INSERT INTO `settings` VALUES (58, 'show_note', '1', '2024-07-19 02:58:05', '2024-07-19 02:58:05');
INSERT INTO `settings` VALUES (59, 'show_phone', '1', '2024-07-19 02:58:05', '2024-07-19 02:58:05');
INSERT INTO `settings` VALUES (60, 'show_customer', '1', '2024-07-19 02:58:05', '2024-07-19 02:58:05');
INSERT INTO `settings` VALUES (61, 'show_address', '1', '2024-07-19 02:58:05', '2024-07-19 02:58:05');
INSERT INTO `settings` VALUES (62, 'show_email', '1', '2024-07-19 02:58:05', '2024-07-19 02:58:05');
INSERT INTO `settings` VALUES (63, 'show_warehouse', '1', '2024-07-19 02:58:05', '2024-07-19 02:58:05');
INSERT INTO `settings` VALUES (64, 'show_tax_discount_shipping', '1', '2024-07-19 02:58:05', '2024-07-19 02:58:05');
INSERT INTO `settings` VALUES (65, 'show_barcode_in_receipt', '1', '2024-07-19 02:58:05', '2024-07-19 02:58:05');
INSERT INTO `settings` VALUES (66, 'notes', 'Thanks for order', '2024-07-19 02:58:05', '2024-07-19 02:58:05');

-- ----------------------------
-- Table structure for sms_settings
-- ----------------------------
DROP TABLE IF EXISTS `sms_settings`;
CREATE TABLE `sms_settings`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_settings
-- ----------------------------
INSERT INTO `sms_settings` VALUES (1, 'url', 'http://test.com/api/test.php', '2024-03-27 15:30:30', '2024-03-27 15:30:30');
INSERT INTO `sms_settings` VALUES (2, 'mobile_key', '', '2024-03-27 15:30:30', '2024-03-27 15:30:30');
INSERT INTO `sms_settings` VALUES (3, 'message_key', '', '2024-03-27 15:30:30', '2024-03-27 15:30:30');
INSERT INTO `sms_settings` VALUES (4, 'payload', '', '2024-03-27 15:30:30', '2024-03-27 15:30:30');

-- ----------------------------
-- Table structure for sms_templates
-- ----------------------------
DROP TABLE IF EXISTS `sms_templates`;
CREATE TABLE `sms_templates`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `template_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_templates
-- ----------------------------
INSERT INTO `sms_templates` VALUES (1, 'GREETING TO CUSTOMER ON SALES !', 'Hi {customer_name}, Your sales Id is {sales_id}, Sales Date {sales_date}, Total Amount {sales_amount}, You have paid {paid_amount}, and customer total due amount is {due_amount} Thank you visit again', '1', '2024-03-27 15:30:30', '2024-03-27 15:30:30', 0);
INSERT INTO `sms_templates` VALUES (2, 'GREETING TO CUSTOMER ON SALES RETURN !', 'Hi {customer_name}, Your sales return Id is {sales_return_id}, Sales return Date {sales_return_date}, and Total Amount is {sales_return_amount} Thank you visit again', '2', '2024-03-27 15:30:30', '2024-03-27 15:30:30', 0);

-- ----------------------------
-- Table structure for states
-- ----------------------------
DROP TABLE IF EXISTS `states`;
CREATE TABLE `states`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(170) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `states_country_id_foreign`(`country_id`) USING BTREE,
  CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4122 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of states
-- ----------------------------
INSERT INTO `states` VALUES (1, 'Andaman and Nicobar Islands', 101, NULL, NULL);
INSERT INTO `states` VALUES (2, 'Andhra Pradesh', 101, NULL, NULL);
INSERT INTO `states` VALUES (3, 'Arunachal Pradesh', 101, NULL, NULL);
INSERT INTO `states` VALUES (4, 'Assam', 101, NULL, NULL);
INSERT INTO `states` VALUES (5, 'Bihar', 101, NULL, NULL);
INSERT INTO `states` VALUES (6, 'Chandigarh', 101, NULL, NULL);
INSERT INTO `states` VALUES (7, 'Chhattisgarh', 101, NULL, NULL);
INSERT INTO `states` VALUES (8, 'Dadra and Nagar Haveli', 101, NULL, NULL);
INSERT INTO `states` VALUES (9, 'Daman and Diu', 101, NULL, NULL);
INSERT INTO `states` VALUES (10, 'Delhi', 101, NULL, NULL);
INSERT INTO `states` VALUES (11, 'Goa', 101, NULL, NULL);
INSERT INTO `states` VALUES (12, 'Gujarat', 101, NULL, NULL);
INSERT INTO `states` VALUES (13, 'Haryana', 101, NULL, NULL);
INSERT INTO `states` VALUES (14, 'Himachal Pradesh', 101, NULL, NULL);
INSERT INTO `states` VALUES (15, 'Jammu and Kashmir', 101, NULL, NULL);
INSERT INTO `states` VALUES (16, 'Jharkhand', 101, NULL, NULL);
INSERT INTO `states` VALUES (17, 'Karnataka', 101, NULL, NULL);
INSERT INTO `states` VALUES (19, 'Kerala', 101, NULL, NULL);
INSERT INTO `states` VALUES (20, 'Lakshadweep', 101, NULL, NULL);
INSERT INTO `states` VALUES (21, 'Madhya Pradesh', 101, NULL, NULL);
INSERT INTO `states` VALUES (22, 'Maharashtra', 101, NULL, NULL);
INSERT INTO `states` VALUES (23, 'Manipur', 101, NULL, NULL);
INSERT INTO `states` VALUES (24, 'Meghalaya', 101, NULL, NULL);
INSERT INTO `states` VALUES (25, 'Mizoram', 101, NULL, NULL);
INSERT INTO `states` VALUES (26, 'Nagaland', 101, NULL, NULL);
INSERT INTO `states` VALUES (29, 'Odisha', 101, NULL, NULL);
INSERT INTO `states` VALUES (31, 'Pondicherry', 101, NULL, NULL);
INSERT INTO `states` VALUES (32, 'Punjab', 101, NULL, NULL);
INSERT INTO `states` VALUES (33, 'Rajasthan', 101, NULL, NULL);
INSERT INTO `states` VALUES (34, 'Sikkim', 101, NULL, NULL);
INSERT INTO `states` VALUES (35, 'Tamil Nadu', 101, NULL, NULL);
INSERT INTO `states` VALUES (36, 'Telangana', 101, NULL, NULL);
INSERT INTO `states` VALUES (37, 'Tripura', 101, NULL, NULL);
INSERT INTO `states` VALUES (38, 'Uttar Pradesh', 101, NULL, NULL);
INSERT INTO `states` VALUES (39, 'Uttarakhand', 101, NULL, NULL);
INSERT INTO `states` VALUES (41, 'West Bengal', 101, NULL, NULL);
INSERT INTO `states` VALUES (42, 'Badakhshan', 1, NULL, NULL);
INSERT INTO `states` VALUES (43, 'Badgis', 1, NULL, NULL);
INSERT INTO `states` VALUES (44, 'Baglan', 1, NULL, NULL);
INSERT INTO `states` VALUES (45, 'Balkh', 1, NULL, NULL);
INSERT INTO `states` VALUES (46, 'Bamiyan', 1, NULL, NULL);
INSERT INTO `states` VALUES (47, 'Farah', 1, NULL, NULL);
INSERT INTO `states` VALUES (48, 'Faryab', 1, NULL, NULL);
INSERT INTO `states` VALUES (49, 'Gawr', 1, NULL, NULL);
INSERT INTO `states` VALUES (50, 'Gazni', 1, NULL, NULL);
INSERT INTO `states` VALUES (51, 'Herat', 1, NULL, NULL);
INSERT INTO `states` VALUES (52, 'Hilmand', 1, NULL, NULL);
INSERT INTO `states` VALUES (53, 'Jawzjan', 1, NULL, NULL);
INSERT INTO `states` VALUES (54, 'Kabul', 1, NULL, NULL);
INSERT INTO `states` VALUES (55, 'Kapisa', 1, NULL, NULL);
INSERT INTO `states` VALUES (56, 'Khawst', 1, NULL, NULL);
INSERT INTO `states` VALUES (57, 'Kunar', 1, NULL, NULL);
INSERT INTO `states` VALUES (58, 'Lagman', 1, NULL, NULL);
INSERT INTO `states` VALUES (59, 'Lawghar', 1, NULL, NULL);
INSERT INTO `states` VALUES (60, 'Nangarhar', 1, NULL, NULL);
INSERT INTO `states` VALUES (61, 'Nimruz', 1, NULL, NULL);
INSERT INTO `states` VALUES (62, 'Nuristan', 1, NULL, NULL);
INSERT INTO `states` VALUES (63, 'Paktika', 1, NULL, NULL);
INSERT INTO `states` VALUES (64, 'Paktiya', 1, NULL, NULL);
INSERT INTO `states` VALUES (65, 'Parwan', 1, NULL, NULL);
INSERT INTO `states` VALUES (66, 'Qandahar', 1, NULL, NULL);
INSERT INTO `states` VALUES (67, 'Qunduz', 1, NULL, NULL);
INSERT INTO `states` VALUES (68, 'Samangan', 1, NULL, NULL);
INSERT INTO `states` VALUES (69, 'Sar-e Pul', 1, NULL, NULL);
INSERT INTO `states` VALUES (70, 'Takhar', 1, NULL, NULL);
INSERT INTO `states` VALUES (71, 'Uruzgan', 1, NULL, NULL);
INSERT INTO `states` VALUES (72, 'Wardag', 1, NULL, NULL);
INSERT INTO `states` VALUES (73, 'Zabul', 1, NULL, NULL);
INSERT INTO `states` VALUES (74, 'Berat', 2, NULL, NULL);
INSERT INTO `states` VALUES (75, 'Bulqize', 2, NULL, NULL);
INSERT INTO `states` VALUES (76, 'Delvine', 2, NULL, NULL);
INSERT INTO `states` VALUES (77, 'Devoll', 2, NULL, NULL);
INSERT INTO `states` VALUES (78, 'Dibre', 2, NULL, NULL);
INSERT INTO `states` VALUES (79, 'Durres', 2, NULL, NULL);
INSERT INTO `states` VALUES (80, 'Elbasan', 2, NULL, NULL);
INSERT INTO `states` VALUES (81, 'Fier', 2, NULL, NULL);
INSERT INTO `states` VALUES (82, 'Gjirokaster', 2, NULL, NULL);
INSERT INTO `states` VALUES (83, 'Gramsh', 2, NULL, NULL);
INSERT INTO `states` VALUES (84, 'Has', 2, NULL, NULL);
INSERT INTO `states` VALUES (85, 'Kavaje', 2, NULL, NULL);
INSERT INTO `states` VALUES (86, 'Kolonje', 2, NULL, NULL);
INSERT INTO `states` VALUES (87, 'Korce', 2, NULL, NULL);
INSERT INTO `states` VALUES (88, 'Kruje', 2, NULL, NULL);
INSERT INTO `states` VALUES (89, 'Kucove', 2, NULL, NULL);
INSERT INTO `states` VALUES (90, 'Kukes', 2, NULL, NULL);
INSERT INTO `states` VALUES (91, 'Kurbin', 2, NULL, NULL);
INSERT INTO `states` VALUES (92, 'Lezhe', 2, NULL, NULL);
INSERT INTO `states` VALUES (93, 'Librazhd', 2, NULL, NULL);
INSERT INTO `states` VALUES (94, 'Lushnje', 2, NULL, NULL);
INSERT INTO `states` VALUES (95, 'Mallakaster', 2, NULL, NULL);
INSERT INTO `states` VALUES (96, 'Malsi e Madhe', 2, NULL, NULL);
INSERT INTO `states` VALUES (97, 'Mat', 2, NULL, NULL);
INSERT INTO `states` VALUES (98, 'Mirdite', 2, NULL, NULL);
INSERT INTO `states` VALUES (99, 'Peqin', 2, NULL, NULL);
INSERT INTO `states` VALUES (100, 'Permet', 2, NULL, NULL);
INSERT INTO `states` VALUES (101, 'Pogradec', 2, NULL, NULL);
INSERT INTO `states` VALUES (102, 'Puke', 2, NULL, NULL);
INSERT INTO `states` VALUES (103, 'Sarande', 2, NULL, NULL);
INSERT INTO `states` VALUES (104, 'Shkoder', 2, NULL, NULL);
INSERT INTO `states` VALUES (105, 'Skrapar', 2, NULL, NULL);
INSERT INTO `states` VALUES (106, 'Tepelene', 2, NULL, NULL);
INSERT INTO `states` VALUES (107, 'Tirane', 2, NULL, NULL);
INSERT INTO `states` VALUES (108, 'Tropoje', 2, NULL, NULL);
INSERT INTO `states` VALUES (109, 'Vlore', 2, NULL, NULL);
INSERT INTO `states` VALUES (110, 'Ayn Daflah', 3, NULL, NULL);
INSERT INTO `states` VALUES (111, 'Ayn Tamushanat', 3, NULL, NULL);
INSERT INTO `states` VALUES (112, 'Adrar', 3, NULL, NULL);
INSERT INTO `states` VALUES (113, 'Algiers', 3, NULL, NULL);
INSERT INTO `states` VALUES (114, 'Annabah', 3, NULL, NULL);
INSERT INTO `states` VALUES (115, 'Bashshar', 3, NULL, NULL);
INSERT INTO `states` VALUES (116, 'Batnah', 3, NULL, NULL);
INSERT INTO `states` VALUES (117, 'Bijayah', 3, NULL, NULL);
INSERT INTO `states` VALUES (118, 'Biskrah', 3, NULL, NULL);
INSERT INTO `states` VALUES (119, 'Blidah', 3, NULL, NULL);
INSERT INTO `states` VALUES (120, 'Buirah', 3, NULL, NULL);
INSERT INTO `states` VALUES (121, 'Bumardas', 3, NULL, NULL);
INSERT INTO `states` VALUES (122, 'Burj Bu Arririj', 3, NULL, NULL);
INSERT INTO `states` VALUES (123, 'Ghalizan', 3, NULL, NULL);
INSERT INTO `states` VALUES (124, 'Ghardayah', 3, NULL, NULL);
INSERT INTO `states` VALUES (125, 'Ilizi', 3, NULL, NULL);
INSERT INTO `states` VALUES (126, 'Jijili', 3, NULL, NULL);
INSERT INTO `states` VALUES (127, 'Jilfah', 3, NULL, NULL);
INSERT INTO `states` VALUES (128, 'Khanshalah', 3, NULL, NULL);
INSERT INTO `states` VALUES (129, 'Masilah', 3, NULL, NULL);
INSERT INTO `states` VALUES (130, 'Midyah', 3, NULL, NULL);
INSERT INTO `states` VALUES (131, 'Milah', 3, NULL, NULL);
INSERT INTO `states` VALUES (132, 'Muaskar', 3, NULL, NULL);
INSERT INTO `states` VALUES (133, 'Mustaghanam', 3, NULL, NULL);
INSERT INTO `states` VALUES (134, 'Naama', 3, NULL, NULL);
INSERT INTO `states` VALUES (135, 'Oran', 3, NULL, NULL);
INSERT INTO `states` VALUES (136, 'Ouargla', 3, NULL, NULL);
INSERT INTO `states` VALUES (137, 'Qalmah', 3, NULL, NULL);
INSERT INTO `states` VALUES (138, 'Qustantinah', 3, NULL, NULL);
INSERT INTO `states` VALUES (139, 'Sakikdah', 3, NULL, NULL);
INSERT INTO `states` VALUES (140, 'Satif', 3, NULL, NULL);
INSERT INTO `states` VALUES (141, 'Sayda', 3, NULL, NULL);
INSERT INTO `states` VALUES (142, 'Sidi ban-al-\'\'Abbas', 3, NULL, NULL);
INSERT INTO `states` VALUES (143, 'Suq Ahras', 3, NULL, NULL);
INSERT INTO `states` VALUES (144, 'Tamanghasat', 3, NULL, NULL);
INSERT INTO `states` VALUES (145, 'Tibazah', 3, NULL, NULL);
INSERT INTO `states` VALUES (146, 'Tibissah', 3, NULL, NULL);
INSERT INTO `states` VALUES (147, 'Tilimsan', 3, NULL, NULL);
INSERT INTO `states` VALUES (148, 'Tinduf', 3, NULL, NULL);
INSERT INTO `states` VALUES (149, 'Tisamsilt', 3, NULL, NULL);
INSERT INTO `states` VALUES (150, 'Tiyarat', 3, NULL, NULL);
INSERT INTO `states` VALUES (151, 'Tizi Wazu', 3, NULL, NULL);
INSERT INTO `states` VALUES (152, 'Umm-al-Bawaghi', 3, NULL, NULL);
INSERT INTO `states` VALUES (153, 'Wahran', 3, NULL, NULL);
INSERT INTO `states` VALUES (154, 'Warqla', 3, NULL, NULL);
INSERT INTO `states` VALUES (155, 'Wilaya d Alger', 3, NULL, NULL);
INSERT INTO `states` VALUES (156, 'Wilaya de Bejaia', 3, NULL, NULL);
INSERT INTO `states` VALUES (157, 'Wilaya de Constantine', 3, NULL, NULL);
INSERT INTO `states` VALUES (158, 'al-Aghwat', 3, NULL, NULL);
INSERT INTO `states` VALUES (159, 'al-Bayadh', 3, NULL, NULL);
INSERT INTO `states` VALUES (160, 'al-Jaza\'\'ir', 3, NULL, NULL);
INSERT INTO `states` VALUES (161, 'al-Wad', 3, NULL, NULL);
INSERT INTO `states` VALUES (162, 'ash-Shalif', 3, NULL, NULL);
INSERT INTO `states` VALUES (163, 'at-Tarif', 3, NULL, NULL);
INSERT INTO `states` VALUES (164, 'Eastern', 4, NULL, NULL);
INSERT INTO `states` VALUES (165, 'Manu\'\'a', 4, NULL, NULL);
INSERT INTO `states` VALUES (166, 'Swains Island', 4, NULL, NULL);
INSERT INTO `states` VALUES (167, 'Western', 4, NULL, NULL);
INSERT INTO `states` VALUES (168, 'Andorra la Vella', 5, NULL, NULL);
INSERT INTO `states` VALUES (169, 'Canillo', 5, NULL, NULL);
INSERT INTO `states` VALUES (170, 'Encamp', 5, NULL, NULL);
INSERT INTO `states` VALUES (171, 'La Massana', 5, NULL, NULL);
INSERT INTO `states` VALUES (172, 'Les Escaldes', 5, NULL, NULL);
INSERT INTO `states` VALUES (173, 'Ordino', 5, NULL, NULL);
INSERT INTO `states` VALUES (174, 'Sant Julia de Loria', 5, NULL, NULL);
INSERT INTO `states` VALUES (175, 'Bengo', 6, NULL, NULL);
INSERT INTO `states` VALUES (176, 'Benguela', 6, NULL, NULL);
INSERT INTO `states` VALUES (177, 'Bie', 6, NULL, NULL);
INSERT INTO `states` VALUES (178, 'Cabinda', 6, NULL, NULL);
INSERT INTO `states` VALUES (179, 'Cunene', 6, NULL, NULL);
INSERT INTO `states` VALUES (180, 'Huambo', 6, NULL, NULL);
INSERT INTO `states` VALUES (181, 'Huila', 6, NULL, NULL);
INSERT INTO `states` VALUES (182, 'Kuando-Kubango', 6, NULL, NULL);
INSERT INTO `states` VALUES (183, 'Kwanza Norte', 6, NULL, NULL);
INSERT INTO `states` VALUES (184, 'Kwanza Sul', 6, NULL, NULL);
INSERT INTO `states` VALUES (185, 'Luanda', 6, NULL, NULL);
INSERT INTO `states` VALUES (186, 'Lunda Norte', 6, NULL, NULL);
INSERT INTO `states` VALUES (187, 'Lunda Sul', 6, NULL, NULL);
INSERT INTO `states` VALUES (188, 'Malanje', 6, NULL, NULL);
INSERT INTO `states` VALUES (189, 'Moxico', 6, NULL, NULL);
INSERT INTO `states` VALUES (190, 'Namibe', 6, NULL, NULL);
INSERT INTO `states` VALUES (191, 'Uige', 6, NULL, NULL);
INSERT INTO `states` VALUES (192, 'Zaire', 6, NULL, NULL);
INSERT INTO `states` VALUES (193, 'Other Provinces', 7, NULL, NULL);
INSERT INTO `states` VALUES (194, 'Sector claimed by Argentina/Ch', 8, NULL, NULL);
INSERT INTO `states` VALUES (195, 'Sector claimed by Argentina/UK', 8, NULL, NULL);
INSERT INTO `states` VALUES (196, 'Sector claimed by Australia', 8, NULL, NULL);
INSERT INTO `states` VALUES (197, 'Sector claimed by France', 8, NULL, NULL);
INSERT INTO `states` VALUES (198, 'Sector claimed by New Zealand', 8, NULL, NULL);
INSERT INTO `states` VALUES (199, 'Sector claimed by Norway', 8, NULL, NULL);
INSERT INTO `states` VALUES (200, 'Unclaimed Sector', 8, NULL, NULL);
INSERT INTO `states` VALUES (201, 'Barbuda', 9, NULL, NULL);
INSERT INTO `states` VALUES (202, 'Saint George', 9, NULL, NULL);
INSERT INTO `states` VALUES (203, 'Saint John', 9, NULL, NULL);
INSERT INTO `states` VALUES (204, 'Saint Mary', 9, NULL, NULL);
INSERT INTO `states` VALUES (205, 'Saint Paul', 9, NULL, NULL);
INSERT INTO `states` VALUES (206, 'Saint Peter', 9, NULL, NULL);
INSERT INTO `states` VALUES (207, 'Saint Philip', 9, NULL, NULL);
INSERT INTO `states` VALUES (208, 'Buenos Aires', 10, NULL, NULL);
INSERT INTO `states` VALUES (209, 'Catamarca', 10, NULL, NULL);
INSERT INTO `states` VALUES (210, 'Chaco', 10, NULL, NULL);
INSERT INTO `states` VALUES (211, 'Chubut', 10, NULL, NULL);
INSERT INTO `states` VALUES (212, 'Cordoba', 10, NULL, NULL);
INSERT INTO `states` VALUES (213, 'Corrientes', 10, NULL, NULL);
INSERT INTO `states` VALUES (214, 'Distrito Federal', 10, NULL, NULL);
INSERT INTO `states` VALUES (215, 'Entre Rios', 10, NULL, NULL);
INSERT INTO `states` VALUES (216, 'Formosa', 10, NULL, NULL);
INSERT INTO `states` VALUES (217, 'Jujuy', 10, NULL, NULL);
INSERT INTO `states` VALUES (218, 'La Pampa', 10, NULL, NULL);
INSERT INTO `states` VALUES (219, 'La Rioja', 10, NULL, NULL);
INSERT INTO `states` VALUES (220, 'Mendoza', 10, NULL, NULL);
INSERT INTO `states` VALUES (221, 'Misiones', 10, NULL, NULL);
INSERT INTO `states` VALUES (222, 'Neuquen', 10, NULL, NULL);
INSERT INTO `states` VALUES (223, 'Rio Negro', 10, NULL, NULL);
INSERT INTO `states` VALUES (224, 'Salta', 10, NULL, NULL);
INSERT INTO `states` VALUES (225, 'San Juan', 10, NULL, NULL);
INSERT INTO `states` VALUES (226, 'San Luis', 10, NULL, NULL);
INSERT INTO `states` VALUES (227, 'Santa Cruz', 10, NULL, NULL);
INSERT INTO `states` VALUES (228, 'Santa Fe', 10, NULL, NULL);
INSERT INTO `states` VALUES (229, 'Santiago del Estero', 10, NULL, NULL);
INSERT INTO `states` VALUES (230, 'Tierra del Fuego', 10, NULL, NULL);
INSERT INTO `states` VALUES (231, 'Tucuman', 10, NULL, NULL);
INSERT INTO `states` VALUES (232, 'Aragatsotn', 11, NULL, NULL);
INSERT INTO `states` VALUES (233, 'Ararat', 11, NULL, NULL);
INSERT INTO `states` VALUES (234, 'Armavir', 11, NULL, NULL);
INSERT INTO `states` VALUES (235, 'Gegharkunik', 11, NULL, NULL);
INSERT INTO `states` VALUES (236, 'Kotaik', 11, NULL, NULL);
INSERT INTO `states` VALUES (237, 'Lori', 11, NULL, NULL);
INSERT INTO `states` VALUES (238, 'Shirak', 11, NULL, NULL);
INSERT INTO `states` VALUES (239, 'Stepanakert', 11, NULL, NULL);
INSERT INTO `states` VALUES (240, 'Syunik', 11, NULL, NULL);
INSERT INTO `states` VALUES (241, 'Tavush', 11, NULL, NULL);
INSERT INTO `states` VALUES (242, 'Vayots Dzor', 11, NULL, NULL);
INSERT INTO `states` VALUES (243, 'Yerevan', 11, NULL, NULL);
INSERT INTO `states` VALUES (244, 'Aruba', 12, NULL, NULL);
INSERT INTO `states` VALUES (245, 'Auckland', 13, NULL, NULL);
INSERT INTO `states` VALUES (246, 'Australian Capital Territory', 13, NULL, NULL);
INSERT INTO `states` VALUES (247, 'Balgowlah', 13, NULL, NULL);
INSERT INTO `states` VALUES (248, 'Balmain', 13, NULL, NULL);
INSERT INTO `states` VALUES (249, 'Bankstown', 13, NULL, NULL);
INSERT INTO `states` VALUES (250, 'Baulkham Hills', 13, NULL, NULL);
INSERT INTO `states` VALUES (251, 'Bonnet Bay', 13, NULL, NULL);
INSERT INTO `states` VALUES (252, 'Camberwell', 13, NULL, NULL);
INSERT INTO `states` VALUES (253, 'Carole Park', 13, NULL, NULL);
INSERT INTO `states` VALUES (254, 'Castle Hill', 13, NULL, NULL);
INSERT INTO `states` VALUES (255, 'Caulfield', 13, NULL, NULL);
INSERT INTO `states` VALUES (256, 'Chatswood', 13, NULL, NULL);
INSERT INTO `states` VALUES (257, 'Cheltenham', 13, NULL, NULL);
INSERT INTO `states` VALUES (258, 'Cherrybrook', 13, NULL, NULL);
INSERT INTO `states` VALUES (259, 'Clayton', 13, NULL, NULL);
INSERT INTO `states` VALUES (260, 'Collingwood', 13, NULL, NULL);
INSERT INTO `states` VALUES (261, 'Frenchs Forest', 13, NULL, NULL);
INSERT INTO `states` VALUES (262, 'Hawthorn', 13, NULL, NULL);
INSERT INTO `states` VALUES (263, 'Jannnali', 13, NULL, NULL);
INSERT INTO `states` VALUES (264, 'Knoxfield', 13, NULL, NULL);
INSERT INTO `states` VALUES (265, 'Melbourne', 13, NULL, NULL);
INSERT INTO `states` VALUES (266, 'New South Wales', 13, NULL, NULL);
INSERT INTO `states` VALUES (267, 'Northern Territory', 13, NULL, NULL);
INSERT INTO `states` VALUES (268, 'Perth', 13, NULL, NULL);
INSERT INTO `states` VALUES (269, 'Queensland', 13, NULL, NULL);
INSERT INTO `states` VALUES (270, 'South Australia', 13, NULL, NULL);
INSERT INTO `states` VALUES (271, 'Tasmania', 13, NULL, NULL);
INSERT INTO `states` VALUES (272, 'Templestowe', 13, NULL, NULL);
INSERT INTO `states` VALUES (273, 'Victoria', 13, NULL, NULL);
INSERT INTO `states` VALUES (274, 'Werribee south', 13, NULL, NULL);
INSERT INTO `states` VALUES (275, 'Western Australia', 13, NULL, NULL);
INSERT INTO `states` VALUES (276, 'Wheeler', 13, NULL, NULL);
INSERT INTO `states` VALUES (277, 'Bundesland Salzburg', 14, NULL, NULL);
INSERT INTO `states` VALUES (278, 'Bundesland Steiermark', 14, NULL, NULL);
INSERT INTO `states` VALUES (279, 'Bundesland Tirol', 14, NULL, NULL);
INSERT INTO `states` VALUES (280, 'Burgenland', 14, NULL, NULL);
INSERT INTO `states` VALUES (281, 'Carinthia', 14, NULL, NULL);
INSERT INTO `states` VALUES (282, 'Karnten', 14, NULL, NULL);
INSERT INTO `states` VALUES (283, 'Liezen', 14, NULL, NULL);
INSERT INTO `states` VALUES (284, 'Lower Austria', 14, NULL, NULL);
INSERT INTO `states` VALUES (285, 'Niederosterreich', 14, NULL, NULL);
INSERT INTO `states` VALUES (286, 'Oberosterreich', 14, NULL, NULL);
INSERT INTO `states` VALUES (287, 'Salzburg', 14, NULL, NULL);
INSERT INTO `states` VALUES (288, 'Schleswig-Holstein', 14, NULL, NULL);
INSERT INTO `states` VALUES (289, 'Steiermark', 14, NULL, NULL);
INSERT INTO `states` VALUES (290, 'Styria', 14, NULL, NULL);
INSERT INTO `states` VALUES (291, 'Tirol', 14, NULL, NULL);
INSERT INTO `states` VALUES (292, 'Upper Austria', 14, NULL, NULL);
INSERT INTO `states` VALUES (293, 'Vorarlberg', 14, NULL, NULL);
INSERT INTO `states` VALUES (294, 'Wien', 14, NULL, NULL);
INSERT INTO `states` VALUES (295, 'Abseron', 15, NULL, NULL);
INSERT INTO `states` VALUES (296, 'Baki Sahari', 15, NULL, NULL);
INSERT INTO `states` VALUES (297, 'Ganca', 15, NULL, NULL);
INSERT INTO `states` VALUES (298, 'Ganja', 15, NULL, NULL);
INSERT INTO `states` VALUES (299, 'Kalbacar', 15, NULL, NULL);
INSERT INTO `states` VALUES (300, 'Lankaran', 15, NULL, NULL);
INSERT INTO `states` VALUES (301, 'Mil-Qarabax', 15, NULL, NULL);
INSERT INTO `states` VALUES (302, 'Mugan-Salyan', 15, NULL, NULL);
INSERT INTO `states` VALUES (303, 'Nagorni-Qarabax', 15, NULL, NULL);
INSERT INTO `states` VALUES (304, 'Naxcivan', 15, NULL, NULL);
INSERT INTO `states` VALUES (305, 'Priaraks', 15, NULL, NULL);
INSERT INTO `states` VALUES (306, 'Qazax', 15, NULL, NULL);
INSERT INTO `states` VALUES (307, 'Saki', 15, NULL, NULL);
INSERT INTO `states` VALUES (308, 'Sirvan', 15, NULL, NULL);
INSERT INTO `states` VALUES (309, 'Xacmaz', 15, NULL, NULL);
INSERT INTO `states` VALUES (310, 'Abaco', 16, NULL, NULL);
INSERT INTO `states` VALUES (311, 'Acklins Island', 16, NULL, NULL);
INSERT INTO `states` VALUES (312, 'Andros', 16, NULL, NULL);
INSERT INTO `states` VALUES (313, 'Berry Islands', 16, NULL, NULL);
INSERT INTO `states` VALUES (314, 'Biminis', 16, NULL, NULL);
INSERT INTO `states` VALUES (315, 'Cat Island', 16, NULL, NULL);
INSERT INTO `states` VALUES (316, 'Crooked Island', 16, NULL, NULL);
INSERT INTO `states` VALUES (317, 'Eleuthera', 16, NULL, NULL);
INSERT INTO `states` VALUES (318, 'Exuma and Cays', 16, NULL, NULL);
INSERT INTO `states` VALUES (319, 'Grand Bahama', 16, NULL, NULL);
INSERT INTO `states` VALUES (320, 'Inagua Islands', 16, NULL, NULL);
INSERT INTO `states` VALUES (321, 'Long Island', 16, NULL, NULL);
INSERT INTO `states` VALUES (322, 'Mayaguana', 16, NULL, NULL);
INSERT INTO `states` VALUES (323, 'New Providence', 16, NULL, NULL);
INSERT INTO `states` VALUES (324, 'Ragged Island', 16, NULL, NULL);
INSERT INTO `states` VALUES (325, 'Rum Cay', 16, NULL, NULL);
INSERT INTO `states` VALUES (326, 'San Salvador', 16, NULL, NULL);
INSERT INTO `states` VALUES (327, 'Isa', 17, NULL, NULL);
INSERT INTO `states` VALUES (328, 'Badiyah', 17, NULL, NULL);
INSERT INTO `states` VALUES (329, 'Hidd', 17, NULL, NULL);
INSERT INTO `states` VALUES (330, 'Jidd Hafs', 17, NULL, NULL);
INSERT INTO `states` VALUES (331, 'Mahama', 17, NULL, NULL);
INSERT INTO `states` VALUES (332, 'Manama', 17, NULL, NULL);
INSERT INTO `states` VALUES (333, 'Sitrah', 17, NULL, NULL);
INSERT INTO `states` VALUES (334, 'al-Manamah', 17, NULL, NULL);
INSERT INTO `states` VALUES (335, 'al-Muharraq', 17, NULL, NULL);
INSERT INTO `states` VALUES (336, 'ar-Rifa\'\'a', 17, NULL, NULL);
INSERT INTO `states` VALUES (337, 'Bagar Hat', 18, NULL, NULL);
INSERT INTO `states` VALUES (338, 'Bandarban', 18, NULL, NULL);
INSERT INTO `states` VALUES (339, 'Barguna', 18, NULL, NULL);
INSERT INTO `states` VALUES (340, 'Barisal', 18, NULL, NULL);
INSERT INTO `states` VALUES (341, 'Bhola', 18, NULL, NULL);
INSERT INTO `states` VALUES (342, 'Bogora', 18, NULL, NULL);
INSERT INTO `states` VALUES (343, 'Brahman Bariya', 18, NULL, NULL);
INSERT INTO `states` VALUES (344, 'Chandpur', 18, NULL, NULL);
INSERT INTO `states` VALUES (345, 'Chattagam', 18, NULL, NULL);
INSERT INTO `states` VALUES (346, 'Chittagong Division', 18, NULL, NULL);
INSERT INTO `states` VALUES (347, 'Chuadanga', 18, NULL, NULL);
INSERT INTO `states` VALUES (348, 'Dhaka', 18, NULL, NULL);
INSERT INTO `states` VALUES (349, 'Dinajpur', 18, NULL, NULL);
INSERT INTO `states` VALUES (350, 'Faridpur', 18, NULL, NULL);
INSERT INTO `states` VALUES (351, 'Feni', 18, NULL, NULL);
INSERT INTO `states` VALUES (352, 'Gaybanda', 18, NULL, NULL);
INSERT INTO `states` VALUES (353, 'Gazipur', 18, NULL, NULL);
INSERT INTO `states` VALUES (354, 'Gopalganj', 18, NULL, NULL);
INSERT INTO `states` VALUES (355, 'Habiganj', 18, NULL, NULL);
INSERT INTO `states` VALUES (356, 'Jaipur Hat', 18, NULL, NULL);
INSERT INTO `states` VALUES (357, 'Jamalpur', 18, NULL, NULL);
INSERT INTO `states` VALUES (358, 'Jessor', 18, NULL, NULL);
INSERT INTO `states` VALUES (359, 'Jhalakati', 18, NULL, NULL);
INSERT INTO `states` VALUES (360, 'Jhanaydah', 18, NULL, NULL);
INSERT INTO `states` VALUES (361, 'Khagrachhari', 18, NULL, NULL);
INSERT INTO `states` VALUES (362, 'Khulna', 18, NULL, NULL);
INSERT INTO `states` VALUES (363, 'Kishorganj', 18, NULL, NULL);
INSERT INTO `states` VALUES (364, 'Koks Bazar', 18, NULL, NULL);
INSERT INTO `states` VALUES (365, 'Komilla', 18, NULL, NULL);
INSERT INTO `states` VALUES (366, 'Kurigram', 18, NULL, NULL);
INSERT INTO `states` VALUES (367, 'Kushtiya', 18, NULL, NULL);
INSERT INTO `states` VALUES (368, 'Lakshmipur', 18, NULL, NULL);
INSERT INTO `states` VALUES (369, 'Lalmanir Hat', 18, NULL, NULL);
INSERT INTO `states` VALUES (370, 'Madaripur', 18, NULL, NULL);
INSERT INTO `states` VALUES (371, 'Magura', 18, NULL, NULL);
INSERT INTO `states` VALUES (372, 'Maimansingh', 18, NULL, NULL);
INSERT INTO `states` VALUES (373, 'Manikganj', 18, NULL, NULL);
INSERT INTO `states` VALUES (374, 'Maulvi Bazar', 18, NULL, NULL);
INSERT INTO `states` VALUES (375, 'Meherpur', 18, NULL, NULL);
INSERT INTO `states` VALUES (376, 'Munshiganj', 18, NULL, NULL);
INSERT INTO `states` VALUES (377, 'Naral', 18, NULL, NULL);
INSERT INTO `states` VALUES (378, 'Narayanganj', 18, NULL, NULL);
INSERT INTO `states` VALUES (379, 'Narsingdi', 18, NULL, NULL);
INSERT INTO `states` VALUES (380, 'Nator', 18, NULL, NULL);
INSERT INTO `states` VALUES (381, 'Naugaon', 18, NULL, NULL);
INSERT INTO `states` VALUES (382, 'Nawabganj', 18, NULL, NULL);
INSERT INTO `states` VALUES (383, 'Netrakona', 18, NULL, NULL);
INSERT INTO `states` VALUES (384, 'Nilphamari', 18, NULL, NULL);
INSERT INTO `states` VALUES (385, 'Noakhali', 18, NULL, NULL);
INSERT INTO `states` VALUES (386, 'Pabna', 18, NULL, NULL);
INSERT INTO `states` VALUES (387, 'Panchagarh', 18, NULL, NULL);
INSERT INTO `states` VALUES (388, 'Patuakhali', 18, NULL, NULL);
INSERT INTO `states` VALUES (389, 'Pirojpur', 18, NULL, NULL);
INSERT INTO `states` VALUES (390, 'Rajbari', 18, NULL, NULL);
INSERT INTO `states` VALUES (391, 'Rajshahi', 18, NULL, NULL);
INSERT INTO `states` VALUES (392, 'Rangamati', 18, NULL, NULL);
INSERT INTO `states` VALUES (393, 'Rangpur', 18, NULL, NULL);
INSERT INTO `states` VALUES (394, 'Satkhira', 18, NULL, NULL);
INSERT INTO `states` VALUES (395, 'Shariatpur', 18, NULL, NULL);
INSERT INTO `states` VALUES (396, 'Sherpur', 18, NULL, NULL);
INSERT INTO `states` VALUES (397, 'Silhat', 18, NULL, NULL);
INSERT INTO `states` VALUES (398, 'Sirajganj', 18, NULL, NULL);
INSERT INTO `states` VALUES (399, 'Sunamganj', 18, NULL, NULL);
INSERT INTO `states` VALUES (400, 'Tangayal', 18, NULL, NULL);
INSERT INTO `states` VALUES (401, 'Thakurgaon', 18, NULL, NULL);
INSERT INTO `states` VALUES (402, 'Christ Church', 19, NULL, NULL);
INSERT INTO `states` VALUES (403, 'Saint Andrew', 19, NULL, NULL);
INSERT INTO `states` VALUES (404, 'Saint George', 19, NULL, NULL);
INSERT INTO `states` VALUES (405, 'Saint James', 19, NULL, NULL);
INSERT INTO `states` VALUES (406, 'Saint John', 19, NULL, NULL);
INSERT INTO `states` VALUES (407, 'Saint Joseph', 19, NULL, NULL);
INSERT INTO `states` VALUES (408, 'Saint Lucy', 19, NULL, NULL);
INSERT INTO `states` VALUES (409, 'Saint Michael', 19, NULL, NULL);
INSERT INTO `states` VALUES (410, 'Saint Peter', 19, NULL, NULL);
INSERT INTO `states` VALUES (411, 'Saint Philip', 19, NULL, NULL);
INSERT INTO `states` VALUES (412, 'Saint Thomas', 19, NULL, NULL);
INSERT INTO `states` VALUES (413, 'Brest', 20, NULL, NULL);
INSERT INTO `states` VALUES (414, 'Homjel', 20, NULL, NULL);
INSERT INTO `states` VALUES (415, 'Hrodna', 20, NULL, NULL);
INSERT INTO `states` VALUES (416, 'Mahiljow', 20, NULL, NULL);
INSERT INTO `states` VALUES (417, 'Mahilyowskaya Voblasts', 20, NULL, NULL);
INSERT INTO `states` VALUES (418, 'Minsk', 20, NULL, NULL);
INSERT INTO `states` VALUES (419, 'Minskaja Voblasts', 20, NULL, NULL);
INSERT INTO `states` VALUES (420, 'Petrik', 20, NULL, NULL);
INSERT INTO `states` VALUES (421, 'Vicebsk', 20, NULL, NULL);
INSERT INTO `states` VALUES (422, 'Antwerpen', 21, NULL, NULL);
INSERT INTO `states` VALUES (423, 'Berchem', 21, NULL, NULL);
INSERT INTO `states` VALUES (424, 'Brabant', 21, NULL, NULL);
INSERT INTO `states` VALUES (425, 'Brabant Wallon', 21, NULL, NULL);
INSERT INTO `states` VALUES (426, 'Brussel', 21, NULL, NULL);
INSERT INTO `states` VALUES (427, 'East Flanders', 21, NULL, NULL);
INSERT INTO `states` VALUES (428, 'Hainaut', 21, NULL, NULL);
INSERT INTO `states` VALUES (429, 'Liege', 21, NULL, NULL);
INSERT INTO `states` VALUES (430, 'Limburg', 21, NULL, NULL);
INSERT INTO `states` VALUES (431, 'Luxembourg', 21, NULL, NULL);
INSERT INTO `states` VALUES (432, 'Namur', 21, NULL, NULL);
INSERT INTO `states` VALUES (433, 'Ontario', 21, NULL, NULL);
INSERT INTO `states` VALUES (434, 'Oost-Vlaanderen', 21, NULL, NULL);
INSERT INTO `states` VALUES (435, 'Provincie Brabant', 21, NULL, NULL);
INSERT INTO `states` VALUES (436, 'Vlaams-Brabant', 21, NULL, NULL);
INSERT INTO `states` VALUES (437, 'Wallonne', 21, NULL, NULL);
INSERT INTO `states` VALUES (438, 'West-Vlaanderen', 21, NULL, NULL);
INSERT INTO `states` VALUES (439, 'Belize', 22, NULL, NULL);
INSERT INTO `states` VALUES (440, 'Cayo', 22, NULL, NULL);
INSERT INTO `states` VALUES (441, 'Corozal', 22, NULL, NULL);
INSERT INTO `states` VALUES (442, 'Orange Walk', 22, NULL, NULL);
INSERT INTO `states` VALUES (443, 'Stann Creek', 22, NULL, NULL);
INSERT INTO `states` VALUES (444, 'Toledo', 22, NULL, NULL);
INSERT INTO `states` VALUES (445, 'Alibori', 23, NULL, NULL);
INSERT INTO `states` VALUES (446, 'Atacora', 23, NULL, NULL);
INSERT INTO `states` VALUES (447, 'Atlantique', 23, NULL, NULL);
INSERT INTO `states` VALUES (448, 'Borgou', 23, NULL, NULL);
INSERT INTO `states` VALUES (449, 'Collines', 23, NULL, NULL);
INSERT INTO `states` VALUES (450, 'Couffo', 23, NULL, NULL);
INSERT INTO `states` VALUES (451, 'Donga', 23, NULL, NULL);
INSERT INTO `states` VALUES (452, 'Littoral', 23, NULL, NULL);
INSERT INTO `states` VALUES (453, 'Mono', 23, NULL, NULL);
INSERT INTO `states` VALUES (454, 'Oueme', 23, NULL, NULL);
INSERT INTO `states` VALUES (455, 'Plateau', 23, NULL, NULL);
INSERT INTO `states` VALUES (456, 'Zou', 23, NULL, NULL);
INSERT INTO `states` VALUES (457, 'Hamilton', 24, NULL, NULL);
INSERT INTO `states` VALUES (458, 'Saint George', 24, NULL, NULL);
INSERT INTO `states` VALUES (459, 'Bumthang', 25, NULL, NULL);
INSERT INTO `states` VALUES (460, 'Chhukha', 25, NULL, NULL);
INSERT INTO `states` VALUES (461, 'Chirang', 25, NULL, NULL);
INSERT INTO `states` VALUES (462, 'Daga', 25, NULL, NULL);
INSERT INTO `states` VALUES (463, 'Geylegphug', 25, NULL, NULL);
INSERT INTO `states` VALUES (464, 'Ha', 25, NULL, NULL);
INSERT INTO `states` VALUES (465, 'Lhuntshi', 25, NULL, NULL);
INSERT INTO `states` VALUES (466, 'Mongar', 25, NULL, NULL);
INSERT INTO `states` VALUES (467, 'Pemagatsel', 25, NULL, NULL);
INSERT INTO `states` VALUES (468, 'Punakha', 25, NULL, NULL);
INSERT INTO `states` VALUES (469, 'Rinpung', 25, NULL, NULL);
INSERT INTO `states` VALUES (470, 'Samchi', 25, NULL, NULL);
INSERT INTO `states` VALUES (471, 'Samdrup Jongkhar', 25, NULL, NULL);
INSERT INTO `states` VALUES (472, 'Shemgang', 25, NULL, NULL);
INSERT INTO `states` VALUES (473, 'Tashigang', 25, NULL, NULL);
INSERT INTO `states` VALUES (474, 'Timphu', 25, NULL, NULL);
INSERT INTO `states` VALUES (475, 'Tongsa', 25, NULL, NULL);
INSERT INTO `states` VALUES (476, 'Wangdiphodrang', 25, NULL, NULL);
INSERT INTO `states` VALUES (477, 'Beni', 26, NULL, NULL);
INSERT INTO `states` VALUES (478, 'Chuquisaca', 26, NULL, NULL);
INSERT INTO `states` VALUES (479, 'Cochabamba', 26, NULL, NULL);
INSERT INTO `states` VALUES (480, 'La Paz', 26, NULL, NULL);
INSERT INTO `states` VALUES (481, 'Oruro', 26, NULL, NULL);
INSERT INTO `states` VALUES (482, 'Pando', 26, NULL, NULL);
INSERT INTO `states` VALUES (483, 'Potosi', 26, NULL, NULL);
INSERT INTO `states` VALUES (484, 'Santa Cruz', 26, NULL, NULL);
INSERT INTO `states` VALUES (485, 'Tarija', 26, NULL, NULL);
INSERT INTO `states` VALUES (486, 'Federacija Bosna i Hercegovina', 27, NULL, NULL);
INSERT INTO `states` VALUES (487, 'Republika Srpska', 27, NULL, NULL);
INSERT INTO `states` VALUES (488, 'Central Bobonong', 28, NULL, NULL);
INSERT INTO `states` VALUES (489, 'Central Boteti', 28, NULL, NULL);
INSERT INTO `states` VALUES (490, 'Central Mahalapye', 28, NULL, NULL);
INSERT INTO `states` VALUES (491, 'Central Serowe-Palapye', 28, NULL, NULL);
INSERT INTO `states` VALUES (492, 'Central Tutume', 28, NULL, NULL);
INSERT INTO `states` VALUES (493, 'Chobe', 28, NULL, NULL);
INSERT INTO `states` VALUES (494, 'Francistown', 28, NULL, NULL);
INSERT INTO `states` VALUES (495, 'Gaborone', 28, NULL, NULL);
INSERT INTO `states` VALUES (496, 'Ghanzi', 28, NULL, NULL);
INSERT INTO `states` VALUES (497, 'Jwaneng', 28, NULL, NULL);
INSERT INTO `states` VALUES (498, 'Kgalagadi North', 28, NULL, NULL);
INSERT INTO `states` VALUES (499, 'Kgalagadi South', 28, NULL, NULL);
INSERT INTO `states` VALUES (500, 'Kgatleng', 28, NULL, NULL);
INSERT INTO `states` VALUES (501, 'Kweneng', 28, NULL, NULL);
INSERT INTO `states` VALUES (502, 'Lobatse', 28, NULL, NULL);
INSERT INTO `states` VALUES (503, 'Ngamiland', 28, NULL, NULL);
INSERT INTO `states` VALUES (504, 'Ngwaketse', 28, NULL, NULL);
INSERT INTO `states` VALUES (505, 'North East', 28, NULL, NULL);
INSERT INTO `states` VALUES (506, 'Okavango', 28, NULL, NULL);
INSERT INTO `states` VALUES (507, 'Orapa', 28, NULL, NULL);
INSERT INTO `states` VALUES (508, 'Selibe Phikwe', 28, NULL, NULL);
INSERT INTO `states` VALUES (509, 'South East', 28, NULL, NULL);
INSERT INTO `states` VALUES (510, 'Sowa', 28, NULL, NULL);
INSERT INTO `states` VALUES (511, 'Bouvet Island', 29, NULL, NULL);
INSERT INTO `states` VALUES (512, 'Acre', 30, NULL, NULL);
INSERT INTO `states` VALUES (513, 'Alagoas', 30, NULL, NULL);
INSERT INTO `states` VALUES (514, 'Amapa', 30, NULL, NULL);
INSERT INTO `states` VALUES (515, 'Amazonas', 30, NULL, NULL);
INSERT INTO `states` VALUES (516, 'Bahia', 30, NULL, NULL);
INSERT INTO `states` VALUES (517, 'Ceara', 30, NULL, NULL);
INSERT INTO `states` VALUES (518, 'Distrito Federal', 30, NULL, NULL);
INSERT INTO `states` VALUES (519, 'Espirito Santo', 30, NULL, NULL);
INSERT INTO `states` VALUES (520, 'Estado de Sao Paulo', 30, NULL, NULL);
INSERT INTO `states` VALUES (521, 'Goias', 30, NULL, NULL);
INSERT INTO `states` VALUES (522, 'Maranhao', 30, NULL, NULL);
INSERT INTO `states` VALUES (523, 'Mato Grosso', 30, NULL, NULL);
INSERT INTO `states` VALUES (524, 'Mato Grosso do Sul', 30, NULL, NULL);
INSERT INTO `states` VALUES (525, 'Minas Gerais', 30, NULL, NULL);
INSERT INTO `states` VALUES (526, 'Para', 30, NULL, NULL);
INSERT INTO `states` VALUES (527, 'Paraiba', 30, NULL, NULL);
INSERT INTO `states` VALUES (528, 'Parana', 30, NULL, NULL);
INSERT INTO `states` VALUES (529, 'Pernambuco', 30, NULL, NULL);
INSERT INTO `states` VALUES (530, 'Piaui', 30, NULL, NULL);
INSERT INTO `states` VALUES (531, 'Rio Grande do Norte', 30, NULL, NULL);
INSERT INTO `states` VALUES (532, 'Rio Grande do Sul', 30, NULL, NULL);
INSERT INTO `states` VALUES (533, 'Rio de Janeiro', 30, NULL, NULL);
INSERT INTO `states` VALUES (534, 'Rondonia', 30, NULL, NULL);
INSERT INTO `states` VALUES (535, 'Roraima', 30, NULL, NULL);
INSERT INTO `states` VALUES (536, 'Santa Catarina', 30, NULL, NULL);
INSERT INTO `states` VALUES (537, 'Sao Paulo', 30, NULL, NULL);
INSERT INTO `states` VALUES (538, 'Sergipe', 30, NULL, NULL);
INSERT INTO `states` VALUES (539, 'Tocantins', 30, NULL, NULL);
INSERT INTO `states` VALUES (540, 'British Indian Ocean Territory', 31, NULL, NULL);
INSERT INTO `states` VALUES (541, 'Belait', 32, NULL, NULL);
INSERT INTO `states` VALUES (542, 'Brunei-Muara', 32, NULL, NULL);
INSERT INTO `states` VALUES (543, 'Temburong', 32, NULL, NULL);
INSERT INTO `states` VALUES (544, 'Tutong', 32, NULL, NULL);
INSERT INTO `states` VALUES (545, 'Blagoevgrad', 33, NULL, NULL);
INSERT INTO `states` VALUES (546, 'Burgas', 33, NULL, NULL);
INSERT INTO `states` VALUES (547, 'Dobrich', 33, NULL, NULL);
INSERT INTO `states` VALUES (548, 'Gabrovo', 33, NULL, NULL);
INSERT INTO `states` VALUES (549, 'Haskovo', 33, NULL, NULL);
INSERT INTO `states` VALUES (550, 'Jambol', 33, NULL, NULL);
INSERT INTO `states` VALUES (551, 'Kardzhali', 33, NULL, NULL);
INSERT INTO `states` VALUES (552, 'Kjustendil', 33, NULL, NULL);
INSERT INTO `states` VALUES (553, 'Lovech', 33, NULL, NULL);
INSERT INTO `states` VALUES (554, 'Montana', 33, NULL, NULL);
INSERT INTO `states` VALUES (555, 'Oblast Sofiya-Grad', 33, NULL, NULL);
INSERT INTO `states` VALUES (556, 'Pazardzhik', 33, NULL, NULL);
INSERT INTO `states` VALUES (557, 'Pernik', 33, NULL, NULL);
INSERT INTO `states` VALUES (558, 'Pleven', 33, NULL, NULL);
INSERT INTO `states` VALUES (559, 'Plovdiv', 33, NULL, NULL);
INSERT INTO `states` VALUES (560, 'Razgrad', 33, NULL, NULL);
INSERT INTO `states` VALUES (561, 'Ruse', 33, NULL, NULL);
INSERT INTO `states` VALUES (562, 'Shumen', 33, NULL, NULL);
INSERT INTO `states` VALUES (563, 'Silistra', 33, NULL, NULL);
INSERT INTO `states` VALUES (564, 'Sliven', 33, NULL, NULL);
INSERT INTO `states` VALUES (565, 'Smoljan', 33, NULL, NULL);
INSERT INTO `states` VALUES (566, 'Sofija grad', 33, NULL, NULL);
INSERT INTO `states` VALUES (567, 'Sofijska oblast', 33, NULL, NULL);
INSERT INTO `states` VALUES (568, 'Stara Zagora', 33, NULL, NULL);
INSERT INTO `states` VALUES (569, 'Targovishte', 33, NULL, NULL);
INSERT INTO `states` VALUES (570, 'Varna', 33, NULL, NULL);
INSERT INTO `states` VALUES (571, 'Veliko Tarnovo', 33, NULL, NULL);
INSERT INTO `states` VALUES (572, 'Vidin', 33, NULL, NULL);
INSERT INTO `states` VALUES (573, 'Vraca', 33, NULL, NULL);
INSERT INTO `states` VALUES (574, 'Yablaniza', 33, NULL, NULL);
INSERT INTO `states` VALUES (575, 'Bale', 34, NULL, NULL);
INSERT INTO `states` VALUES (576, 'Bam', 34, NULL, NULL);
INSERT INTO `states` VALUES (577, 'Bazega', 34, NULL, NULL);
INSERT INTO `states` VALUES (578, 'Bougouriba', 34, NULL, NULL);
INSERT INTO `states` VALUES (579, 'Boulgou', 34, NULL, NULL);
INSERT INTO `states` VALUES (580, 'Boulkiemde', 34, NULL, NULL);
INSERT INTO `states` VALUES (581, 'Comoe', 34, NULL, NULL);
INSERT INTO `states` VALUES (582, 'Ganzourgou', 34, NULL, NULL);
INSERT INTO `states` VALUES (583, 'Gnagna', 34, NULL, NULL);
INSERT INTO `states` VALUES (584, 'Gourma', 34, NULL, NULL);
INSERT INTO `states` VALUES (585, 'Houet', 34, NULL, NULL);
INSERT INTO `states` VALUES (586, 'Ioba', 34, NULL, NULL);
INSERT INTO `states` VALUES (587, 'Kadiogo', 34, NULL, NULL);
INSERT INTO `states` VALUES (588, 'Kenedougou', 34, NULL, NULL);
INSERT INTO `states` VALUES (589, 'Komandjari', 34, NULL, NULL);
INSERT INTO `states` VALUES (590, 'Kompienga', 34, NULL, NULL);
INSERT INTO `states` VALUES (591, 'Kossi', 34, NULL, NULL);
INSERT INTO `states` VALUES (592, 'Kouritenga', 34, NULL, NULL);
INSERT INTO `states` VALUES (593, 'Kourweogo', 34, NULL, NULL);
INSERT INTO `states` VALUES (594, 'Leraba', 34, NULL, NULL);
INSERT INTO `states` VALUES (595, 'Mouhoun', 34, NULL, NULL);
INSERT INTO `states` VALUES (596, 'Nahouri', 34, NULL, NULL);
INSERT INTO `states` VALUES (597, 'Namentenga', 34, NULL, NULL);
INSERT INTO `states` VALUES (598, 'Noumbiel', 34, NULL, NULL);
INSERT INTO `states` VALUES (599, 'Oubritenga', 34, NULL, NULL);
INSERT INTO `states` VALUES (600, 'Oudalan', 34, NULL, NULL);
INSERT INTO `states` VALUES (601, 'Passore', 34, NULL, NULL);
INSERT INTO `states` VALUES (602, 'Poni', 34, NULL, NULL);
INSERT INTO `states` VALUES (603, 'Sanguie', 34, NULL, NULL);
INSERT INTO `states` VALUES (604, 'Sanmatenga', 34, NULL, NULL);
INSERT INTO `states` VALUES (605, 'Seno', 34, NULL, NULL);
INSERT INTO `states` VALUES (606, 'Sissili', 34, NULL, NULL);
INSERT INTO `states` VALUES (607, 'Soum', 34, NULL, NULL);
INSERT INTO `states` VALUES (608, 'Sourou', 34, NULL, NULL);
INSERT INTO `states` VALUES (609, 'Tapoa', 34, NULL, NULL);
INSERT INTO `states` VALUES (610, 'Tuy', 34, NULL, NULL);
INSERT INTO `states` VALUES (611, 'Yatenga', 34, NULL, NULL);
INSERT INTO `states` VALUES (612, 'Zondoma', 34, NULL, NULL);
INSERT INTO `states` VALUES (613, 'Zoundweogo', 34, NULL, NULL);
INSERT INTO `states` VALUES (614, 'Bubanza', 35, NULL, NULL);
INSERT INTO `states` VALUES (615, 'Bujumbura', 35, NULL, NULL);
INSERT INTO `states` VALUES (616, 'Bururi', 35, NULL, NULL);
INSERT INTO `states` VALUES (617, 'Cankuzo', 35, NULL, NULL);
INSERT INTO `states` VALUES (618, 'Cibitoke', 35, NULL, NULL);
INSERT INTO `states` VALUES (619, 'Gitega', 35, NULL, NULL);
INSERT INTO `states` VALUES (620, 'Karuzi', 35, NULL, NULL);
INSERT INTO `states` VALUES (621, 'Kayanza', 35, NULL, NULL);
INSERT INTO `states` VALUES (622, 'Kirundo', 35, NULL, NULL);
INSERT INTO `states` VALUES (623, 'Makamba', 35, NULL, NULL);
INSERT INTO `states` VALUES (624, 'Muramvya', 35, NULL, NULL);
INSERT INTO `states` VALUES (625, 'Muyinga', 35, NULL, NULL);
INSERT INTO `states` VALUES (626, 'Ngozi', 35, NULL, NULL);
INSERT INTO `states` VALUES (627, 'Rutana', 35, NULL, NULL);
INSERT INTO `states` VALUES (628, 'Ruyigi', 35, NULL, NULL);
INSERT INTO `states` VALUES (629, 'Banteay Mean Chey', 36, NULL, NULL);
INSERT INTO `states` VALUES (630, 'Bat Dambang', 36, NULL, NULL);
INSERT INTO `states` VALUES (631, 'Kampong Cham', 36, NULL, NULL);
INSERT INTO `states` VALUES (632, 'Kampong Chhnang', 36, NULL, NULL);
INSERT INTO `states` VALUES (633, 'Kampong Spoeu', 36, NULL, NULL);
INSERT INTO `states` VALUES (634, 'Kampong Thum', 36, NULL, NULL);
INSERT INTO `states` VALUES (635, 'Kampot', 36, NULL, NULL);
INSERT INTO `states` VALUES (636, 'Kandal', 36, NULL, NULL);
INSERT INTO `states` VALUES (637, 'Kaoh Kong', 36, NULL, NULL);
INSERT INTO `states` VALUES (638, 'Kracheh', 36, NULL, NULL);
INSERT INTO `states` VALUES (639, 'Krong Kaeb', 36, NULL, NULL);
INSERT INTO `states` VALUES (640, 'Krong Pailin', 36, NULL, NULL);
INSERT INTO `states` VALUES (641, 'Krong Preah Sihanouk', 36, NULL, NULL);
INSERT INTO `states` VALUES (642, 'Mondol Kiri', 36, NULL, NULL);
INSERT INTO `states` VALUES (643, 'Otdar Mean Chey', 36, NULL, NULL);
INSERT INTO `states` VALUES (644, 'Phnum Penh', 36, NULL, NULL);
INSERT INTO `states` VALUES (645, 'Pousat', 36, NULL, NULL);
INSERT INTO `states` VALUES (646, 'Preah Vihear', 36, NULL, NULL);
INSERT INTO `states` VALUES (647, 'Prey Veaeng', 36, NULL, NULL);
INSERT INTO `states` VALUES (648, 'Rotanak Kiri', 36, NULL, NULL);
INSERT INTO `states` VALUES (649, 'Siem Reab', 36, NULL, NULL);
INSERT INTO `states` VALUES (650, 'Stueng Traeng', 36, NULL, NULL);
INSERT INTO `states` VALUES (651, 'Svay Rieng', 36, NULL, NULL);
INSERT INTO `states` VALUES (652, 'Takaev', 36, NULL, NULL);
INSERT INTO `states` VALUES (653, 'Adamaoua', 37, NULL, NULL);
INSERT INTO `states` VALUES (654, 'Centre', 37, NULL, NULL);
INSERT INTO `states` VALUES (655, 'Est', 37, NULL, NULL);
INSERT INTO `states` VALUES (656, 'Littoral', 37, NULL, NULL);
INSERT INTO `states` VALUES (657, 'Nord', 37, NULL, NULL);
INSERT INTO `states` VALUES (658, 'Nord Extreme', 37, NULL, NULL);
INSERT INTO `states` VALUES (659, 'Nordouest', 37, NULL, NULL);
INSERT INTO `states` VALUES (660, 'Ouest', 37, NULL, NULL);
INSERT INTO `states` VALUES (661, 'Sud', 37, NULL, NULL);
INSERT INTO `states` VALUES (662, 'Sudouest', 37, NULL, NULL);
INSERT INTO `states` VALUES (663, 'Alberta', 38, NULL, NULL);
INSERT INTO `states` VALUES (664, 'British Columbia', 38, NULL, NULL);
INSERT INTO `states` VALUES (665, 'Manitoba', 38, NULL, NULL);
INSERT INTO `states` VALUES (666, 'New Brunswick', 38, NULL, NULL);
INSERT INTO `states` VALUES (667, 'Newfoundland and Labrador', 38, NULL, NULL);
INSERT INTO `states` VALUES (668, 'Northwest Territories', 38, NULL, NULL);
INSERT INTO `states` VALUES (669, 'Nova Scotia', 38, NULL, NULL);
INSERT INTO `states` VALUES (670, 'Nunavut', 38, NULL, NULL);
INSERT INTO `states` VALUES (671, 'Ontario', 38, NULL, NULL);
INSERT INTO `states` VALUES (672, 'Prince Edward Island', 38, NULL, NULL);
INSERT INTO `states` VALUES (673, 'Quebec', 38, NULL, NULL);
INSERT INTO `states` VALUES (674, 'Saskatchewan', 38, NULL, NULL);
INSERT INTO `states` VALUES (675, 'Yukon', 38, NULL, NULL);
INSERT INTO `states` VALUES (676, 'Boavista', 39, NULL, NULL);
INSERT INTO `states` VALUES (677, 'Brava', 39, NULL, NULL);
INSERT INTO `states` VALUES (678, 'Fogo', 39, NULL, NULL);
INSERT INTO `states` VALUES (679, 'Maio', 39, NULL, NULL);
INSERT INTO `states` VALUES (680, 'Sal', 39, NULL, NULL);
INSERT INTO `states` VALUES (681, 'Santo Antao', 39, NULL, NULL);
INSERT INTO `states` VALUES (682, 'Sao Nicolau', 39, NULL, NULL);
INSERT INTO `states` VALUES (683, 'Sao Tiago', 39, NULL, NULL);
INSERT INTO `states` VALUES (684, 'Sao Vicente', 39, NULL, NULL);
INSERT INTO `states` VALUES (685, 'Grand Cayman', 40, NULL, NULL);
INSERT INTO `states` VALUES (686, 'Bamingui-Bangoran', 41, NULL, NULL);
INSERT INTO `states` VALUES (687, 'Bangui', 41, NULL, NULL);
INSERT INTO `states` VALUES (688, 'Basse-Kotto', 41, NULL, NULL);
INSERT INTO `states` VALUES (689, 'Haut-Mbomou', 41, NULL, NULL);
INSERT INTO `states` VALUES (690, 'Haute-Kotto', 41, NULL, NULL);
INSERT INTO `states` VALUES (691, 'Kemo', 41, NULL, NULL);
INSERT INTO `states` VALUES (692, 'Lobaye', 41, NULL, NULL);
INSERT INTO `states` VALUES (693, 'Mambere-Kadei', 41, NULL, NULL);
INSERT INTO `states` VALUES (694, 'Mbomou', 41, NULL, NULL);
INSERT INTO `states` VALUES (695, 'Nana-Gribizi', 41, NULL, NULL);
INSERT INTO `states` VALUES (696, 'Nana-Mambere', 41, NULL, NULL);
INSERT INTO `states` VALUES (697, 'Ombella Mpoko', 41, NULL, NULL);
INSERT INTO `states` VALUES (698, 'Ouaka', 41, NULL, NULL);
INSERT INTO `states` VALUES (699, 'Ouham', 41, NULL, NULL);
INSERT INTO `states` VALUES (700, 'Ouham-Pende', 41, NULL, NULL);
INSERT INTO `states` VALUES (701, 'Sangha-Mbaere', 41, NULL, NULL);
INSERT INTO `states` VALUES (702, 'Vakaga', 41, NULL, NULL);
INSERT INTO `states` VALUES (703, 'Batha', 42, NULL, NULL);
INSERT INTO `states` VALUES (704, 'Biltine', 42, NULL, NULL);
INSERT INTO `states` VALUES (705, 'Bourkou-Ennedi-Tibesti', 42, NULL, NULL);
INSERT INTO `states` VALUES (706, 'Chari-Baguirmi', 42, NULL, NULL);
INSERT INTO `states` VALUES (707, 'Guera', 42, NULL, NULL);
INSERT INTO `states` VALUES (708, 'Kanem', 42, NULL, NULL);
INSERT INTO `states` VALUES (709, 'Lac', 42, NULL, NULL);
INSERT INTO `states` VALUES (710, 'Logone Occidental', 42, NULL, NULL);
INSERT INTO `states` VALUES (711, 'Logone Oriental', 42, NULL, NULL);
INSERT INTO `states` VALUES (712, 'Mayo-Kebbi', 42, NULL, NULL);
INSERT INTO `states` VALUES (713, 'Moyen-Chari', 42, NULL, NULL);
INSERT INTO `states` VALUES (714, 'Ouaddai', 42, NULL, NULL);
INSERT INTO `states` VALUES (715, 'Salamat', 42, NULL, NULL);
INSERT INTO `states` VALUES (716, 'Tandjile', 42, NULL, NULL);
INSERT INTO `states` VALUES (717, 'Aisen', 43, NULL, NULL);
INSERT INTO `states` VALUES (718, 'Antofagasta', 43, NULL, NULL);
INSERT INTO `states` VALUES (719, 'Araucania', 43, NULL, NULL);
INSERT INTO `states` VALUES (720, 'Atacama', 43, NULL, NULL);
INSERT INTO `states` VALUES (721, 'Bio Bio', 43, NULL, NULL);
INSERT INTO `states` VALUES (722, 'Coquimbo', 43, NULL, NULL);
INSERT INTO `states` VALUES (723, 'Libertador General Bernardo O', 43, NULL, NULL);
INSERT INTO `states` VALUES (724, 'Los Lagos', 43, NULL, NULL);
INSERT INTO `states` VALUES (725, 'Magellanes', 43, NULL, NULL);
INSERT INTO `states` VALUES (726, 'Maule', 43, NULL, NULL);
INSERT INTO `states` VALUES (727, 'Metropolitana', 43, NULL, NULL);
INSERT INTO `states` VALUES (728, 'Metropolitana de Santiago', 43, NULL, NULL);
INSERT INTO `states` VALUES (729, 'Tarapaca', 43, NULL, NULL);
INSERT INTO `states` VALUES (730, 'Valparaiso', 43, NULL, NULL);
INSERT INTO `states` VALUES (731, 'Anhui', 44, NULL, NULL);
INSERT INTO `states` VALUES (732, 'Anhui Province', 44, NULL, NULL);
INSERT INTO `states` VALUES (733, 'Anhui Sheng', 44, NULL, NULL);
INSERT INTO `states` VALUES (734, 'Aomen', 44, NULL, NULL);
INSERT INTO `states` VALUES (735, 'Beijing', 44, NULL, NULL);
INSERT INTO `states` VALUES (736, 'Beijing Shi', 44, NULL, NULL);
INSERT INTO `states` VALUES (737, 'Chongqing', 44, NULL, NULL);
INSERT INTO `states` VALUES (738, 'Fujian', 44, NULL, NULL);
INSERT INTO `states` VALUES (739, 'Fujian Sheng', 44, NULL, NULL);
INSERT INTO `states` VALUES (740, 'Gansu', 44, NULL, NULL);
INSERT INTO `states` VALUES (741, 'Guangdong', 44, NULL, NULL);
INSERT INTO `states` VALUES (742, 'Guangdong Sheng', 44, NULL, NULL);
INSERT INTO `states` VALUES (743, 'Guangxi', 44, NULL, NULL);
INSERT INTO `states` VALUES (744, 'Guizhou', 44, NULL, NULL);
INSERT INTO `states` VALUES (745, 'Hainan', 44, NULL, NULL);
INSERT INTO `states` VALUES (746, 'Hebei', 44, NULL, NULL);
INSERT INTO `states` VALUES (747, 'Heilongjiang', 44, NULL, NULL);
INSERT INTO `states` VALUES (748, 'Henan', 44, NULL, NULL);
INSERT INTO `states` VALUES (749, 'Hubei', 44, NULL, NULL);
INSERT INTO `states` VALUES (750, 'Hunan', 44, NULL, NULL);
INSERT INTO `states` VALUES (751, 'Jiangsu', 44, NULL, NULL);
INSERT INTO `states` VALUES (752, 'Jiangsu Sheng', 44, NULL, NULL);
INSERT INTO `states` VALUES (753, 'Jiangxi', 44, NULL, NULL);
INSERT INTO `states` VALUES (754, 'Jilin', 44, NULL, NULL);
INSERT INTO `states` VALUES (755, 'Liaoning', 44, NULL, NULL);
INSERT INTO `states` VALUES (756, 'Liaoning Sheng', 44, NULL, NULL);
INSERT INTO `states` VALUES (757, 'Nei Monggol', 44, NULL, NULL);
INSERT INTO `states` VALUES (758, 'Ningxia Hui', 44, NULL, NULL);
INSERT INTO `states` VALUES (759, 'Qinghai', 44, NULL, NULL);
INSERT INTO `states` VALUES (760, 'Shaanxi', 44, NULL, NULL);
INSERT INTO `states` VALUES (761, 'Shandong', 44, NULL, NULL);
INSERT INTO `states` VALUES (762, 'Shandong Sheng', 44, NULL, NULL);
INSERT INTO `states` VALUES (763, 'Shanghai', 44, NULL, NULL);
INSERT INTO `states` VALUES (764, 'Shanxi', 44, NULL, NULL);
INSERT INTO `states` VALUES (765, 'Sichuan', 44, NULL, NULL);
INSERT INTO `states` VALUES (766, 'Tianjin', 44, NULL, NULL);
INSERT INTO `states` VALUES (767, 'Xianggang', 44, NULL, NULL);
INSERT INTO `states` VALUES (768, 'Xinjiang', 44, NULL, NULL);
INSERT INTO `states` VALUES (769, 'Xizang', 44, NULL, NULL);
INSERT INTO `states` VALUES (770, 'Yunnan', 44, NULL, NULL);
INSERT INTO `states` VALUES (771, 'Zhejiang', 44, NULL, NULL);
INSERT INTO `states` VALUES (772, 'Zhejiang Sheng', 44, NULL, NULL);
INSERT INTO `states` VALUES (773, 'Christmas Island', 45, NULL, NULL);
INSERT INTO `states` VALUES (774, 'Cocos (Keeling) Islands', 46, NULL, NULL);
INSERT INTO `states` VALUES (775, 'Amazonas', 47, NULL, NULL);
INSERT INTO `states` VALUES (776, 'Antioquia', 47, NULL, NULL);
INSERT INTO `states` VALUES (777, 'Arauca', 47, NULL, NULL);
INSERT INTO `states` VALUES (778, 'Atlantico', 47, NULL, NULL);
INSERT INTO `states` VALUES (779, 'Bogota', 47, NULL, NULL);
INSERT INTO `states` VALUES (780, 'Bolivar', 47, NULL, NULL);
INSERT INTO `states` VALUES (781, 'Boyaca', 47, NULL, NULL);
INSERT INTO `states` VALUES (782, 'Caldas', 47, NULL, NULL);
INSERT INTO `states` VALUES (783, 'Caqueta', 47, NULL, NULL);
INSERT INTO `states` VALUES (784, 'Casanare', 47, NULL, NULL);
INSERT INTO `states` VALUES (785, 'Cauca', 47, NULL, NULL);
INSERT INTO `states` VALUES (786, 'Cesar', 47, NULL, NULL);
INSERT INTO `states` VALUES (787, 'Choco', 47, NULL, NULL);
INSERT INTO `states` VALUES (788, 'Cordoba', 47, NULL, NULL);
INSERT INTO `states` VALUES (789, 'Cundinamarca', 47, NULL, NULL);
INSERT INTO `states` VALUES (790, 'Guainia', 47, NULL, NULL);
INSERT INTO `states` VALUES (791, 'Guaviare', 47, NULL, NULL);
INSERT INTO `states` VALUES (792, 'Huila', 47, NULL, NULL);
INSERT INTO `states` VALUES (793, 'La Guajira', 47, NULL, NULL);
INSERT INTO `states` VALUES (794, 'Magdalena', 47, NULL, NULL);
INSERT INTO `states` VALUES (795, 'Meta', 47, NULL, NULL);
INSERT INTO `states` VALUES (796, 'Narino', 47, NULL, NULL);
INSERT INTO `states` VALUES (797, 'Norte de Santander', 47, NULL, NULL);
INSERT INTO `states` VALUES (798, 'Putumayo', 47, NULL, NULL);
INSERT INTO `states` VALUES (799, 'Quindio', 47, NULL, NULL);
INSERT INTO `states` VALUES (800, 'Risaralda', 47, NULL, NULL);
INSERT INTO `states` VALUES (801, 'San Andres y Providencia', 47, NULL, NULL);
INSERT INTO `states` VALUES (802, 'Santander', 47, NULL, NULL);
INSERT INTO `states` VALUES (803, 'Sucre', 47, NULL, NULL);
INSERT INTO `states` VALUES (804, 'Tolima', 47, NULL, NULL);
INSERT INTO `states` VALUES (805, 'Valle del Cauca', 47, NULL, NULL);
INSERT INTO `states` VALUES (806, 'Vaupes', 47, NULL, NULL);
INSERT INTO `states` VALUES (807, 'Vichada', 47, NULL, NULL);
INSERT INTO `states` VALUES (808, 'Mwali', 48, NULL, NULL);
INSERT INTO `states` VALUES (809, 'Njazidja', 48, NULL, NULL);
INSERT INTO `states` VALUES (810, 'Nzwani', 48, NULL, NULL);
INSERT INTO `states` VALUES (811, 'Bouenza', 49, NULL, NULL);
INSERT INTO `states` VALUES (812, 'Brazzaville', 49, NULL, NULL);
INSERT INTO `states` VALUES (813, 'Cuvette', 49, NULL, NULL);
INSERT INTO `states` VALUES (814, 'Kouilou', 49, NULL, NULL);
INSERT INTO `states` VALUES (815, 'Lekoumou', 49, NULL, NULL);
INSERT INTO `states` VALUES (816, 'Likouala', 49, NULL, NULL);
INSERT INTO `states` VALUES (817, 'Niari', 49, NULL, NULL);
INSERT INTO `states` VALUES (818, 'Plateaux', 49, NULL, NULL);
INSERT INTO `states` VALUES (819, 'Pool', 49, NULL, NULL);
INSERT INTO `states` VALUES (820, 'Sangha', 49, NULL, NULL);
INSERT INTO `states` VALUES (821, 'Bandundu', 50, NULL, NULL);
INSERT INTO `states` VALUES (822, 'Bas-Congo', 50, NULL, NULL);
INSERT INTO `states` VALUES (823, 'Equateur', 50, NULL, NULL);
INSERT INTO `states` VALUES (824, 'Haut-Congo', 50, NULL, NULL);
INSERT INTO `states` VALUES (825, 'Kasai-Occidental', 50, NULL, NULL);
INSERT INTO `states` VALUES (826, 'Kasai-Oriental', 50, NULL, NULL);
INSERT INTO `states` VALUES (827, 'Katanga', 50, NULL, NULL);
INSERT INTO `states` VALUES (828, 'Kinshasa', 50, NULL, NULL);
INSERT INTO `states` VALUES (829, 'Maniema', 50, NULL, NULL);
INSERT INTO `states` VALUES (830, 'Nord-Kivu', 50, NULL, NULL);
INSERT INTO `states` VALUES (831, 'Sud-Kivu', 50, NULL, NULL);
INSERT INTO `states` VALUES (832, 'Aitutaki', 51, NULL, NULL);
INSERT INTO `states` VALUES (833, 'Atiu', 51, NULL, NULL);
INSERT INTO `states` VALUES (834, 'Mangaia', 51, NULL, NULL);
INSERT INTO `states` VALUES (835, 'Manihiki', 51, NULL, NULL);
INSERT INTO `states` VALUES (836, 'Mauke', 51, NULL, NULL);
INSERT INTO `states` VALUES (837, 'Mitiaro', 51, NULL, NULL);
INSERT INTO `states` VALUES (838, 'Nassau', 51, NULL, NULL);
INSERT INTO `states` VALUES (839, 'Pukapuka', 51, NULL, NULL);
INSERT INTO `states` VALUES (840, 'Rakahanga', 51, NULL, NULL);
INSERT INTO `states` VALUES (841, 'Rarotonga', 51, NULL, NULL);
INSERT INTO `states` VALUES (842, 'Tongareva', 51, NULL, NULL);
INSERT INTO `states` VALUES (843, 'Alajuela', 52, NULL, NULL);
INSERT INTO `states` VALUES (844, 'Cartago', 52, NULL, NULL);
INSERT INTO `states` VALUES (845, 'Guanacaste', 52, NULL, NULL);
INSERT INTO `states` VALUES (846, 'Heredia', 52, NULL, NULL);
INSERT INTO `states` VALUES (847, 'Limon', 52, NULL, NULL);
INSERT INTO `states` VALUES (848, 'Puntarenas', 52, NULL, NULL);
INSERT INTO `states` VALUES (849, 'San Jose', 52, NULL, NULL);
INSERT INTO `states` VALUES (850, 'Abidjan', 53, NULL, NULL);
INSERT INTO `states` VALUES (851, 'Agneby', 53, NULL, NULL);
INSERT INTO `states` VALUES (852, 'Bafing', 53, NULL, NULL);
INSERT INTO `states` VALUES (853, 'Denguele', 53, NULL, NULL);
INSERT INTO `states` VALUES (854, 'Dix-huit Montagnes', 53, NULL, NULL);
INSERT INTO `states` VALUES (855, 'Fromager', 53, NULL, NULL);
INSERT INTO `states` VALUES (856, 'Haut-Sassandra', 53, NULL, NULL);
INSERT INTO `states` VALUES (857, 'Lacs', 53, NULL, NULL);
INSERT INTO `states` VALUES (858, 'Lagunes', 53, NULL, NULL);
INSERT INTO `states` VALUES (859, 'Marahoue', 53, NULL, NULL);
INSERT INTO `states` VALUES (860, 'Moyen-Cavally', 53, NULL, NULL);
INSERT INTO `states` VALUES (861, 'Moyen-Comoe', 53, NULL, NULL);
INSERT INTO `states` VALUES (862, 'N\'\'zi-Comoe', 53, NULL, NULL);
INSERT INTO `states` VALUES (863, 'Sassandra', 53, NULL, NULL);
INSERT INTO `states` VALUES (864, 'Savanes', 53, NULL, NULL);
INSERT INTO `states` VALUES (865, 'Sud-Bandama', 53, NULL, NULL);
INSERT INTO `states` VALUES (866, 'Sud-Comoe', 53, NULL, NULL);
INSERT INTO `states` VALUES (867, 'Vallee du Bandama', 53, NULL, NULL);
INSERT INTO `states` VALUES (868, 'Worodougou', 53, NULL, NULL);
INSERT INTO `states` VALUES (869, 'Zanzan', 53, NULL, NULL);
INSERT INTO `states` VALUES (870, 'Bjelovar-Bilogora', 54, NULL, NULL);
INSERT INTO `states` VALUES (871, 'Dubrovnik-Neretva', 54, NULL, NULL);
INSERT INTO `states` VALUES (872, 'Grad Zagreb', 54, NULL, NULL);
INSERT INTO `states` VALUES (873, 'Istra', 54, NULL, NULL);
INSERT INTO `states` VALUES (874, 'Karlovac', 54, NULL, NULL);
INSERT INTO `states` VALUES (875, 'Koprivnica-Krizhevci', 54, NULL, NULL);
INSERT INTO `states` VALUES (876, 'Krapina-Zagorje', 54, NULL, NULL);
INSERT INTO `states` VALUES (877, 'Lika-Senj', 54, NULL, NULL);
INSERT INTO `states` VALUES (878, 'Medhimurje', 54, NULL, NULL);
INSERT INTO `states` VALUES (879, 'Medimurska Zupanija', 54, NULL, NULL);
INSERT INTO `states` VALUES (880, 'Osijek-Baranja', 54, NULL, NULL);
INSERT INTO `states` VALUES (881, 'Osjecko-Baranjska Zupanija', 54, NULL, NULL);
INSERT INTO `states` VALUES (882, 'Pozhega-Slavonija', 54, NULL, NULL);
INSERT INTO `states` VALUES (883, 'Primorje-Gorski Kotar', 54, NULL, NULL);
INSERT INTO `states` VALUES (884, 'Shibenik-Knin', 54, NULL, NULL);
INSERT INTO `states` VALUES (885, 'Sisak-Moslavina', 54, NULL, NULL);
INSERT INTO `states` VALUES (886, 'Slavonski Brod-Posavina', 54, NULL, NULL);
INSERT INTO `states` VALUES (887, 'Split-Dalmacija', 54, NULL, NULL);
INSERT INTO `states` VALUES (888, 'Varazhdin', 54, NULL, NULL);
INSERT INTO `states` VALUES (889, 'Virovitica-Podravina', 54, NULL, NULL);
INSERT INTO `states` VALUES (890, 'Vukovar-Srijem', 54, NULL, NULL);
INSERT INTO `states` VALUES (891, 'Zadar', 54, NULL, NULL);
INSERT INTO `states` VALUES (892, 'Zagreb', 54, NULL, NULL);
INSERT INTO `states` VALUES (893, 'Camaguey', 55, NULL, NULL);
INSERT INTO `states` VALUES (894, 'Ciego de Avila', 55, NULL, NULL);
INSERT INTO `states` VALUES (895, 'Cienfuegos', 55, NULL, NULL);
INSERT INTO `states` VALUES (896, 'Ciudad de la Habana', 55, NULL, NULL);
INSERT INTO `states` VALUES (897, 'Granma', 55, NULL, NULL);
INSERT INTO `states` VALUES (898, 'Guantanamo', 55, NULL, NULL);
INSERT INTO `states` VALUES (899, 'Habana', 55, NULL, NULL);
INSERT INTO `states` VALUES (900, 'Holguin', 55, NULL, NULL);
INSERT INTO `states` VALUES (901, 'Isla de la Juventud', 55, NULL, NULL);
INSERT INTO `states` VALUES (902, 'La Habana', 55, NULL, NULL);
INSERT INTO `states` VALUES (903, 'Las Tunas', 55, NULL, NULL);
INSERT INTO `states` VALUES (904, 'Matanzas', 55, NULL, NULL);
INSERT INTO `states` VALUES (905, 'Pinar del Rio', 55, NULL, NULL);
INSERT INTO `states` VALUES (906, 'Sancti Spiritus', 55, NULL, NULL);
INSERT INTO `states` VALUES (907, 'Santiago de Cuba', 55, NULL, NULL);
INSERT INTO `states` VALUES (908, 'Villa Clara', 55, NULL, NULL);
INSERT INTO `states` VALUES (909, 'Government controlled area', 56, NULL, NULL);
INSERT INTO `states` VALUES (910, 'Limassol', 56, NULL, NULL);
INSERT INTO `states` VALUES (911, 'Nicosia District', 56, NULL, NULL);
INSERT INTO `states` VALUES (912, 'Paphos', 56, NULL, NULL);
INSERT INTO `states` VALUES (913, 'Turkish controlled area', 56, NULL, NULL);
INSERT INTO `states` VALUES (914, 'Central Bohemian', 57, NULL, NULL);
INSERT INTO `states` VALUES (915, 'Frycovice', 57, NULL, NULL);
INSERT INTO `states` VALUES (916, 'Jihocesky Kraj', 57, NULL, NULL);
INSERT INTO `states` VALUES (917, 'Jihochesky', 57, NULL, NULL);
INSERT INTO `states` VALUES (918, 'Jihomoravsky', 57, NULL, NULL);
INSERT INTO `states` VALUES (919, 'Karlovarsky', 57, NULL, NULL);
INSERT INTO `states` VALUES (920, 'Klecany', 57, NULL, NULL);
INSERT INTO `states` VALUES (921, 'Kralovehradecky', 57, NULL, NULL);
INSERT INTO `states` VALUES (922, 'Liberecky', 57, NULL, NULL);
INSERT INTO `states` VALUES (923, 'Lipov', 57, NULL, NULL);
INSERT INTO `states` VALUES (924, 'Moravskoslezsky', 57, NULL, NULL);
INSERT INTO `states` VALUES (925, 'Olomoucky', 57, NULL, NULL);
INSERT INTO `states` VALUES (926, 'Olomoucky Kraj', 57, NULL, NULL);
INSERT INTO `states` VALUES (927, 'Pardubicky', 57, NULL, NULL);
INSERT INTO `states` VALUES (928, 'Plzensky', 57, NULL, NULL);
INSERT INTO `states` VALUES (929, 'Praha', 57, NULL, NULL);
INSERT INTO `states` VALUES (930, 'Rajhrad', 57, NULL, NULL);
INSERT INTO `states` VALUES (931, 'Smirice', 57, NULL, NULL);
INSERT INTO `states` VALUES (932, 'South Moravian', 57, NULL, NULL);
INSERT INTO `states` VALUES (933, 'Straz nad Nisou', 57, NULL, NULL);
INSERT INTO `states` VALUES (934, 'Stredochesky', 57, NULL, NULL);
INSERT INTO `states` VALUES (935, 'Unicov', 57, NULL, NULL);
INSERT INTO `states` VALUES (936, 'Ustecky', 57, NULL, NULL);
INSERT INTO `states` VALUES (937, 'Valletta', 57, NULL, NULL);
INSERT INTO `states` VALUES (938, 'Velesin', 57, NULL, NULL);
INSERT INTO `states` VALUES (939, 'Vysochina', 57, NULL, NULL);
INSERT INTO `states` VALUES (940, 'Zlinsky', 57, NULL, NULL);
INSERT INTO `states` VALUES (941, 'Arhus', 58, NULL, NULL);
INSERT INTO `states` VALUES (942, 'Bornholm', 58, NULL, NULL);
INSERT INTO `states` VALUES (943, 'Frederiksborg', 58, NULL, NULL);
INSERT INTO `states` VALUES (944, 'Fyn', 58, NULL, NULL);
INSERT INTO `states` VALUES (945, 'Hovedstaden', 58, NULL, NULL);
INSERT INTO `states` VALUES (946, 'Kobenhavn', 58, NULL, NULL);
INSERT INTO `states` VALUES (947, 'Kobenhavns Amt', 58, NULL, NULL);
INSERT INTO `states` VALUES (948, 'Kobenhavns Kommune', 58, NULL, NULL);
INSERT INTO `states` VALUES (949, 'Nordjylland', 58, NULL, NULL);
INSERT INTO `states` VALUES (950, 'Ribe', 58, NULL, NULL);
INSERT INTO `states` VALUES (951, 'Ringkobing', 58, NULL, NULL);
INSERT INTO `states` VALUES (952, 'Roervig', 58, NULL, NULL);
INSERT INTO `states` VALUES (953, 'Roskilde', 58, NULL, NULL);
INSERT INTO `states` VALUES (954, 'Roslev', 58, NULL, NULL);
INSERT INTO `states` VALUES (955, 'Sjaelland', 58, NULL, NULL);
INSERT INTO `states` VALUES (956, 'Soeborg', 58, NULL, NULL);
INSERT INTO `states` VALUES (957, 'Sonderjylland', 58, NULL, NULL);
INSERT INTO `states` VALUES (958, 'Storstrom', 58, NULL, NULL);
INSERT INTO `states` VALUES (959, 'Syddanmark', 58, NULL, NULL);
INSERT INTO `states` VALUES (960, 'Toelloese', 58, NULL, NULL);
INSERT INTO `states` VALUES (961, 'Vejle', 58, NULL, NULL);
INSERT INTO `states` VALUES (962, 'Vestsjalland', 58, NULL, NULL);
INSERT INTO `states` VALUES (963, 'Viborg', 58, NULL, NULL);
INSERT INTO `states` VALUES (964, 'Ali Sabih', 59, NULL, NULL);
INSERT INTO `states` VALUES (965, 'Dikhil', 59, NULL, NULL);
INSERT INTO `states` VALUES (966, 'Jibuti', 59, NULL, NULL);
INSERT INTO `states` VALUES (967, 'Tajurah', 59, NULL, NULL);
INSERT INTO `states` VALUES (968, 'Ubuk', 59, NULL, NULL);
INSERT INTO `states` VALUES (969, 'Saint Andrew', 60, NULL, NULL);
INSERT INTO `states` VALUES (970, 'Saint David', 60, NULL, NULL);
INSERT INTO `states` VALUES (971, 'Saint George', 60, NULL, NULL);
INSERT INTO `states` VALUES (972, 'Saint John', 60, NULL, NULL);
INSERT INTO `states` VALUES (973, 'Saint Joseph', 60, NULL, NULL);
INSERT INTO `states` VALUES (974, 'Saint Luke', 60, NULL, NULL);
INSERT INTO `states` VALUES (975, 'Saint Mark', 60, NULL, NULL);
INSERT INTO `states` VALUES (976, 'Saint Patrick', 60, NULL, NULL);
INSERT INTO `states` VALUES (977, 'Saint Paul', 60, NULL, NULL);
INSERT INTO `states` VALUES (978, 'Saint Peter', 60, NULL, NULL);
INSERT INTO `states` VALUES (979, 'Azua', 61, NULL, NULL);
INSERT INTO `states` VALUES (980, 'Bahoruco', 61, NULL, NULL);
INSERT INTO `states` VALUES (981, 'Barahona', 61, NULL, NULL);
INSERT INTO `states` VALUES (982, 'Dajabon', 61, NULL, NULL);
INSERT INTO `states` VALUES (983, 'Distrito Nacional', 61, NULL, NULL);
INSERT INTO `states` VALUES (984, 'Duarte', 61, NULL, NULL);
INSERT INTO `states` VALUES (985, 'El Seybo', 61, NULL, NULL);
INSERT INTO `states` VALUES (986, 'Elias Pina', 61, NULL, NULL);
INSERT INTO `states` VALUES (987, 'Espaillat', 61, NULL, NULL);
INSERT INTO `states` VALUES (988, 'Hato Mayor', 61, NULL, NULL);
INSERT INTO `states` VALUES (989, 'Independencia', 61, NULL, NULL);
INSERT INTO `states` VALUES (990, 'La Altagracia', 61, NULL, NULL);
INSERT INTO `states` VALUES (991, 'La Romana', 61, NULL, NULL);
INSERT INTO `states` VALUES (992, 'La Vega', 61, NULL, NULL);
INSERT INTO `states` VALUES (993, 'Maria Trinidad Sanchez', 61, NULL, NULL);
INSERT INTO `states` VALUES (994, 'Monsenor Nouel', 61, NULL, NULL);
INSERT INTO `states` VALUES (995, 'Monte Cristi', 61, NULL, NULL);
INSERT INTO `states` VALUES (996, 'Monte Plata', 61, NULL, NULL);
INSERT INTO `states` VALUES (997, 'Pedernales', 61, NULL, NULL);
INSERT INTO `states` VALUES (998, 'Peravia', 61, NULL, NULL);
INSERT INTO `states` VALUES (999, 'Puerto Plata', 61, NULL, NULL);
INSERT INTO `states` VALUES (1000, 'Salcedo', 61, NULL, NULL);
INSERT INTO `states` VALUES (1001, 'Samana', 61, NULL, NULL);
INSERT INTO `states` VALUES (1002, 'San Cristobal', 61, NULL, NULL);
INSERT INTO `states` VALUES (1003, 'San Juan', 61, NULL, NULL);
INSERT INTO `states` VALUES (1004, 'San Pedro de Macoris', 61, NULL, NULL);
INSERT INTO `states` VALUES (1005, 'Sanchez Ramirez', 61, NULL, NULL);
INSERT INTO `states` VALUES (1006, 'Santiago', 61, NULL, NULL);
INSERT INTO `states` VALUES (1007, 'Santiago Rodriguez', 61, NULL, NULL);
INSERT INTO `states` VALUES (1008, 'Valverde', 61, NULL, NULL);
INSERT INTO `states` VALUES (1009, 'Aileu', 62, NULL, NULL);
INSERT INTO `states` VALUES (1010, 'Ainaro', 62, NULL, NULL);
INSERT INTO `states` VALUES (1011, 'Ambeno', 62, NULL, NULL);
INSERT INTO `states` VALUES (1012, 'Baucau', 62, NULL, NULL);
INSERT INTO `states` VALUES (1013, 'Bobonaro', 62, NULL, NULL);
INSERT INTO `states` VALUES (1014, 'Cova Lima', 62, NULL, NULL);
INSERT INTO `states` VALUES (1015, 'Dili', 62, NULL, NULL);
INSERT INTO `states` VALUES (1016, 'Ermera', 62, NULL, NULL);
INSERT INTO `states` VALUES (1017, 'Lautem', 62, NULL, NULL);
INSERT INTO `states` VALUES (1018, 'Liquica', 62, NULL, NULL);
INSERT INTO `states` VALUES (1019, 'Manatuto', 62, NULL, NULL);
INSERT INTO `states` VALUES (1020, 'Manufahi', 62, NULL, NULL);
INSERT INTO `states` VALUES (1021, 'Viqueque', 62, NULL, NULL);
INSERT INTO `states` VALUES (1022, 'Azuay', 63, NULL, NULL);
INSERT INTO `states` VALUES (1023, 'Bolivar', 63, NULL, NULL);
INSERT INTO `states` VALUES (1024, 'Canar', 63, NULL, NULL);
INSERT INTO `states` VALUES (1025, 'Carchi', 63, NULL, NULL);
INSERT INTO `states` VALUES (1026, 'Chimborazo', 63, NULL, NULL);
INSERT INTO `states` VALUES (1027, 'Cotopaxi', 63, NULL, NULL);
INSERT INTO `states` VALUES (1028, 'El Oro', 63, NULL, NULL);
INSERT INTO `states` VALUES (1029, 'Esmeraldas', 63, NULL, NULL);
INSERT INTO `states` VALUES (1030, 'Galapagos', 63, NULL, NULL);
INSERT INTO `states` VALUES (1031, 'Guayas', 63, NULL, NULL);
INSERT INTO `states` VALUES (1032, 'Imbabura', 63, NULL, NULL);
INSERT INTO `states` VALUES (1033, 'Loja', 63, NULL, NULL);
INSERT INTO `states` VALUES (1034, 'Los Rios', 63, NULL, NULL);
INSERT INTO `states` VALUES (1035, 'Manabi', 63, NULL, NULL);
INSERT INTO `states` VALUES (1036, 'Morona Santiago', 63, NULL, NULL);
INSERT INTO `states` VALUES (1037, 'Napo', 63, NULL, NULL);
INSERT INTO `states` VALUES (1038, 'Orellana', 63, NULL, NULL);
INSERT INTO `states` VALUES (1039, 'Pastaza', 63, NULL, NULL);
INSERT INTO `states` VALUES (1040, 'Pichincha', 63, NULL, NULL);
INSERT INTO `states` VALUES (1041, 'Sucumbios', 63, NULL, NULL);
INSERT INTO `states` VALUES (1042, 'Tungurahua', 63, NULL, NULL);
INSERT INTO `states` VALUES (1043, 'Zamora Chinchipe', 63, NULL, NULL);
INSERT INTO `states` VALUES (1044, 'Aswan', 64, NULL, NULL);
INSERT INTO `states` VALUES (1045, 'Asyut', 64, NULL, NULL);
INSERT INTO `states` VALUES (1046, 'Bani Suwayf', 64, NULL, NULL);
INSERT INTO `states` VALUES (1047, 'Bur Sa\'\'id', 64, NULL, NULL);
INSERT INTO `states` VALUES (1048, 'Cairo', 64, NULL, NULL);
INSERT INTO `states` VALUES (1049, 'Dumyat', 64, NULL, NULL);
INSERT INTO `states` VALUES (1050, 'Kafr-ash-Shaykh', 64, NULL, NULL);
INSERT INTO `states` VALUES (1051, 'Matruh', 64, NULL, NULL);
INSERT INTO `states` VALUES (1052, 'Muhafazat ad Daqahliyah', 64, NULL, NULL);
INSERT INTO `states` VALUES (1053, 'Muhafazat al Fayyum', 64, NULL, NULL);
INSERT INTO `states` VALUES (1054, 'Muhafazat al Gharbiyah', 64, NULL, NULL);
INSERT INTO `states` VALUES (1055, 'Muhafazat al Iskandariyah', 64, NULL, NULL);
INSERT INTO `states` VALUES (1056, 'Muhafazat al Qahirah', 64, NULL, NULL);
INSERT INTO `states` VALUES (1057, 'Qina', 64, NULL, NULL);
INSERT INTO `states` VALUES (1058, 'Sawhaj', 64, NULL, NULL);
INSERT INTO `states` VALUES (1059, 'Sina al-Janubiyah', 64, NULL, NULL);
INSERT INTO `states` VALUES (1060, 'Sina ash-Shamaliyah', 64, NULL, NULL);
INSERT INTO `states` VALUES (1061, 'ad-Daqahliyah', 64, NULL, NULL);
INSERT INTO `states` VALUES (1062, 'al-Bahr-al-Ahmar', 64, NULL, NULL);
INSERT INTO `states` VALUES (1063, 'al-Buhayrah', 64, NULL, NULL);
INSERT INTO `states` VALUES (1064, 'al-Fayyum', 64, NULL, NULL);
INSERT INTO `states` VALUES (1065, 'al-Gharbiyah', 64, NULL, NULL);
INSERT INTO `states` VALUES (1066, 'al-Iskandariyah', 64, NULL, NULL);
INSERT INTO `states` VALUES (1067, 'al-Ismailiyah', 64, NULL, NULL);
INSERT INTO `states` VALUES (1068, 'al-Jizah', 64, NULL, NULL);
INSERT INTO `states` VALUES (1069, 'al-Minufiyah', 64, NULL, NULL);
INSERT INTO `states` VALUES (1070, 'al-Minya', 64, NULL, NULL);
INSERT INTO `states` VALUES (1071, 'al-Qahira', 64, NULL, NULL);
INSERT INTO `states` VALUES (1072, 'al-Qalyubiyah', 64, NULL, NULL);
INSERT INTO `states` VALUES (1073, 'al-Uqsur', 64, NULL, NULL);
INSERT INTO `states` VALUES (1074, 'al-Wadi al-Jadid', 64, NULL, NULL);
INSERT INTO `states` VALUES (1075, 'as-Suways', 64, NULL, NULL);
INSERT INTO `states` VALUES (1076, 'ash-Sharqiyah', 64, NULL, NULL);
INSERT INTO `states` VALUES (1077, 'Ahuachapan', 65, NULL, NULL);
INSERT INTO `states` VALUES (1078, 'Cabanas', 65, NULL, NULL);
INSERT INTO `states` VALUES (1079, 'Chalatenango', 65, NULL, NULL);
INSERT INTO `states` VALUES (1080, 'Cuscatlan', 65, NULL, NULL);
INSERT INTO `states` VALUES (1081, 'La Libertad', 65, NULL, NULL);
INSERT INTO `states` VALUES (1082, 'La Paz', 65, NULL, NULL);
INSERT INTO `states` VALUES (1083, 'La Union', 65, NULL, NULL);
INSERT INTO `states` VALUES (1084, 'Morazan', 65, NULL, NULL);
INSERT INTO `states` VALUES (1085, 'San Miguel', 65, NULL, NULL);
INSERT INTO `states` VALUES (1086, 'San Salvador', 65, NULL, NULL);
INSERT INTO `states` VALUES (1087, 'San Vicente', 65, NULL, NULL);
INSERT INTO `states` VALUES (1088, 'Santa Ana', 65, NULL, NULL);
INSERT INTO `states` VALUES (1089, 'Sonsonate', 65, NULL, NULL);
INSERT INTO `states` VALUES (1090, 'Usulutan', 65, NULL, NULL);
INSERT INTO `states` VALUES (1091, 'Annobon', 66, NULL, NULL);
INSERT INTO `states` VALUES (1092, 'Bioko Norte', 66, NULL, NULL);
INSERT INTO `states` VALUES (1093, 'Bioko Sur', 66, NULL, NULL);
INSERT INTO `states` VALUES (1094, 'Centro Sur', 66, NULL, NULL);
INSERT INTO `states` VALUES (1095, 'Kie-Ntem', 66, NULL, NULL);
INSERT INTO `states` VALUES (1096, 'Litoral', 66, NULL, NULL);
INSERT INTO `states` VALUES (1097, 'Wele-Nzas', 66, NULL, NULL);
INSERT INTO `states` VALUES (1098, 'Anseba', 67, NULL, NULL);
INSERT INTO `states` VALUES (1099, 'Debub', 67, NULL, NULL);
INSERT INTO `states` VALUES (1100, 'Debub-Keih-Bahri', 67, NULL, NULL);
INSERT INTO `states` VALUES (1101, 'Gash-Barka', 67, NULL, NULL);
INSERT INTO `states` VALUES (1102, 'Maekel', 67, NULL, NULL);
INSERT INTO `states` VALUES (1103, 'Semien-Keih-Bahri', 67, NULL, NULL);
INSERT INTO `states` VALUES (1104, 'Harju', 68, NULL, NULL);
INSERT INTO `states` VALUES (1105, 'Hiiu', 68, NULL, NULL);
INSERT INTO `states` VALUES (1106, 'Ida-Viru', 68, NULL, NULL);
INSERT INTO `states` VALUES (1107, 'Jarva', 68, NULL, NULL);
INSERT INTO `states` VALUES (1108, 'Jogeva', 68, NULL, NULL);
INSERT INTO `states` VALUES (1109, 'Laane', 68, NULL, NULL);
INSERT INTO `states` VALUES (1110, 'Laane-Viru', 68, NULL, NULL);
INSERT INTO `states` VALUES (1111, 'Parnu', 68, NULL, NULL);
INSERT INTO `states` VALUES (1112, 'Polva', 68, NULL, NULL);
INSERT INTO `states` VALUES (1113, 'Rapla', 68, NULL, NULL);
INSERT INTO `states` VALUES (1114, 'Saare', 68, NULL, NULL);
INSERT INTO `states` VALUES (1115, 'Tartu', 68, NULL, NULL);
INSERT INTO `states` VALUES (1116, 'Valga', 68, NULL, NULL);
INSERT INTO `states` VALUES (1117, 'Viljandi', 68, NULL, NULL);
INSERT INTO `states` VALUES (1118, 'Voru', 68, NULL, NULL);
INSERT INTO `states` VALUES (1119, 'Addis Abeba', 69, NULL, NULL);
INSERT INTO `states` VALUES (1120, 'Afar', 69, NULL, NULL);
INSERT INTO `states` VALUES (1121, 'Amhara', 69, NULL, NULL);
INSERT INTO `states` VALUES (1122, 'Benishangul', 69, NULL, NULL);
INSERT INTO `states` VALUES (1123, 'Diredawa', 69, NULL, NULL);
INSERT INTO `states` VALUES (1124, 'Gambella', 69, NULL, NULL);
INSERT INTO `states` VALUES (1125, 'Harar', 69, NULL, NULL);
INSERT INTO `states` VALUES (1126, 'Jigjiga', 69, NULL, NULL);
INSERT INTO `states` VALUES (1127, 'Mekele', 69, NULL, NULL);
INSERT INTO `states` VALUES (1128, 'Oromia', 69, NULL, NULL);
INSERT INTO `states` VALUES (1129, 'Somali', 69, NULL, NULL);
INSERT INTO `states` VALUES (1130, 'Southern', 69, NULL, NULL);
INSERT INTO `states` VALUES (1131, 'Tigray', 69, NULL, NULL);
INSERT INTO `states` VALUES (1132, 'Christmas Island', 70, NULL, NULL);
INSERT INTO `states` VALUES (1133, 'Cocos Islands', 70, NULL, NULL);
INSERT INTO `states` VALUES (1134, 'Coral Sea Islands', 70, NULL, NULL);
INSERT INTO `states` VALUES (1135, 'Falkland Islands', 71, NULL, NULL);
INSERT INTO `states` VALUES (1136, 'South Georgia', 71, NULL, NULL);
INSERT INTO `states` VALUES (1137, 'Klaksvik', 72, NULL, NULL);
INSERT INTO `states` VALUES (1138, 'Nor ara Eysturoy', 72, NULL, NULL);
INSERT INTO `states` VALUES (1139, 'Nor oy', 72, NULL, NULL);
INSERT INTO `states` VALUES (1140, 'Sandoy', 72, NULL, NULL);
INSERT INTO `states` VALUES (1141, 'Streymoy', 72, NULL, NULL);
INSERT INTO `states` VALUES (1142, 'Su uroy', 72, NULL, NULL);
INSERT INTO `states` VALUES (1143, 'Sy ra Eysturoy', 72, NULL, NULL);
INSERT INTO `states` VALUES (1144, 'Torshavn', 72, NULL, NULL);
INSERT INTO `states` VALUES (1145, 'Vaga', 72, NULL, NULL);
INSERT INTO `states` VALUES (1146, 'Central', 73, NULL, NULL);
INSERT INTO `states` VALUES (1147, 'Eastern', 73, NULL, NULL);
INSERT INTO `states` VALUES (1148, 'Northern', 73, NULL, NULL);
INSERT INTO `states` VALUES (1149, 'South Pacific', 73, NULL, NULL);
INSERT INTO `states` VALUES (1150, 'Western', 73, NULL, NULL);
INSERT INTO `states` VALUES (1151, 'Ahvenanmaa', 74, NULL, NULL);
INSERT INTO `states` VALUES (1152, 'Etela-Karjala', 74, NULL, NULL);
INSERT INTO `states` VALUES (1153, 'Etela-Pohjanmaa', 74, NULL, NULL);
INSERT INTO `states` VALUES (1154, 'Etela-Savo', 74, NULL, NULL);
INSERT INTO `states` VALUES (1155, 'Etela-Suomen Laani', 74, NULL, NULL);
INSERT INTO `states` VALUES (1156, 'Ita-Suomen Laani', 74, NULL, NULL);
INSERT INTO `states` VALUES (1157, 'Ita-Uusimaa', 74, NULL, NULL);
INSERT INTO `states` VALUES (1158, 'Kainuu', 74, NULL, NULL);
INSERT INTO `states` VALUES (1159, 'Kanta-Hame', 74, NULL, NULL);
INSERT INTO `states` VALUES (1160, 'Keski-Pohjanmaa', 74, NULL, NULL);
INSERT INTO `states` VALUES (1161, 'Keski-Suomi', 74, NULL, NULL);
INSERT INTO `states` VALUES (1162, 'Kymenlaakso', 74, NULL, NULL);
INSERT INTO `states` VALUES (1163, 'Lansi-Suomen Laani', 74, NULL, NULL);
INSERT INTO `states` VALUES (1164, 'Lappi', 74, NULL, NULL);
INSERT INTO `states` VALUES (1165, 'Northern Savonia', 74, NULL, NULL);
INSERT INTO `states` VALUES (1166, 'Ostrobothnia', 74, NULL, NULL);
INSERT INTO `states` VALUES (1167, 'Oulun Laani', 74, NULL, NULL);
INSERT INTO `states` VALUES (1168, 'Paijat-Hame', 74, NULL, NULL);
INSERT INTO `states` VALUES (1169, 'Pirkanmaa', 74, NULL, NULL);
INSERT INTO `states` VALUES (1170, 'Pohjanmaa', 74, NULL, NULL);
INSERT INTO `states` VALUES (1171, 'Pohjois-Karjala', 74, NULL, NULL);
INSERT INTO `states` VALUES (1172, 'Pohjois-Pohjanmaa', 74, NULL, NULL);
INSERT INTO `states` VALUES (1173, 'Pohjois-Savo', 74, NULL, NULL);
INSERT INTO `states` VALUES (1174, 'Saarijarvi', 74, NULL, NULL);
INSERT INTO `states` VALUES (1175, 'Satakunta', 74, NULL, NULL);
INSERT INTO `states` VALUES (1176, 'Southern Savonia', 74, NULL, NULL);
INSERT INTO `states` VALUES (1177, 'Tavastia Proper', 74, NULL, NULL);
INSERT INTO `states` VALUES (1178, 'Uleaborgs Lan', 74, NULL, NULL);
INSERT INTO `states` VALUES (1179, 'Uusimaa', 74, NULL, NULL);
INSERT INTO `states` VALUES (1180, 'Varsinais-Suomi', 74, NULL, NULL);
INSERT INTO `states` VALUES (1181, 'Ain', 75, NULL, NULL);
INSERT INTO `states` VALUES (1182, 'Aisne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1183, 'Albi Le Sequestre', 75, NULL, NULL);
INSERT INTO `states` VALUES (1184, 'Allier', 75, NULL, NULL);
INSERT INTO `states` VALUES (1185, 'Alpes-Cote dAzur', 75, NULL, NULL);
INSERT INTO `states` VALUES (1186, 'Alpes-Maritimes', 75, NULL, NULL);
INSERT INTO `states` VALUES (1187, 'Alpes-de-Haute-Provence', 75, NULL, NULL);
INSERT INTO `states` VALUES (1188, 'Alsace', 75, NULL, NULL);
INSERT INTO `states` VALUES (1189, 'Aquitaine', 75, NULL, NULL);
INSERT INTO `states` VALUES (1190, 'Ardeche', 75, NULL, NULL);
INSERT INTO `states` VALUES (1191, 'Ardennes', 75, NULL, NULL);
INSERT INTO `states` VALUES (1192, 'Ariege', 75, NULL, NULL);
INSERT INTO `states` VALUES (1193, 'Aube', 75, NULL, NULL);
INSERT INTO `states` VALUES (1194, 'Aude', 75, NULL, NULL);
INSERT INTO `states` VALUES (1195, 'Auvergne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1196, 'Aveyron', 75, NULL, NULL);
INSERT INTO `states` VALUES (1197, 'Bas-Rhin', 75, NULL, NULL);
INSERT INTO `states` VALUES (1198, 'Basse-Normandie', 75, NULL, NULL);
INSERT INTO `states` VALUES (1199, 'Bouches-du-Rhone', 75, NULL, NULL);
INSERT INTO `states` VALUES (1200, 'Bourgogne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1201, 'Bretagne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1202, 'Brittany', 75, NULL, NULL);
INSERT INTO `states` VALUES (1203, 'Burgundy', 75, NULL, NULL);
INSERT INTO `states` VALUES (1204, 'Calvados', 75, NULL, NULL);
INSERT INTO `states` VALUES (1205, 'Cantal', 75, NULL, NULL);
INSERT INTO `states` VALUES (1206, 'Cedex', 75, NULL, NULL);
INSERT INTO `states` VALUES (1207, 'Centre', 75, NULL, NULL);
INSERT INTO `states` VALUES (1208, 'Charente', 75, NULL, NULL);
INSERT INTO `states` VALUES (1209, 'Charente-Maritime', 75, NULL, NULL);
INSERT INTO `states` VALUES (1210, 'Cher', 75, NULL, NULL);
INSERT INTO `states` VALUES (1211, 'Correze', 75, NULL, NULL);
INSERT INTO `states` VALUES (1212, 'Corse-du-Sud', 75, NULL, NULL);
INSERT INTO `states` VALUES (1213, 'Cote-d\'\'Or', 75, NULL, NULL);
INSERT INTO `states` VALUES (1214, 'Cotes-d\'\'Armor', 75, NULL, NULL);
INSERT INTO `states` VALUES (1215, 'Creuse', 75, NULL, NULL);
INSERT INTO `states` VALUES (1216, 'Crolles', 75, NULL, NULL);
INSERT INTO `states` VALUES (1217, 'Deux-Sevres', 75, NULL, NULL);
INSERT INTO `states` VALUES (1218, 'Dordogne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1219, 'Doubs', 75, NULL, NULL);
INSERT INTO `states` VALUES (1220, 'Drome', 75, NULL, NULL);
INSERT INTO `states` VALUES (1221, 'Essonne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1222, 'Eure', 75, NULL, NULL);
INSERT INTO `states` VALUES (1223, 'Eure-et-Loir', 75, NULL, NULL);
INSERT INTO `states` VALUES (1224, 'Feucherolles', 75, NULL, NULL);
INSERT INTO `states` VALUES (1225, 'Finistere', 75, NULL, NULL);
INSERT INTO `states` VALUES (1226, 'Franche-Comte', 75, NULL, NULL);
INSERT INTO `states` VALUES (1227, 'Gard', 75, NULL, NULL);
INSERT INTO `states` VALUES (1228, 'Gers', 75, NULL, NULL);
INSERT INTO `states` VALUES (1229, 'Gironde', 75, NULL, NULL);
INSERT INTO `states` VALUES (1230, 'Haut-Rhin', 75, NULL, NULL);
INSERT INTO `states` VALUES (1231, 'Haute-Corse', 75, NULL, NULL);
INSERT INTO `states` VALUES (1232, 'Haute-Garonne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1233, 'Haute-Loire', 75, NULL, NULL);
INSERT INTO `states` VALUES (1234, 'Haute-Marne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1235, 'Haute-Saone', 75, NULL, NULL);
INSERT INTO `states` VALUES (1236, 'Haute-Savoie', 75, NULL, NULL);
INSERT INTO `states` VALUES (1237, 'Haute-Vienne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1238, 'Hautes-Alpes', 75, NULL, NULL);
INSERT INTO `states` VALUES (1239, 'Hautes-Pyrenees', 75, NULL, NULL);
INSERT INTO `states` VALUES (1240, 'Hauts-de-Seine', 75, NULL, NULL);
INSERT INTO `states` VALUES (1241, 'Herault', 75, NULL, NULL);
INSERT INTO `states` VALUES (1242, 'Ile-de-France', 75, NULL, NULL);
INSERT INTO `states` VALUES (1243, 'Ille-et-Vilaine', 75, NULL, NULL);
INSERT INTO `states` VALUES (1244, 'Indre', 75, NULL, NULL);
INSERT INTO `states` VALUES (1245, 'Indre-et-Loire', 75, NULL, NULL);
INSERT INTO `states` VALUES (1246, 'Isere', 75, NULL, NULL);
INSERT INTO `states` VALUES (1247, 'Jura', 75, NULL, NULL);
INSERT INTO `states` VALUES (1248, 'Klagenfurt', 75, NULL, NULL);
INSERT INTO `states` VALUES (1249, 'Landes', 75, NULL, NULL);
INSERT INTO `states` VALUES (1250, 'Languedoc-Roussillon', 75, NULL, NULL);
INSERT INTO `states` VALUES (1251, 'Larcay', 75, NULL, NULL);
INSERT INTO `states` VALUES (1252, 'Le Castellet', 75, NULL, NULL);
INSERT INTO `states` VALUES (1253, 'Le Creusot', 75, NULL, NULL);
INSERT INTO `states` VALUES (1254, 'Limousin', 75, NULL, NULL);
INSERT INTO `states` VALUES (1255, 'Loir-et-Cher', 75, NULL, NULL);
INSERT INTO `states` VALUES (1256, 'Loire', 75, NULL, NULL);
INSERT INTO `states` VALUES (1257, 'Loire-Atlantique', 75, NULL, NULL);
INSERT INTO `states` VALUES (1258, 'Loiret', 75, NULL, NULL);
INSERT INTO `states` VALUES (1259, 'Lorraine', 75, NULL, NULL);
INSERT INTO `states` VALUES (1260, 'Lot', 75, NULL, NULL);
INSERT INTO `states` VALUES (1261, 'Lot-et-Garonne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1262, 'Lower Normandy', 75, NULL, NULL);
INSERT INTO `states` VALUES (1263, 'Lozere', 75, NULL, NULL);
INSERT INTO `states` VALUES (1264, 'Maine-et-Loire', 75, NULL, NULL);
INSERT INTO `states` VALUES (1265, 'Manche', 75, NULL, NULL);
INSERT INTO `states` VALUES (1266, 'Marne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1267, 'Mayenne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1268, 'Meurthe-et-Moselle', 75, NULL, NULL);
INSERT INTO `states` VALUES (1269, 'Meuse', 75, NULL, NULL);
INSERT INTO `states` VALUES (1270, 'Midi-Pyrenees', 75, NULL, NULL);
INSERT INTO `states` VALUES (1271, 'Morbihan', 75, NULL, NULL);
INSERT INTO `states` VALUES (1272, 'Moselle', 75, NULL, NULL);
INSERT INTO `states` VALUES (1273, 'Nievre', 75, NULL, NULL);
INSERT INTO `states` VALUES (1274, 'Nord', 75, NULL, NULL);
INSERT INTO `states` VALUES (1275, 'Nord-Pas-de-Calais', 75, NULL, NULL);
INSERT INTO `states` VALUES (1276, 'Oise', 75, NULL, NULL);
INSERT INTO `states` VALUES (1277, 'Orne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1278, 'Paris', 75, NULL, NULL);
INSERT INTO `states` VALUES (1279, 'Pas-de-Calais', 75, NULL, NULL);
INSERT INTO `states` VALUES (1280, 'Pays de la Loire', 75, NULL, NULL);
INSERT INTO `states` VALUES (1281, 'Pays-de-la-Loire', 75, NULL, NULL);
INSERT INTO `states` VALUES (1282, 'Picardy', 75, NULL, NULL);
INSERT INTO `states` VALUES (1283, 'Puy-de-Dome', 75, NULL, NULL);
INSERT INTO `states` VALUES (1284, 'Pyrenees-Atlantiques', 75, NULL, NULL);
INSERT INTO `states` VALUES (1285, 'Pyrenees-Orientales', 75, NULL, NULL);
INSERT INTO `states` VALUES (1286, 'Quelmes', 75, NULL, NULL);
INSERT INTO `states` VALUES (1287, 'Rhone', 75, NULL, NULL);
INSERT INTO `states` VALUES (1288, 'Rhone-Alpes', 75, NULL, NULL);
INSERT INTO `states` VALUES (1289, 'Saint Ouen', 75, NULL, NULL);
INSERT INTO `states` VALUES (1290, 'Saint Viatre', 75, NULL, NULL);
INSERT INTO `states` VALUES (1291, 'Saone-et-Loire', 75, NULL, NULL);
INSERT INTO `states` VALUES (1292, 'Sarthe', 75, NULL, NULL);
INSERT INTO `states` VALUES (1293, 'Savoie', 75, NULL, NULL);
INSERT INTO `states` VALUES (1294, 'Seine-Maritime', 75, NULL, NULL);
INSERT INTO `states` VALUES (1295, 'Seine-Saint-Denis', 75, NULL, NULL);
INSERT INTO `states` VALUES (1296, 'Seine-et-Marne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1297, 'Somme', 75, NULL, NULL);
INSERT INTO `states` VALUES (1298, 'Sophia Antipolis', 75, NULL, NULL);
INSERT INTO `states` VALUES (1299, 'Souvans', 75, NULL, NULL);
INSERT INTO `states` VALUES (1300, 'Tarn', 75, NULL, NULL);
INSERT INTO `states` VALUES (1301, 'Tarn-et-Garonne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1302, 'Territoire de Belfort', 75, NULL, NULL);
INSERT INTO `states` VALUES (1303, 'Treignac', 75, NULL, NULL);
INSERT INTO `states` VALUES (1304, 'Upper Normandy', 75, NULL, NULL);
INSERT INTO `states` VALUES (1305, 'Val-d\'\'Oise', 75, NULL, NULL);
INSERT INTO `states` VALUES (1306, 'Val-de-Marne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1307, 'Var', 75, NULL, NULL);
INSERT INTO `states` VALUES (1308, 'Vaucluse', 75, NULL, NULL);
INSERT INTO `states` VALUES (1309, 'Vellise', 75, NULL, NULL);
INSERT INTO `states` VALUES (1310, 'Vendee', 75, NULL, NULL);
INSERT INTO `states` VALUES (1311, 'Vienne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1312, 'Vosges', 75, NULL, NULL);
INSERT INTO `states` VALUES (1313, 'Yonne', 75, NULL, NULL);
INSERT INTO `states` VALUES (1314, 'Yvelines', 75, NULL, NULL);
INSERT INTO `states` VALUES (1315, 'Cayenne', 76, NULL, NULL);
INSERT INTO `states` VALUES (1316, 'Saint-Laurent-du-Maroni', 76, NULL, NULL);
INSERT INTO `states` VALUES (1317, 'Iles du Vent', 77, NULL, NULL);
INSERT INTO `states` VALUES (1318, 'Iles sous le Vent', 77, NULL, NULL);
INSERT INTO `states` VALUES (1319, 'Marquesas', 77, NULL, NULL);
INSERT INTO `states` VALUES (1320, 'Tuamotu', 77, NULL, NULL);
INSERT INTO `states` VALUES (1321, 'Tubuai', 77, NULL, NULL);
INSERT INTO `states` VALUES (1322, 'Amsterdam', 78, NULL, NULL);
INSERT INTO `states` VALUES (1323, 'Crozet Islands', 78, NULL, NULL);
INSERT INTO `states` VALUES (1324, 'Kerguelen', 78, NULL, NULL);
INSERT INTO `states` VALUES (1325, 'Estuaire', 79, NULL, NULL);
INSERT INTO `states` VALUES (1326, 'Haut-Ogooue', 79, NULL, NULL);
INSERT INTO `states` VALUES (1327, 'Moyen-Ogooue', 79, NULL, NULL);
INSERT INTO `states` VALUES (1328, 'Ngounie', 79, NULL, NULL);
INSERT INTO `states` VALUES (1329, 'Nyanga', 79, NULL, NULL);
INSERT INTO `states` VALUES (1330, 'Ogooue-Ivindo', 79, NULL, NULL);
INSERT INTO `states` VALUES (1331, 'Ogooue-Lolo', 79, NULL, NULL);
INSERT INTO `states` VALUES (1332, 'Ogooue-Maritime', 79, NULL, NULL);
INSERT INTO `states` VALUES (1333, 'Woleu-Ntem', 79, NULL, NULL);
INSERT INTO `states` VALUES (1334, 'Banjul', 80, NULL, NULL);
INSERT INTO `states` VALUES (1335, 'Basse', 80, NULL, NULL);
INSERT INTO `states` VALUES (1336, 'Brikama', 80, NULL, NULL);
INSERT INTO `states` VALUES (1337, 'Janjanbureh', 80, NULL, NULL);
INSERT INTO `states` VALUES (1338, 'Kanifing', 80, NULL, NULL);
INSERT INTO `states` VALUES (1339, 'Kerewan', 80, NULL, NULL);
INSERT INTO `states` VALUES (1340, 'Kuntaur', 80, NULL, NULL);
INSERT INTO `states` VALUES (1341, 'Mansakonko', 80, NULL, NULL);
INSERT INTO `states` VALUES (1342, 'Abhasia', 81, NULL, NULL);
INSERT INTO `states` VALUES (1343, 'Ajaria', 81, NULL, NULL);
INSERT INTO `states` VALUES (1344, 'Guria', 81, NULL, NULL);
INSERT INTO `states` VALUES (1345, 'Imereti', 81, NULL, NULL);
INSERT INTO `states` VALUES (1346, 'Kaheti', 81, NULL, NULL);
INSERT INTO `states` VALUES (1347, 'Kvemo Kartli', 81, NULL, NULL);
INSERT INTO `states` VALUES (1348, 'Mcheta-Mtianeti', 81, NULL, NULL);
INSERT INTO `states` VALUES (1349, 'Racha', 81, NULL, NULL);
INSERT INTO `states` VALUES (1350, 'Samagrelo-Zemo Svaneti', 81, NULL, NULL);
INSERT INTO `states` VALUES (1351, 'Samche-Zhavaheti', 81, NULL, NULL);
INSERT INTO `states` VALUES (1352, 'Shida Kartli', 81, NULL, NULL);
INSERT INTO `states` VALUES (1353, 'Tbilisi', 81, NULL, NULL);
INSERT INTO `states` VALUES (1354, 'Auvergne', 82, NULL, NULL);
INSERT INTO `states` VALUES (1355, 'Baden-Wurttemberg', 82, NULL, NULL);
INSERT INTO `states` VALUES (1356, 'Bavaria', 82, NULL, NULL);
INSERT INTO `states` VALUES (1357, 'Bayern', 82, NULL, NULL);
INSERT INTO `states` VALUES (1358, 'Beilstein Wurtt', 82, NULL, NULL);
INSERT INTO `states` VALUES (1359, 'Berlin', 82, NULL, NULL);
INSERT INTO `states` VALUES (1360, 'Brandenburg', 82, NULL, NULL);
INSERT INTO `states` VALUES (1361, 'Bremen', 82, NULL, NULL);
INSERT INTO `states` VALUES (1362, 'Dreisbach', 82, NULL, NULL);
INSERT INTO `states` VALUES (1363, 'Freistaat Bayern', 82, NULL, NULL);
INSERT INTO `states` VALUES (1364, 'Hamburg', 82, NULL, NULL);
INSERT INTO `states` VALUES (1365, 'Hannover', 82, NULL, NULL);
INSERT INTO `states` VALUES (1366, 'Heroldstatt', 82, NULL, NULL);
INSERT INTO `states` VALUES (1367, 'Hessen', 82, NULL, NULL);
INSERT INTO `states` VALUES (1368, 'Kortenberg', 82, NULL, NULL);
INSERT INTO `states` VALUES (1369, 'Laasdorf', 82, NULL, NULL);
INSERT INTO `states` VALUES (1370, 'Land Baden-Wurttemberg', 82, NULL, NULL);
INSERT INTO `states` VALUES (1371, 'Land Bayern', 82, NULL, NULL);
INSERT INTO `states` VALUES (1372, 'Land Brandenburg', 82, NULL, NULL);
INSERT INTO `states` VALUES (1373, 'Land Hessen', 82, NULL, NULL);
INSERT INTO `states` VALUES (1374, 'Land Mecklenburg-Vorpommern', 82, NULL, NULL);
INSERT INTO `states` VALUES (1375, 'Land Nordrhein-Westfalen', 82, NULL, NULL);
INSERT INTO `states` VALUES (1376, 'Land Rheinland-Pfalz', 82, NULL, NULL);
INSERT INTO `states` VALUES (1377, 'Land Sachsen', 82, NULL, NULL);
INSERT INTO `states` VALUES (1378, 'Land Sachsen-Anhalt', 82, NULL, NULL);
INSERT INTO `states` VALUES (1379, 'Land Thuringen', 82, NULL, NULL);
INSERT INTO `states` VALUES (1380, 'Lower Saxony', 82, NULL, NULL);
INSERT INTO `states` VALUES (1381, 'Mecklenburg-Vorpommern', 82, NULL, NULL);
INSERT INTO `states` VALUES (1382, 'Mulfingen', 82, NULL, NULL);
INSERT INTO `states` VALUES (1383, 'Munich', 82, NULL, NULL);
INSERT INTO `states` VALUES (1384, 'Neubeuern', 82, NULL, NULL);
INSERT INTO `states` VALUES (1385, 'Niedersachsen', 82, NULL, NULL);
INSERT INTO `states` VALUES (1386, 'Noord-Holland', 82, NULL, NULL);
INSERT INTO `states` VALUES (1387, 'Nordrhein-Westfalen', 82, NULL, NULL);
INSERT INTO `states` VALUES (1388, 'North Rhine-Westphalia', 82, NULL, NULL);
INSERT INTO `states` VALUES (1389, 'Osterode', 82, NULL, NULL);
INSERT INTO `states` VALUES (1390, 'Rheinland-Pfalz', 82, NULL, NULL);
INSERT INTO `states` VALUES (1391, 'Rhineland-Palatinate', 82, NULL, NULL);
INSERT INTO `states` VALUES (1392, 'Saarland', 82, NULL, NULL);
INSERT INTO `states` VALUES (1393, 'Sachsen', 82, NULL, NULL);
INSERT INTO `states` VALUES (1394, 'Sachsen-Anhalt', 82, NULL, NULL);
INSERT INTO `states` VALUES (1395, 'Saxony', 82, NULL, NULL);
INSERT INTO `states` VALUES (1396, 'Schleswig-Holstein', 82, NULL, NULL);
INSERT INTO `states` VALUES (1397, 'Thuringia', 82, NULL, NULL);
INSERT INTO `states` VALUES (1398, 'Webling', 82, NULL, NULL);
INSERT INTO `states` VALUES (1399, 'Weinstrabe', 82, NULL, NULL);
INSERT INTO `states` VALUES (1400, 'schlobborn', 82, NULL, NULL);
INSERT INTO `states` VALUES (1401, 'Ashanti', 83, NULL, NULL);
INSERT INTO `states` VALUES (1402, 'Brong-Ahafo', 83, NULL, NULL);
INSERT INTO `states` VALUES (1403, 'Central', 83, NULL, NULL);
INSERT INTO `states` VALUES (1404, 'Eastern', 83, NULL, NULL);
INSERT INTO `states` VALUES (1405, 'Greater Accra', 83, NULL, NULL);
INSERT INTO `states` VALUES (1406, 'Northern', 83, NULL, NULL);
INSERT INTO `states` VALUES (1407, 'Upper East', 83, NULL, NULL);
INSERT INTO `states` VALUES (1408, 'Upper West', 83, NULL, NULL);
INSERT INTO `states` VALUES (1409, 'Volta', 83, NULL, NULL);
INSERT INTO `states` VALUES (1410, 'Western', 83, NULL, NULL);
INSERT INTO `states` VALUES (1411, 'Gibraltar', 84, NULL, NULL);
INSERT INTO `states` VALUES (1412, 'Acharnes', 85, NULL, NULL);
INSERT INTO `states` VALUES (1413, 'Ahaia', 85, NULL, NULL);
INSERT INTO `states` VALUES (1414, 'Aitolia kai Akarnania', 85, NULL, NULL);
INSERT INTO `states` VALUES (1415, 'Argolis', 85, NULL, NULL);
INSERT INTO `states` VALUES (1416, 'Arkadia', 85, NULL, NULL);
INSERT INTO `states` VALUES (1417, 'Arta', 85, NULL, NULL);
INSERT INTO `states` VALUES (1418, 'Attica', 85, NULL, NULL);
INSERT INTO `states` VALUES (1419, 'Attiki', 85, NULL, NULL);
INSERT INTO `states` VALUES (1420, 'Ayion Oros', 85, NULL, NULL);
INSERT INTO `states` VALUES (1421, 'Crete', 85, NULL, NULL);
INSERT INTO `states` VALUES (1422, 'Dodekanisos', 85, NULL, NULL);
INSERT INTO `states` VALUES (1423, 'Drama', 85, NULL, NULL);
INSERT INTO `states` VALUES (1424, 'Evia', 85, NULL, NULL);
INSERT INTO `states` VALUES (1425, 'Evritania', 85, NULL, NULL);
INSERT INTO `states` VALUES (1426, 'Evros', 85, NULL, NULL);
INSERT INTO `states` VALUES (1427, 'Evvoia', 85, NULL, NULL);
INSERT INTO `states` VALUES (1428, 'Florina', 85, NULL, NULL);
INSERT INTO `states` VALUES (1429, 'Fokis', 85, NULL, NULL);
INSERT INTO `states` VALUES (1430, 'Fthiotis', 85, NULL, NULL);
INSERT INTO `states` VALUES (1431, 'Grevena', 85, NULL, NULL);
INSERT INTO `states` VALUES (1432, 'Halandri', 85, NULL, NULL);
INSERT INTO `states` VALUES (1433, 'Halkidiki', 85, NULL, NULL);
INSERT INTO `states` VALUES (1434, 'Hania', 85, NULL, NULL);
INSERT INTO `states` VALUES (1435, 'Heraklion', 85, NULL, NULL);
INSERT INTO `states` VALUES (1436, 'Hios', 85, NULL, NULL);
INSERT INTO `states` VALUES (1437, 'Ilia', 85, NULL, NULL);
INSERT INTO `states` VALUES (1438, 'Imathia', 85, NULL, NULL);
INSERT INTO `states` VALUES (1439, 'Ioannina', 85, NULL, NULL);
INSERT INTO `states` VALUES (1440, 'Iraklion', 85, NULL, NULL);
INSERT INTO `states` VALUES (1441, 'Karditsa', 85, NULL, NULL);
INSERT INTO `states` VALUES (1442, 'Kastoria', 85, NULL, NULL);
INSERT INTO `states` VALUES (1443, 'Kavala', 85, NULL, NULL);
INSERT INTO `states` VALUES (1444, 'Kefallinia', 85, NULL, NULL);
INSERT INTO `states` VALUES (1445, 'Kerkira', 85, NULL, NULL);
INSERT INTO `states` VALUES (1446, 'Kiklades', 85, NULL, NULL);
INSERT INTO `states` VALUES (1447, 'Kilkis', 85, NULL, NULL);
INSERT INTO `states` VALUES (1448, 'Korinthia', 85, NULL, NULL);
INSERT INTO `states` VALUES (1449, 'Kozani', 85, NULL, NULL);
INSERT INTO `states` VALUES (1450, 'Lakonia', 85, NULL, NULL);
INSERT INTO `states` VALUES (1451, 'Larisa', 85, NULL, NULL);
INSERT INTO `states` VALUES (1452, 'Lasithi', 85, NULL, NULL);
INSERT INTO `states` VALUES (1453, 'Lesvos', 85, NULL, NULL);
INSERT INTO `states` VALUES (1454, 'Levkas', 85, NULL, NULL);
INSERT INTO `states` VALUES (1455, 'Magnisia', 85, NULL, NULL);
INSERT INTO `states` VALUES (1456, 'Messinia', 85, NULL, NULL);
INSERT INTO `states` VALUES (1457, 'Nomos Attikis', 85, NULL, NULL);
INSERT INTO `states` VALUES (1458, 'Nomos Zakynthou', 85, NULL, NULL);
INSERT INTO `states` VALUES (1459, 'Pella', 85, NULL, NULL);
INSERT INTO `states` VALUES (1460, 'Pieria', 85, NULL, NULL);
INSERT INTO `states` VALUES (1461, 'Piraios', 85, NULL, NULL);
INSERT INTO `states` VALUES (1462, 'Preveza', 85, NULL, NULL);
INSERT INTO `states` VALUES (1463, 'Rethimni', 85, NULL, NULL);
INSERT INTO `states` VALUES (1464, 'Rodopi', 85, NULL, NULL);
INSERT INTO `states` VALUES (1465, 'Samos', 85, NULL, NULL);
INSERT INTO `states` VALUES (1466, 'Serrai', 85, NULL, NULL);
INSERT INTO `states` VALUES (1467, 'Thesprotia', 85, NULL, NULL);
INSERT INTO `states` VALUES (1468, 'Thessaloniki', 85, NULL, NULL);
INSERT INTO `states` VALUES (1469, 'Trikala', 85, NULL, NULL);
INSERT INTO `states` VALUES (1470, 'Voiotia', 85, NULL, NULL);
INSERT INTO `states` VALUES (1471, 'West Greece', 85, NULL, NULL);
INSERT INTO `states` VALUES (1472, 'Xanthi', 85, NULL, NULL);
INSERT INTO `states` VALUES (1473, 'Zakinthos', 85, NULL, NULL);
INSERT INTO `states` VALUES (1474, 'Aasiaat', 86, NULL, NULL);
INSERT INTO `states` VALUES (1475, 'Ammassalik', 86, NULL, NULL);
INSERT INTO `states` VALUES (1476, 'Illoqqortoormiut', 86, NULL, NULL);
INSERT INTO `states` VALUES (1477, 'Ilulissat', 86, NULL, NULL);
INSERT INTO `states` VALUES (1478, 'Ivittuut', 86, NULL, NULL);
INSERT INTO `states` VALUES (1479, 'Kangaatsiaq', 86, NULL, NULL);
INSERT INTO `states` VALUES (1480, 'Maniitsoq', 86, NULL, NULL);
INSERT INTO `states` VALUES (1481, 'Nanortalik', 86, NULL, NULL);
INSERT INTO `states` VALUES (1482, 'Narsaq', 86, NULL, NULL);
INSERT INTO `states` VALUES (1483, 'Nuuk', 86, NULL, NULL);
INSERT INTO `states` VALUES (1484, 'Paamiut', 86, NULL, NULL);
INSERT INTO `states` VALUES (1485, 'Qaanaaq', 86, NULL, NULL);
INSERT INTO `states` VALUES (1486, 'Qaqortoq', 86, NULL, NULL);
INSERT INTO `states` VALUES (1487, 'Qasigiannguit', 86, NULL, NULL);
INSERT INTO `states` VALUES (1488, 'Qeqertarsuaq', 86, NULL, NULL);
INSERT INTO `states` VALUES (1489, 'Sisimiut', 86, NULL, NULL);
INSERT INTO `states` VALUES (1490, 'Udenfor kommunal inddeling', 86, NULL, NULL);
INSERT INTO `states` VALUES (1491, 'Upernavik', 86, NULL, NULL);
INSERT INTO `states` VALUES (1492, 'Uummannaq', 86, NULL, NULL);
INSERT INTO `states` VALUES (1493, 'Carriacou-Petite Martinique', 87, NULL, NULL);
INSERT INTO `states` VALUES (1494, 'Saint Andrew', 87, NULL, NULL);
INSERT INTO `states` VALUES (1495, 'Saint Davids', 87, NULL, NULL);
INSERT INTO `states` VALUES (1496, 'Saint George\'\'s', 87, NULL, NULL);
INSERT INTO `states` VALUES (1497, 'Saint John', 87, NULL, NULL);
INSERT INTO `states` VALUES (1498, 'Saint Mark', 87, NULL, NULL);
INSERT INTO `states` VALUES (1499, 'Saint Patrick', 87, NULL, NULL);
INSERT INTO `states` VALUES (1500, 'Basse-Terre', 88, NULL, NULL);
INSERT INTO `states` VALUES (1501, 'Grande-Terre', 88, NULL, NULL);
INSERT INTO `states` VALUES (1502, 'Iles des Saintes', 88, NULL, NULL);
INSERT INTO `states` VALUES (1503, 'La Desirade', 88, NULL, NULL);
INSERT INTO `states` VALUES (1504, 'Marie-Galante', 88, NULL, NULL);
INSERT INTO `states` VALUES (1505, 'Saint Barthelemy', 88, NULL, NULL);
INSERT INTO `states` VALUES (1506, 'Saint Martin', 88, NULL, NULL);
INSERT INTO `states` VALUES (1507, 'Agana Heights', 89, NULL, NULL);
INSERT INTO `states` VALUES (1508, 'Agat', 89, NULL, NULL);
INSERT INTO `states` VALUES (1509, 'Barrigada', 89, NULL, NULL);
INSERT INTO `states` VALUES (1510, 'Chalan-Pago-Ordot', 89, NULL, NULL);
INSERT INTO `states` VALUES (1511, 'Dededo', 89, NULL, NULL);
INSERT INTO `states` VALUES (1512, 'Hagatna', 89, NULL, NULL);
INSERT INTO `states` VALUES (1513, 'Inarajan', 89, NULL, NULL);
INSERT INTO `states` VALUES (1514, 'Mangilao', 89, NULL, NULL);
INSERT INTO `states` VALUES (1515, 'Merizo', 89, NULL, NULL);
INSERT INTO `states` VALUES (1516, 'Mongmong-Toto-Maite', 89, NULL, NULL);
INSERT INTO `states` VALUES (1517, 'Santa Rita', 89, NULL, NULL);
INSERT INTO `states` VALUES (1518, 'Sinajana', 89, NULL, NULL);
INSERT INTO `states` VALUES (1519, 'Talofofo', 89, NULL, NULL);
INSERT INTO `states` VALUES (1520, 'Tamuning', 89, NULL, NULL);
INSERT INTO `states` VALUES (1521, 'Yigo', 89, NULL, NULL);
INSERT INTO `states` VALUES (1522, 'Yona', 89, NULL, NULL);
INSERT INTO `states` VALUES (1523, 'Alta Verapaz', 90, NULL, NULL);
INSERT INTO `states` VALUES (1524, 'Baja Verapaz', 90, NULL, NULL);
INSERT INTO `states` VALUES (1525, 'Chimaltenango', 90, NULL, NULL);
INSERT INTO `states` VALUES (1526, 'Chiquimula', 90, NULL, NULL);
INSERT INTO `states` VALUES (1527, 'El Progreso', 90, NULL, NULL);
INSERT INTO `states` VALUES (1528, 'Escuintla', 90, NULL, NULL);
INSERT INTO `states` VALUES (1529, 'Guatemala', 90, NULL, NULL);
INSERT INTO `states` VALUES (1530, 'Huehuetenango', 90, NULL, NULL);
INSERT INTO `states` VALUES (1531, 'Izabal', 90, NULL, NULL);
INSERT INTO `states` VALUES (1532, 'Jalapa', 90, NULL, NULL);
INSERT INTO `states` VALUES (1533, 'Jutiapa', 90, NULL, NULL);
INSERT INTO `states` VALUES (1534, 'Peten', 90, NULL, NULL);
INSERT INTO `states` VALUES (1535, 'Quezaltenango', 90, NULL, NULL);
INSERT INTO `states` VALUES (1536, 'Quiche', 90, NULL, NULL);
INSERT INTO `states` VALUES (1537, 'Retalhuleu', 90, NULL, NULL);
INSERT INTO `states` VALUES (1538, 'Sacatepequez', 90, NULL, NULL);
INSERT INTO `states` VALUES (1539, 'San Marcos', 90, NULL, NULL);
INSERT INTO `states` VALUES (1540, 'Santa Rosa', 90, NULL, NULL);
INSERT INTO `states` VALUES (1541, 'Solola', 90, NULL, NULL);
INSERT INTO `states` VALUES (1542, 'Suchitepequez', 90, NULL, NULL);
INSERT INTO `states` VALUES (1543, 'Totonicapan', 90, NULL, NULL);
INSERT INTO `states` VALUES (1544, 'Zacapa', 90, NULL, NULL);
INSERT INTO `states` VALUES (1545, 'Alderney', 91, NULL, NULL);
INSERT INTO `states` VALUES (1546, 'Castel', 91, NULL, NULL);
INSERT INTO `states` VALUES (1547, 'Forest', 91, NULL, NULL);
INSERT INTO `states` VALUES (1548, 'Saint Andrew', 91, NULL, NULL);
INSERT INTO `states` VALUES (1549, 'Saint Martin', 91, NULL, NULL);
INSERT INTO `states` VALUES (1550, 'Saint Peter Port', 91, NULL, NULL);
INSERT INTO `states` VALUES (1551, 'Saint Pierre du Bois', 91, NULL, NULL);
INSERT INTO `states` VALUES (1552, 'Saint Sampson', 91, NULL, NULL);
INSERT INTO `states` VALUES (1553, 'Saint Saviour', 91, NULL, NULL);
INSERT INTO `states` VALUES (1554, 'Sark', 91, NULL, NULL);
INSERT INTO `states` VALUES (1555, 'Torteval', 91, NULL, NULL);
INSERT INTO `states` VALUES (1556, 'Vale', 91, NULL, NULL);
INSERT INTO `states` VALUES (1557, 'Beyla', 92, NULL, NULL);
INSERT INTO `states` VALUES (1558, 'Boffa', 92, NULL, NULL);
INSERT INTO `states` VALUES (1559, 'Boke', 92, NULL, NULL);
INSERT INTO `states` VALUES (1560, 'Conakry', 92, NULL, NULL);
INSERT INTO `states` VALUES (1561, 'Coyah', 92, NULL, NULL);
INSERT INTO `states` VALUES (1562, 'Dabola', 92, NULL, NULL);
INSERT INTO `states` VALUES (1563, 'Dalaba', 92, NULL, NULL);
INSERT INTO `states` VALUES (1564, 'Dinguiraye', 92, NULL, NULL);
INSERT INTO `states` VALUES (1565, 'Faranah', 92, NULL, NULL);
INSERT INTO `states` VALUES (1566, 'Forecariah', 92, NULL, NULL);
INSERT INTO `states` VALUES (1567, 'Fria', 92, NULL, NULL);
INSERT INTO `states` VALUES (1568, 'Gaoual', 92, NULL, NULL);
INSERT INTO `states` VALUES (1569, 'Gueckedou', 92, NULL, NULL);
INSERT INTO `states` VALUES (1570, 'Kankan', 92, NULL, NULL);
INSERT INTO `states` VALUES (1571, 'Kerouane', 92, NULL, NULL);
INSERT INTO `states` VALUES (1572, 'Kindia', 92, NULL, NULL);
INSERT INTO `states` VALUES (1573, 'Kissidougou', 92, NULL, NULL);
INSERT INTO `states` VALUES (1574, 'Koubia', 92, NULL, NULL);
INSERT INTO `states` VALUES (1575, 'Koundara', 92, NULL, NULL);
INSERT INTO `states` VALUES (1576, 'Kouroussa', 92, NULL, NULL);
INSERT INTO `states` VALUES (1577, 'Labe', 92, NULL, NULL);
INSERT INTO `states` VALUES (1578, 'Lola', 92, NULL, NULL);
INSERT INTO `states` VALUES (1579, 'Macenta', 92, NULL, NULL);
INSERT INTO `states` VALUES (1580, 'Mali', 92, NULL, NULL);
INSERT INTO `states` VALUES (1581, 'Mamou', 92, NULL, NULL);
INSERT INTO `states` VALUES (1582, 'Mandiana', 92, NULL, NULL);
INSERT INTO `states` VALUES (1583, 'Nzerekore', 92, NULL, NULL);
INSERT INTO `states` VALUES (1584, 'Pita', 92, NULL, NULL);
INSERT INTO `states` VALUES (1585, 'Siguiri', 92, NULL, NULL);
INSERT INTO `states` VALUES (1586, 'Telimele', 92, NULL, NULL);
INSERT INTO `states` VALUES (1587, 'Tougue', 92, NULL, NULL);
INSERT INTO `states` VALUES (1588, 'Yomou', 92, NULL, NULL);
INSERT INTO `states` VALUES (1589, 'Bafata', 93, NULL, NULL);
INSERT INTO `states` VALUES (1590, 'Bissau', 93, NULL, NULL);
INSERT INTO `states` VALUES (1591, 'Bolama', 93, NULL, NULL);
INSERT INTO `states` VALUES (1592, 'Cacheu', 93, NULL, NULL);
INSERT INTO `states` VALUES (1593, 'Gabu', 93, NULL, NULL);
INSERT INTO `states` VALUES (1594, 'Oio', 93, NULL, NULL);
INSERT INTO `states` VALUES (1595, 'Quinara', 93, NULL, NULL);
INSERT INTO `states` VALUES (1596, 'Tombali', 93, NULL, NULL);
INSERT INTO `states` VALUES (1597, 'Barima-Waini', 94, NULL, NULL);
INSERT INTO `states` VALUES (1598, 'Cuyuni-Mazaruni', 94, NULL, NULL);
INSERT INTO `states` VALUES (1599, 'Demerara-Mahaica', 94, NULL, NULL);
INSERT INTO `states` VALUES (1600, 'East Berbice-Corentyne', 94, NULL, NULL);
INSERT INTO `states` VALUES (1601, 'Essequibo Islands-West Demerar', 94, NULL, NULL);
INSERT INTO `states` VALUES (1602, 'Mahaica-Berbice', 94, NULL, NULL);
INSERT INTO `states` VALUES (1603, 'Pomeroon-Supenaam', 94, NULL, NULL);
INSERT INTO `states` VALUES (1604, 'Potaro-Siparuni', 94, NULL, NULL);
INSERT INTO `states` VALUES (1605, 'Upper Demerara-Berbice', 94, NULL, NULL);
INSERT INTO `states` VALUES (1606, 'Upper Takutu-Upper Essequibo', 94, NULL, NULL);
INSERT INTO `states` VALUES (1607, 'Artibonite', 95, NULL, NULL);
INSERT INTO `states` VALUES (1608, 'Centre', 95, NULL, NULL);
INSERT INTO `states` VALUES (1609, 'Grand\'\'Anse', 95, NULL, NULL);
INSERT INTO `states` VALUES (1610, 'Nord', 95, NULL, NULL);
INSERT INTO `states` VALUES (1611, 'Nord-Est', 95, NULL, NULL);
INSERT INTO `states` VALUES (1612, 'Nord-Ouest', 95, NULL, NULL);
INSERT INTO `states` VALUES (1613, 'Ouest', 95, NULL, NULL);
INSERT INTO `states` VALUES (1614, 'Sud', 95, NULL, NULL);
INSERT INTO `states` VALUES (1615, 'Sud-Est', 95, NULL, NULL);
INSERT INTO `states` VALUES (1616, 'Heard and McDonald Islands', 96, NULL, NULL);
INSERT INTO `states` VALUES (1617, 'Atlantida', 97, NULL, NULL);
INSERT INTO `states` VALUES (1618, 'Choluteca', 97, NULL, NULL);
INSERT INTO `states` VALUES (1619, 'Colon', 97, NULL, NULL);
INSERT INTO `states` VALUES (1620, 'Comayagua', 97, NULL, NULL);
INSERT INTO `states` VALUES (1621, 'Copan', 97, NULL, NULL);
INSERT INTO `states` VALUES (1622, 'Cortes', 97, NULL, NULL);
INSERT INTO `states` VALUES (1623, 'Distrito Central', 97, NULL, NULL);
INSERT INTO `states` VALUES (1624, 'El Paraiso', 97, NULL, NULL);
INSERT INTO `states` VALUES (1625, 'Francisco Morazan', 97, NULL, NULL);
INSERT INTO `states` VALUES (1626, 'Gracias a Dios', 97, NULL, NULL);
INSERT INTO `states` VALUES (1627, 'Intibuca', 97, NULL, NULL);
INSERT INTO `states` VALUES (1628, 'Islas de la Bahia', 97, NULL, NULL);
INSERT INTO `states` VALUES (1629, 'La Paz', 97, NULL, NULL);
INSERT INTO `states` VALUES (1630, 'Lempira', 97, NULL, NULL);
INSERT INTO `states` VALUES (1631, 'Ocotepeque', 97, NULL, NULL);
INSERT INTO `states` VALUES (1632, 'Olancho', 97, NULL, NULL);
INSERT INTO `states` VALUES (1633, 'Santa Barbara', 97, NULL, NULL);
INSERT INTO `states` VALUES (1634, 'Valle', 97, NULL, NULL);
INSERT INTO `states` VALUES (1635, 'Yoro', 97, NULL, NULL);
INSERT INTO `states` VALUES (1636, 'Hong Kong', 98, NULL, NULL);
INSERT INTO `states` VALUES (1637, 'Bacs-Kiskun', 99, NULL, NULL);
INSERT INTO `states` VALUES (1638, 'Baranya', 99, NULL, NULL);
INSERT INTO `states` VALUES (1639, 'Bekes', 99, NULL, NULL);
INSERT INTO `states` VALUES (1640, 'Borsod-Abauj-Zemplen', 99, NULL, NULL);
INSERT INTO `states` VALUES (1641, 'Budapest', 99, NULL, NULL);
INSERT INTO `states` VALUES (1642, 'Csongrad', 99, NULL, NULL);
INSERT INTO `states` VALUES (1643, 'Fejer', 99, NULL, NULL);
INSERT INTO `states` VALUES (1644, 'Gyor-Moson-Sopron', 99, NULL, NULL);
INSERT INTO `states` VALUES (1645, 'Hajdu-Bihar', 99, NULL, NULL);
INSERT INTO `states` VALUES (1646, 'Heves', 99, NULL, NULL);
INSERT INTO `states` VALUES (1647, 'Jasz-Nagykun-Szolnok', 99, NULL, NULL);
INSERT INTO `states` VALUES (1648, 'Komarom-Esztergom', 99, NULL, NULL);
INSERT INTO `states` VALUES (1649, 'Nograd', 99, NULL, NULL);
INSERT INTO `states` VALUES (1650, 'Pest', 99, NULL, NULL);
INSERT INTO `states` VALUES (1651, 'Somogy', 99, NULL, NULL);
INSERT INTO `states` VALUES (1652, 'Szabolcs-Szatmar-Bereg', 99, NULL, NULL);
INSERT INTO `states` VALUES (1653, 'Tolna', 99, NULL, NULL);
INSERT INTO `states` VALUES (1654, 'Vas', 99, NULL, NULL);
INSERT INTO `states` VALUES (1655, 'Veszprem', 99, NULL, NULL);
INSERT INTO `states` VALUES (1656, 'Zala', 99, NULL, NULL);
INSERT INTO `states` VALUES (1657, 'Austurland', 100, NULL, NULL);
INSERT INTO `states` VALUES (1658, 'Gullbringusysla', 100, NULL, NULL);
INSERT INTO `states` VALUES (1659, 'Hofu borgarsva i', 100, NULL, NULL);
INSERT INTO `states` VALUES (1660, 'Nor urland eystra', 100, NULL, NULL);
INSERT INTO `states` VALUES (1661, 'Nor urland vestra', 100, NULL, NULL);
INSERT INTO `states` VALUES (1662, 'Su urland', 100, NULL, NULL);
INSERT INTO `states` VALUES (1663, 'Su urnes', 100, NULL, NULL);
INSERT INTO `states` VALUES (1664, 'Vestfir ir', 100, NULL, NULL);
INSERT INTO `states` VALUES (1665, 'Vesturland', 100, NULL, NULL);
INSERT INTO `states` VALUES (1666, 'Aceh', 102, NULL, NULL);
INSERT INTO `states` VALUES (1667, 'Bali', 102, NULL, NULL);
INSERT INTO `states` VALUES (1668, 'Bangka-Belitung', 102, NULL, NULL);
INSERT INTO `states` VALUES (1669, 'Banten', 102, NULL, NULL);
INSERT INTO `states` VALUES (1670, 'Bengkulu', 102, NULL, NULL);
INSERT INTO `states` VALUES (1671, 'Gandaria', 102, NULL, NULL);
INSERT INTO `states` VALUES (1672, 'Gorontalo', 102, NULL, NULL);
INSERT INTO `states` VALUES (1673, 'Jakarta', 102, NULL, NULL);
INSERT INTO `states` VALUES (1674, 'Jambi', 102, NULL, NULL);
INSERT INTO `states` VALUES (1675, 'Jawa Barat', 102, NULL, NULL);
INSERT INTO `states` VALUES (1676, 'Jawa Tengah', 102, NULL, NULL);
INSERT INTO `states` VALUES (1677, 'Jawa Timur', 102, NULL, NULL);
INSERT INTO `states` VALUES (1678, 'Kalimantan Barat', 102, NULL, NULL);
INSERT INTO `states` VALUES (1679, 'Kalimantan Selatan', 102, NULL, NULL);
INSERT INTO `states` VALUES (1680, 'Kalimantan Tengah', 102, NULL, NULL);
INSERT INTO `states` VALUES (1681, 'Kalimantan Timur', 102, NULL, NULL);
INSERT INTO `states` VALUES (1682, 'Kendal', 102, NULL, NULL);
INSERT INTO `states` VALUES (1683, 'Lampung', 102, NULL, NULL);
INSERT INTO `states` VALUES (1684, 'Maluku', 102, NULL, NULL);
INSERT INTO `states` VALUES (1685, 'Maluku Utara', 102, NULL, NULL);
INSERT INTO `states` VALUES (1686, 'Nusa Tenggara Barat', 102, NULL, NULL);
INSERT INTO `states` VALUES (1687, 'Nusa Tenggara Timur', 102, NULL, NULL);
INSERT INTO `states` VALUES (1688, 'Papua', 102, NULL, NULL);
INSERT INTO `states` VALUES (1689, 'Riau', 102, NULL, NULL);
INSERT INTO `states` VALUES (1690, 'Riau Kepulauan', 102, NULL, NULL);
INSERT INTO `states` VALUES (1691, 'Solo', 102, NULL, NULL);
INSERT INTO `states` VALUES (1692, 'Sulawesi Selatan', 102, NULL, NULL);
INSERT INTO `states` VALUES (1693, 'Sulawesi Tengah', 102, NULL, NULL);
INSERT INTO `states` VALUES (1694, 'Sulawesi Tenggara', 102, NULL, NULL);
INSERT INTO `states` VALUES (1695, 'Sulawesi Utara', 102, NULL, NULL);
INSERT INTO `states` VALUES (1696, 'Sumatera Barat', 102, NULL, NULL);
INSERT INTO `states` VALUES (1697, 'Sumatera Selatan', 102, NULL, NULL);
INSERT INTO `states` VALUES (1698, 'Sumatera Utara', 102, NULL, NULL);
INSERT INTO `states` VALUES (1699, 'Yogyakarta', 102, NULL, NULL);
INSERT INTO `states` VALUES (1700, 'Ardabil', 103, NULL, NULL);
INSERT INTO `states` VALUES (1701, 'Azarbayjan-e Bakhtari', 103, NULL, NULL);
INSERT INTO `states` VALUES (1702, 'Azarbayjan-e Khavari', 103, NULL, NULL);
INSERT INTO `states` VALUES (1703, 'Bushehr', 103, NULL, NULL);
INSERT INTO `states` VALUES (1704, 'Chahar Mahal-e Bakhtiari', 103, NULL, NULL);
INSERT INTO `states` VALUES (1705, 'Esfahan', 103, NULL, NULL);
INSERT INTO `states` VALUES (1706, 'Fars', 103, NULL, NULL);
INSERT INTO `states` VALUES (1707, 'Gilan', 103, NULL, NULL);
INSERT INTO `states` VALUES (1708, 'Golestan', 103, NULL, NULL);
INSERT INTO `states` VALUES (1709, 'Hamadan', 103, NULL, NULL);
INSERT INTO `states` VALUES (1710, 'Hormozgan', 103, NULL, NULL);
INSERT INTO `states` VALUES (1711, 'Ilam', 103, NULL, NULL);
INSERT INTO `states` VALUES (1712, 'Kerman', 103, NULL, NULL);
INSERT INTO `states` VALUES (1713, 'Kermanshah', 103, NULL, NULL);
INSERT INTO `states` VALUES (1714, 'Khorasan', 103, NULL, NULL);
INSERT INTO `states` VALUES (1715, 'Khuzestan', 103, NULL, NULL);
INSERT INTO `states` VALUES (1716, 'Kohgiluyeh-e Boyerahmad', 103, NULL, NULL);
INSERT INTO `states` VALUES (1717, 'Kordestan', 103, NULL, NULL);
INSERT INTO `states` VALUES (1718, 'Lorestan', 103, NULL, NULL);
INSERT INTO `states` VALUES (1719, 'Markazi', 103, NULL, NULL);
INSERT INTO `states` VALUES (1720, 'Mazandaran', 103, NULL, NULL);
INSERT INTO `states` VALUES (1721, 'Ostan-e Esfahan', 103, NULL, NULL);
INSERT INTO `states` VALUES (1722, 'Qazvin', 103, NULL, NULL);
INSERT INTO `states` VALUES (1723, 'Qom', 103, NULL, NULL);
INSERT INTO `states` VALUES (1724, 'Semnan', 103, NULL, NULL);
INSERT INTO `states` VALUES (1725, 'Sistan-e Baluchestan', 103, NULL, NULL);
INSERT INTO `states` VALUES (1726, 'Tehran', 103, NULL, NULL);
INSERT INTO `states` VALUES (1727, 'Yazd', 103, NULL, NULL);
INSERT INTO `states` VALUES (1728, 'Zanjan', 103, NULL, NULL);
INSERT INTO `states` VALUES (1729, 'Babil', 104, NULL, NULL);
INSERT INTO `states` VALUES (1730, 'Baghdad', 104, NULL, NULL);
INSERT INTO `states` VALUES (1731, 'Dahuk', 104, NULL, NULL);
INSERT INTO `states` VALUES (1732, 'Dhi Qar', 104, NULL, NULL);
INSERT INTO `states` VALUES (1733, 'Diyala', 104, NULL, NULL);
INSERT INTO `states` VALUES (1734, 'Erbil', 104, NULL, NULL);
INSERT INTO `states` VALUES (1735, 'Irbil', 104, NULL, NULL);
INSERT INTO `states` VALUES (1736, 'Karbala', 104, NULL, NULL);
INSERT INTO `states` VALUES (1737, 'Kurdistan', 104, NULL, NULL);
INSERT INTO `states` VALUES (1738, 'Maysan', 104, NULL, NULL);
INSERT INTO `states` VALUES (1739, 'Ninawa', 104, NULL, NULL);
INSERT INTO `states` VALUES (1740, 'Salah-ad-Din', 104, NULL, NULL);
INSERT INTO `states` VALUES (1741, 'Wasit', 104, NULL, NULL);
INSERT INTO `states` VALUES (1742, 'al-Anbar', 104, NULL, NULL);
INSERT INTO `states` VALUES (1743, 'al-Basrah', 104, NULL, NULL);
INSERT INTO `states` VALUES (1744, 'al-Muthanna', 104, NULL, NULL);
INSERT INTO `states` VALUES (1745, 'al-Qadisiyah', 104, NULL, NULL);
INSERT INTO `states` VALUES (1746, 'an-Najaf', 104, NULL, NULL);
INSERT INTO `states` VALUES (1747, 'as-Sulaymaniyah', 104, NULL, NULL);
INSERT INTO `states` VALUES (1748, 'at-Ta\'\'mim', 104, NULL, NULL);
INSERT INTO `states` VALUES (1749, 'Armagh', 105, NULL, NULL);
INSERT INTO `states` VALUES (1750, 'Carlow', 105, NULL, NULL);
INSERT INTO `states` VALUES (1751, 'Cavan', 105, NULL, NULL);
INSERT INTO `states` VALUES (1752, 'Clare', 105, NULL, NULL);
INSERT INTO `states` VALUES (1753, 'Cork', 105, NULL, NULL);
INSERT INTO `states` VALUES (1754, 'Donegal', 105, NULL, NULL);
INSERT INTO `states` VALUES (1755, 'Dublin', 105, NULL, NULL);
INSERT INTO `states` VALUES (1756, 'Galway', 105, NULL, NULL);
INSERT INTO `states` VALUES (1757, 'Kerry', 105, NULL, NULL);
INSERT INTO `states` VALUES (1758, 'Kildare', 105, NULL, NULL);
INSERT INTO `states` VALUES (1759, 'Kilkenny', 105, NULL, NULL);
INSERT INTO `states` VALUES (1760, 'Laois', 105, NULL, NULL);
INSERT INTO `states` VALUES (1761, 'Leinster', 105, NULL, NULL);
INSERT INTO `states` VALUES (1762, 'Leitrim', 105, NULL, NULL);
INSERT INTO `states` VALUES (1763, 'Limerick', 105, NULL, NULL);
INSERT INTO `states` VALUES (1764, 'Loch Garman', 105, NULL, NULL);
INSERT INTO `states` VALUES (1765, 'Longford', 105, NULL, NULL);
INSERT INTO `states` VALUES (1766, 'Louth', 105, NULL, NULL);
INSERT INTO `states` VALUES (1767, 'Mayo', 105, NULL, NULL);
INSERT INTO `states` VALUES (1768, 'Meath', 105, NULL, NULL);
INSERT INTO `states` VALUES (1769, 'Monaghan', 105, NULL, NULL);
INSERT INTO `states` VALUES (1770, 'Offaly', 105, NULL, NULL);
INSERT INTO `states` VALUES (1771, 'Roscommon', 105, NULL, NULL);
INSERT INTO `states` VALUES (1772, 'Sligo', 105, NULL, NULL);
INSERT INTO `states` VALUES (1773, 'Tipperary North Riding', 105, NULL, NULL);
INSERT INTO `states` VALUES (1774, 'Tipperary South Riding', 105, NULL, NULL);
INSERT INTO `states` VALUES (1775, 'Ulster', 105, NULL, NULL);
INSERT INTO `states` VALUES (1776, 'Waterford', 105, NULL, NULL);
INSERT INTO `states` VALUES (1777, 'Westmeath', 105, NULL, NULL);
INSERT INTO `states` VALUES (1778, 'Wexford', 105, NULL, NULL);
INSERT INTO `states` VALUES (1779, 'Wicklow', 105, NULL, NULL);
INSERT INTO `states` VALUES (1780, 'Beit Hanania', 106, NULL, NULL);
INSERT INTO `states` VALUES (1781, 'Ben Gurion Airport', 106, NULL, NULL);
INSERT INTO `states` VALUES (1782, 'Bethlehem', 106, NULL, NULL);
INSERT INTO `states` VALUES (1783, 'Caesarea', 106, NULL, NULL);
INSERT INTO `states` VALUES (1784, 'Centre', 106, NULL, NULL);
INSERT INTO `states` VALUES (1785, 'Gaza', 106, NULL, NULL);
INSERT INTO `states` VALUES (1786, 'Hadaron', 106, NULL, NULL);
INSERT INTO `states` VALUES (1787, 'Haifa District', 106, NULL, NULL);
INSERT INTO `states` VALUES (1788, 'Hamerkaz', 106, NULL, NULL);
INSERT INTO `states` VALUES (1789, 'Hazafon', 106, NULL, NULL);
INSERT INTO `states` VALUES (1790, 'Hebron', 106, NULL, NULL);
INSERT INTO `states` VALUES (1791, 'Jaffa', 106, NULL, NULL);
INSERT INTO `states` VALUES (1792, 'Jerusalem', 106, NULL, NULL);
INSERT INTO `states` VALUES (1793, 'Khefa', 106, NULL, NULL);
INSERT INTO `states` VALUES (1794, 'Kiryat Yam', 106, NULL, NULL);
INSERT INTO `states` VALUES (1795, 'Lower Galilee', 106, NULL, NULL);
INSERT INTO `states` VALUES (1796, 'Qalqilya', 106, NULL, NULL);
INSERT INTO `states` VALUES (1797, 'Talme Elazar', 106, NULL, NULL);
INSERT INTO `states` VALUES (1798, 'Tel Aviv', 106, NULL, NULL);
INSERT INTO `states` VALUES (1799, 'Tsafon', 106, NULL, NULL);
INSERT INTO `states` VALUES (1800, 'Umm El Fahem', 106, NULL, NULL);
INSERT INTO `states` VALUES (1801, 'Yerushalayim', 106, NULL, NULL);
INSERT INTO `states` VALUES (1802, 'Abruzzi', 107, NULL, NULL);
INSERT INTO `states` VALUES (1803, 'Abruzzo', 107, NULL, NULL);
INSERT INTO `states` VALUES (1804, 'Agrigento', 107, NULL, NULL);
INSERT INTO `states` VALUES (1805, 'Alessandria', 107, NULL, NULL);
INSERT INTO `states` VALUES (1806, 'Ancona', 107, NULL, NULL);
INSERT INTO `states` VALUES (1807, 'Arezzo', 107, NULL, NULL);
INSERT INTO `states` VALUES (1808, 'Ascoli Piceno', 107, NULL, NULL);
INSERT INTO `states` VALUES (1809, 'Asti', 107, NULL, NULL);
INSERT INTO `states` VALUES (1810, 'Avellino', 107, NULL, NULL);
INSERT INTO `states` VALUES (1811, 'Bari', 107, NULL, NULL);
INSERT INTO `states` VALUES (1812, 'Basilicata', 107, NULL, NULL);
INSERT INTO `states` VALUES (1813, 'Belluno', 107, NULL, NULL);
INSERT INTO `states` VALUES (1814, 'Benevento', 107, NULL, NULL);
INSERT INTO `states` VALUES (1815, 'Bergamo', 107, NULL, NULL);
INSERT INTO `states` VALUES (1816, 'Biella', 107, NULL, NULL);
INSERT INTO `states` VALUES (1817, 'Bologna', 107, NULL, NULL);
INSERT INTO `states` VALUES (1818, 'Bolzano', 107, NULL, NULL);
INSERT INTO `states` VALUES (1819, 'Brescia', 107, NULL, NULL);
INSERT INTO `states` VALUES (1820, 'Brindisi', 107, NULL, NULL);
INSERT INTO `states` VALUES (1821, 'Calabria', 107, NULL, NULL);
INSERT INTO `states` VALUES (1822, 'Campania', 107, NULL, NULL);
INSERT INTO `states` VALUES (1823, 'Cartoceto', 107, NULL, NULL);
INSERT INTO `states` VALUES (1824, 'Caserta', 107, NULL, NULL);
INSERT INTO `states` VALUES (1825, 'Catania', 107, NULL, NULL);
INSERT INTO `states` VALUES (1826, 'Chieti', 107, NULL, NULL);
INSERT INTO `states` VALUES (1827, 'Como', 107, NULL, NULL);
INSERT INTO `states` VALUES (1828, 'Cosenza', 107, NULL, NULL);
INSERT INTO `states` VALUES (1829, 'Cremona', 107, NULL, NULL);
INSERT INTO `states` VALUES (1830, 'Cuneo', 107, NULL, NULL);
INSERT INTO `states` VALUES (1831, 'Emilia-Romagna', 107, NULL, NULL);
INSERT INTO `states` VALUES (1832, 'Ferrara', 107, NULL, NULL);
INSERT INTO `states` VALUES (1833, 'Firenze', 107, NULL, NULL);
INSERT INTO `states` VALUES (1834, 'Florence', 107, NULL, NULL);
INSERT INTO `states` VALUES (1835, 'Forli-Cesena', 107, NULL, NULL);
INSERT INTO `states` VALUES (1836, 'Friuli-Venezia Giulia', 107, NULL, NULL);
INSERT INTO `states` VALUES (1837, 'Frosinone', 107, NULL, NULL);
INSERT INTO `states` VALUES (1838, 'Genoa', 107, NULL, NULL);
INSERT INTO `states` VALUES (1839, 'Gorizia', 107, NULL, NULL);
INSERT INTO `states` VALUES (1840, 'L\'\'Aquila', 107, NULL, NULL);
INSERT INTO `states` VALUES (1841, 'Lazio', 107, NULL, NULL);
INSERT INTO `states` VALUES (1842, 'Lecce', 107, NULL, NULL);
INSERT INTO `states` VALUES (1843, 'Lecco', 107, NULL, NULL);
INSERT INTO `states` VALUES (1844, 'Lecco Province', 107, NULL, NULL);
INSERT INTO `states` VALUES (1845, 'Liguria', 107, NULL, NULL);
INSERT INTO `states` VALUES (1846, 'Lodi', 107, NULL, NULL);
INSERT INTO `states` VALUES (1847, 'Lombardia', 107, NULL, NULL);
INSERT INTO `states` VALUES (1848, 'Lombardy', 107, NULL, NULL);
INSERT INTO `states` VALUES (1849, 'Macerata', 107, NULL, NULL);
INSERT INTO `states` VALUES (1850, 'Mantova', 107, NULL, NULL);
INSERT INTO `states` VALUES (1851, 'Marche', 107, NULL, NULL);
INSERT INTO `states` VALUES (1852, 'Messina', 107, NULL, NULL);
INSERT INTO `states` VALUES (1853, 'Milan', 107, NULL, NULL);
INSERT INTO `states` VALUES (1854, 'Modena', 107, NULL, NULL);
INSERT INTO `states` VALUES (1855, 'Molise', 107, NULL, NULL);
INSERT INTO `states` VALUES (1856, 'Molteno', 107, NULL, NULL);
INSERT INTO `states` VALUES (1857, 'Montenegro', 107, NULL, NULL);
INSERT INTO `states` VALUES (1858, 'Monza and Brianza', 107, NULL, NULL);
INSERT INTO `states` VALUES (1859, 'Naples', 107, NULL, NULL);
INSERT INTO `states` VALUES (1860, 'Novara', 107, NULL, NULL);
INSERT INTO `states` VALUES (1861, 'Padova', 107, NULL, NULL);
INSERT INTO `states` VALUES (1862, 'Parma', 107, NULL, NULL);
INSERT INTO `states` VALUES (1863, 'Pavia', 107, NULL, NULL);
INSERT INTO `states` VALUES (1864, 'Perugia', 107, NULL, NULL);
INSERT INTO `states` VALUES (1865, 'Pesaro-Urbino', 107, NULL, NULL);
INSERT INTO `states` VALUES (1866, 'Piacenza', 107, NULL, NULL);
INSERT INTO `states` VALUES (1867, 'Piedmont', 107, NULL, NULL);
INSERT INTO `states` VALUES (1868, 'Piemonte', 107, NULL, NULL);
INSERT INTO `states` VALUES (1869, 'Pisa', 107, NULL, NULL);
INSERT INTO `states` VALUES (1870, 'Pordenone', 107, NULL, NULL);
INSERT INTO `states` VALUES (1871, 'Potenza', 107, NULL, NULL);
INSERT INTO `states` VALUES (1872, 'Puglia', 107, NULL, NULL);
INSERT INTO `states` VALUES (1873, 'Reggio Emilia', 107, NULL, NULL);
INSERT INTO `states` VALUES (1874, 'Rimini', 107, NULL, NULL);
INSERT INTO `states` VALUES (1875, 'Roma', 107, NULL, NULL);
INSERT INTO `states` VALUES (1876, 'Salerno', 107, NULL, NULL);
INSERT INTO `states` VALUES (1877, 'Sardegna', 107, NULL, NULL);
INSERT INTO `states` VALUES (1878, 'Sassari', 107, NULL, NULL);
INSERT INTO `states` VALUES (1879, 'Savona', 107, NULL, NULL);
INSERT INTO `states` VALUES (1880, 'Sicilia', 107, NULL, NULL);
INSERT INTO `states` VALUES (1881, 'Siena', 107, NULL, NULL);
INSERT INTO `states` VALUES (1882, 'Sondrio', 107, NULL, NULL);
INSERT INTO `states` VALUES (1883, 'South Tyrol', 107, NULL, NULL);
INSERT INTO `states` VALUES (1884, 'Taranto', 107, NULL, NULL);
INSERT INTO `states` VALUES (1885, 'Teramo', 107, NULL, NULL);
INSERT INTO `states` VALUES (1886, 'Torino', 107, NULL, NULL);
INSERT INTO `states` VALUES (1887, 'Toscana', 107, NULL, NULL);
INSERT INTO `states` VALUES (1888, 'Trapani', 107, NULL, NULL);
INSERT INTO `states` VALUES (1889, 'Trentino-Alto Adige', 107, NULL, NULL);
INSERT INTO `states` VALUES (1890, 'Trento', 107, NULL, NULL);
INSERT INTO `states` VALUES (1891, 'Treviso', 107, NULL, NULL);
INSERT INTO `states` VALUES (1892, 'Udine', 107, NULL, NULL);
INSERT INTO `states` VALUES (1893, 'Umbria', 107, NULL, NULL);
INSERT INTO `states` VALUES (1894, 'Valle d\'\'Aosta', 107, NULL, NULL);
INSERT INTO `states` VALUES (1895, 'Varese', 107, NULL, NULL);
INSERT INTO `states` VALUES (1896, 'Veneto', 107, NULL, NULL);
INSERT INTO `states` VALUES (1897, 'Venezia', 107, NULL, NULL);
INSERT INTO `states` VALUES (1898, 'Verbano-Cusio-Ossola', 107, NULL, NULL);
INSERT INTO `states` VALUES (1899, 'Vercelli', 107, NULL, NULL);
INSERT INTO `states` VALUES (1900, 'Verona', 107, NULL, NULL);
INSERT INTO `states` VALUES (1901, 'Vicenza', 107, NULL, NULL);
INSERT INTO `states` VALUES (1902, 'Viterbo', 107, NULL, NULL);
INSERT INTO `states` VALUES (1903, 'Buxoro Viloyati', 108, NULL, NULL);
INSERT INTO `states` VALUES (1904, 'Clarendon', 108, NULL, NULL);
INSERT INTO `states` VALUES (1905, 'Hanover', 108, NULL, NULL);
INSERT INTO `states` VALUES (1906, 'Kingston', 108, NULL, NULL);
INSERT INTO `states` VALUES (1907, 'Manchester', 108, NULL, NULL);
INSERT INTO `states` VALUES (1908, 'Portland', 108, NULL, NULL);
INSERT INTO `states` VALUES (1909, 'Saint Andrews', 108, NULL, NULL);
INSERT INTO `states` VALUES (1910, 'Saint Ann', 108, NULL, NULL);
INSERT INTO `states` VALUES (1911, 'Saint Catherine', 108, NULL, NULL);
INSERT INTO `states` VALUES (1912, 'Saint Elizabeth', 108, NULL, NULL);
INSERT INTO `states` VALUES (1913, 'Saint James', 108, NULL, NULL);
INSERT INTO `states` VALUES (1914, 'Saint Mary', 108, NULL, NULL);
INSERT INTO `states` VALUES (1915, 'Saint Thomas', 108, NULL, NULL);
INSERT INTO `states` VALUES (1916, 'Trelawney', 108, NULL, NULL);
INSERT INTO `states` VALUES (1917, 'Westmoreland', 108, NULL, NULL);
INSERT INTO `states` VALUES (1918, 'Aichi', 109, NULL, NULL);
INSERT INTO `states` VALUES (1919, 'Akita', 109, NULL, NULL);
INSERT INTO `states` VALUES (1920, 'Aomori', 109, NULL, NULL);
INSERT INTO `states` VALUES (1921, 'Chiba', 109, NULL, NULL);
INSERT INTO `states` VALUES (1922, 'Ehime', 109, NULL, NULL);
INSERT INTO `states` VALUES (1923, 'Fukui', 109, NULL, NULL);
INSERT INTO `states` VALUES (1924, 'Fukuoka', 109, NULL, NULL);
INSERT INTO `states` VALUES (1925, 'Fukushima', 109, NULL, NULL);
INSERT INTO `states` VALUES (1926, 'Gifu', 109, NULL, NULL);
INSERT INTO `states` VALUES (1927, 'Gumma', 109, NULL, NULL);
INSERT INTO `states` VALUES (1928, 'Hiroshima', 109, NULL, NULL);
INSERT INTO `states` VALUES (1929, 'Hokkaido', 109, NULL, NULL);
INSERT INTO `states` VALUES (1930, 'Hyogo', 109, NULL, NULL);
INSERT INTO `states` VALUES (1931, 'Ibaraki', 109, NULL, NULL);
INSERT INTO `states` VALUES (1932, 'Ishikawa', 109, NULL, NULL);
INSERT INTO `states` VALUES (1933, 'Iwate', 109, NULL, NULL);
INSERT INTO `states` VALUES (1934, 'Kagawa', 109, NULL, NULL);
INSERT INTO `states` VALUES (1935, 'Kagoshima', 109, NULL, NULL);
INSERT INTO `states` VALUES (1936, 'Kanagawa', 109, NULL, NULL);
INSERT INTO `states` VALUES (1937, 'Kanto', 109, NULL, NULL);
INSERT INTO `states` VALUES (1938, 'Kochi', 109, NULL, NULL);
INSERT INTO `states` VALUES (1939, 'Kumamoto', 109, NULL, NULL);
INSERT INTO `states` VALUES (1940, 'Kyoto', 109, NULL, NULL);
INSERT INTO `states` VALUES (1941, 'Mie', 109, NULL, NULL);
INSERT INTO `states` VALUES (1942, 'Miyagi', 109, NULL, NULL);
INSERT INTO `states` VALUES (1943, 'Miyazaki', 109, NULL, NULL);
INSERT INTO `states` VALUES (1944, 'Nagano', 109, NULL, NULL);
INSERT INTO `states` VALUES (1945, 'Nagasaki', 109, NULL, NULL);
INSERT INTO `states` VALUES (1946, 'Nara', 109, NULL, NULL);
INSERT INTO `states` VALUES (1947, 'Niigata', 109, NULL, NULL);
INSERT INTO `states` VALUES (1948, 'Oita', 109, NULL, NULL);
INSERT INTO `states` VALUES (1949, 'Okayama', 109, NULL, NULL);
INSERT INTO `states` VALUES (1950, 'Okinawa', 109, NULL, NULL);
INSERT INTO `states` VALUES (1951, 'Osaka', 109, NULL, NULL);
INSERT INTO `states` VALUES (1952, 'Saga', 109, NULL, NULL);
INSERT INTO `states` VALUES (1953, 'Saitama', 109, NULL, NULL);
INSERT INTO `states` VALUES (1954, 'Shiga', 109, NULL, NULL);
INSERT INTO `states` VALUES (1955, 'Shimane', 109, NULL, NULL);
INSERT INTO `states` VALUES (1956, 'Shizuoka', 109, NULL, NULL);
INSERT INTO `states` VALUES (1957, 'Tochigi', 109, NULL, NULL);
INSERT INTO `states` VALUES (1958, 'Tokushima', 109, NULL, NULL);
INSERT INTO `states` VALUES (1959, 'Tokyo', 109, NULL, NULL);
INSERT INTO `states` VALUES (1960, 'Tottori', 109, NULL, NULL);
INSERT INTO `states` VALUES (1961, 'Toyama', 109, NULL, NULL);
INSERT INTO `states` VALUES (1962, 'Wakayama', 109, NULL, NULL);
INSERT INTO `states` VALUES (1963, 'Yamagata', 109, NULL, NULL);
INSERT INTO `states` VALUES (1964, 'Yamaguchi', 109, NULL, NULL);
INSERT INTO `states` VALUES (1965, 'Yamanashi', 109, NULL, NULL);
INSERT INTO `states` VALUES (1966, 'Grouville', 110, NULL, NULL);
INSERT INTO `states` VALUES (1967, 'Saint Brelade', 110, NULL, NULL);
INSERT INTO `states` VALUES (1968, 'Saint Clement', 110, NULL, NULL);
INSERT INTO `states` VALUES (1969, 'Saint Helier', 110, NULL, NULL);
INSERT INTO `states` VALUES (1970, 'Saint John', 110, NULL, NULL);
INSERT INTO `states` VALUES (1971, 'Saint Lawrence', 110, NULL, NULL);
INSERT INTO `states` VALUES (1972, 'Saint Martin', 110, NULL, NULL);
INSERT INTO `states` VALUES (1973, 'Saint Mary', 110, NULL, NULL);
INSERT INTO `states` VALUES (1974, 'Saint Peter', 110, NULL, NULL);
INSERT INTO `states` VALUES (1975, 'Saint Saviour', 110, NULL, NULL);
INSERT INTO `states` VALUES (1976, 'Trinity', 110, NULL, NULL);
INSERT INTO `states` VALUES (1977, 'Ajlun', 111, NULL, NULL);
INSERT INTO `states` VALUES (1978, 'Amman', 111, NULL, NULL);
INSERT INTO `states` VALUES (1979, 'Irbid', 111, NULL, NULL);
INSERT INTO `states` VALUES (1980, 'Jarash', 111, NULL, NULL);
INSERT INTO `states` VALUES (1981, 'Ma\'\'an', 111, NULL, NULL);
INSERT INTO `states` VALUES (1982, 'Madaba', 111, NULL, NULL);
INSERT INTO `states` VALUES (1983, 'al-\'\'Aqabah', 111, NULL, NULL);
INSERT INTO `states` VALUES (1984, 'al-Balqa', 111, NULL, NULL);
INSERT INTO `states` VALUES (1985, 'al-Karak', 111, NULL, NULL);
INSERT INTO `states` VALUES (1986, 'al-Mafraq', 111, NULL, NULL);
INSERT INTO `states` VALUES (1987, 'at-Tafilah', 111, NULL, NULL);
INSERT INTO `states` VALUES (1988, 'az-Zarqa', 111, NULL, NULL);
INSERT INTO `states` VALUES (1989, 'Akmecet', 112, NULL, NULL);
INSERT INTO `states` VALUES (1990, 'Akmola', 112, NULL, NULL);
INSERT INTO `states` VALUES (1991, 'Aktobe', 112, NULL, NULL);
INSERT INTO `states` VALUES (1992, 'Almati', 112, NULL, NULL);
INSERT INTO `states` VALUES (1993, 'Atirau', 112, NULL, NULL);
INSERT INTO `states` VALUES (1994, 'Batis Kazakstan', 112, NULL, NULL);
INSERT INTO `states` VALUES (1995, 'Burlinsky Region', 112, NULL, NULL);
INSERT INTO `states` VALUES (1996, 'Karagandi', 112, NULL, NULL);
INSERT INTO `states` VALUES (1997, 'Kostanay', 112, NULL, NULL);
INSERT INTO `states` VALUES (1998, 'Mankistau', 112, NULL, NULL);
INSERT INTO `states` VALUES (1999, 'Ontustik Kazakstan', 112, NULL, NULL);
INSERT INTO `states` VALUES (2000, 'Pavlodar', 112, NULL, NULL);
INSERT INTO `states` VALUES (2001, 'Sigis Kazakstan', 112, NULL, NULL);
INSERT INTO `states` VALUES (2002, 'Soltustik Kazakstan', 112, NULL, NULL);
INSERT INTO `states` VALUES (2003, 'Taraz', 112, NULL, NULL);
INSERT INTO `states` VALUES (2004, 'Central', 113, NULL, NULL);
INSERT INTO `states` VALUES (2005, 'Coast', 113, NULL, NULL);
INSERT INTO `states` VALUES (2006, 'Eastern', 113, NULL, NULL);
INSERT INTO `states` VALUES (2007, 'Nairobi', 113, NULL, NULL);
INSERT INTO `states` VALUES (2008, 'North Eastern', 113, NULL, NULL);
INSERT INTO `states` VALUES (2009, 'Nyanza', 113, NULL, NULL);
INSERT INTO `states` VALUES (2010, 'Rift Valley', 113, NULL, NULL);
INSERT INTO `states` VALUES (2011, 'Western', 113, NULL, NULL);
INSERT INTO `states` VALUES (2012, 'Abaiang', 114, NULL, NULL);
INSERT INTO `states` VALUES (2013, 'Abemana', 114, NULL, NULL);
INSERT INTO `states` VALUES (2014, 'Aranuka', 114, NULL, NULL);
INSERT INTO `states` VALUES (2015, 'Arorae', 114, NULL, NULL);
INSERT INTO `states` VALUES (2016, 'Banaba', 114, NULL, NULL);
INSERT INTO `states` VALUES (2017, 'Beru', 114, NULL, NULL);
INSERT INTO `states` VALUES (2018, 'Butaritari', 114, NULL, NULL);
INSERT INTO `states` VALUES (2019, 'Kiritimati', 114, NULL, NULL);
INSERT INTO `states` VALUES (2020, 'Kuria', 114, NULL, NULL);
INSERT INTO `states` VALUES (2021, 'Maiana', 114, NULL, NULL);
INSERT INTO `states` VALUES (2022, 'Makin', 114, NULL, NULL);
INSERT INTO `states` VALUES (2023, 'Marakei', 114, NULL, NULL);
INSERT INTO `states` VALUES (2024, 'Nikunau', 114, NULL, NULL);
INSERT INTO `states` VALUES (2025, 'Nonouti', 114, NULL, NULL);
INSERT INTO `states` VALUES (2026, 'Onotoa', 114, NULL, NULL);
INSERT INTO `states` VALUES (2027, 'Phoenix Islands', 114, NULL, NULL);
INSERT INTO `states` VALUES (2028, 'Tabiteuea North', 114, NULL, NULL);
INSERT INTO `states` VALUES (2029, 'Tabiteuea South', 114, NULL, NULL);
INSERT INTO `states` VALUES (2030, 'Tabuaeran', 114, NULL, NULL);
INSERT INTO `states` VALUES (2031, 'Tamana', 114, NULL, NULL);
INSERT INTO `states` VALUES (2032, 'Tarawa North', 114, NULL, NULL);
INSERT INTO `states` VALUES (2033, 'Tarawa South', 114, NULL, NULL);
INSERT INTO `states` VALUES (2034, 'Teraina', 114, NULL, NULL);
INSERT INTO `states` VALUES (2035, 'Chagangdo', 115, NULL, NULL);
INSERT INTO `states` VALUES (2036, 'Hamgyeongbukto', 115, NULL, NULL);
INSERT INTO `states` VALUES (2037, 'Hamgyeongnamdo', 115, NULL, NULL);
INSERT INTO `states` VALUES (2038, 'Hwanghaebukto', 115, NULL, NULL);
INSERT INTO `states` VALUES (2039, 'Hwanghaenamdo', 115, NULL, NULL);
INSERT INTO `states` VALUES (2040, 'Kaeseong', 115, NULL, NULL);
INSERT INTO `states` VALUES (2041, 'Kangweon', 115, NULL, NULL);
INSERT INTO `states` VALUES (2042, 'Nampo', 115, NULL, NULL);
INSERT INTO `states` VALUES (2043, 'Pyeonganbukto', 115, NULL, NULL);
INSERT INTO `states` VALUES (2044, 'Pyeongannamdo', 115, NULL, NULL);
INSERT INTO `states` VALUES (2045, 'Pyeongyang', 115, NULL, NULL);
INSERT INTO `states` VALUES (2046, 'Yanggang', 115, NULL, NULL);
INSERT INTO `states` VALUES (2047, 'Busan', 116, NULL, NULL);
INSERT INTO `states` VALUES (2048, 'Cheju', 116, NULL, NULL);
INSERT INTO `states` VALUES (2049, 'Chollabuk', 116, NULL, NULL);
INSERT INTO `states` VALUES (2050, 'Chollanam', 116, NULL, NULL);
INSERT INTO `states` VALUES (2051, 'Chungbuk', 116, NULL, NULL);
INSERT INTO `states` VALUES (2052, 'Chungcheongbuk', 116, NULL, NULL);
INSERT INTO `states` VALUES (2053, 'Chungcheongnam', 116, NULL, NULL);
INSERT INTO `states` VALUES (2054, 'Chungnam', 116, NULL, NULL);
INSERT INTO `states` VALUES (2055, 'Daegu', 116, NULL, NULL);
INSERT INTO `states` VALUES (2056, 'Gangwon-do', 116, NULL, NULL);
INSERT INTO `states` VALUES (2057, 'Goyang-si', 116, NULL, NULL);
INSERT INTO `states` VALUES (2058, 'Gyeonggi-do', 116, NULL, NULL);
INSERT INTO `states` VALUES (2059, 'Gyeongsang', 116, NULL, NULL);
INSERT INTO `states` VALUES (2060, 'Gyeongsangnam-do', 116, NULL, NULL);
INSERT INTO `states` VALUES (2061, 'Incheon', 116, NULL, NULL);
INSERT INTO `states` VALUES (2062, 'Jeju-Si', 116, NULL, NULL);
INSERT INTO `states` VALUES (2063, 'Jeonbuk', 116, NULL, NULL);
INSERT INTO `states` VALUES (2064, 'Kangweon', 116, NULL, NULL);
INSERT INTO `states` VALUES (2065, 'Kwangju', 116, NULL, NULL);
INSERT INTO `states` VALUES (2066, 'Kyeonggi', 116, NULL, NULL);
INSERT INTO `states` VALUES (2067, 'Kyeongsangbuk', 116, NULL, NULL);
INSERT INTO `states` VALUES (2068, 'Kyeongsangnam', 116, NULL, NULL);
INSERT INTO `states` VALUES (2069, 'Kyonggi-do', 116, NULL, NULL);
INSERT INTO `states` VALUES (2070, 'Kyungbuk-Do', 116, NULL, NULL);
INSERT INTO `states` VALUES (2071, 'Kyunggi-Do', 116, NULL, NULL);
INSERT INTO `states` VALUES (2072, 'Kyunggi-do', 116, NULL, NULL);
INSERT INTO `states` VALUES (2073, 'Pusan', 116, NULL, NULL);
INSERT INTO `states` VALUES (2074, 'Seoul', 116, NULL, NULL);
INSERT INTO `states` VALUES (2075, 'Sudogwon', 116, NULL, NULL);
INSERT INTO `states` VALUES (2076, 'Taegu', 116, NULL, NULL);
INSERT INTO `states` VALUES (2077, 'Taejeon', 116, NULL, NULL);
INSERT INTO `states` VALUES (2078, 'Taejon-gwangyoksi', 116, NULL, NULL);
INSERT INTO `states` VALUES (2079, 'Ulsan', 116, NULL, NULL);
INSERT INTO `states` VALUES (2080, 'Wonju', 116, NULL, NULL);
INSERT INTO `states` VALUES (2081, 'gwangyoksi', 116, NULL, NULL);
INSERT INTO `states` VALUES (2082, 'Al Asimah', 117, NULL, NULL);
INSERT INTO `states` VALUES (2083, 'Hawalli', 117, NULL, NULL);
INSERT INTO `states` VALUES (2084, 'Mishref', 117, NULL, NULL);
INSERT INTO `states` VALUES (2085, 'Qadesiya', 117, NULL, NULL);
INSERT INTO `states` VALUES (2086, 'Safat', 117, NULL, NULL);
INSERT INTO `states` VALUES (2087, 'Salmiya', 117, NULL, NULL);
INSERT INTO `states` VALUES (2088, 'al-Ahmadi', 117, NULL, NULL);
INSERT INTO `states` VALUES (2089, 'al-Farwaniyah', 117, NULL, NULL);
INSERT INTO `states` VALUES (2090, 'al-Jahra', 117, NULL, NULL);
INSERT INTO `states` VALUES (2091, 'al-Kuwayt', 117, NULL, NULL);
INSERT INTO `states` VALUES (2092, 'Batken', 118, NULL, NULL);
INSERT INTO `states` VALUES (2093, 'Bishkek', 118, NULL, NULL);
INSERT INTO `states` VALUES (2094, 'Chui', 118, NULL, NULL);
INSERT INTO `states` VALUES (2095, 'Issyk-Kul', 118, NULL, NULL);
INSERT INTO `states` VALUES (2096, 'Jalal-Abad', 118, NULL, NULL);
INSERT INTO `states` VALUES (2097, 'Naryn', 118, NULL, NULL);
INSERT INTO `states` VALUES (2098, 'Osh', 118, NULL, NULL);
INSERT INTO `states` VALUES (2099, 'Talas', 118, NULL, NULL);
INSERT INTO `states` VALUES (2100, 'Attopu', 119, NULL, NULL);
INSERT INTO `states` VALUES (2101, 'Bokeo', 119, NULL, NULL);
INSERT INTO `states` VALUES (2102, 'Bolikhamsay', 119, NULL, NULL);
INSERT INTO `states` VALUES (2103, 'Champasak', 119, NULL, NULL);
INSERT INTO `states` VALUES (2104, 'Houaphanh', 119, NULL, NULL);
INSERT INTO `states` VALUES (2105, 'Khammouane', 119, NULL, NULL);
INSERT INTO `states` VALUES (2106, 'Luang Nam Tha', 119, NULL, NULL);
INSERT INTO `states` VALUES (2107, 'Luang Prabang', 119, NULL, NULL);
INSERT INTO `states` VALUES (2108, 'Oudomxay', 119, NULL, NULL);
INSERT INTO `states` VALUES (2109, 'Phongsaly', 119, NULL, NULL);
INSERT INTO `states` VALUES (2110, 'Saravan', 119, NULL, NULL);
INSERT INTO `states` VALUES (2111, 'Savannakhet', 119, NULL, NULL);
INSERT INTO `states` VALUES (2112, 'Sekong', 119, NULL, NULL);
INSERT INTO `states` VALUES (2113, 'Viangchan Prefecture', 119, NULL, NULL);
INSERT INTO `states` VALUES (2114, 'Viangchan Province', 119, NULL, NULL);
INSERT INTO `states` VALUES (2115, 'Xaignabury', 119, NULL, NULL);
INSERT INTO `states` VALUES (2116, 'Xiang Khuang', 119, NULL, NULL);
INSERT INTO `states` VALUES (2117, 'Aizkraukles', 120, NULL, NULL);
INSERT INTO `states` VALUES (2118, 'Aluksnes', 120, NULL, NULL);
INSERT INTO `states` VALUES (2119, 'Balvu', 120, NULL, NULL);
INSERT INTO `states` VALUES (2120, 'Bauskas', 120, NULL, NULL);
INSERT INTO `states` VALUES (2121, 'Cesu', 120, NULL, NULL);
INSERT INTO `states` VALUES (2122, 'Daugavpils', 120, NULL, NULL);
INSERT INTO `states` VALUES (2123, 'Daugavpils City', 120, NULL, NULL);
INSERT INTO `states` VALUES (2124, 'Dobeles', 120, NULL, NULL);
INSERT INTO `states` VALUES (2125, 'Gulbenes', 120, NULL, NULL);
INSERT INTO `states` VALUES (2126, 'Jekabspils', 120, NULL, NULL);
INSERT INTO `states` VALUES (2127, 'Jelgava', 120, NULL, NULL);
INSERT INTO `states` VALUES (2128, 'Jelgavas', 120, NULL, NULL);
INSERT INTO `states` VALUES (2129, 'Jurmala City', 120, NULL, NULL);
INSERT INTO `states` VALUES (2130, 'Kraslavas', 120, NULL, NULL);
INSERT INTO `states` VALUES (2131, 'Kuldigas', 120, NULL, NULL);
INSERT INTO `states` VALUES (2132, 'Liepaja', 120, NULL, NULL);
INSERT INTO `states` VALUES (2133, 'Liepajas', 120, NULL, NULL);
INSERT INTO `states` VALUES (2134, 'Limbazhu', 120, NULL, NULL);
INSERT INTO `states` VALUES (2135, 'Ludzas', 120, NULL, NULL);
INSERT INTO `states` VALUES (2136, 'Madonas', 120, NULL, NULL);
INSERT INTO `states` VALUES (2137, 'Ogres', 120, NULL, NULL);
INSERT INTO `states` VALUES (2138, 'Preilu', 120, NULL, NULL);
INSERT INTO `states` VALUES (2139, 'Rezekne', 120, NULL, NULL);
INSERT INTO `states` VALUES (2140, 'Rezeknes', 120, NULL, NULL);
INSERT INTO `states` VALUES (2141, 'Riga', 120, NULL, NULL);
INSERT INTO `states` VALUES (2142, 'Rigas', 120, NULL, NULL);
INSERT INTO `states` VALUES (2143, 'Saldus', 120, NULL, NULL);
INSERT INTO `states` VALUES (2144, 'Talsu', 120, NULL, NULL);
INSERT INTO `states` VALUES (2145, 'Tukuma', 120, NULL, NULL);
INSERT INTO `states` VALUES (2146, 'Valkas', 120, NULL, NULL);
INSERT INTO `states` VALUES (2147, 'Valmieras', 120, NULL, NULL);
INSERT INTO `states` VALUES (2148, 'Ventspils', 120, NULL, NULL);
INSERT INTO `states` VALUES (2149, 'Ventspils City', 120, NULL, NULL);
INSERT INTO `states` VALUES (2150, 'Beirut', 121, NULL, NULL);
INSERT INTO `states` VALUES (2151, 'Jabal Lubnan', 121, NULL, NULL);
INSERT INTO `states` VALUES (2152, 'Mohafazat Liban-Nord', 121, NULL, NULL);
INSERT INTO `states` VALUES (2153, 'Mohafazat Mont-Liban', 121, NULL, NULL);
INSERT INTO `states` VALUES (2154, 'Sidon', 121, NULL, NULL);
INSERT INTO `states` VALUES (2155, 'al-Biqa', 121, NULL, NULL);
INSERT INTO `states` VALUES (2156, 'al-Janub', 121, NULL, NULL);
INSERT INTO `states` VALUES (2157, 'an-Nabatiyah', 121, NULL, NULL);
INSERT INTO `states` VALUES (2158, 'ash-Shamal', 121, NULL, NULL);
INSERT INTO `states` VALUES (2159, 'Berea', 122, NULL, NULL);
INSERT INTO `states` VALUES (2160, 'Butha-Buthe', 122, NULL, NULL);
INSERT INTO `states` VALUES (2161, 'Leribe', 122, NULL, NULL);
INSERT INTO `states` VALUES (2162, 'Mafeteng', 122, NULL, NULL);
INSERT INTO `states` VALUES (2163, 'Maseru', 122, NULL, NULL);
INSERT INTO `states` VALUES (2164, 'Mohale\'\'s Hoek', 122, NULL, NULL);
INSERT INTO `states` VALUES (2165, 'Mokhotlong', 122, NULL, NULL);
INSERT INTO `states` VALUES (2166, 'Qacha\'\'s Nek', 122, NULL, NULL);
INSERT INTO `states` VALUES (2167, 'Quthing', 122, NULL, NULL);
INSERT INTO `states` VALUES (2168, 'Thaba-Tseka', 122, NULL, NULL);
INSERT INTO `states` VALUES (2169, 'Bomi', 123, NULL, NULL);
INSERT INTO `states` VALUES (2170, 'Bong', 123, NULL, NULL);
INSERT INTO `states` VALUES (2171, 'Grand Bassa', 123, NULL, NULL);
INSERT INTO `states` VALUES (2172, 'Grand Cape Mount', 123, NULL, NULL);
INSERT INTO `states` VALUES (2173, 'Grand Gedeh', 123, NULL, NULL);
INSERT INTO `states` VALUES (2174, 'Loffa', 123, NULL, NULL);
INSERT INTO `states` VALUES (2175, 'Margibi', 123, NULL, NULL);
INSERT INTO `states` VALUES (2176, 'Maryland and Grand Kru', 123, NULL, NULL);
INSERT INTO `states` VALUES (2177, 'Montserrado', 123, NULL, NULL);
INSERT INTO `states` VALUES (2178, 'Nimba', 123, NULL, NULL);
INSERT INTO `states` VALUES (2179, 'Rivercess', 123, NULL, NULL);
INSERT INTO `states` VALUES (2180, 'Sinoe', 123, NULL, NULL);
INSERT INTO `states` VALUES (2181, 'Ajdabiya', 124, NULL, NULL);
INSERT INTO `states` VALUES (2182, 'Fezzan', 124, NULL, NULL);
INSERT INTO `states` VALUES (2183, 'Banghazi', 124, NULL, NULL);
INSERT INTO `states` VALUES (2184, 'Darnah', 124, NULL, NULL);
INSERT INTO `states` VALUES (2185, 'Ghadamis', 124, NULL, NULL);
INSERT INTO `states` VALUES (2186, 'Gharyan', 124, NULL, NULL);
INSERT INTO `states` VALUES (2187, 'Misratah', 124, NULL, NULL);
INSERT INTO `states` VALUES (2188, 'Murzuq', 124, NULL, NULL);
INSERT INTO `states` VALUES (2189, 'Sabha', 124, NULL, NULL);
INSERT INTO `states` VALUES (2190, 'Sawfajjin', 124, NULL, NULL);
INSERT INTO `states` VALUES (2191, 'Surt', 124, NULL, NULL);
INSERT INTO `states` VALUES (2192, 'Tarabulus', 124, NULL, NULL);
INSERT INTO `states` VALUES (2193, 'Tarhunah', 124, NULL, NULL);
INSERT INTO `states` VALUES (2194, 'Tripolitania', 124, NULL, NULL);
INSERT INTO `states` VALUES (2195, 'Tubruq', 124, NULL, NULL);
INSERT INTO `states` VALUES (2196, 'Yafran', 124, NULL, NULL);
INSERT INTO `states` VALUES (2197, 'Zlitan', 124, NULL, NULL);
INSERT INTO `states` VALUES (2198, 'al-\'\'Aziziyah', 124, NULL, NULL);
INSERT INTO `states` VALUES (2199, 'al-Fatih', 124, NULL, NULL);
INSERT INTO `states` VALUES (2200, 'al-Jabal al Akhdar', 124, NULL, NULL);
INSERT INTO `states` VALUES (2201, 'al-Jufrah', 124, NULL, NULL);
INSERT INTO `states` VALUES (2202, 'al-Khums', 124, NULL, NULL);
INSERT INTO `states` VALUES (2203, 'al-Kufrah', 124, NULL, NULL);
INSERT INTO `states` VALUES (2204, 'an-Nuqat al-Khams', 124, NULL, NULL);
INSERT INTO `states` VALUES (2205, 'ash-Shati', 124, NULL, NULL);
INSERT INTO `states` VALUES (2206, 'az-Zawiyah', 124, NULL, NULL);
INSERT INTO `states` VALUES (2207, 'Balzers', 125, NULL, NULL);
INSERT INTO `states` VALUES (2208, 'Eschen', 125, NULL, NULL);
INSERT INTO `states` VALUES (2209, 'Gamprin', 125, NULL, NULL);
INSERT INTO `states` VALUES (2210, 'Mauren', 125, NULL, NULL);
INSERT INTO `states` VALUES (2211, 'Planken', 125, NULL, NULL);
INSERT INTO `states` VALUES (2212, 'Ruggell', 125, NULL, NULL);
INSERT INTO `states` VALUES (2213, 'Schaan', 125, NULL, NULL);
INSERT INTO `states` VALUES (2214, 'Schellenberg', 125, NULL, NULL);
INSERT INTO `states` VALUES (2215, 'Triesen', 125, NULL, NULL);
INSERT INTO `states` VALUES (2216, 'Triesenberg', 125, NULL, NULL);
INSERT INTO `states` VALUES (2217, 'Vaduz', 125, NULL, NULL);
INSERT INTO `states` VALUES (2218, 'Alytaus', 126, NULL, NULL);
INSERT INTO `states` VALUES (2219, 'Anyksciai', 126, NULL, NULL);
INSERT INTO `states` VALUES (2220, 'Kauno', 126, NULL, NULL);
INSERT INTO `states` VALUES (2221, 'Klaipedos', 126, NULL, NULL);
INSERT INTO `states` VALUES (2222, 'Marijampoles', 126, NULL, NULL);
INSERT INTO `states` VALUES (2223, 'Panevezhio', 126, NULL, NULL);
INSERT INTO `states` VALUES (2224, 'Panevezys', 126, NULL, NULL);
INSERT INTO `states` VALUES (2225, 'Shiauliu', 126, NULL, NULL);
INSERT INTO `states` VALUES (2226, 'Taurages', 126, NULL, NULL);
INSERT INTO `states` VALUES (2227, 'Telshiu', 126, NULL, NULL);
INSERT INTO `states` VALUES (2228, 'Telsiai', 126, NULL, NULL);
INSERT INTO `states` VALUES (2229, 'Utenos', 126, NULL, NULL);
INSERT INTO `states` VALUES (2230, 'Vilniaus', 126, NULL, NULL);
INSERT INTO `states` VALUES (2231, 'Capellen', 127, NULL, NULL);
INSERT INTO `states` VALUES (2232, 'Clervaux', 127, NULL, NULL);
INSERT INTO `states` VALUES (2233, 'Diekirch', 127, NULL, NULL);
INSERT INTO `states` VALUES (2234, 'Echternach', 127, NULL, NULL);
INSERT INTO `states` VALUES (2235, 'Esch-sur-Alzette', 127, NULL, NULL);
INSERT INTO `states` VALUES (2236, 'Grevenmacher', 127, NULL, NULL);
INSERT INTO `states` VALUES (2237, 'Luxembourg', 127, NULL, NULL);
INSERT INTO `states` VALUES (2238, 'Mersch', 127, NULL, NULL);
INSERT INTO `states` VALUES (2239, 'Redange', 127, NULL, NULL);
INSERT INTO `states` VALUES (2240, 'Remich', 127, NULL, NULL);
INSERT INTO `states` VALUES (2241, 'Vianden', 127, NULL, NULL);
INSERT INTO `states` VALUES (2242, 'Wiltz', 127, NULL, NULL);
INSERT INTO `states` VALUES (2243, 'Macau', 128, NULL, NULL);
INSERT INTO `states` VALUES (2244, 'Berovo', 129, NULL, NULL);
INSERT INTO `states` VALUES (2245, 'Bitola', 129, NULL, NULL);
INSERT INTO `states` VALUES (2246, 'Brod', 129, NULL, NULL);
INSERT INTO `states` VALUES (2247, 'Debar', 129, NULL, NULL);
INSERT INTO `states` VALUES (2248, 'Delchevo', 129, NULL, NULL);
INSERT INTO `states` VALUES (2249, 'Demir Hisar', 129, NULL, NULL);
INSERT INTO `states` VALUES (2250, 'Gevgelija', 129, NULL, NULL);
INSERT INTO `states` VALUES (2251, 'Gostivar', 129, NULL, NULL);
INSERT INTO `states` VALUES (2252, 'Kavadarci', 129, NULL, NULL);
INSERT INTO `states` VALUES (2253, 'Kichevo', 129, NULL, NULL);
INSERT INTO `states` VALUES (2254, 'Kochani', 129, NULL, NULL);
INSERT INTO `states` VALUES (2255, 'Kratovo', 129, NULL, NULL);
INSERT INTO `states` VALUES (2256, 'Kriva Palanka', 129, NULL, NULL);
INSERT INTO `states` VALUES (2257, 'Krushevo', 129, NULL, NULL);
INSERT INTO `states` VALUES (2258, 'Kumanovo', 129, NULL, NULL);
INSERT INTO `states` VALUES (2259, 'Negotino', 129, NULL, NULL);
INSERT INTO `states` VALUES (2260, 'Ohrid', 129, NULL, NULL);
INSERT INTO `states` VALUES (2261, 'Prilep', 129, NULL, NULL);
INSERT INTO `states` VALUES (2262, 'Probishtip', 129, NULL, NULL);
INSERT INTO `states` VALUES (2263, 'Radovish', 129, NULL, NULL);
INSERT INTO `states` VALUES (2264, 'Resen', 129, NULL, NULL);
INSERT INTO `states` VALUES (2265, 'Shtip', 129, NULL, NULL);
INSERT INTO `states` VALUES (2266, 'Skopje', 129, NULL, NULL);
INSERT INTO `states` VALUES (2267, 'Struga', 129, NULL, NULL);
INSERT INTO `states` VALUES (2268, 'Strumica', 129, NULL, NULL);
INSERT INTO `states` VALUES (2269, 'Sveti Nikole', 129, NULL, NULL);
INSERT INTO `states` VALUES (2270, 'Tetovo', 129, NULL, NULL);
INSERT INTO `states` VALUES (2271, 'Valandovo', 129, NULL, NULL);
INSERT INTO `states` VALUES (2272, 'Veles', 129, NULL, NULL);
INSERT INTO `states` VALUES (2273, 'Vinica', 129, NULL, NULL);
INSERT INTO `states` VALUES (2274, 'Antananarivo', 130, NULL, NULL);
INSERT INTO `states` VALUES (2275, 'Antsiranana', 130, NULL, NULL);
INSERT INTO `states` VALUES (2276, 'Fianarantsoa', 130, NULL, NULL);
INSERT INTO `states` VALUES (2277, 'Mahajanga', 130, NULL, NULL);
INSERT INTO `states` VALUES (2278, 'Toamasina', 130, NULL, NULL);
INSERT INTO `states` VALUES (2279, 'Toliary', 130, NULL, NULL);
INSERT INTO `states` VALUES (2280, 'Balaka', 131, NULL, NULL);
INSERT INTO `states` VALUES (2281, 'Blantyre City', 131, NULL, NULL);
INSERT INTO `states` VALUES (2282, 'Chikwawa', 131, NULL, NULL);
INSERT INTO `states` VALUES (2283, 'Chiradzulu', 131, NULL, NULL);
INSERT INTO `states` VALUES (2284, 'Chitipa', 131, NULL, NULL);
INSERT INTO `states` VALUES (2285, 'Dedza', 131, NULL, NULL);
INSERT INTO `states` VALUES (2286, 'Dowa', 131, NULL, NULL);
INSERT INTO `states` VALUES (2287, 'Karonga', 131, NULL, NULL);
INSERT INTO `states` VALUES (2288, 'Kasungu', 131, NULL, NULL);
INSERT INTO `states` VALUES (2289, 'Lilongwe City', 131, NULL, NULL);
INSERT INTO `states` VALUES (2290, 'Machinga', 131, NULL, NULL);
INSERT INTO `states` VALUES (2291, 'Mangochi', 131, NULL, NULL);
INSERT INTO `states` VALUES (2292, 'Mchinji', 131, NULL, NULL);
INSERT INTO `states` VALUES (2293, 'Mulanje', 131, NULL, NULL);
INSERT INTO `states` VALUES (2294, 'Mwanza', 131, NULL, NULL);
INSERT INTO `states` VALUES (2295, 'Mzimba', 131, NULL, NULL);
INSERT INTO `states` VALUES (2296, 'Mzuzu City', 131, NULL, NULL);
INSERT INTO `states` VALUES (2297, 'Nkhata Bay', 131, NULL, NULL);
INSERT INTO `states` VALUES (2298, 'Nkhotakota', 131, NULL, NULL);
INSERT INTO `states` VALUES (2299, 'Nsanje', 131, NULL, NULL);
INSERT INTO `states` VALUES (2300, 'Ntcheu', 131, NULL, NULL);
INSERT INTO `states` VALUES (2301, 'Ntchisi', 131, NULL, NULL);
INSERT INTO `states` VALUES (2302, 'Phalombe', 131, NULL, NULL);
INSERT INTO `states` VALUES (2303, 'Rumphi', 131, NULL, NULL);
INSERT INTO `states` VALUES (2304, 'Salima', 131, NULL, NULL);
INSERT INTO `states` VALUES (2305, 'Thyolo', 131, NULL, NULL);
INSERT INTO `states` VALUES (2306, 'Zomba Municipality', 131, NULL, NULL);
INSERT INTO `states` VALUES (2307, 'Johor', 132, NULL, NULL);
INSERT INTO `states` VALUES (2308, 'Kedah', 132, NULL, NULL);
INSERT INTO `states` VALUES (2309, 'Kelantan', 132, NULL, NULL);
INSERT INTO `states` VALUES (2310, 'Kuala Lumpur', 132, NULL, NULL);
INSERT INTO `states` VALUES (2311, 'Labuan', 132, NULL, NULL);
INSERT INTO `states` VALUES (2312, 'Melaka', 132, NULL, NULL);
INSERT INTO `states` VALUES (2313, 'Negeri Johor', 132, NULL, NULL);
INSERT INTO `states` VALUES (2314, 'Negeri Sembilan', 132, NULL, NULL);
INSERT INTO `states` VALUES (2315, 'Pahang', 132, NULL, NULL);
INSERT INTO `states` VALUES (2316, 'Penang', 132, NULL, NULL);
INSERT INTO `states` VALUES (2317, 'Perak', 132, NULL, NULL);
INSERT INTO `states` VALUES (2318, 'Perlis', 132, NULL, NULL);
INSERT INTO `states` VALUES (2319, 'Pulau Pinang', 132, NULL, NULL);
INSERT INTO `states` VALUES (2320, 'Sabah', 132, NULL, NULL);
INSERT INTO `states` VALUES (2321, 'Sarawak', 132, NULL, NULL);
INSERT INTO `states` VALUES (2322, 'Selangor', 132, NULL, NULL);
INSERT INTO `states` VALUES (2323, 'Sembilan', 132, NULL, NULL);
INSERT INTO `states` VALUES (2324, 'Terengganu', 132, NULL, NULL);
INSERT INTO `states` VALUES (2325, 'Alif Alif', 133, NULL, NULL);
INSERT INTO `states` VALUES (2326, 'Alif Dhaal', 133, NULL, NULL);
INSERT INTO `states` VALUES (2327, 'Baa', 133, NULL, NULL);
INSERT INTO `states` VALUES (2328, 'Dhaal', 133, NULL, NULL);
INSERT INTO `states` VALUES (2329, 'Faaf', 133, NULL, NULL);
INSERT INTO `states` VALUES (2330, 'Gaaf Alif', 133, NULL, NULL);
INSERT INTO `states` VALUES (2331, 'Gaaf Dhaal', 133, NULL, NULL);
INSERT INTO `states` VALUES (2332, 'Ghaviyani', 133, NULL, NULL);
INSERT INTO `states` VALUES (2333, 'Haa Alif', 133, NULL, NULL);
INSERT INTO `states` VALUES (2334, 'Haa Dhaal', 133, NULL, NULL);
INSERT INTO `states` VALUES (2335, 'Kaaf', 133, NULL, NULL);
INSERT INTO `states` VALUES (2336, 'Laam', 133, NULL, NULL);
INSERT INTO `states` VALUES (2337, 'Lhaviyani', 133, NULL, NULL);
INSERT INTO `states` VALUES (2338, 'Male', 133, NULL, NULL);
INSERT INTO `states` VALUES (2339, 'Miim', 133, NULL, NULL);
INSERT INTO `states` VALUES (2340, 'Nuun', 133, NULL, NULL);
INSERT INTO `states` VALUES (2341, 'Raa', 133, NULL, NULL);
INSERT INTO `states` VALUES (2342, 'Shaviyani', 133, NULL, NULL);
INSERT INTO `states` VALUES (2343, 'Siin', 133, NULL, NULL);
INSERT INTO `states` VALUES (2344, 'Thaa', 133, NULL, NULL);
INSERT INTO `states` VALUES (2345, 'Vaav', 133, NULL, NULL);
INSERT INTO `states` VALUES (2346, 'Bamako', 134, NULL, NULL);
INSERT INTO `states` VALUES (2347, 'Gao', 134, NULL, NULL);
INSERT INTO `states` VALUES (2348, 'Kayes', 134, NULL, NULL);
INSERT INTO `states` VALUES (2349, 'Kidal', 134, NULL, NULL);
INSERT INTO `states` VALUES (2350, 'Koulikoro', 134, NULL, NULL);
INSERT INTO `states` VALUES (2351, 'Mopti', 134, NULL, NULL);
INSERT INTO `states` VALUES (2352, 'Segou', 134, NULL, NULL);
INSERT INTO `states` VALUES (2353, 'Sikasso', 134, NULL, NULL);
INSERT INTO `states` VALUES (2354, 'Tombouctou', 134, NULL, NULL);
INSERT INTO `states` VALUES (2355, 'Gozo and Comino', 135, NULL, NULL);
INSERT INTO `states` VALUES (2356, 'Inner Harbour', 135, NULL, NULL);
INSERT INTO `states` VALUES (2357, 'Northern', 135, NULL, NULL);
INSERT INTO `states` VALUES (2358, 'Outer Harbour', 135, NULL, NULL);
INSERT INTO `states` VALUES (2359, 'South Eastern', 135, NULL, NULL);
INSERT INTO `states` VALUES (2360, 'Valletta', 135, NULL, NULL);
INSERT INTO `states` VALUES (2361, 'Western', 135, NULL, NULL);
INSERT INTO `states` VALUES (2362, 'Castletown', 136, NULL, NULL);
INSERT INTO `states` VALUES (2363, 'Douglas', 136, NULL, NULL);
INSERT INTO `states` VALUES (2364, 'Laxey', 136, NULL, NULL);
INSERT INTO `states` VALUES (2365, 'Onchan', 136, NULL, NULL);
INSERT INTO `states` VALUES (2366, 'Peel', 136, NULL, NULL);
INSERT INTO `states` VALUES (2367, 'Port Erin', 136, NULL, NULL);
INSERT INTO `states` VALUES (2368, 'Port Saint Mary', 136, NULL, NULL);
INSERT INTO `states` VALUES (2369, 'Ramsey', 136, NULL, NULL);
INSERT INTO `states` VALUES (2370, 'Ailinlaplap', 137, NULL, NULL);
INSERT INTO `states` VALUES (2371, 'Ailuk', 137, NULL, NULL);
INSERT INTO `states` VALUES (2372, 'Arno', 137, NULL, NULL);
INSERT INTO `states` VALUES (2373, 'Aur', 137, NULL, NULL);
INSERT INTO `states` VALUES (2374, 'Bikini', 137, NULL, NULL);
INSERT INTO `states` VALUES (2375, 'Ebon', 137, NULL, NULL);
INSERT INTO `states` VALUES (2376, 'Enewetak', 137, NULL, NULL);
INSERT INTO `states` VALUES (2377, 'Jabat', 137, NULL, NULL);
INSERT INTO `states` VALUES (2378, 'Jaluit', 137, NULL, NULL);
INSERT INTO `states` VALUES (2379, 'Kili', 137, NULL, NULL);
INSERT INTO `states` VALUES (2380, 'Kwajalein', 137, NULL, NULL);
INSERT INTO `states` VALUES (2381, 'Lae', 137, NULL, NULL);
INSERT INTO `states` VALUES (2382, 'Lib', 137, NULL, NULL);
INSERT INTO `states` VALUES (2383, 'Likiep', 137, NULL, NULL);
INSERT INTO `states` VALUES (2384, 'Majuro', 137, NULL, NULL);
INSERT INTO `states` VALUES (2385, 'Maloelap', 137, NULL, NULL);
INSERT INTO `states` VALUES (2386, 'Mejit', 137, NULL, NULL);
INSERT INTO `states` VALUES (2387, 'Mili', 137, NULL, NULL);
INSERT INTO `states` VALUES (2388, 'Namorik', 137, NULL, NULL);
INSERT INTO `states` VALUES (2389, 'Namu', 137, NULL, NULL);
INSERT INTO `states` VALUES (2390, 'Rongelap', 137, NULL, NULL);
INSERT INTO `states` VALUES (2391, 'Ujae', 137, NULL, NULL);
INSERT INTO `states` VALUES (2392, 'Utrik', 137, NULL, NULL);
INSERT INTO `states` VALUES (2393, 'Wotho', 137, NULL, NULL);
INSERT INTO `states` VALUES (2394, 'Wotje', 137, NULL, NULL);
INSERT INTO `states` VALUES (2395, 'Fort-de-France', 138, NULL, NULL);
INSERT INTO `states` VALUES (2396, 'La Trinite', 138, NULL, NULL);
INSERT INTO `states` VALUES (2397, 'Le Marin', 138, NULL, NULL);
INSERT INTO `states` VALUES (2398, 'Saint-Pierre', 138, NULL, NULL);
INSERT INTO `states` VALUES (2399, 'Adrar', 139, NULL, NULL);
INSERT INTO `states` VALUES (2400, 'Assaba', 139, NULL, NULL);
INSERT INTO `states` VALUES (2401, 'Brakna', 139, NULL, NULL);
INSERT INTO `states` VALUES (2402, 'Dhakhlat Nawadibu', 139, NULL, NULL);
INSERT INTO `states` VALUES (2403, 'Hudh-al-Gharbi', 139, NULL, NULL);
INSERT INTO `states` VALUES (2404, 'Hudh-ash-Sharqi', 139, NULL, NULL);
INSERT INTO `states` VALUES (2405, 'Inshiri', 139, NULL, NULL);
INSERT INTO `states` VALUES (2406, 'Nawakshut', 139, NULL, NULL);
INSERT INTO `states` VALUES (2407, 'Qidimagha', 139, NULL, NULL);
INSERT INTO `states` VALUES (2408, 'Qurqul', 139, NULL, NULL);
INSERT INTO `states` VALUES (2409, 'Taqant', 139, NULL, NULL);
INSERT INTO `states` VALUES (2410, 'Tiris Zammur', 139, NULL, NULL);
INSERT INTO `states` VALUES (2411, 'Trarza', 139, NULL, NULL);
INSERT INTO `states` VALUES (2412, 'Black River', 140, NULL, NULL);
INSERT INTO `states` VALUES (2413, 'Eau Coulee', 140, NULL, NULL);
INSERT INTO `states` VALUES (2414, 'Flacq', 140, NULL, NULL);
INSERT INTO `states` VALUES (2415, 'Floreal', 140, NULL, NULL);
INSERT INTO `states` VALUES (2416, 'Grand Port', 140, NULL, NULL);
INSERT INTO `states` VALUES (2417, 'Moka', 140, NULL, NULL);
INSERT INTO `states` VALUES (2418, 'Pamplempousses', 140, NULL, NULL);
INSERT INTO `states` VALUES (2419, 'Plaines Wilhelm', 140, NULL, NULL);
INSERT INTO `states` VALUES (2420, 'Port Louis', 140, NULL, NULL);
INSERT INTO `states` VALUES (2421, 'Riviere du Rempart', 140, NULL, NULL);
INSERT INTO `states` VALUES (2422, 'Rodrigues', 140, NULL, NULL);
INSERT INTO `states` VALUES (2423, 'Rose Hill', 140, NULL, NULL);
INSERT INTO `states` VALUES (2424, 'Savanne', 140, NULL, NULL);
INSERT INTO `states` VALUES (2425, 'Mayotte', 141, NULL, NULL);
INSERT INTO `states` VALUES (2426, 'Pamanzi', 141, NULL, NULL);
INSERT INTO `states` VALUES (2427, 'Aguascalientes', 142, NULL, NULL);
INSERT INTO `states` VALUES (2428, 'Baja California', 142, NULL, NULL);
INSERT INTO `states` VALUES (2429, 'Baja California Sur', 142, NULL, NULL);
INSERT INTO `states` VALUES (2430, 'Campeche', 142, NULL, NULL);
INSERT INTO `states` VALUES (2431, 'Chiapas', 142, NULL, NULL);
INSERT INTO `states` VALUES (2432, 'Chihuahua', 142, NULL, NULL);
INSERT INTO `states` VALUES (2433, 'Coahuila', 142, NULL, NULL);
INSERT INTO `states` VALUES (2434, 'Colima', 142, NULL, NULL);
INSERT INTO `states` VALUES (2435, 'Distrito Federal', 142, NULL, NULL);
INSERT INTO `states` VALUES (2436, 'Durango', 142, NULL, NULL);
INSERT INTO `states` VALUES (2437, 'Estado de Mexico', 142, NULL, NULL);
INSERT INTO `states` VALUES (2438, 'Guanajuato', 142, NULL, NULL);
INSERT INTO `states` VALUES (2439, 'Guerrero', 142, NULL, NULL);
INSERT INTO `states` VALUES (2440, 'Hidalgo', 142, NULL, NULL);
INSERT INTO `states` VALUES (2441, 'Jalisco', 142, NULL, NULL);
INSERT INTO `states` VALUES (2442, 'Mexico', 142, NULL, NULL);
INSERT INTO `states` VALUES (2443, 'Michoacan', 142, NULL, NULL);
INSERT INTO `states` VALUES (2444, 'Morelos', 142, NULL, NULL);
INSERT INTO `states` VALUES (2445, 'Nayarit', 142, NULL, NULL);
INSERT INTO `states` VALUES (2446, 'Nuevo Leon', 142, NULL, NULL);
INSERT INTO `states` VALUES (2447, 'Oaxaca', 142, NULL, NULL);
INSERT INTO `states` VALUES (2448, 'Puebla', 142, NULL, NULL);
INSERT INTO `states` VALUES (2449, 'Queretaro', 142, NULL, NULL);
INSERT INTO `states` VALUES (2450, 'Quintana Roo', 142, NULL, NULL);
INSERT INTO `states` VALUES (2451, 'San Luis Potosi', 142, NULL, NULL);
INSERT INTO `states` VALUES (2452, 'Sinaloa', 142, NULL, NULL);
INSERT INTO `states` VALUES (2453, 'Sonora', 142, NULL, NULL);
INSERT INTO `states` VALUES (2454, 'Tabasco', 142, NULL, NULL);
INSERT INTO `states` VALUES (2455, 'Tamaulipas', 142, NULL, NULL);
INSERT INTO `states` VALUES (2456, 'Tlaxcala', 142, NULL, NULL);
INSERT INTO `states` VALUES (2457, 'Veracruz', 142, NULL, NULL);
INSERT INTO `states` VALUES (2458, 'Yucatan', 142, NULL, NULL);
INSERT INTO `states` VALUES (2459, 'Zacatecas', 142, NULL, NULL);
INSERT INTO `states` VALUES (2460, 'Chuuk', 143, NULL, NULL);
INSERT INTO `states` VALUES (2461, 'Kusaie', 143, NULL, NULL);
INSERT INTO `states` VALUES (2462, 'Pohnpei', 143, NULL, NULL);
INSERT INTO `states` VALUES (2463, 'Yap', 143, NULL, NULL);
INSERT INTO `states` VALUES (2464, 'Balti', 144, NULL, NULL);
INSERT INTO `states` VALUES (2465, 'Cahul', 144, NULL, NULL);
INSERT INTO `states` VALUES (2466, 'Chisinau', 144, NULL, NULL);
INSERT INTO `states` VALUES (2467, 'Chisinau Oras', 144, NULL, NULL);
INSERT INTO `states` VALUES (2468, 'Edinet', 144, NULL, NULL);
INSERT INTO `states` VALUES (2469, 'Gagauzia', 144, NULL, NULL);
INSERT INTO `states` VALUES (2470, 'Lapusna', 144, NULL, NULL);
INSERT INTO `states` VALUES (2471, 'Orhei', 144, NULL, NULL);
INSERT INTO `states` VALUES (2472, 'Soroca', 144, NULL, NULL);
INSERT INTO `states` VALUES (2473, 'Taraclia', 144, NULL, NULL);
INSERT INTO `states` VALUES (2474, 'Tighina', 144, NULL, NULL);
INSERT INTO `states` VALUES (2475, 'Transnistria', 144, NULL, NULL);
INSERT INTO `states` VALUES (2476, 'Ungheni', 144, NULL, NULL);
INSERT INTO `states` VALUES (2477, 'Fontvieille', 145, NULL, NULL);
INSERT INTO `states` VALUES (2478, 'La Condamine', 145, NULL, NULL);
INSERT INTO `states` VALUES (2479, 'Monaco-Ville', 145, NULL, NULL);
INSERT INTO `states` VALUES (2480, 'Monte Carlo', 145, NULL, NULL);
INSERT INTO `states` VALUES (2481, 'Arhangaj', 146, NULL, NULL);
INSERT INTO `states` VALUES (2482, 'Bajan-Olgij', 146, NULL, NULL);
INSERT INTO `states` VALUES (2483, 'Bajanhongor', 146, NULL, NULL);
INSERT INTO `states` VALUES (2484, 'Bulgan', 146, NULL, NULL);
INSERT INTO `states` VALUES (2485, 'Darhan-Uul', 146, NULL, NULL);
INSERT INTO `states` VALUES (2486, 'Dornod', 146, NULL, NULL);
INSERT INTO `states` VALUES (2487, 'Dornogovi', 146, NULL, NULL);
INSERT INTO `states` VALUES (2488, 'Dundgovi', 146, NULL, NULL);
INSERT INTO `states` VALUES (2489, 'Govi-Altaj', 146, NULL, NULL);
INSERT INTO `states` VALUES (2490, 'Govisumber', 146, NULL, NULL);
INSERT INTO `states` VALUES (2491, 'Hentij', 146, NULL, NULL);
INSERT INTO `states` VALUES (2492, 'Hovd', 146, NULL, NULL);
INSERT INTO `states` VALUES (2493, 'Hovsgol', 146, NULL, NULL);
INSERT INTO `states` VALUES (2494, 'Omnogovi', 146, NULL, NULL);
INSERT INTO `states` VALUES (2495, 'Orhon', 146, NULL, NULL);
INSERT INTO `states` VALUES (2496, 'Ovorhangaj', 146, NULL, NULL);
INSERT INTO `states` VALUES (2497, 'Selenge', 146, NULL, NULL);
INSERT INTO `states` VALUES (2498, 'Suhbaatar', 146, NULL, NULL);
INSERT INTO `states` VALUES (2499, 'Tov', 146, NULL, NULL);
INSERT INTO `states` VALUES (2500, 'Ulaanbaatar', 146, NULL, NULL);
INSERT INTO `states` VALUES (2501, 'Uvs', 146, NULL, NULL);
INSERT INTO `states` VALUES (2502, 'Zavhan', 146, NULL, NULL);
INSERT INTO `states` VALUES (2503, 'Montserrat', 147, NULL, NULL);
INSERT INTO `states` VALUES (2504, 'Agadir', 148, NULL, NULL);
INSERT INTO `states` VALUES (2505, 'Casablanca', 148, NULL, NULL);
INSERT INTO `states` VALUES (2506, 'Chaouia-Ouardigha', 148, NULL, NULL);
INSERT INTO `states` VALUES (2507, 'Doukkala-Abda', 148, NULL, NULL);
INSERT INTO `states` VALUES (2508, 'Fes-Boulemane', 148, NULL, NULL);
INSERT INTO `states` VALUES (2509, 'Gharb-Chrarda-Beni Hssen', 148, NULL, NULL);
INSERT INTO `states` VALUES (2510, 'Guelmim', 148, NULL, NULL);
INSERT INTO `states` VALUES (2511, 'Kenitra', 148, NULL, NULL);
INSERT INTO `states` VALUES (2512, 'Marrakech-Tensift-Al Haouz', 148, NULL, NULL);
INSERT INTO `states` VALUES (2513, 'Meknes-Tafilalet', 148, NULL, NULL);
INSERT INTO `states` VALUES (2514, 'Oriental', 148, NULL, NULL);
INSERT INTO `states` VALUES (2515, 'Oujda', 148, NULL, NULL);
INSERT INTO `states` VALUES (2516, 'Province de Tanger', 148, NULL, NULL);
INSERT INTO `states` VALUES (2517, 'Rabat-Sale-Zammour-Zaer', 148, NULL, NULL);
INSERT INTO `states` VALUES (2518, 'Sala Al Jadida', 148, NULL, NULL);
INSERT INTO `states` VALUES (2519, 'Settat', 148, NULL, NULL);
INSERT INTO `states` VALUES (2520, 'Souss Massa-Draa', 148, NULL, NULL);
INSERT INTO `states` VALUES (2521, 'Tadla-Azilal', 148, NULL, NULL);
INSERT INTO `states` VALUES (2522, 'Tangier-Tetouan', 148, NULL, NULL);
INSERT INTO `states` VALUES (2523, 'Taza-Al Hoceima-Taounate', 148, NULL, NULL);
INSERT INTO `states` VALUES (2524, 'Wilaya de Casablanca', 148, NULL, NULL);
INSERT INTO `states` VALUES (2525, 'Wilaya de Rabat-Sale', 148, NULL, NULL);
INSERT INTO `states` VALUES (2526, 'Cabo Delgado', 149, NULL, NULL);
INSERT INTO `states` VALUES (2527, 'Gaza', 149, NULL, NULL);
INSERT INTO `states` VALUES (2528, 'Inhambane', 149, NULL, NULL);
INSERT INTO `states` VALUES (2529, 'Manica', 149, NULL, NULL);
INSERT INTO `states` VALUES (2530, 'Maputo', 149, NULL, NULL);
INSERT INTO `states` VALUES (2531, 'Maputo Provincia', 149, NULL, NULL);
INSERT INTO `states` VALUES (2532, 'Nampula', 149, NULL, NULL);
INSERT INTO `states` VALUES (2533, 'Niassa', 149, NULL, NULL);
INSERT INTO `states` VALUES (2534, 'Sofala', 149, NULL, NULL);
INSERT INTO `states` VALUES (2535, 'Tete', 149, NULL, NULL);
INSERT INTO `states` VALUES (2536, 'Zambezia', 149, NULL, NULL);
INSERT INTO `states` VALUES (2537, 'Ayeyarwady', 150, NULL, NULL);
INSERT INTO `states` VALUES (2538, 'Bago', 150, NULL, NULL);
INSERT INTO `states` VALUES (2539, 'Chin', 150, NULL, NULL);
INSERT INTO `states` VALUES (2540, 'Kachin', 150, NULL, NULL);
INSERT INTO `states` VALUES (2541, 'Kayah', 150, NULL, NULL);
INSERT INTO `states` VALUES (2542, 'Kayin', 150, NULL, NULL);
INSERT INTO `states` VALUES (2543, 'Magway', 150, NULL, NULL);
INSERT INTO `states` VALUES (2544, 'Mandalay', 150, NULL, NULL);
INSERT INTO `states` VALUES (2545, 'Mon', 150, NULL, NULL);
INSERT INTO `states` VALUES (2546, 'Nay Pyi Taw', 150, NULL, NULL);
INSERT INTO `states` VALUES (2547, 'Rakhine', 150, NULL, NULL);
INSERT INTO `states` VALUES (2548, 'Sagaing', 150, NULL, NULL);
INSERT INTO `states` VALUES (2549, 'Shan', 150, NULL, NULL);
INSERT INTO `states` VALUES (2550, 'Tanintharyi', 150, NULL, NULL);
INSERT INTO `states` VALUES (2551, 'Yangon', 150, NULL, NULL);
INSERT INTO `states` VALUES (2552, 'Caprivi', 151, NULL, NULL);
INSERT INTO `states` VALUES (2553, 'Erongo', 151, NULL, NULL);
INSERT INTO `states` VALUES (2554, 'Hardap', 151, NULL, NULL);
INSERT INTO `states` VALUES (2555, 'Karas', 151, NULL, NULL);
INSERT INTO `states` VALUES (2556, 'Kavango', 151, NULL, NULL);
INSERT INTO `states` VALUES (2557, 'Khomas', 151, NULL, NULL);
INSERT INTO `states` VALUES (2558, 'Kunene', 151, NULL, NULL);
INSERT INTO `states` VALUES (2559, 'Ohangwena', 151, NULL, NULL);
INSERT INTO `states` VALUES (2560, 'Omaheke', 151, NULL, NULL);
INSERT INTO `states` VALUES (2561, 'Omusati', 151, NULL, NULL);
INSERT INTO `states` VALUES (2562, 'Oshana', 151, NULL, NULL);
INSERT INTO `states` VALUES (2563, 'Oshikoto', 151, NULL, NULL);
INSERT INTO `states` VALUES (2564, 'Otjozondjupa', 151, NULL, NULL);
INSERT INTO `states` VALUES (2565, 'Yaren', 152, NULL, NULL);
INSERT INTO `states` VALUES (2566, 'Bagmati', 153, NULL, NULL);
INSERT INTO `states` VALUES (2567, 'Bheri', 153, NULL, NULL);
INSERT INTO `states` VALUES (2568, 'Dhawalagiri', 153, NULL, NULL);
INSERT INTO `states` VALUES (2569, 'Gandaki', 153, NULL, NULL);
INSERT INTO `states` VALUES (2570, 'Janakpur', 153, NULL, NULL);
INSERT INTO `states` VALUES (2571, 'Karnali', 153, NULL, NULL);
INSERT INTO `states` VALUES (2572, 'Koshi', 153, NULL, NULL);
INSERT INTO `states` VALUES (2573, 'Lumbini', 153, NULL, NULL);
INSERT INTO `states` VALUES (2574, 'Mahakali', 153, NULL, NULL);
INSERT INTO `states` VALUES (2575, 'Mechi', 153, NULL, NULL);
INSERT INTO `states` VALUES (2576, 'Narayani', 153, NULL, NULL);
INSERT INTO `states` VALUES (2577, 'Rapti', 153, NULL, NULL);
INSERT INTO `states` VALUES (2578, 'Sagarmatha', 153, NULL, NULL);
INSERT INTO `states` VALUES (2579, 'Seti', 153, NULL, NULL);
INSERT INTO `states` VALUES (2580, 'Bonaire', 154, NULL, NULL);
INSERT INTO `states` VALUES (2581, 'Curacao', 154, NULL, NULL);
INSERT INTO `states` VALUES (2582, 'Saba', 154, NULL, NULL);
INSERT INTO `states` VALUES (2583, 'Sint Eustatius', 154, NULL, NULL);
INSERT INTO `states` VALUES (2584, 'Sint Maarten', 154, NULL, NULL);
INSERT INTO `states` VALUES (2585, 'Amsterdam', 155, NULL, NULL);
INSERT INTO `states` VALUES (2586, 'Benelux', 155, NULL, NULL);
INSERT INTO `states` VALUES (2587, 'Drenthe', 155, NULL, NULL);
INSERT INTO `states` VALUES (2588, 'Flevoland', 155, NULL, NULL);
INSERT INTO `states` VALUES (2589, 'Friesland', 155, NULL, NULL);
INSERT INTO `states` VALUES (2590, 'Gelderland', 155, NULL, NULL);
INSERT INTO `states` VALUES (2591, 'Groningen', 155, NULL, NULL);
INSERT INTO `states` VALUES (2592, 'Limburg', 155, NULL, NULL);
INSERT INTO `states` VALUES (2593, 'Noord-Brabant', 155, NULL, NULL);
INSERT INTO `states` VALUES (2594, 'Noord-Holland', 155, NULL, NULL);
INSERT INTO `states` VALUES (2595, 'Overijssel', 155, NULL, NULL);
INSERT INTO `states` VALUES (2596, 'South Holland', 155, NULL, NULL);
INSERT INTO `states` VALUES (2597, 'Utrecht', 155, NULL, NULL);
INSERT INTO `states` VALUES (2598, 'Zeeland', 155, NULL, NULL);
INSERT INTO `states` VALUES (2599, 'Zuid-Holland', 155, NULL, NULL);
INSERT INTO `states` VALUES (2600, 'Iles', 156, NULL, NULL);
INSERT INTO `states` VALUES (2601, 'Nord', 156, NULL, NULL);
INSERT INTO `states` VALUES (2602, 'Sud', 156, NULL, NULL);
INSERT INTO `states` VALUES (2603, 'Area Outside Region', 157, NULL, NULL);
INSERT INTO `states` VALUES (2604, 'Auckland', 157, NULL, NULL);
INSERT INTO `states` VALUES (2605, 'Bay of Plenty', 157, NULL, NULL);
INSERT INTO `states` VALUES (2606, 'Canterbury', 157, NULL, NULL);
INSERT INTO `states` VALUES (2607, 'Christchurch', 157, NULL, NULL);
INSERT INTO `states` VALUES (2608, 'Gisborne', 157, NULL, NULL);
INSERT INTO `states` VALUES (2609, 'Hawke\'\'s Bay', 157, NULL, NULL);
INSERT INTO `states` VALUES (2610, 'Manawatu-Wanganui', 157, NULL, NULL);
INSERT INTO `states` VALUES (2611, 'Marlborough', 157, NULL, NULL);
INSERT INTO `states` VALUES (2612, 'Nelson', 157, NULL, NULL);
INSERT INTO `states` VALUES (2613, 'Northland', 157, NULL, NULL);
INSERT INTO `states` VALUES (2614, 'Otago', 157, NULL, NULL);
INSERT INTO `states` VALUES (2615, 'Rodney', 157, NULL, NULL);
INSERT INTO `states` VALUES (2616, 'Southland', 157, NULL, NULL);
INSERT INTO `states` VALUES (2617, 'Taranaki', 157, NULL, NULL);
INSERT INTO `states` VALUES (2618, 'Tasman', 157, NULL, NULL);
INSERT INTO `states` VALUES (2619, 'Waikato', 157, NULL, NULL);
INSERT INTO `states` VALUES (2620, 'Wellington', 157, NULL, NULL);
INSERT INTO `states` VALUES (2621, 'West Coast', 157, NULL, NULL);
INSERT INTO `states` VALUES (2622, 'Atlantico Norte', 158, NULL, NULL);
INSERT INTO `states` VALUES (2623, 'Atlantico Sur', 158, NULL, NULL);
INSERT INTO `states` VALUES (2624, 'Boaco', 158, NULL, NULL);
INSERT INTO `states` VALUES (2625, 'Carazo', 158, NULL, NULL);
INSERT INTO `states` VALUES (2626, 'Chinandega', 158, NULL, NULL);
INSERT INTO `states` VALUES (2627, 'Chontales', 158, NULL, NULL);
INSERT INTO `states` VALUES (2628, 'Esteli', 158, NULL, NULL);
INSERT INTO `states` VALUES (2629, 'Granada', 158, NULL, NULL);
INSERT INTO `states` VALUES (2630, 'Jinotega', 158, NULL, NULL);
INSERT INTO `states` VALUES (2631, 'Leon', 158, NULL, NULL);
INSERT INTO `states` VALUES (2632, 'Madriz', 158, NULL, NULL);
INSERT INTO `states` VALUES (2633, 'Managua', 158, NULL, NULL);
INSERT INTO `states` VALUES (2634, 'Masaya', 158, NULL, NULL);
INSERT INTO `states` VALUES (2635, 'Matagalpa', 158, NULL, NULL);
INSERT INTO `states` VALUES (2636, 'Nueva Segovia', 158, NULL, NULL);
INSERT INTO `states` VALUES (2637, 'Rio San Juan', 158, NULL, NULL);
INSERT INTO `states` VALUES (2638, 'Rivas', 158, NULL, NULL);
INSERT INTO `states` VALUES (2639, 'Agadez', 159, NULL, NULL);
INSERT INTO `states` VALUES (2640, 'Diffa', 159, NULL, NULL);
INSERT INTO `states` VALUES (2641, 'Dosso', 159, NULL, NULL);
INSERT INTO `states` VALUES (2642, 'Maradi', 159, NULL, NULL);
INSERT INTO `states` VALUES (2643, 'Niamey', 159, NULL, NULL);
INSERT INTO `states` VALUES (2644, 'Tahoua', 159, NULL, NULL);
INSERT INTO `states` VALUES (2645, 'Tillabery', 159, NULL, NULL);
INSERT INTO `states` VALUES (2646, 'Zinder', 159, NULL, NULL);
INSERT INTO `states` VALUES (2647, 'Abia', 160, NULL, NULL);
INSERT INTO `states` VALUES (2648, 'Abuja Federal Capital Territor', 160, NULL, NULL);
INSERT INTO `states` VALUES (2649, 'Adamawa', 160, NULL, NULL);
INSERT INTO `states` VALUES (2650, 'Akwa Ibom', 160, NULL, NULL);
INSERT INTO `states` VALUES (2651, 'Anambra', 160, NULL, NULL);
INSERT INTO `states` VALUES (2652, 'Bauchi', 160, NULL, NULL);
INSERT INTO `states` VALUES (2653, 'Bayelsa', 160, NULL, NULL);
INSERT INTO `states` VALUES (2654, 'Benue', 160, NULL, NULL);
INSERT INTO `states` VALUES (2655, 'Borno', 160, NULL, NULL);
INSERT INTO `states` VALUES (2656, 'Cross River', 160, NULL, NULL);
INSERT INTO `states` VALUES (2657, 'Delta', 160, NULL, NULL);
INSERT INTO `states` VALUES (2658, 'Ebonyi', 160, NULL, NULL);
INSERT INTO `states` VALUES (2659, 'Edo', 160, NULL, NULL);
INSERT INTO `states` VALUES (2660, 'Ekiti', 160, NULL, NULL);
INSERT INTO `states` VALUES (2661, 'Enugu', 160, NULL, NULL);
INSERT INTO `states` VALUES (2662, 'Gombe', 160, NULL, NULL);
INSERT INTO `states` VALUES (2663, 'Imo', 160, NULL, NULL);
INSERT INTO `states` VALUES (2664, 'Jigawa', 160, NULL, NULL);
INSERT INTO `states` VALUES (2665, 'Kaduna', 160, NULL, NULL);
INSERT INTO `states` VALUES (2666, 'Kano', 160, NULL, NULL);
INSERT INTO `states` VALUES (2667, 'Katsina', 160, NULL, NULL);
INSERT INTO `states` VALUES (2668, 'Kebbi', 160, NULL, NULL);
INSERT INTO `states` VALUES (2669, 'Kogi', 160, NULL, NULL);
INSERT INTO `states` VALUES (2670, 'Kwara', 160, NULL, NULL);
INSERT INTO `states` VALUES (2671, 'Lagos', 160, NULL, NULL);
INSERT INTO `states` VALUES (2672, 'Nassarawa', 160, NULL, NULL);
INSERT INTO `states` VALUES (2673, 'Niger', 160, NULL, NULL);
INSERT INTO `states` VALUES (2674, 'Ogun', 160, NULL, NULL);
INSERT INTO `states` VALUES (2675, 'Ondo', 160, NULL, NULL);
INSERT INTO `states` VALUES (2676, 'Osun', 160, NULL, NULL);
INSERT INTO `states` VALUES (2677, 'Oyo', 160, NULL, NULL);
INSERT INTO `states` VALUES (2678, 'Plateau', 160, NULL, NULL);
INSERT INTO `states` VALUES (2679, 'Rivers', 160, NULL, NULL);
INSERT INTO `states` VALUES (2680, 'Sokoto', 160, NULL, NULL);
INSERT INTO `states` VALUES (2681, 'Taraba', 160, NULL, NULL);
INSERT INTO `states` VALUES (2682, 'Yobe', 160, NULL, NULL);
INSERT INTO `states` VALUES (2683, 'Zamfara', 160, NULL, NULL);
INSERT INTO `states` VALUES (2684, 'Niue', 161, NULL, NULL);
INSERT INTO `states` VALUES (2685, 'Norfolk Island', 162, NULL, NULL);
INSERT INTO `states` VALUES (2686, 'Northern Islands', 163, NULL, NULL);
INSERT INTO `states` VALUES (2687, 'Rota', 163, NULL, NULL);
INSERT INTO `states` VALUES (2688, 'Saipan', 163, NULL, NULL);
INSERT INTO `states` VALUES (2689, 'Tinian', 163, NULL, NULL);
INSERT INTO `states` VALUES (2690, 'Akershus', 164, NULL, NULL);
INSERT INTO `states` VALUES (2691, 'Aust Agder', 164, NULL, NULL);
INSERT INTO `states` VALUES (2692, 'Bergen', 164, NULL, NULL);
INSERT INTO `states` VALUES (2693, 'Buskerud', 164, NULL, NULL);
INSERT INTO `states` VALUES (2694, 'Finnmark', 164, NULL, NULL);
INSERT INTO `states` VALUES (2695, 'Hedmark', 164, NULL, NULL);
INSERT INTO `states` VALUES (2696, 'Hordaland', 164, NULL, NULL);
INSERT INTO `states` VALUES (2697, 'Moere og Romsdal', 164, NULL, NULL);
INSERT INTO `states` VALUES (2698, 'Nord Trondelag', 164, NULL, NULL);
INSERT INTO `states` VALUES (2699, 'Nordland', 164, NULL, NULL);
INSERT INTO `states` VALUES (2700, 'Oestfold', 164, NULL, NULL);
INSERT INTO `states` VALUES (2701, 'Oppland', 164, NULL, NULL);
INSERT INTO `states` VALUES (2702, 'Oslo', 164, NULL, NULL);
INSERT INTO `states` VALUES (2703, 'Rogaland', 164, NULL, NULL);
INSERT INTO `states` VALUES (2704, 'Soer Troendelag', 164, NULL, NULL);
INSERT INTO `states` VALUES (2705, 'Sogn og Fjordane', 164, NULL, NULL);
INSERT INTO `states` VALUES (2706, 'Stavern', 164, NULL, NULL);
INSERT INTO `states` VALUES (2707, 'Sykkylven', 164, NULL, NULL);
INSERT INTO `states` VALUES (2708, 'Telemark', 164, NULL, NULL);
INSERT INTO `states` VALUES (2709, 'Troms', 164, NULL, NULL);
INSERT INTO `states` VALUES (2710, 'Vest Agder', 164, NULL, NULL);
INSERT INTO `states` VALUES (2711, 'Vestfold', 164, NULL, NULL);
INSERT INTO `states` VALUES (2712, 'ÃƒÂ˜stfold', 164, NULL, NULL);
INSERT INTO `states` VALUES (2713, 'Al Buraimi', 165, NULL, NULL);
INSERT INTO `states` VALUES (2714, 'Dhufar', 165, NULL, NULL);
INSERT INTO `states` VALUES (2715, 'Masqat', 165, NULL, NULL);
INSERT INTO `states` VALUES (2716, 'Musandam', 165, NULL, NULL);
INSERT INTO `states` VALUES (2717, 'Rusayl', 165, NULL, NULL);
INSERT INTO `states` VALUES (2718, 'Wadi Kabir', 165, NULL, NULL);
INSERT INTO `states` VALUES (2719, 'ad-Dakhiliyah', 165, NULL, NULL);
INSERT INTO `states` VALUES (2720, 'adh-Dhahirah', 165, NULL, NULL);
INSERT INTO `states` VALUES (2721, 'al-Batinah', 165, NULL, NULL);
INSERT INTO `states` VALUES (2722, 'ash-Sharqiyah', 165, NULL, NULL);
INSERT INTO `states` VALUES (2723, 'Baluchistan', 166, NULL, NULL);
INSERT INTO `states` VALUES (2724, 'Federal Capital Area', 166, NULL, NULL);
INSERT INTO `states` VALUES (2725, 'Federally administered Tribal', 166, NULL, NULL);
INSERT INTO `states` VALUES (2726, 'North-West Frontier', 166, NULL, NULL);
INSERT INTO `states` VALUES (2727, 'Northern Areas', 166, NULL, NULL);
INSERT INTO `states` VALUES (2728, 'Punjab', 166, NULL, NULL);
INSERT INTO `states` VALUES (2729, 'Sind', 166, NULL, NULL);
INSERT INTO `states` VALUES (2730, 'Aimeliik', 167, NULL, NULL);
INSERT INTO `states` VALUES (2731, 'Airai', 167, NULL, NULL);
INSERT INTO `states` VALUES (2732, 'Angaur', 167, NULL, NULL);
INSERT INTO `states` VALUES (2733, 'Hatobohei', 167, NULL, NULL);
INSERT INTO `states` VALUES (2734, 'Kayangel', 167, NULL, NULL);
INSERT INTO `states` VALUES (2735, 'Koror', 167, NULL, NULL);
INSERT INTO `states` VALUES (2736, 'Melekeok', 167, NULL, NULL);
INSERT INTO `states` VALUES (2737, 'Ngaraard', 167, NULL, NULL);
INSERT INTO `states` VALUES (2738, 'Ngardmau', 167, NULL, NULL);
INSERT INTO `states` VALUES (2739, 'Ngaremlengui', 167, NULL, NULL);
INSERT INTO `states` VALUES (2740, 'Ngatpang', 167, NULL, NULL);
INSERT INTO `states` VALUES (2741, 'Ngchesar', 167, NULL, NULL);
INSERT INTO `states` VALUES (2742, 'Ngerchelong', 167, NULL, NULL);
INSERT INTO `states` VALUES (2743, 'Ngiwal', 167, NULL, NULL);
INSERT INTO `states` VALUES (2744, 'Peleliu', 167, NULL, NULL);
INSERT INTO `states` VALUES (2745, 'Sonsorol', 167, NULL, NULL);
INSERT INTO `states` VALUES (2746, 'Ariha', 168, NULL, NULL);
INSERT INTO `states` VALUES (2747, 'Bayt Lahm', 168, NULL, NULL);
INSERT INTO `states` VALUES (2748, 'Bethlehem', 168, NULL, NULL);
INSERT INTO `states` VALUES (2749, 'Dayr-al-Balah', 168, NULL, NULL);
INSERT INTO `states` VALUES (2750, 'Ghazzah', 168, NULL, NULL);
INSERT INTO `states` VALUES (2751, 'Ghazzah ash-Shamaliyah', 168, NULL, NULL);
INSERT INTO `states` VALUES (2752, 'Janin', 168, NULL, NULL);
INSERT INTO `states` VALUES (2753, 'Khan Yunis', 168, NULL, NULL);
INSERT INTO `states` VALUES (2754, 'Nabulus', 168, NULL, NULL);
INSERT INTO `states` VALUES (2755, 'Qalqilyah', 168, NULL, NULL);
INSERT INTO `states` VALUES (2756, 'Rafah', 168, NULL, NULL);
INSERT INTO `states` VALUES (2757, 'Ram Allah wal-Birah', 168, NULL, NULL);
INSERT INTO `states` VALUES (2758, 'Salfit', 168, NULL, NULL);
INSERT INTO `states` VALUES (2759, 'Tubas', 168, NULL, NULL);
INSERT INTO `states` VALUES (2760, 'Tulkarm', 168, NULL, NULL);
INSERT INTO `states` VALUES (2761, 'al-Khalil', 168, NULL, NULL);
INSERT INTO `states` VALUES (2762, 'al-Quds', 168, NULL, NULL);
INSERT INTO `states` VALUES (2763, 'Bocas del Toro', 169, NULL, NULL);
INSERT INTO `states` VALUES (2764, 'Chiriqui', 169, NULL, NULL);
INSERT INTO `states` VALUES (2765, 'Cocle', 169, NULL, NULL);
INSERT INTO `states` VALUES (2766, 'Colon', 169, NULL, NULL);
INSERT INTO `states` VALUES (2767, 'Darien', 169, NULL, NULL);
INSERT INTO `states` VALUES (2768, 'Embera', 169, NULL, NULL);
INSERT INTO `states` VALUES (2769, 'Herrera', 169, NULL, NULL);
INSERT INTO `states` VALUES (2770, 'Kuna Yala', 169, NULL, NULL);
INSERT INTO `states` VALUES (2771, 'Los Santos', 169, NULL, NULL);
INSERT INTO `states` VALUES (2772, 'Ngobe Bugle', 169, NULL, NULL);
INSERT INTO `states` VALUES (2773, 'Panama', 169, NULL, NULL);
INSERT INTO `states` VALUES (2774, 'Veraguas', 169, NULL, NULL);
INSERT INTO `states` VALUES (2775, 'East New Britain', 170, NULL, NULL);
INSERT INTO `states` VALUES (2776, 'East Sepik', 170, NULL, NULL);
INSERT INTO `states` VALUES (2777, 'Eastern Highlands', 170, NULL, NULL);
INSERT INTO `states` VALUES (2778, 'Enga', 170, NULL, NULL);
INSERT INTO `states` VALUES (2779, 'Fly River', 170, NULL, NULL);
INSERT INTO `states` VALUES (2780, 'Gulf', 170, NULL, NULL);
INSERT INTO `states` VALUES (2781, 'Madang', 170, NULL, NULL);
INSERT INTO `states` VALUES (2782, 'Manus', 170, NULL, NULL);
INSERT INTO `states` VALUES (2783, 'Milne Bay', 170, NULL, NULL);
INSERT INTO `states` VALUES (2784, 'Morobe', 170, NULL, NULL);
INSERT INTO `states` VALUES (2785, 'National Capital District', 170, NULL, NULL);
INSERT INTO `states` VALUES (2786, 'New Ireland', 170, NULL, NULL);
INSERT INTO `states` VALUES (2787, 'North Solomons', 170, NULL, NULL);
INSERT INTO `states` VALUES (2788, 'Oro', 170, NULL, NULL);
INSERT INTO `states` VALUES (2789, 'Sandaun', 170, NULL, NULL);
INSERT INTO `states` VALUES (2790, 'Simbu', 170, NULL, NULL);
INSERT INTO `states` VALUES (2791, 'Southern Highlands', 170, NULL, NULL);
INSERT INTO `states` VALUES (2792, 'West New Britain', 170, NULL, NULL);
INSERT INTO `states` VALUES (2793, 'Western Highlands', 170, NULL, NULL);
INSERT INTO `states` VALUES (2794, 'Alto Paraguay', 171, NULL, NULL);
INSERT INTO `states` VALUES (2795, 'Alto Parana', 171, NULL, NULL);
INSERT INTO `states` VALUES (2796, 'Amambay', 171, NULL, NULL);
INSERT INTO `states` VALUES (2797, 'Asuncion', 171, NULL, NULL);
INSERT INTO `states` VALUES (2798, 'Boqueron', 171, NULL, NULL);
INSERT INTO `states` VALUES (2799, 'Caaguazu', 171, NULL, NULL);
INSERT INTO `states` VALUES (2800, 'Caazapa', 171, NULL, NULL);
INSERT INTO `states` VALUES (2801, 'Canendiyu', 171, NULL, NULL);
INSERT INTO `states` VALUES (2802, 'Central', 171, NULL, NULL);
INSERT INTO `states` VALUES (2803, 'Concepcion', 171, NULL, NULL);
INSERT INTO `states` VALUES (2804, 'Cordillera', 171, NULL, NULL);
INSERT INTO `states` VALUES (2805, 'Guaira', 171, NULL, NULL);
INSERT INTO `states` VALUES (2806, 'Itapua', 171, NULL, NULL);
INSERT INTO `states` VALUES (2807, 'Misiones', 171, NULL, NULL);
INSERT INTO `states` VALUES (2808, 'Neembucu', 171, NULL, NULL);
INSERT INTO `states` VALUES (2809, 'Paraguari', 171, NULL, NULL);
INSERT INTO `states` VALUES (2810, 'Presidente Hayes', 171, NULL, NULL);
INSERT INTO `states` VALUES (2811, 'San Pedro', 171, NULL, NULL);
INSERT INTO `states` VALUES (2812, 'Amazonas', 172, NULL, NULL);
INSERT INTO `states` VALUES (2813, 'Ancash', 172, NULL, NULL);
INSERT INTO `states` VALUES (2814, 'Apurimac', 172, NULL, NULL);
INSERT INTO `states` VALUES (2815, 'Arequipa', 172, NULL, NULL);
INSERT INTO `states` VALUES (2816, 'Ayacucho', 172, NULL, NULL);
INSERT INTO `states` VALUES (2817, 'Cajamarca', 172, NULL, NULL);
INSERT INTO `states` VALUES (2818, 'Cusco', 172, NULL, NULL);
INSERT INTO `states` VALUES (2819, 'Huancavelica', 172, NULL, NULL);
INSERT INTO `states` VALUES (2820, 'Huanuco', 172, NULL, NULL);
INSERT INTO `states` VALUES (2821, 'Ica', 172, NULL, NULL);
INSERT INTO `states` VALUES (2822, 'Junin', 172, NULL, NULL);
INSERT INTO `states` VALUES (2823, 'La Libertad', 172, NULL, NULL);
INSERT INTO `states` VALUES (2824, 'Lambayeque', 172, NULL, NULL);
INSERT INTO `states` VALUES (2825, 'Lima y Callao', 172, NULL, NULL);
INSERT INTO `states` VALUES (2826, 'Loreto', 172, NULL, NULL);
INSERT INTO `states` VALUES (2827, 'Madre de Dios', 172, NULL, NULL);
INSERT INTO `states` VALUES (2828, 'Moquegua', 172, NULL, NULL);
INSERT INTO `states` VALUES (2829, 'Pasco', 172, NULL, NULL);
INSERT INTO `states` VALUES (2830, 'Piura', 172, NULL, NULL);
INSERT INTO `states` VALUES (2831, 'Puno', 172, NULL, NULL);
INSERT INTO `states` VALUES (2832, 'San Martin', 172, NULL, NULL);
INSERT INTO `states` VALUES (2833, 'Tacna', 172, NULL, NULL);
INSERT INTO `states` VALUES (2834, 'Tumbes', 172, NULL, NULL);
INSERT INTO `states` VALUES (2835, 'Ucayali', 172, NULL, NULL);
INSERT INTO `states` VALUES (2836, 'Batangas', 173, NULL, NULL);
INSERT INTO `states` VALUES (2837, 'Bicol', 173, NULL, NULL);
INSERT INTO `states` VALUES (2838, 'Bulacan', 173, NULL, NULL);
INSERT INTO `states` VALUES (2839, 'Cagayan', 173, NULL, NULL);
INSERT INTO `states` VALUES (2840, 'Caraga', 173, NULL, NULL);
INSERT INTO `states` VALUES (2841, 'Central Luzon', 173, NULL, NULL);
INSERT INTO `states` VALUES (2842, 'Central Mindanao', 173, NULL, NULL);
INSERT INTO `states` VALUES (2843, 'Central Visayas', 173, NULL, NULL);
INSERT INTO `states` VALUES (2844, 'Cordillera', 173, NULL, NULL);
INSERT INTO `states` VALUES (2845, 'Davao', 173, NULL, NULL);
INSERT INTO `states` VALUES (2846, 'Eastern Visayas', 173, NULL, NULL);
INSERT INTO `states` VALUES (2847, 'Greater Metropolitan Area', 173, NULL, NULL);
INSERT INTO `states` VALUES (2848, 'Ilocos', 173, NULL, NULL);
INSERT INTO `states` VALUES (2849, 'Laguna', 173, NULL, NULL);
INSERT INTO `states` VALUES (2850, 'Luzon', 173, NULL, NULL);
INSERT INTO `states` VALUES (2851, 'Mactan', 173, NULL, NULL);
INSERT INTO `states` VALUES (2852, 'Metropolitan Manila Area', 173, NULL, NULL);
INSERT INTO `states` VALUES (2853, 'Muslim Mindanao', 173, NULL, NULL);
INSERT INTO `states` VALUES (2854, 'Northern Mindanao', 173, NULL, NULL);
INSERT INTO `states` VALUES (2855, 'Southern Mindanao', 173, NULL, NULL);
INSERT INTO `states` VALUES (2856, 'Southern Tagalog', 173, NULL, NULL);
INSERT INTO `states` VALUES (2857, 'Western Mindanao', 173, NULL, NULL);
INSERT INTO `states` VALUES (2858, 'Western Visayas', 173, NULL, NULL);
INSERT INTO `states` VALUES (2859, 'Pitcairn Island', 174, NULL, NULL);
INSERT INTO `states` VALUES (2860, 'Biale Blota', 175, NULL, NULL);
INSERT INTO `states` VALUES (2861, 'Dobroszyce', 175, NULL, NULL);
INSERT INTO `states` VALUES (2862, 'Dolnoslaskie', 175, NULL, NULL);
INSERT INTO `states` VALUES (2863, 'Dziekanow Lesny', 175, NULL, NULL);
INSERT INTO `states` VALUES (2864, 'Hopowo', 175, NULL, NULL);
INSERT INTO `states` VALUES (2865, 'Kartuzy', 175, NULL, NULL);
INSERT INTO `states` VALUES (2866, 'Koscian', 175, NULL, NULL);
INSERT INTO `states` VALUES (2867, 'Krakow', 175, NULL, NULL);
INSERT INTO `states` VALUES (2868, 'Kujawsko-Pomorskie', 175, NULL, NULL);
INSERT INTO `states` VALUES (2869, 'Lodzkie', 175, NULL, NULL);
INSERT INTO `states` VALUES (2870, 'Lubelskie', 175, NULL, NULL);
INSERT INTO `states` VALUES (2871, 'Lubuskie', 175, NULL, NULL);
INSERT INTO `states` VALUES (2872, 'Malomice', 175, NULL, NULL);
INSERT INTO `states` VALUES (2873, 'Malopolskie', 175, NULL, NULL);
INSERT INTO `states` VALUES (2874, 'Mazowieckie', 175, NULL, NULL);
INSERT INTO `states` VALUES (2875, 'Mirkow', 175, NULL, NULL);
INSERT INTO `states` VALUES (2876, 'Opolskie', 175, NULL, NULL);
INSERT INTO `states` VALUES (2877, 'Ostrowiec', 175, NULL, NULL);
INSERT INTO `states` VALUES (2878, 'Podkarpackie', 175, NULL, NULL);
INSERT INTO `states` VALUES (2879, 'Podlaskie', 175, NULL, NULL);
INSERT INTO `states` VALUES (2880, 'Polska', 175, NULL, NULL);
INSERT INTO `states` VALUES (2881, 'Pomorskie', 175, NULL, NULL);
INSERT INTO `states` VALUES (2882, 'Poznan', 175, NULL, NULL);
INSERT INTO `states` VALUES (2883, 'Pruszkow', 175, NULL, NULL);
INSERT INTO `states` VALUES (2884, 'Rymanowska', 175, NULL, NULL);
INSERT INTO `states` VALUES (2885, 'Rzeszow', 175, NULL, NULL);
INSERT INTO `states` VALUES (2886, 'Slaskie', 175, NULL, NULL);
INSERT INTO `states` VALUES (2887, 'Stare Pole', 175, NULL, NULL);
INSERT INTO `states` VALUES (2888, 'Swietokrzyskie', 175, NULL, NULL);
INSERT INTO `states` VALUES (2889, 'Warminsko-Mazurskie', 175, NULL, NULL);
INSERT INTO `states` VALUES (2890, 'Warsaw', 175, NULL, NULL);
INSERT INTO `states` VALUES (2891, 'Wejherowo', 175, NULL, NULL);
INSERT INTO `states` VALUES (2892, 'Wielkopolskie', 175, NULL, NULL);
INSERT INTO `states` VALUES (2893, 'Wroclaw', 175, NULL, NULL);
INSERT INTO `states` VALUES (2894, 'Zachodnio-Pomorskie', 175, NULL, NULL);
INSERT INTO `states` VALUES (2895, 'Zukowo', 175, NULL, NULL);
INSERT INTO `states` VALUES (2896, 'Abrantes', 176, NULL, NULL);
INSERT INTO `states` VALUES (2897, 'Acores', 176, NULL, NULL);
INSERT INTO `states` VALUES (2898, 'Alentejo', 176, NULL, NULL);
INSERT INTO `states` VALUES (2899, 'Algarve', 176, NULL, NULL);
INSERT INTO `states` VALUES (2900, 'Braga', 176, NULL, NULL);
INSERT INTO `states` VALUES (2901, 'Centro', 176, NULL, NULL);
INSERT INTO `states` VALUES (2902, 'Distrito de Leiria', 176, NULL, NULL);
INSERT INTO `states` VALUES (2903, 'Distrito de Viana do Castelo', 176, NULL, NULL);
INSERT INTO `states` VALUES (2904, 'Distrito de Vila Real', 176, NULL, NULL);
INSERT INTO `states` VALUES (2905, 'Distrito do Porto', 176, NULL, NULL);
INSERT INTO `states` VALUES (2906, 'Lisboa e Vale do Tejo', 176, NULL, NULL);
INSERT INTO `states` VALUES (2907, 'Madeira', 176, NULL, NULL);
INSERT INTO `states` VALUES (2908, 'Norte', 176, NULL, NULL);
INSERT INTO `states` VALUES (2909, 'Paivas', 176, NULL, NULL);
INSERT INTO `states` VALUES (2910, 'Arecibo', 177, NULL, NULL);
INSERT INTO `states` VALUES (2911, 'Bayamon', 177, NULL, NULL);
INSERT INTO `states` VALUES (2912, 'Carolina', 177, NULL, NULL);
INSERT INTO `states` VALUES (2913, 'Florida', 177, NULL, NULL);
INSERT INTO `states` VALUES (2914, 'Guayama', 177, NULL, NULL);
INSERT INTO `states` VALUES (2915, 'Humacao', 177, NULL, NULL);
INSERT INTO `states` VALUES (2916, 'Mayaguez-Aguadilla', 177, NULL, NULL);
INSERT INTO `states` VALUES (2917, 'Ponce', 177, NULL, NULL);
INSERT INTO `states` VALUES (2918, 'Salinas', 177, NULL, NULL);
INSERT INTO `states` VALUES (2919, 'San Juan', 177, NULL, NULL);
INSERT INTO `states` VALUES (2920, 'Doha', 178, NULL, NULL);
INSERT INTO `states` VALUES (2921, 'Jarian-al-Batnah', 178, NULL, NULL);
INSERT INTO `states` VALUES (2922, 'Umm Salal', 178, NULL, NULL);
INSERT INTO `states` VALUES (2923, 'ad-Dawhah', 178, NULL, NULL);
INSERT INTO `states` VALUES (2924, 'al-Ghuwayriyah', 178, NULL, NULL);
INSERT INTO `states` VALUES (2925, 'al-Jumayliyah', 178, NULL, NULL);
INSERT INTO `states` VALUES (2926, 'al-Khawr', 178, NULL, NULL);
INSERT INTO `states` VALUES (2927, 'al-Wakrah', 178, NULL, NULL);
INSERT INTO `states` VALUES (2928, 'ar-Rayyan', 178, NULL, NULL);
INSERT INTO `states` VALUES (2929, 'ash-Shamal', 178, NULL, NULL);
INSERT INTO `states` VALUES (2930, 'Saint-Benoit', 179, NULL, NULL);
INSERT INTO `states` VALUES (2931, 'Saint-Denis', 179, NULL, NULL);
INSERT INTO `states` VALUES (2932, 'Saint-Paul', 179, NULL, NULL);
INSERT INTO `states` VALUES (2933, 'Saint-Pierre', 179, NULL, NULL);
INSERT INTO `states` VALUES (2934, 'Alba', 180, NULL, NULL);
INSERT INTO `states` VALUES (2935, 'Arad', 180, NULL, NULL);
INSERT INTO `states` VALUES (2936, 'Arges', 180, NULL, NULL);
INSERT INTO `states` VALUES (2937, 'Bacau', 180, NULL, NULL);
INSERT INTO `states` VALUES (2938, 'Bihor', 180, NULL, NULL);
INSERT INTO `states` VALUES (2939, 'Bistrita-Nasaud', 180, NULL, NULL);
INSERT INTO `states` VALUES (2940, 'Botosani', 180, NULL, NULL);
INSERT INTO `states` VALUES (2941, 'Braila', 180, NULL, NULL);
INSERT INTO `states` VALUES (2942, 'Brasov', 180, NULL, NULL);
INSERT INTO `states` VALUES (2943, 'Bucuresti', 180, NULL, NULL);
INSERT INTO `states` VALUES (2944, 'Buzau', 180, NULL, NULL);
INSERT INTO `states` VALUES (2945, 'Calarasi', 180, NULL, NULL);
INSERT INTO `states` VALUES (2946, 'Caras-Severin', 180, NULL, NULL);
INSERT INTO `states` VALUES (2947, 'Cluj', 180, NULL, NULL);
INSERT INTO `states` VALUES (2948, 'Constanta', 180, NULL, NULL);
INSERT INTO `states` VALUES (2949, 'Covasna', 180, NULL, NULL);
INSERT INTO `states` VALUES (2950, 'Dambovita', 180, NULL, NULL);
INSERT INTO `states` VALUES (2951, 'Dolj', 180, NULL, NULL);
INSERT INTO `states` VALUES (2952, 'Galati', 180, NULL, NULL);
INSERT INTO `states` VALUES (2953, 'Giurgiu', 180, NULL, NULL);
INSERT INTO `states` VALUES (2954, 'Gorj', 180, NULL, NULL);
INSERT INTO `states` VALUES (2955, 'Harghita', 180, NULL, NULL);
INSERT INTO `states` VALUES (2956, 'Hunedoara', 180, NULL, NULL);
INSERT INTO `states` VALUES (2957, 'Ialomita', 180, NULL, NULL);
INSERT INTO `states` VALUES (2958, 'Iasi', 180, NULL, NULL);
INSERT INTO `states` VALUES (2959, 'Ilfov', 180, NULL, NULL);
INSERT INTO `states` VALUES (2960, 'Maramures', 180, NULL, NULL);
INSERT INTO `states` VALUES (2961, 'Mehedinti', 180, NULL, NULL);
INSERT INTO `states` VALUES (2962, 'Mures', 180, NULL, NULL);
INSERT INTO `states` VALUES (2963, 'Neamt', 180, NULL, NULL);
INSERT INTO `states` VALUES (2964, 'Olt', 180, NULL, NULL);
INSERT INTO `states` VALUES (2965, 'Prahova', 180, NULL, NULL);
INSERT INTO `states` VALUES (2966, 'Salaj', 180, NULL, NULL);
INSERT INTO `states` VALUES (2967, 'Satu Mare', 180, NULL, NULL);
INSERT INTO `states` VALUES (2968, 'Sibiu', 180, NULL, NULL);
INSERT INTO `states` VALUES (2969, 'Sondelor', 180, NULL, NULL);
INSERT INTO `states` VALUES (2970, 'Suceava', 180, NULL, NULL);
INSERT INTO `states` VALUES (2971, 'Teleorman', 180, NULL, NULL);
INSERT INTO `states` VALUES (2972, 'Timis', 180, NULL, NULL);
INSERT INTO `states` VALUES (2973, 'Tulcea', 180, NULL, NULL);
INSERT INTO `states` VALUES (2974, 'Valcea', 180, NULL, NULL);
INSERT INTO `states` VALUES (2975, 'Vaslui', 180, NULL, NULL);
INSERT INTO `states` VALUES (2976, 'Vrancea', 180, NULL, NULL);
INSERT INTO `states` VALUES (2977, 'Adygeja', 181, NULL, NULL);
INSERT INTO `states` VALUES (2978, 'Aga', 181, NULL, NULL);
INSERT INTO `states` VALUES (2979, 'Alanija', 181, NULL, NULL);
INSERT INTO `states` VALUES (2980, 'Altaj', 181, NULL, NULL);
INSERT INTO `states` VALUES (2981, 'Amur', 181, NULL, NULL);
INSERT INTO `states` VALUES (2982, 'Arhangelsk', 181, NULL, NULL);
INSERT INTO `states` VALUES (2983, 'Astrahan', 181, NULL, NULL);
INSERT INTO `states` VALUES (2984, 'Bashkortostan', 181, NULL, NULL);
INSERT INTO `states` VALUES (2985, 'Belgorod', 181, NULL, NULL);
INSERT INTO `states` VALUES (2986, 'Brjansk', 181, NULL, NULL);
INSERT INTO `states` VALUES (2987, 'Burjatija', 181, NULL, NULL);
INSERT INTO `states` VALUES (2988, 'Chechenija', 181, NULL, NULL);
INSERT INTO `states` VALUES (2989, 'Cheljabinsk', 181, NULL, NULL);
INSERT INTO `states` VALUES (2990, 'Chita', 181, NULL, NULL);
INSERT INTO `states` VALUES (2991, 'Chukotka', 181, NULL, NULL);
INSERT INTO `states` VALUES (2992, 'Chuvashija', 181, NULL, NULL);
INSERT INTO `states` VALUES (2993, 'Dagestan', 181, NULL, NULL);
INSERT INTO `states` VALUES (2994, 'Evenkija', 181, NULL, NULL);
INSERT INTO `states` VALUES (2995, 'Gorno-Altaj', 181, NULL, NULL);
INSERT INTO `states` VALUES (2996, 'Habarovsk', 181, NULL, NULL);
INSERT INTO `states` VALUES (2997, 'Hakasija', 181, NULL, NULL);
INSERT INTO `states` VALUES (2998, 'Hanty-Mansija', 181, NULL, NULL);
INSERT INTO `states` VALUES (2999, 'Ingusetija', 181, NULL, NULL);
INSERT INTO `states` VALUES (3000, 'Irkutsk', 181, NULL, NULL);
INSERT INTO `states` VALUES (3001, 'Ivanovo', 181, NULL, NULL);
INSERT INTO `states` VALUES (3002, 'Jamalo-Nenets', 181, NULL, NULL);
INSERT INTO `states` VALUES (3003, 'Jaroslavl', 181, NULL, NULL);
INSERT INTO `states` VALUES (3004, 'Jevrej', 181, NULL, NULL);
INSERT INTO `states` VALUES (3005, 'Kabardino-Balkarija', 181, NULL, NULL);
INSERT INTO `states` VALUES (3006, 'Kaliningrad', 181, NULL, NULL);
INSERT INTO `states` VALUES (3007, 'Kalmykija', 181, NULL, NULL);
INSERT INTO `states` VALUES (3008, 'Kaluga', 181, NULL, NULL);
INSERT INTO `states` VALUES (3009, 'Kamchatka', 181, NULL, NULL);
INSERT INTO `states` VALUES (3010, 'Karachaj-Cherkessija', 181, NULL, NULL);
INSERT INTO `states` VALUES (3011, 'Karelija', 181, NULL, NULL);
INSERT INTO `states` VALUES (3012, 'Kemerovo', 181, NULL, NULL);
INSERT INTO `states` VALUES (3013, 'Khabarovskiy Kray', 181, NULL, NULL);
INSERT INTO `states` VALUES (3014, 'Kirov', 181, NULL, NULL);
INSERT INTO `states` VALUES (3015, 'Komi', 181, NULL, NULL);
INSERT INTO `states` VALUES (3016, 'Komi-Permjakija', 181, NULL, NULL);
INSERT INTO `states` VALUES (3017, 'Korjakija', 181, NULL, NULL);
INSERT INTO `states` VALUES (3018, 'Kostroma', 181, NULL, NULL);
INSERT INTO `states` VALUES (3019, 'Krasnodar', 181, NULL, NULL);
INSERT INTO `states` VALUES (3020, 'Krasnojarsk', 181, NULL, NULL);
INSERT INTO `states` VALUES (3021, 'Krasnoyarskiy Kray', 181, NULL, NULL);
INSERT INTO `states` VALUES (3022, 'Kurgan', 181, NULL, NULL);
INSERT INTO `states` VALUES (3023, 'Kursk', 181, NULL, NULL);
INSERT INTO `states` VALUES (3024, 'Leningrad', 181, NULL, NULL);
INSERT INTO `states` VALUES (3025, 'Lipeck', 181, NULL, NULL);
INSERT INTO `states` VALUES (3026, 'Magadan', 181, NULL, NULL);
INSERT INTO `states` VALUES (3027, 'Marij El', 181, NULL, NULL);
INSERT INTO `states` VALUES (3028, 'Mordovija', 181, NULL, NULL);
INSERT INTO `states` VALUES (3029, 'Moscow', 181, NULL, NULL);
INSERT INTO `states` VALUES (3030, 'Moskovskaja Oblast', 181, NULL, NULL);
INSERT INTO `states` VALUES (3031, 'Moskovskaya Oblast', 181, NULL, NULL);
INSERT INTO `states` VALUES (3032, 'Moskva', 181, NULL, NULL);
INSERT INTO `states` VALUES (3033, 'Murmansk', 181, NULL, NULL);
INSERT INTO `states` VALUES (3034, 'Nenets', 181, NULL, NULL);
INSERT INTO `states` VALUES (3035, 'Nizhnij Novgorod', 181, NULL, NULL);
INSERT INTO `states` VALUES (3036, 'Novgorod', 181, NULL, NULL);
INSERT INTO `states` VALUES (3037, 'Novokusnezk', 181, NULL, NULL);
INSERT INTO `states` VALUES (3038, 'Novosibirsk', 181, NULL, NULL);
INSERT INTO `states` VALUES (3039, 'Omsk', 181, NULL, NULL);
INSERT INTO `states` VALUES (3040, 'Orenburg', 181, NULL, NULL);
INSERT INTO `states` VALUES (3041, 'Orjol', 181, NULL, NULL);
INSERT INTO `states` VALUES (3042, 'Penza', 181, NULL, NULL);
INSERT INTO `states` VALUES (3043, 'Perm', 181, NULL, NULL);
INSERT INTO `states` VALUES (3044, 'Primorje', 181, NULL, NULL);
INSERT INTO `states` VALUES (3045, 'Pskov', 181, NULL, NULL);
INSERT INTO `states` VALUES (3046, 'Pskovskaya Oblast', 181, NULL, NULL);
INSERT INTO `states` VALUES (3047, 'Rjazan', 181, NULL, NULL);
INSERT INTO `states` VALUES (3048, 'Rostov', 181, NULL, NULL);
INSERT INTO `states` VALUES (3049, 'Saha', 181, NULL, NULL);
INSERT INTO `states` VALUES (3050, 'Sahalin', 181, NULL, NULL);
INSERT INTO `states` VALUES (3051, 'Samara', 181, NULL, NULL);
INSERT INTO `states` VALUES (3052, 'Samarskaya', 181, NULL, NULL);
INSERT INTO `states` VALUES (3053, 'Sankt-Peterburg', 181, NULL, NULL);
INSERT INTO `states` VALUES (3054, 'Saratov', 181, NULL, NULL);
INSERT INTO `states` VALUES (3055, 'Smolensk', 181, NULL, NULL);
INSERT INTO `states` VALUES (3056, 'Stavropol', 181, NULL, NULL);
INSERT INTO `states` VALUES (3057, 'Sverdlovsk', 181, NULL, NULL);
INSERT INTO `states` VALUES (3058, 'Tajmyrija', 181, NULL, NULL);
INSERT INTO `states` VALUES (3059, 'Tambov', 181, NULL, NULL);
INSERT INTO `states` VALUES (3060, 'Tatarstan', 181, NULL, NULL);
INSERT INTO `states` VALUES (3061, 'Tjumen', 181, NULL, NULL);
INSERT INTO `states` VALUES (3062, 'Tomsk', 181, NULL, NULL);
INSERT INTO `states` VALUES (3063, 'Tula', 181, NULL, NULL);
INSERT INTO `states` VALUES (3064, 'Tver', 181, NULL, NULL);
INSERT INTO `states` VALUES (3065, 'Tyva', 181, NULL, NULL);
INSERT INTO `states` VALUES (3066, 'Udmurtija', 181, NULL, NULL);
INSERT INTO `states` VALUES (3067, 'Uljanovsk', 181, NULL, NULL);
INSERT INTO `states` VALUES (3068, 'Ulyanovskaya Oblast', 181, NULL, NULL);
INSERT INTO `states` VALUES (3069, 'Ust-Orda', 181, NULL, NULL);
INSERT INTO `states` VALUES (3070, 'Vladimir', 181, NULL, NULL);
INSERT INTO `states` VALUES (3071, 'Volgograd', 181, NULL, NULL);
INSERT INTO `states` VALUES (3072, 'Vologda', 181, NULL, NULL);
INSERT INTO `states` VALUES (3073, 'Voronezh', 181, NULL, NULL);
INSERT INTO `states` VALUES (3074, 'Butare', 182, NULL, NULL);
INSERT INTO `states` VALUES (3075, 'Byumba', 182, NULL, NULL);
INSERT INTO `states` VALUES (3076, 'Cyangugu', 182, NULL, NULL);
INSERT INTO `states` VALUES (3077, 'Gikongoro', 182, NULL, NULL);
INSERT INTO `states` VALUES (3078, 'Gisenyi', 182, NULL, NULL);
INSERT INTO `states` VALUES (3079, 'Gitarama', 182, NULL, NULL);
INSERT INTO `states` VALUES (3080, 'Kibungo', 182, NULL, NULL);
INSERT INTO `states` VALUES (3081, 'Kibuye', 182, NULL, NULL);
INSERT INTO `states` VALUES (3082, 'Kigali-ngali', 182, NULL, NULL);
INSERT INTO `states` VALUES (3083, 'Ruhengeri', 182, NULL, NULL);
INSERT INTO `states` VALUES (3084, 'Ascension', 183, NULL, NULL);
INSERT INTO `states` VALUES (3085, 'Gough Island', 183, NULL, NULL);
INSERT INTO `states` VALUES (3086, 'Saint Helena', 183, NULL, NULL);
INSERT INTO `states` VALUES (3087, 'Tristan da Cunha', 183, NULL, NULL);
INSERT INTO `states` VALUES (3088, 'Christ Church Nichola Town', 184, NULL, NULL);
INSERT INTO `states` VALUES (3089, 'Saint Anne Sandy Point', 184, NULL, NULL);
INSERT INTO `states` VALUES (3090, 'Saint George Basseterre', 184, NULL, NULL);
INSERT INTO `states` VALUES (3091, 'Saint George Gingerland', 184, NULL, NULL);
INSERT INTO `states` VALUES (3092, 'Saint James Windward', 184, NULL, NULL);
INSERT INTO `states` VALUES (3093, 'Saint John Capesterre', 184, NULL, NULL);
INSERT INTO `states` VALUES (3094, 'Saint John Figtree', 184, NULL, NULL);
INSERT INTO `states` VALUES (3095, 'Saint Mary Cayon', 184, NULL, NULL);
INSERT INTO `states` VALUES (3096, 'Saint Paul Capesterre', 184, NULL, NULL);
INSERT INTO `states` VALUES (3097, 'Saint Paul Charlestown', 184, NULL, NULL);
INSERT INTO `states` VALUES (3098, 'Saint Peter Basseterre', 184, NULL, NULL);
INSERT INTO `states` VALUES (3099, 'Saint Thomas Lowland', 184, NULL, NULL);
INSERT INTO `states` VALUES (3100, 'Saint Thomas Middle Island', 184, NULL, NULL);
INSERT INTO `states` VALUES (3101, 'Trinity Palmetto Point', 184, NULL, NULL);
INSERT INTO `states` VALUES (3102, 'Anse-la-Raye', 185, NULL, NULL);
INSERT INTO `states` VALUES (3103, 'Canaries', 185, NULL, NULL);
INSERT INTO `states` VALUES (3104, 'Castries', 185, NULL, NULL);
INSERT INTO `states` VALUES (3105, 'Choiseul', 185, NULL, NULL);
INSERT INTO `states` VALUES (3106, 'Dennery', 185, NULL, NULL);
INSERT INTO `states` VALUES (3107, 'Gros Inlet', 185, NULL, NULL);
INSERT INTO `states` VALUES (3108, 'Laborie', 185, NULL, NULL);
INSERT INTO `states` VALUES (3109, 'Micoud', 185, NULL, NULL);
INSERT INTO `states` VALUES (3110, 'Soufriere', 185, NULL, NULL);
INSERT INTO `states` VALUES (3111, 'Vieux Fort', 185, NULL, NULL);
INSERT INTO `states` VALUES (3112, 'Miquelon-Langlade', 186, NULL, NULL);
INSERT INTO `states` VALUES (3113, 'Saint-Pierre', 186, NULL, NULL);
INSERT INTO `states` VALUES (3114, 'Charlotte', 187, NULL, NULL);
INSERT INTO `states` VALUES (3115, 'Grenadines', 187, NULL, NULL);
INSERT INTO `states` VALUES (3116, 'Saint Andrew', 187, NULL, NULL);
INSERT INTO `states` VALUES (3117, 'Saint David', 187, NULL, NULL);
INSERT INTO `states` VALUES (3118, 'Saint George', 187, NULL, NULL);
INSERT INTO `states` VALUES (3119, 'Saint Patrick', 187, NULL, NULL);
INSERT INTO `states` VALUES (3120, 'A\'\'ana', 188, NULL, NULL);
INSERT INTO `states` VALUES (3121, 'Aiga-i-le-Tai', 188, NULL, NULL);
INSERT INTO `states` VALUES (3122, 'Atua', 188, NULL, NULL);
INSERT INTO `states` VALUES (3123, 'Fa\'\'asaleleaga', 188, NULL, NULL);
INSERT INTO `states` VALUES (3124, 'Gaga\'\'emauga', 188, NULL, NULL);
INSERT INTO `states` VALUES (3125, 'Gagaifomauga', 188, NULL, NULL);
INSERT INTO `states` VALUES (3126, 'Palauli', 188, NULL, NULL);
INSERT INTO `states` VALUES (3127, 'Satupa\'\'itea', 188, NULL, NULL);
INSERT INTO `states` VALUES (3128, 'Tuamasaga', 188, NULL, NULL);
INSERT INTO `states` VALUES (3129, 'Va\'\'a-o-Fonoti', 188, NULL, NULL);
INSERT INTO `states` VALUES (3130, 'Vaisigano', 188, NULL, NULL);
INSERT INTO `states` VALUES (3131, 'Acquaviva', 189, NULL, NULL);
INSERT INTO `states` VALUES (3132, 'Borgo Maggiore', 189, NULL, NULL);
INSERT INTO `states` VALUES (3133, 'Chiesanuova', 189, NULL, NULL);
INSERT INTO `states` VALUES (3134, 'Domagnano', 189, NULL, NULL);
INSERT INTO `states` VALUES (3135, 'Faetano', 189, NULL, NULL);
INSERT INTO `states` VALUES (3136, 'Fiorentino', 189, NULL, NULL);
INSERT INTO `states` VALUES (3137, 'Montegiardino', 189, NULL, NULL);
INSERT INTO `states` VALUES (3138, 'San Marino', 189, NULL, NULL);
INSERT INTO `states` VALUES (3139, 'Serravalle', 189, NULL, NULL);
INSERT INTO `states` VALUES (3140, 'Agua Grande', 190, NULL, NULL);
INSERT INTO `states` VALUES (3141, 'Cantagalo', 190, NULL, NULL);
INSERT INTO `states` VALUES (3142, 'Lemba', 190, NULL, NULL);
INSERT INTO `states` VALUES (3143, 'Lobata', 190, NULL, NULL);
INSERT INTO `states` VALUES (3144, 'Me-Zochi', 190, NULL, NULL);
INSERT INTO `states` VALUES (3145, 'Pague', 190, NULL, NULL);
INSERT INTO `states` VALUES (3146, 'Al Khobar', 191, NULL, NULL);
INSERT INTO `states` VALUES (3147, 'Aseer', 191, NULL, NULL);
INSERT INTO `states` VALUES (3148, 'Ash Sharqiyah', 191, NULL, NULL);
INSERT INTO `states` VALUES (3149, 'Asir', 191, NULL, NULL);
INSERT INTO `states` VALUES (3150, 'Central Province', 191, NULL, NULL);
INSERT INTO `states` VALUES (3151, 'Eastern Province', 191, NULL, NULL);
INSERT INTO `states` VALUES (3152, 'Ha\'\'il', 191, NULL, NULL);
INSERT INTO `states` VALUES (3153, 'Jawf', 191, NULL, NULL);
INSERT INTO `states` VALUES (3154, 'Jizan', 191, NULL, NULL);
INSERT INTO `states` VALUES (3155, 'Makkah', 191, NULL, NULL);
INSERT INTO `states` VALUES (3156, 'Najran', 191, NULL, NULL);
INSERT INTO `states` VALUES (3157, 'Qasim', 191, NULL, NULL);
INSERT INTO `states` VALUES (3158, 'Tabuk', 191, NULL, NULL);
INSERT INTO `states` VALUES (3159, 'Western Province', 191, NULL, NULL);
INSERT INTO `states` VALUES (3160, 'al-Bahah', 191, NULL, NULL);
INSERT INTO `states` VALUES (3161, 'al-Hudud-ash-Shamaliyah', 191, NULL, NULL);
INSERT INTO `states` VALUES (3162, 'al-Madinah', 191, NULL, NULL);
INSERT INTO `states` VALUES (3163, 'ar-Riyad', 191, NULL, NULL);
INSERT INTO `states` VALUES (3164, 'Dakar', 192, NULL, NULL);
INSERT INTO `states` VALUES (3165, 'Diourbel', 192, NULL, NULL);
INSERT INTO `states` VALUES (3166, 'Fatick', 192, NULL, NULL);
INSERT INTO `states` VALUES (3167, 'Kaolack', 192, NULL, NULL);
INSERT INTO `states` VALUES (3168, 'Kolda', 192, NULL, NULL);
INSERT INTO `states` VALUES (3169, 'Louga', 192, NULL, NULL);
INSERT INTO `states` VALUES (3170, 'Saint-Louis', 192, NULL, NULL);
INSERT INTO `states` VALUES (3171, 'Tambacounda', 192, NULL, NULL);
INSERT INTO `states` VALUES (3172, 'Thies', 192, NULL, NULL);
INSERT INTO `states` VALUES (3173, 'Ziguinchor', 192, NULL, NULL);
INSERT INTO `states` VALUES (3174, 'Central Serbia', 193, NULL, NULL);
INSERT INTO `states` VALUES (3175, 'Kosovo and Metohija', 193, NULL, NULL);
INSERT INTO `states` VALUES (3176, 'Vojvodina', 193, NULL, NULL);
INSERT INTO `states` VALUES (3177, 'Anse Boileau', 194, NULL, NULL);
INSERT INTO `states` VALUES (3178, 'Anse Royale', 194, NULL, NULL);
INSERT INTO `states` VALUES (3179, 'Cascade', 194, NULL, NULL);
INSERT INTO `states` VALUES (3180, 'Takamaka', 194, NULL, NULL);
INSERT INTO `states` VALUES (3181, 'Victoria', 194, NULL, NULL);
INSERT INTO `states` VALUES (3182, 'Eastern', 195, NULL, NULL);
INSERT INTO `states` VALUES (3183, 'Northern', 195, NULL, NULL);
INSERT INTO `states` VALUES (3184, 'Southern', 195, NULL, NULL);
INSERT INTO `states` VALUES (3185, 'Western', 195, NULL, NULL);
INSERT INTO `states` VALUES (3186, 'Singapore', 196, NULL, NULL);
INSERT INTO `states` VALUES (3187, 'Banskobystricky', 197, NULL, NULL);
INSERT INTO `states` VALUES (3188, 'Bratislavsky', 197, NULL, NULL);
INSERT INTO `states` VALUES (3189, 'Kosicky', 197, NULL, NULL);
INSERT INTO `states` VALUES (3190, 'Nitriansky', 197, NULL, NULL);
INSERT INTO `states` VALUES (3191, 'Presovsky', 197, NULL, NULL);
INSERT INTO `states` VALUES (3192, 'Trenciansky', 197, NULL, NULL);
INSERT INTO `states` VALUES (3193, 'Trnavsky', 197, NULL, NULL);
INSERT INTO `states` VALUES (3194, 'Zilinsky', 197, NULL, NULL);
INSERT INTO `states` VALUES (3195, 'Benedikt', 198, NULL, NULL);
INSERT INTO `states` VALUES (3196, 'Gorenjska', 198, NULL, NULL);
INSERT INTO `states` VALUES (3197, 'Gorishka', 198, NULL, NULL);
INSERT INTO `states` VALUES (3198, 'Jugovzhodna Slovenija', 198, NULL, NULL);
INSERT INTO `states` VALUES (3199, 'Koroshka', 198, NULL, NULL);
INSERT INTO `states` VALUES (3200, 'Notranjsko-krashka', 198, NULL, NULL);
INSERT INTO `states` VALUES (3201, 'Obalno-krashka', 198, NULL, NULL);
INSERT INTO `states` VALUES (3202, 'Obcina Domzale', 198, NULL, NULL);
INSERT INTO `states` VALUES (3203, 'Obcina Vitanje', 198, NULL, NULL);
INSERT INTO `states` VALUES (3204, 'Osrednjeslovenska', 198, NULL, NULL);
INSERT INTO `states` VALUES (3205, 'Podravska', 198, NULL, NULL);
INSERT INTO `states` VALUES (3206, 'Pomurska', 198, NULL, NULL);
INSERT INTO `states` VALUES (3207, 'Savinjska', 198, NULL, NULL);
INSERT INTO `states` VALUES (3208, 'Slovenian Littoral', 198, NULL, NULL);
INSERT INTO `states` VALUES (3209, 'Spodnjeposavska', 198, NULL, NULL);
INSERT INTO `states` VALUES (3210, 'Zasavska', 198, NULL, NULL);
INSERT INTO `states` VALUES (3211, 'Pitcairn', 199, NULL, NULL);
INSERT INTO `states` VALUES (3212, 'Central', 200, NULL, NULL);
INSERT INTO `states` VALUES (3213, 'Choiseul', 200, NULL, NULL);
INSERT INTO `states` VALUES (3214, 'Guadalcanal', 200, NULL, NULL);
INSERT INTO `states` VALUES (3215, 'Isabel', 200, NULL, NULL);
INSERT INTO `states` VALUES (3216, 'Makira and Ulawa', 200, NULL, NULL);
INSERT INTO `states` VALUES (3217, 'Malaita', 200, NULL, NULL);
INSERT INTO `states` VALUES (3218, 'Rennell and Bellona', 200, NULL, NULL);
INSERT INTO `states` VALUES (3219, 'Temotu', 200, NULL, NULL);
INSERT INTO `states` VALUES (3220, 'Western', 200, NULL, NULL);
INSERT INTO `states` VALUES (3221, 'Awdal', 201, NULL, NULL);
INSERT INTO `states` VALUES (3222, 'Bakol', 201, NULL, NULL);
INSERT INTO `states` VALUES (3223, 'Banadir', 201, NULL, NULL);
INSERT INTO `states` VALUES (3224, 'Bari', 201, NULL, NULL);
INSERT INTO `states` VALUES (3225, 'Bay', 201, NULL, NULL);
INSERT INTO `states` VALUES (3226, 'Galgudug', 201, NULL, NULL);
INSERT INTO `states` VALUES (3227, 'Gedo', 201, NULL, NULL);
INSERT INTO `states` VALUES (3228, 'Hiran', 201, NULL, NULL);
INSERT INTO `states` VALUES (3229, 'Jubbada Hose', 201, NULL, NULL);
INSERT INTO `states` VALUES (3230, 'Jubbadha Dexe', 201, NULL, NULL);
INSERT INTO `states` VALUES (3231, 'Mudug', 201, NULL, NULL);
INSERT INTO `states` VALUES (3232, 'Nugal', 201, NULL, NULL);
INSERT INTO `states` VALUES (3233, 'Sanag', 201, NULL, NULL);
INSERT INTO `states` VALUES (3234, 'Shabellaha Dhexe', 201, NULL, NULL);
INSERT INTO `states` VALUES (3235, 'Shabellaha Hose', 201, NULL, NULL);
INSERT INTO `states` VALUES (3236, 'Togdher', 201, NULL, NULL);
INSERT INTO `states` VALUES (3237, 'Woqoyi Galbed', 201, NULL, NULL);
INSERT INTO `states` VALUES (3238, 'Eastern Cape', 202, NULL, NULL);
INSERT INTO `states` VALUES (3239, 'Free State', 202, NULL, NULL);
INSERT INTO `states` VALUES (3240, 'Gauteng', 202, NULL, NULL);
INSERT INTO `states` VALUES (3241, 'Kempton Park', 202, NULL, NULL);
INSERT INTO `states` VALUES (3242, 'Kramerville', 202, NULL, NULL);
INSERT INTO `states` VALUES (3243, 'KwaZulu Natal', 202, NULL, NULL);
INSERT INTO `states` VALUES (3244, 'Limpopo', 202, NULL, NULL);
INSERT INTO `states` VALUES (3245, 'Mpumalanga', 202, NULL, NULL);
INSERT INTO `states` VALUES (3246, 'North West', 202, NULL, NULL);
INSERT INTO `states` VALUES (3247, 'Northern Cape', 202, NULL, NULL);
INSERT INTO `states` VALUES (3248, 'Parow', 202, NULL, NULL);
INSERT INTO `states` VALUES (3249, 'Table View', 202, NULL, NULL);
INSERT INTO `states` VALUES (3250, 'Umtentweni', 202, NULL, NULL);
INSERT INTO `states` VALUES (3251, 'Western Cape', 202, NULL, NULL);
INSERT INTO `states` VALUES (3252, 'South Georgia', 203, NULL, NULL);
INSERT INTO `states` VALUES (3253, 'Central Equatoria', 204, NULL, NULL);
INSERT INTO `states` VALUES (3254, 'A Coruna', 205, NULL, NULL);
INSERT INTO `states` VALUES (3255, 'Alacant', 205, NULL, NULL);
INSERT INTO `states` VALUES (3256, 'Alava', 205, NULL, NULL);
INSERT INTO `states` VALUES (3257, 'Albacete', 205, NULL, NULL);
INSERT INTO `states` VALUES (3258, 'Almeria', 205, NULL, NULL);
INSERT INTO `states` VALUES (3259, 'Andalucia', 205, NULL, NULL);
INSERT INTO `states` VALUES (3260, 'Asturias', 205, NULL, NULL);
INSERT INTO `states` VALUES (3261, 'Avila', 205, NULL, NULL);
INSERT INTO `states` VALUES (3262, 'Badajoz', 205, NULL, NULL);
INSERT INTO `states` VALUES (3263, 'Balears', 205, NULL, NULL);
INSERT INTO `states` VALUES (3264, 'Barcelona', 205, NULL, NULL);
INSERT INTO `states` VALUES (3265, 'Bertamirans', 205, NULL, NULL);
INSERT INTO `states` VALUES (3266, 'Biscay', 205, NULL, NULL);
INSERT INTO `states` VALUES (3267, 'Burgos', 205, NULL, NULL);
INSERT INTO `states` VALUES (3268, 'Caceres', 205, NULL, NULL);
INSERT INTO `states` VALUES (3269, 'Cadiz', 205, NULL, NULL);
INSERT INTO `states` VALUES (3270, 'Cantabria', 205, NULL, NULL);
INSERT INTO `states` VALUES (3271, 'Castello', 205, NULL, NULL);
INSERT INTO `states` VALUES (3272, 'Catalunya', 205, NULL, NULL);
INSERT INTO `states` VALUES (3273, 'Ceuta', 205, NULL, NULL);
INSERT INTO `states` VALUES (3274, 'Ciudad Real', 205, NULL, NULL);
INSERT INTO `states` VALUES (3275, 'Comunidad Autonoma de Canarias', 205, NULL, NULL);
INSERT INTO `states` VALUES (3276, 'Comunidad Autonoma de Cataluna', 205, NULL, NULL);
INSERT INTO `states` VALUES (3277, 'Comunidad Autonoma de Galicia', 205, NULL, NULL);
INSERT INTO `states` VALUES (3278, 'Comunidad Autonoma de las Isla', 205, NULL, NULL);
INSERT INTO `states` VALUES (3279, 'Comunidad Autonoma del Princip', 205, NULL, NULL);
INSERT INTO `states` VALUES (3280, 'Comunidad Valenciana', 205, NULL, NULL);
INSERT INTO `states` VALUES (3281, 'Cordoba', 205, NULL, NULL);
INSERT INTO `states` VALUES (3282, 'Cuenca', 205, NULL, NULL);
INSERT INTO `states` VALUES (3283, 'Gipuzkoa', 205, NULL, NULL);
INSERT INTO `states` VALUES (3284, 'Girona', 205, NULL, NULL);
INSERT INTO `states` VALUES (3285, 'Granada', 205, NULL, NULL);
INSERT INTO `states` VALUES (3286, 'Guadalajara', 205, NULL, NULL);
INSERT INTO `states` VALUES (3287, 'Guipuzcoa', 205, NULL, NULL);
INSERT INTO `states` VALUES (3288, 'Huelva', 205, NULL, NULL);
INSERT INTO `states` VALUES (3289, 'Huesca', 205, NULL, NULL);
INSERT INTO `states` VALUES (3290, 'Jaen', 205, NULL, NULL);
INSERT INTO `states` VALUES (3291, 'La Rioja', 205, NULL, NULL);
INSERT INTO `states` VALUES (3292, 'Las Palmas', 205, NULL, NULL);
INSERT INTO `states` VALUES (3293, 'Leon', 205, NULL, NULL);
INSERT INTO `states` VALUES (3294, 'Lerida', 205, NULL, NULL);
INSERT INTO `states` VALUES (3295, 'Lleida', 205, NULL, NULL);
INSERT INTO `states` VALUES (3296, 'Lugo', 205, NULL, NULL);
INSERT INTO `states` VALUES (3297, 'Madrid', 205, NULL, NULL);
INSERT INTO `states` VALUES (3298, 'Malaga', 205, NULL, NULL);
INSERT INTO `states` VALUES (3299, 'Melilla', 205, NULL, NULL);
INSERT INTO `states` VALUES (3300, 'Murcia', 205, NULL, NULL);
INSERT INTO `states` VALUES (3301, 'Navarra', 205, NULL, NULL);
INSERT INTO `states` VALUES (3302, 'Ourense', 205, NULL, NULL);
INSERT INTO `states` VALUES (3303, 'Pais Vasco', 205, NULL, NULL);
INSERT INTO `states` VALUES (3304, 'Palencia', 205, NULL, NULL);
INSERT INTO `states` VALUES (3305, 'Pontevedra', 205, NULL, NULL);
INSERT INTO `states` VALUES (3306, 'Salamanca', 205, NULL, NULL);
INSERT INTO `states` VALUES (3307, 'Santa Cruz de Tenerife', 205, NULL, NULL);
INSERT INTO `states` VALUES (3308, 'Segovia', 205, NULL, NULL);
INSERT INTO `states` VALUES (3309, 'Sevilla', 205, NULL, NULL);
INSERT INTO `states` VALUES (3310, 'Soria', 205, NULL, NULL);
INSERT INTO `states` VALUES (3311, 'Tarragona', 205, NULL, NULL);
INSERT INTO `states` VALUES (3312, 'Tenerife', 205, NULL, NULL);
INSERT INTO `states` VALUES (3313, 'Teruel', 205, NULL, NULL);
INSERT INTO `states` VALUES (3314, 'Toledo', 205, NULL, NULL);
INSERT INTO `states` VALUES (3315, 'Valencia', 205, NULL, NULL);
INSERT INTO `states` VALUES (3316, 'Valladolid', 205, NULL, NULL);
INSERT INTO `states` VALUES (3317, 'Vizcaya', 205, NULL, NULL);
INSERT INTO `states` VALUES (3318, 'Zamora', 205, NULL, NULL);
INSERT INTO `states` VALUES (3319, 'Zaragoza', 205, NULL, NULL);
INSERT INTO `states` VALUES (3320, 'Amparai', 206, NULL, NULL);
INSERT INTO `states` VALUES (3321, 'Anuradhapuraya', 206, NULL, NULL);
INSERT INTO `states` VALUES (3322, 'Badulla', 206, NULL, NULL);
INSERT INTO `states` VALUES (3323, 'Boralesgamuwa', 206, NULL, NULL);
INSERT INTO `states` VALUES (3324, 'Colombo', 206, NULL, NULL);
INSERT INTO `states` VALUES (3325, 'Galla', 206, NULL, NULL);
INSERT INTO `states` VALUES (3326, 'Gampaha', 206, NULL, NULL);
INSERT INTO `states` VALUES (3327, 'Hambantota', 206, NULL, NULL);
INSERT INTO `states` VALUES (3328, 'Kalatura', 206, NULL, NULL);
INSERT INTO `states` VALUES (3329, 'Kegalla', 206, NULL, NULL);
INSERT INTO `states` VALUES (3330, 'Kilinochchi', 206, NULL, NULL);
INSERT INTO `states` VALUES (3331, 'Kurunegala', 206, NULL, NULL);
INSERT INTO `states` VALUES (3332, 'Madakalpuwa', 206, NULL, NULL);
INSERT INTO `states` VALUES (3333, 'Maha Nuwara', 206, NULL, NULL);
INSERT INTO `states` VALUES (3334, 'Malwana', 206, NULL, NULL);
INSERT INTO `states` VALUES (3335, 'Mannarama', 206, NULL, NULL);
INSERT INTO `states` VALUES (3336, 'Matale', 206, NULL, NULL);
INSERT INTO `states` VALUES (3337, 'Matara', 206, NULL, NULL);
INSERT INTO `states` VALUES (3338, 'Monaragala', 206, NULL, NULL);
INSERT INTO `states` VALUES (3339, 'Mullaitivu', 206, NULL, NULL);
INSERT INTO `states` VALUES (3340, 'North Eastern Province', 206, NULL, NULL);
INSERT INTO `states` VALUES (3341, 'North Western Province', 206, NULL, NULL);
INSERT INTO `states` VALUES (3342, 'Nuwara Eliya', 206, NULL, NULL);
INSERT INTO `states` VALUES (3343, 'Polonnaruwa', 206, NULL, NULL);
INSERT INTO `states` VALUES (3344, 'Puttalama', 206, NULL, NULL);
INSERT INTO `states` VALUES (3345, 'Ratnapuraya', 206, NULL, NULL);
INSERT INTO `states` VALUES (3346, 'Southern Province', 206, NULL, NULL);
INSERT INTO `states` VALUES (3347, 'Tirikunamalaya', 206, NULL, NULL);
INSERT INTO `states` VALUES (3348, 'Tuscany', 206, NULL, NULL);
INSERT INTO `states` VALUES (3349, 'Vavuniyawa', 206, NULL, NULL);
INSERT INTO `states` VALUES (3350, 'Western Province', 206, NULL, NULL);
INSERT INTO `states` VALUES (3351, 'Yapanaya', 206, NULL, NULL);
INSERT INTO `states` VALUES (3352, 'kadawatha', 206, NULL, NULL);
INSERT INTO `states` VALUES (3353, 'A\'\'ali-an-Nil', 207, NULL, NULL);
INSERT INTO `states` VALUES (3354, 'Bahr-al-Jabal', 207, NULL, NULL);
INSERT INTO `states` VALUES (3355, 'Central Equatoria', 207, NULL, NULL);
INSERT INTO `states` VALUES (3356, 'Gharb Bahr-al-Ghazal', 207, NULL, NULL);
INSERT INTO `states` VALUES (3357, 'Gharb Darfur', 207, NULL, NULL);
INSERT INTO `states` VALUES (3358, 'Gharb Kurdufan', 207, NULL, NULL);
INSERT INTO `states` VALUES (3359, 'Gharb-al-Istiwa\'\'iyah', 207, NULL, NULL);
INSERT INTO `states` VALUES (3360, 'Janub Darfur', 207, NULL, NULL);
INSERT INTO `states` VALUES (3361, 'Janub Kurdufan', 207, NULL, NULL);
INSERT INTO `states` VALUES (3362, 'Junqali', 207, NULL, NULL);
INSERT INTO `states` VALUES (3363, 'Kassala', 207, NULL, NULL);
INSERT INTO `states` VALUES (3364, 'Nahr-an-Nil', 207, NULL, NULL);
INSERT INTO `states` VALUES (3365, 'Shamal Bahr-al-Ghazal', 207, NULL, NULL);
INSERT INTO `states` VALUES (3366, 'Shamal Darfur', 207, NULL, NULL);
INSERT INTO `states` VALUES (3367, 'Shamal Kurdufan', 207, NULL, NULL);
INSERT INTO `states` VALUES (3368, 'Sharq-al-Istiwa\'\'iyah', 207, NULL, NULL);
INSERT INTO `states` VALUES (3369, 'Sinnar', 207, NULL, NULL);
INSERT INTO `states` VALUES (3370, 'Warab', 207, NULL, NULL);
INSERT INTO `states` VALUES (3371, 'Wilayat al Khartum', 207, NULL, NULL);
INSERT INTO `states` VALUES (3372, 'al-Bahr-al-Ahmar', 207, NULL, NULL);
INSERT INTO `states` VALUES (3373, 'al-Buhayrat', 207, NULL, NULL);
INSERT INTO `states` VALUES (3374, 'al-Jazirah', 207, NULL, NULL);
INSERT INTO `states` VALUES (3375, 'al-Khartum', 207, NULL, NULL);
INSERT INTO `states` VALUES (3376, 'al-Qadarif', 207, NULL, NULL);
INSERT INTO `states` VALUES (3377, 'al-Wahdah', 207, NULL, NULL);
INSERT INTO `states` VALUES (3378, 'an-Nil-al-Abyad', 207, NULL, NULL);
INSERT INTO `states` VALUES (3379, 'an-Nil-al-Azraq', 207, NULL, NULL);
INSERT INTO `states` VALUES (3380, 'ash-Shamaliyah', 207, NULL, NULL);
INSERT INTO `states` VALUES (3381, 'Brokopondo', 208, NULL, NULL);
INSERT INTO `states` VALUES (3382, 'Commewijne', 208, NULL, NULL);
INSERT INTO `states` VALUES (3383, 'Coronie', 208, NULL, NULL);
INSERT INTO `states` VALUES (3384, 'Marowijne', 208, NULL, NULL);
INSERT INTO `states` VALUES (3385, 'Nickerie', 208, NULL, NULL);
INSERT INTO `states` VALUES (3386, 'Para', 208, NULL, NULL);
INSERT INTO `states` VALUES (3387, 'Paramaribo', 208, NULL, NULL);
INSERT INTO `states` VALUES (3388, 'Saramacca', 208, NULL, NULL);
INSERT INTO `states` VALUES (3389, 'Wanica', 208, NULL, NULL);
INSERT INTO `states` VALUES (3390, 'Svalbard', 209, NULL, NULL);
INSERT INTO `states` VALUES (3391, 'Hhohho', 210, NULL, NULL);
INSERT INTO `states` VALUES (3392, 'Lubombo', 210, NULL, NULL);
INSERT INTO `states` VALUES (3393, 'Manzini', 210, NULL, NULL);
INSERT INTO `states` VALUES (3394, 'Shiselweni', 210, NULL, NULL);
INSERT INTO `states` VALUES (3395, 'Alvsborgs Lan', 211, NULL, NULL);
INSERT INTO `states` VALUES (3396, 'Angermanland', 211, NULL, NULL);
INSERT INTO `states` VALUES (3397, 'Blekinge', 211, NULL, NULL);
INSERT INTO `states` VALUES (3398, 'Bohuslan', 211, NULL, NULL);
INSERT INTO `states` VALUES (3399, 'Dalarna', 211, NULL, NULL);
INSERT INTO `states` VALUES (3400, 'Gavleborg', 211, NULL, NULL);
INSERT INTO `states` VALUES (3401, 'Gaza', 211, NULL, NULL);
INSERT INTO `states` VALUES (3402, 'Gotland', 211, NULL, NULL);
INSERT INTO `states` VALUES (3403, 'Halland', 211, NULL, NULL);
INSERT INTO `states` VALUES (3404, 'Jamtland', 211, NULL, NULL);
INSERT INTO `states` VALUES (3405, 'Jonkoping', 211, NULL, NULL);
INSERT INTO `states` VALUES (3406, 'Kalmar', 211, NULL, NULL);
INSERT INTO `states` VALUES (3407, 'Kristianstads', 211, NULL, NULL);
INSERT INTO `states` VALUES (3408, 'Kronoberg', 211, NULL, NULL);
INSERT INTO `states` VALUES (3409, 'Norrbotten', 211, NULL, NULL);
INSERT INTO `states` VALUES (3410, 'Orebro', 211, NULL, NULL);
INSERT INTO `states` VALUES (3411, 'Ostergotland', 211, NULL, NULL);
INSERT INTO `states` VALUES (3412, 'Saltsjo-Boo', 211, NULL, NULL);
INSERT INTO `states` VALUES (3413, 'Skane', 211, NULL, NULL);
INSERT INTO `states` VALUES (3414, 'Smaland', 211, NULL, NULL);
INSERT INTO `states` VALUES (3415, 'Sodermanland', 211, NULL, NULL);
INSERT INTO `states` VALUES (3416, 'Stockholm', 211, NULL, NULL);
INSERT INTO `states` VALUES (3417, 'Uppsala', 211, NULL, NULL);
INSERT INTO `states` VALUES (3418, 'Varmland', 211, NULL, NULL);
INSERT INTO `states` VALUES (3419, 'Vasterbotten', 211, NULL, NULL);
INSERT INTO `states` VALUES (3420, 'Vastergotland', 211, NULL, NULL);
INSERT INTO `states` VALUES (3421, 'Vasternorrland', 211, NULL, NULL);
INSERT INTO `states` VALUES (3422, 'Vastmanland', 211, NULL, NULL);
INSERT INTO `states` VALUES (3423, 'Vastra Gotaland', 211, NULL, NULL);
INSERT INTO `states` VALUES (3424, 'Aargau', 212, NULL, NULL);
INSERT INTO `states` VALUES (3425, 'Appenzell Inner-Rhoden', 212, NULL, NULL);
INSERT INTO `states` VALUES (3426, 'Appenzell-Ausser Rhoden', 212, NULL, NULL);
INSERT INTO `states` VALUES (3427, 'Basel-Landschaft', 212, NULL, NULL);
INSERT INTO `states` VALUES (3428, 'Basel-Stadt', 212, NULL, NULL);
INSERT INTO `states` VALUES (3429, 'Bern', 212, NULL, NULL);
INSERT INTO `states` VALUES (3430, 'Canton Ticino', 212, NULL, NULL);
INSERT INTO `states` VALUES (3431, 'Fribourg', 212, NULL, NULL);
INSERT INTO `states` VALUES (3432, 'Geneve', 212, NULL, NULL);
INSERT INTO `states` VALUES (3433, 'Glarus', 212, NULL, NULL);
INSERT INTO `states` VALUES (3434, 'Graubunden', 212, NULL, NULL);
INSERT INTO `states` VALUES (3435, 'Heerbrugg', 212, NULL, NULL);
INSERT INTO `states` VALUES (3436, 'Jura', 212, NULL, NULL);
INSERT INTO `states` VALUES (3437, 'Kanton Aargau', 212, NULL, NULL);
INSERT INTO `states` VALUES (3438, 'Luzern', 212, NULL, NULL);
INSERT INTO `states` VALUES (3439, 'Morbio Inferiore', 212, NULL, NULL);
INSERT INTO `states` VALUES (3440, 'Muhen', 212, NULL, NULL);
INSERT INTO `states` VALUES (3441, 'Neuchatel', 212, NULL, NULL);
INSERT INTO `states` VALUES (3442, 'Nidwalden', 212, NULL, NULL);
INSERT INTO `states` VALUES (3443, 'Obwalden', 212, NULL, NULL);
INSERT INTO `states` VALUES (3444, 'Sankt Gallen', 212, NULL, NULL);
INSERT INTO `states` VALUES (3445, 'Schaffhausen', 212, NULL, NULL);
INSERT INTO `states` VALUES (3446, 'Schwyz', 212, NULL, NULL);
INSERT INTO `states` VALUES (3447, 'Solothurn', 212, NULL, NULL);
INSERT INTO `states` VALUES (3448, 'Thurgau', 212, NULL, NULL);
INSERT INTO `states` VALUES (3449, 'Ticino', 212, NULL, NULL);
INSERT INTO `states` VALUES (3450, 'Uri', 212, NULL, NULL);
INSERT INTO `states` VALUES (3451, 'Valais', 212, NULL, NULL);
INSERT INTO `states` VALUES (3452, 'Vaud', 212, NULL, NULL);
INSERT INTO `states` VALUES (3453, 'Vauffelin', 212, NULL, NULL);
INSERT INTO `states` VALUES (3454, 'Zug', 212, NULL, NULL);
INSERT INTO `states` VALUES (3455, 'Zurich', 212, NULL, NULL);
INSERT INTO `states` VALUES (3456, 'Aleppo', 213, NULL, NULL);
INSERT INTO `states` VALUES (3457, 'Dar\'\'a', 213, NULL, NULL);
INSERT INTO `states` VALUES (3458, 'Dayr-az-Zawr', 213, NULL, NULL);
INSERT INTO `states` VALUES (3459, 'Dimashq', 213, NULL, NULL);
INSERT INTO `states` VALUES (3460, 'Halab', 213, NULL, NULL);
INSERT INTO `states` VALUES (3461, 'Hamah', 213, NULL, NULL);
INSERT INTO `states` VALUES (3462, 'Hims', 213, NULL, NULL);
INSERT INTO `states` VALUES (3463, 'Idlib', 213, NULL, NULL);
INSERT INTO `states` VALUES (3464, 'Madinat Dimashq', 213, NULL, NULL);
INSERT INTO `states` VALUES (3465, 'Tartus', 213, NULL, NULL);
INSERT INTO `states` VALUES (3466, 'al-Hasakah', 213, NULL, NULL);
INSERT INTO `states` VALUES (3467, 'al-Ladhiqiyah', 213, NULL, NULL);
INSERT INTO `states` VALUES (3468, 'al-Qunaytirah', 213, NULL, NULL);
INSERT INTO `states` VALUES (3469, 'ar-Raqqah', 213, NULL, NULL);
INSERT INTO `states` VALUES (3470, 'as-Suwayda', 213, NULL, NULL);
INSERT INTO `states` VALUES (3471, 'Changhua County', 214, NULL, NULL);
INSERT INTO `states` VALUES (3472, 'Chiayi County', 214, NULL, NULL);
INSERT INTO `states` VALUES (3473, 'Chiayi City', 214, NULL, NULL);
INSERT INTO `states` VALUES (3474, 'Taipei City', 214, NULL, NULL);
INSERT INTO `states` VALUES (3475, 'Hsinchu County', 214, NULL, NULL);
INSERT INTO `states` VALUES (3476, 'Hsinchu City', 214, NULL, NULL);
INSERT INTO `states` VALUES (3477, 'Hualien County', 214, NULL, NULL);
INSERT INTO `states` VALUES (3480, 'Kaohsiung City', 214, NULL, NULL);
INSERT INTO `states` VALUES (3481, 'Keelung City', 214, NULL, NULL);
INSERT INTO `states` VALUES (3482, 'Kinmen County', 214, NULL, NULL);
INSERT INTO `states` VALUES (3483, 'Miaoli County', 214, NULL, NULL);
INSERT INTO `states` VALUES (3484, 'Nantou County', 214, NULL, NULL);
INSERT INTO `states` VALUES (3486, 'Penghu County', 214, NULL, NULL);
INSERT INTO `states` VALUES (3487, 'Pingtung County', 214, NULL, NULL);
INSERT INTO `states` VALUES (3488, 'Taichung City', 214, NULL, NULL);
INSERT INTO `states` VALUES (3492, 'Tainan City', 214, NULL, NULL);
INSERT INTO `states` VALUES (3493, 'New Taipei City', 214, NULL, NULL);
INSERT INTO `states` VALUES (3495, 'Taitung County', 214, NULL, NULL);
INSERT INTO `states` VALUES (3496, 'Taoyuan City', 214, NULL, NULL);
INSERT INTO `states` VALUES (3497, 'Yilan County', 214, NULL, NULL);
INSERT INTO `states` VALUES (3498, 'YunLin County', 214, NULL, NULL);
INSERT INTO `states` VALUES (3500, 'Dushanbe', 215, NULL, NULL);
INSERT INTO `states` VALUES (3501, 'Gorno-Badakhshan', 215, NULL, NULL);
INSERT INTO `states` VALUES (3502, 'Karotegin', 215, NULL, NULL);
INSERT INTO `states` VALUES (3503, 'Khatlon', 215, NULL, NULL);
INSERT INTO `states` VALUES (3504, 'Sughd', 215, NULL, NULL);
INSERT INTO `states` VALUES (3505, 'Arusha', 216, NULL, NULL);
INSERT INTO `states` VALUES (3506, 'Dar es Salaam', 216, NULL, NULL);
INSERT INTO `states` VALUES (3507, 'Dodoma', 216, NULL, NULL);
INSERT INTO `states` VALUES (3508, 'Iringa', 216, NULL, NULL);
INSERT INTO `states` VALUES (3509, 'Kagera', 216, NULL, NULL);
INSERT INTO `states` VALUES (3510, 'Kigoma', 216, NULL, NULL);
INSERT INTO `states` VALUES (3511, 'Kilimanjaro', 216, NULL, NULL);
INSERT INTO `states` VALUES (3512, 'Lindi', 216, NULL, NULL);
INSERT INTO `states` VALUES (3513, 'Mara', 216, NULL, NULL);
INSERT INTO `states` VALUES (3514, 'Mbeya', 216, NULL, NULL);
INSERT INTO `states` VALUES (3515, 'Morogoro', 216, NULL, NULL);
INSERT INTO `states` VALUES (3516, 'Mtwara', 216, NULL, NULL);
INSERT INTO `states` VALUES (3517, 'Mwanza', 216, NULL, NULL);
INSERT INTO `states` VALUES (3518, 'Pwani', 216, NULL, NULL);
INSERT INTO `states` VALUES (3519, 'Rukwa', 216, NULL, NULL);
INSERT INTO `states` VALUES (3520, 'Ruvuma', 216, NULL, NULL);
INSERT INTO `states` VALUES (3521, 'Shinyanga', 216, NULL, NULL);
INSERT INTO `states` VALUES (3522, 'Singida', 216, NULL, NULL);
INSERT INTO `states` VALUES (3523, 'Tabora', 216, NULL, NULL);
INSERT INTO `states` VALUES (3524, 'Tanga', 216, NULL, NULL);
INSERT INTO `states` VALUES (3525, 'Zanzibar and Pemba', 216, NULL, NULL);
INSERT INTO `states` VALUES (3526, 'Amnat Charoen', 217, NULL, NULL);
INSERT INTO `states` VALUES (3527, 'Ang Thong', 217, NULL, NULL);
INSERT INTO `states` VALUES (3528, 'Bangkok', 217, NULL, NULL);
INSERT INTO `states` VALUES (3529, 'Buri Ram', 217, NULL, NULL);
INSERT INTO `states` VALUES (3530, 'Chachoengsao', 217, NULL, NULL);
INSERT INTO `states` VALUES (3531, 'Chai Nat', 217, NULL, NULL);
INSERT INTO `states` VALUES (3532, 'Chaiyaphum', 217, NULL, NULL);
INSERT INTO `states` VALUES (3533, 'Changwat Chaiyaphum', 217, NULL, NULL);
INSERT INTO `states` VALUES (3534, 'Chanthaburi', 217, NULL, NULL);
INSERT INTO `states` VALUES (3535, 'Chiang Mai', 217, NULL, NULL);
INSERT INTO `states` VALUES (3536, 'Chiang Rai', 217, NULL, NULL);
INSERT INTO `states` VALUES (3537, 'Chon Buri', 217, NULL, NULL);
INSERT INTO `states` VALUES (3538, 'Chumphon', 217, NULL, NULL);
INSERT INTO `states` VALUES (3539, 'Kalasin', 217, NULL, NULL);
INSERT INTO `states` VALUES (3540, 'Kamphaeng Phet', 217, NULL, NULL);
INSERT INTO `states` VALUES (3541, 'Kanchanaburi', 217, NULL, NULL);
INSERT INTO `states` VALUES (3542, 'Khon Kaen', 217, NULL, NULL);
INSERT INTO `states` VALUES (3543, 'Krabi', 217, NULL, NULL);
INSERT INTO `states` VALUES (3544, 'Krung Thep', 217, NULL, NULL);
INSERT INTO `states` VALUES (3545, 'Lampang', 217, NULL, NULL);
INSERT INTO `states` VALUES (3546, 'Lamphun', 217, NULL, NULL);
INSERT INTO `states` VALUES (3547, 'Loei', 217, NULL, NULL);
INSERT INTO `states` VALUES (3548, 'Lop Buri', 217, NULL, NULL);
INSERT INTO `states` VALUES (3549, 'Mae Hong Son', 217, NULL, NULL);
INSERT INTO `states` VALUES (3550, 'Maha Sarakham', 217, NULL, NULL);
INSERT INTO `states` VALUES (3551, 'Mukdahan', 217, NULL, NULL);
INSERT INTO `states` VALUES (3552, 'Nakhon Nayok', 217, NULL, NULL);
INSERT INTO `states` VALUES (3553, 'Nakhon Pathom', 217, NULL, NULL);
INSERT INTO `states` VALUES (3554, 'Nakhon Phanom', 217, NULL, NULL);
INSERT INTO `states` VALUES (3555, 'Nakhon Ratchasima', 217, NULL, NULL);
INSERT INTO `states` VALUES (3556, 'Nakhon Sawan', 217, NULL, NULL);
INSERT INTO `states` VALUES (3557, 'Nakhon Si Thammarat', 217, NULL, NULL);
INSERT INTO `states` VALUES (3558, 'Nan', 217, NULL, NULL);
INSERT INTO `states` VALUES (3559, 'Narathiwat', 217, NULL, NULL);
INSERT INTO `states` VALUES (3560, 'Nong Bua Lam Phu', 217, NULL, NULL);
INSERT INTO `states` VALUES (3561, 'Nong Khai', 217, NULL, NULL);
INSERT INTO `states` VALUES (3562, 'Nonthaburi', 217, NULL, NULL);
INSERT INTO `states` VALUES (3563, 'Pathum Thani', 217, NULL, NULL);
INSERT INTO `states` VALUES (3564, 'Pattani', 217, NULL, NULL);
INSERT INTO `states` VALUES (3565, 'Phangnga', 217, NULL, NULL);
INSERT INTO `states` VALUES (3566, 'Phatthalung', 217, NULL, NULL);
INSERT INTO `states` VALUES (3567, 'Phayao', 217, NULL, NULL);
INSERT INTO `states` VALUES (3568, 'Phetchabun', 217, NULL, NULL);
INSERT INTO `states` VALUES (3569, 'Phetchaburi', 217, NULL, NULL);
INSERT INTO `states` VALUES (3570, 'Phichit', 217, NULL, NULL);
INSERT INTO `states` VALUES (3571, 'Phitsanulok', 217, NULL, NULL);
INSERT INTO `states` VALUES (3572, 'Phra Nakhon Si Ayutthaya', 217, NULL, NULL);
INSERT INTO `states` VALUES (3573, 'Phrae', 217, NULL, NULL);
INSERT INTO `states` VALUES (3574, 'Phuket', 217, NULL, NULL);
INSERT INTO `states` VALUES (3575, 'Prachin Buri', 217, NULL, NULL);
INSERT INTO `states` VALUES (3576, 'Prachuap Khiri Khan', 217, NULL, NULL);
INSERT INTO `states` VALUES (3577, 'Ranong', 217, NULL, NULL);
INSERT INTO `states` VALUES (3578, 'Ratchaburi', 217, NULL, NULL);
INSERT INTO `states` VALUES (3579, 'Rayong', 217, NULL, NULL);
INSERT INTO `states` VALUES (3580, 'Roi Et', 217, NULL, NULL);
INSERT INTO `states` VALUES (3581, 'Sa Kaeo', 217, NULL, NULL);
INSERT INTO `states` VALUES (3582, 'Sakon Nakhon', 217, NULL, NULL);
INSERT INTO `states` VALUES (3583, 'Samut Prakan', 217, NULL, NULL);
INSERT INTO `states` VALUES (3584, 'Samut Sakhon', 217, NULL, NULL);
INSERT INTO `states` VALUES (3585, 'Samut Songkhran', 217, NULL, NULL);
INSERT INTO `states` VALUES (3586, 'Saraburi', 217, NULL, NULL);
INSERT INTO `states` VALUES (3587, 'Satun', 217, NULL, NULL);
INSERT INTO `states` VALUES (3588, 'Si Sa Ket', 217, NULL, NULL);
INSERT INTO `states` VALUES (3589, 'Sing Buri', 217, NULL, NULL);
INSERT INTO `states` VALUES (3590, 'Songkhla', 217, NULL, NULL);
INSERT INTO `states` VALUES (3591, 'Sukhothai', 217, NULL, NULL);
INSERT INTO `states` VALUES (3592, 'Suphan Buri', 217, NULL, NULL);
INSERT INTO `states` VALUES (3593, 'Surat Thani', 217, NULL, NULL);
INSERT INTO `states` VALUES (3594, 'Surin', 217, NULL, NULL);
INSERT INTO `states` VALUES (3595, 'Tak', 217, NULL, NULL);
INSERT INTO `states` VALUES (3596, 'Trang', 217, NULL, NULL);
INSERT INTO `states` VALUES (3597, 'Trat', 217, NULL, NULL);
INSERT INTO `states` VALUES (3598, 'Ubon Ratchathani', 217, NULL, NULL);
INSERT INTO `states` VALUES (3599, 'Udon Thani', 217, NULL, NULL);
INSERT INTO `states` VALUES (3600, 'Uthai Thani', 217, NULL, NULL);
INSERT INTO `states` VALUES (3601, 'Uttaradit', 217, NULL, NULL);
INSERT INTO `states` VALUES (3602, 'Yala', 217, NULL, NULL);
INSERT INTO `states` VALUES (3603, 'Yasothon', 217, NULL, NULL);
INSERT INTO `states` VALUES (3604, 'Centre', 218, NULL, NULL);
INSERT INTO `states` VALUES (3605, 'Kara', 218, NULL, NULL);
INSERT INTO `states` VALUES (3606, 'Maritime', 218, NULL, NULL);
INSERT INTO `states` VALUES (3607, 'Plateaux', 218, NULL, NULL);
INSERT INTO `states` VALUES (3608, 'Savanes', 218, NULL, NULL);
INSERT INTO `states` VALUES (3609, 'Atafu', 219, NULL, NULL);
INSERT INTO `states` VALUES (3610, 'Fakaofo', 219, NULL, NULL);
INSERT INTO `states` VALUES (3611, 'Nukunonu', 219, NULL, NULL);
INSERT INTO `states` VALUES (3612, 'Eua', 220, NULL, NULL);
INSERT INTO `states` VALUES (3613, 'Ha\'\'apai', 220, NULL, NULL);
INSERT INTO `states` VALUES (3614, 'Niuas', 220, NULL, NULL);
INSERT INTO `states` VALUES (3615, 'Tongatapu', 220, NULL, NULL);
INSERT INTO `states` VALUES (3616, 'Vava\'\'u', 220, NULL, NULL);
INSERT INTO `states` VALUES (3617, 'Arima-Tunapuna-Piarco', 221, NULL, NULL);
INSERT INTO `states` VALUES (3618, 'Caroni', 221, NULL, NULL);
INSERT INTO `states` VALUES (3619, 'Chaguanas', 221, NULL, NULL);
INSERT INTO `states` VALUES (3620, 'Couva-Tabaquite-Talparo', 221, NULL, NULL);
INSERT INTO `states` VALUES (3621, 'Diego Martin', 221, NULL, NULL);
INSERT INTO `states` VALUES (3622, 'Glencoe', 221, NULL, NULL);
INSERT INTO `states` VALUES (3623, 'Penal Debe', 221, NULL, NULL);
INSERT INTO `states` VALUES (3624, 'Point Fortin', 221, NULL, NULL);
INSERT INTO `states` VALUES (3625, 'Port of Spain', 221, NULL, NULL);
INSERT INTO `states` VALUES (3626, 'Princes Town', 221, NULL, NULL);
INSERT INTO `states` VALUES (3627, 'Saint George', 221, NULL, NULL);
INSERT INTO `states` VALUES (3628, 'San Fernando', 221, NULL, NULL);
INSERT INTO `states` VALUES (3629, 'San Juan', 221, NULL, NULL);
INSERT INTO `states` VALUES (3630, 'Sangre Grande', 221, NULL, NULL);
INSERT INTO `states` VALUES (3631, 'Siparia', 221, NULL, NULL);
INSERT INTO `states` VALUES (3632, 'Tobago', 221, NULL, NULL);
INSERT INTO `states` VALUES (3633, 'Aryanah', 222, NULL, NULL);
INSERT INTO `states` VALUES (3634, 'Bajah', 222, NULL, NULL);
INSERT INTO `states` VALUES (3635, 'Bin \'\'Arus', 222, NULL, NULL);
INSERT INTO `states` VALUES (3636, 'Binzart', 222, NULL, NULL);
INSERT INTO `states` VALUES (3637, 'Gouvernorat de Ariana', 222, NULL, NULL);
INSERT INTO `states` VALUES (3638, 'Gouvernorat de Nabeul', 222, NULL, NULL);
INSERT INTO `states` VALUES (3639, 'Gouvernorat de Sousse', 222, NULL, NULL);
INSERT INTO `states` VALUES (3640, 'Hammamet Yasmine', 222, NULL, NULL);
INSERT INTO `states` VALUES (3641, 'Jundubah', 222, NULL, NULL);
INSERT INTO `states` VALUES (3642, 'Madaniyin', 222, NULL, NULL);
INSERT INTO `states` VALUES (3643, 'Manubah', 222, NULL, NULL);
INSERT INTO `states` VALUES (3644, 'Monastir', 222, NULL, NULL);
INSERT INTO `states` VALUES (3645, 'Nabul', 222, NULL, NULL);
INSERT INTO `states` VALUES (3646, 'Qabis', 222, NULL, NULL);
INSERT INTO `states` VALUES (3647, 'Qafsah', 222, NULL, NULL);
INSERT INTO `states` VALUES (3648, 'Qibili', 222, NULL, NULL);
INSERT INTO `states` VALUES (3649, 'Safaqis', 222, NULL, NULL);
INSERT INTO `states` VALUES (3650, 'Sfax', 222, NULL, NULL);
INSERT INTO `states` VALUES (3651, 'Sidi Bu Zayd', 222, NULL, NULL);
INSERT INTO `states` VALUES (3652, 'Silyanah', 222, NULL, NULL);
INSERT INTO `states` VALUES (3653, 'Susah', 222, NULL, NULL);
INSERT INTO `states` VALUES (3654, 'Tatawin', 222, NULL, NULL);
INSERT INTO `states` VALUES (3655, 'Tawzar', 222, NULL, NULL);
INSERT INTO `states` VALUES (3656, 'Tunis', 222, NULL, NULL);
INSERT INTO `states` VALUES (3657, 'Zaghwan', 222, NULL, NULL);
INSERT INTO `states` VALUES (3658, 'al-Kaf', 222, NULL, NULL);
INSERT INTO `states` VALUES (3659, 'al-Mahdiyah', 222, NULL, NULL);
INSERT INTO `states` VALUES (3660, 'al-Munastir', 222, NULL, NULL);
INSERT INTO `states` VALUES (3661, 'al-Qasrayn', 222, NULL, NULL);
INSERT INTO `states` VALUES (3662, 'al-Qayrawan', 222, NULL, NULL);
INSERT INTO `states` VALUES (3663, 'Adana', 223, NULL, NULL);
INSERT INTO `states` VALUES (3664, 'Adiyaman', 223, NULL, NULL);
INSERT INTO `states` VALUES (3665, 'Afyon', 223, NULL, NULL);
INSERT INTO `states` VALUES (3666, 'Agri', 223, NULL, NULL);
INSERT INTO `states` VALUES (3667, 'Aksaray', 223, NULL, NULL);
INSERT INTO `states` VALUES (3668, 'Amasya', 223, NULL, NULL);
INSERT INTO `states` VALUES (3669, 'Ankara', 223, NULL, NULL);
INSERT INTO `states` VALUES (3670, 'Antalya', 223, NULL, NULL);
INSERT INTO `states` VALUES (3671, 'Ardahan', 223, NULL, NULL);
INSERT INTO `states` VALUES (3672, 'Artvin', 223, NULL, NULL);
INSERT INTO `states` VALUES (3673, 'Aydin', 223, NULL, NULL);
INSERT INTO `states` VALUES (3674, 'Balikesir', 223, NULL, NULL);
INSERT INTO `states` VALUES (3675, 'Bartin', 223, NULL, NULL);
INSERT INTO `states` VALUES (3676, 'Batman', 223, NULL, NULL);
INSERT INTO `states` VALUES (3677, 'Bayburt', 223, NULL, NULL);
INSERT INTO `states` VALUES (3678, 'Bilecik', 223, NULL, NULL);
INSERT INTO `states` VALUES (3679, 'Bingol', 223, NULL, NULL);
INSERT INTO `states` VALUES (3680, 'Bitlis', 223, NULL, NULL);
INSERT INTO `states` VALUES (3681, 'Bolu', 223, NULL, NULL);
INSERT INTO `states` VALUES (3682, 'Burdur', 223, NULL, NULL);
INSERT INTO `states` VALUES (3683, 'Bursa', 223, NULL, NULL);
INSERT INTO `states` VALUES (3684, 'Canakkale', 223, NULL, NULL);
INSERT INTO `states` VALUES (3685, 'Cankiri', 223, NULL, NULL);
INSERT INTO `states` VALUES (3686, 'Corum', 223, NULL, NULL);
INSERT INTO `states` VALUES (3687, 'Denizli', 223, NULL, NULL);
INSERT INTO `states` VALUES (3688, 'Diyarbakir', 223, NULL, NULL);
INSERT INTO `states` VALUES (3689, 'Duzce', 223, NULL, NULL);
INSERT INTO `states` VALUES (3690, 'Edirne', 223, NULL, NULL);
INSERT INTO `states` VALUES (3691, 'Elazig', 223, NULL, NULL);
INSERT INTO `states` VALUES (3692, 'Erzincan', 223, NULL, NULL);
INSERT INTO `states` VALUES (3693, 'Erzurum', 223, NULL, NULL);
INSERT INTO `states` VALUES (3694, 'Eskisehir', 223, NULL, NULL);
INSERT INTO `states` VALUES (3695, 'Gaziantep', 223, NULL, NULL);
INSERT INTO `states` VALUES (3696, 'Giresun', 223, NULL, NULL);
INSERT INTO `states` VALUES (3697, 'Gumushane', 223, NULL, NULL);
INSERT INTO `states` VALUES (3698, 'Hakkari', 223, NULL, NULL);
INSERT INTO `states` VALUES (3699, 'Hatay', 223, NULL, NULL);
INSERT INTO `states` VALUES (3700, 'Icel', 223, NULL, NULL);
INSERT INTO `states` VALUES (3701, 'Igdir', 223, NULL, NULL);
INSERT INTO `states` VALUES (3702, 'Isparta', 223, NULL, NULL);
INSERT INTO `states` VALUES (3703, 'Istanbul', 223, NULL, NULL);
INSERT INTO `states` VALUES (3704, 'Izmir', 223, NULL, NULL);
INSERT INTO `states` VALUES (3705, 'Kahramanmaras', 223, NULL, NULL);
INSERT INTO `states` VALUES (3706, 'Karabuk', 223, NULL, NULL);
INSERT INTO `states` VALUES (3707, 'Karaman', 223, NULL, NULL);
INSERT INTO `states` VALUES (3708, 'Kars', 223, NULL, NULL);
INSERT INTO `states` VALUES (3709, 'Karsiyaka', 223, NULL, NULL);
INSERT INTO `states` VALUES (3710, 'Kastamonu', 223, NULL, NULL);
INSERT INTO `states` VALUES (3711, 'Kayseri', 223, NULL, NULL);
INSERT INTO `states` VALUES (3712, 'Kilis', 223, NULL, NULL);
INSERT INTO `states` VALUES (3713, 'Kirikkale', 223, NULL, NULL);
INSERT INTO `states` VALUES (3714, 'Kirklareli', 223, NULL, NULL);
INSERT INTO `states` VALUES (3715, 'Kirsehir', 223, NULL, NULL);
INSERT INTO `states` VALUES (3716, 'Kocaeli', 223, NULL, NULL);
INSERT INTO `states` VALUES (3717, 'Konya', 223, NULL, NULL);
INSERT INTO `states` VALUES (3718, 'Kutahya', 223, NULL, NULL);
INSERT INTO `states` VALUES (3719, 'Lefkosa', 223, NULL, NULL);
INSERT INTO `states` VALUES (3720, 'Malatya', 223, NULL, NULL);
INSERT INTO `states` VALUES (3721, 'Manisa', 223, NULL, NULL);
INSERT INTO `states` VALUES (3722, 'Mardin', 223, NULL, NULL);
INSERT INTO `states` VALUES (3723, 'Mugla', 223, NULL, NULL);
INSERT INTO `states` VALUES (3724, 'Mus', 223, NULL, NULL);
INSERT INTO `states` VALUES (3725, 'Nevsehir', 223, NULL, NULL);
INSERT INTO `states` VALUES (3726, 'Nigde', 223, NULL, NULL);
INSERT INTO `states` VALUES (3727, 'Ordu', 223, NULL, NULL);
INSERT INTO `states` VALUES (3728, 'Osmaniye', 223, NULL, NULL);
INSERT INTO `states` VALUES (3729, 'Rize', 223, NULL, NULL);
INSERT INTO `states` VALUES (3730, 'Sakarya', 223, NULL, NULL);
INSERT INTO `states` VALUES (3731, 'Samsun', 223, NULL, NULL);
INSERT INTO `states` VALUES (3732, 'Sanliurfa', 223, NULL, NULL);
INSERT INTO `states` VALUES (3733, 'Siirt', 223, NULL, NULL);
INSERT INTO `states` VALUES (3734, 'Sinop', 223, NULL, NULL);
INSERT INTO `states` VALUES (3735, 'Sirnak', 223, NULL, NULL);
INSERT INTO `states` VALUES (3736, 'Sivas', 223, NULL, NULL);
INSERT INTO `states` VALUES (3737, 'Tekirdag', 223, NULL, NULL);
INSERT INTO `states` VALUES (3738, 'Tokat', 223, NULL, NULL);
INSERT INTO `states` VALUES (3739, 'Trabzon', 223, NULL, NULL);
INSERT INTO `states` VALUES (3740, 'Tunceli', 223, NULL, NULL);
INSERT INTO `states` VALUES (3741, 'Usak', 223, NULL, NULL);
INSERT INTO `states` VALUES (3742, 'Van', 223, NULL, NULL);
INSERT INTO `states` VALUES (3743, 'Yalova', 223, NULL, NULL);
INSERT INTO `states` VALUES (3744, 'Yozgat', 223, NULL, NULL);
INSERT INTO `states` VALUES (3745, 'Zonguldak', 223, NULL, NULL);
INSERT INTO `states` VALUES (3746, 'Ahal', 224, NULL, NULL);
INSERT INTO `states` VALUES (3747, 'Asgabat', 224, NULL, NULL);
INSERT INTO `states` VALUES (3748, 'Balkan', 224, NULL, NULL);
INSERT INTO `states` VALUES (3749, 'Dasoguz', 224, NULL, NULL);
INSERT INTO `states` VALUES (3750, 'Lebap', 224, NULL, NULL);
INSERT INTO `states` VALUES (3751, 'Mari', 224, NULL, NULL);
INSERT INTO `states` VALUES (3752, 'Grand Turk', 225, NULL, NULL);
INSERT INTO `states` VALUES (3753, 'South Caicos and East Caicos', 225, NULL, NULL);
INSERT INTO `states` VALUES (3754, 'Funafuti', 226, NULL, NULL);
INSERT INTO `states` VALUES (3755, 'Nanumanga', 226, NULL, NULL);
INSERT INTO `states` VALUES (3756, 'Nanumea', 226, NULL, NULL);
INSERT INTO `states` VALUES (3757, 'Niutao', 226, NULL, NULL);
INSERT INTO `states` VALUES (3758, 'Nui', 226, NULL, NULL);
INSERT INTO `states` VALUES (3759, 'Nukufetau', 226, NULL, NULL);
INSERT INTO `states` VALUES (3760, 'Nukulaelae', 226, NULL, NULL);
INSERT INTO `states` VALUES (3761, 'Vaitupu', 226, NULL, NULL);
INSERT INTO `states` VALUES (3762, 'Central', 227, NULL, NULL);
INSERT INTO `states` VALUES (3763, 'Eastern', 227, NULL, NULL);
INSERT INTO `states` VALUES (3764, 'Northern', 227, NULL, NULL);
INSERT INTO `states` VALUES (3765, 'Western', 227, NULL, NULL);
INSERT INTO `states` VALUES (3766, 'Cherkas\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3767, 'Chernihivs\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3768, 'Chernivets\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3769, 'Crimea', 228, NULL, NULL);
INSERT INTO `states` VALUES (3770, 'Dnipropetrovska', 228, NULL, NULL);
INSERT INTO `states` VALUES (3771, 'Donets\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3772, 'Ivano-Frankivs\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3773, 'Kharkiv', 228, NULL, NULL);
INSERT INTO `states` VALUES (3774, 'Kharkov', 228, NULL, NULL);
INSERT INTO `states` VALUES (3775, 'Khersonska', 228, NULL, NULL);
INSERT INTO `states` VALUES (3776, 'Khmel\'\'nyts\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3777, 'Kirovohrad', 228, NULL, NULL);
INSERT INTO `states` VALUES (3778, 'Krym', 228, NULL, NULL);
INSERT INTO `states` VALUES (3779, 'Kyyiv', 228, NULL, NULL);
INSERT INTO `states` VALUES (3780, 'Kyyivs\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3781, 'L\'\'vivs\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3782, 'Luhans\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3783, 'Mykolayivs\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3784, 'Odes\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3785, 'Odessa', 228, NULL, NULL);
INSERT INTO `states` VALUES (3786, 'Poltavs\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3787, 'Rivnens\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3788, 'Sevastopol', 228, NULL, NULL);
INSERT INTO `states` VALUES (3789, 'Sums\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3790, 'Ternopil\'\'s\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3791, 'Volyns\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3792, 'Vynnyts\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3793, 'Zakarpats\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3794, 'Zaporizhia', 228, NULL, NULL);
INSERT INTO `states` VALUES (3795, 'Zhytomyrs\'\'ka', 228, NULL, NULL);
INSERT INTO `states` VALUES (3796, 'Abu Zabi', 229, NULL, NULL);
INSERT INTO `states` VALUES (3797, 'Ajman', 229, NULL, NULL);
INSERT INTO `states` VALUES (3798, 'Dubai', 229, NULL, NULL);
INSERT INTO `states` VALUES (3799, 'Ras al-Khaymah', 229, NULL, NULL);
INSERT INTO `states` VALUES (3800, 'Sharjah', 229, NULL, NULL);
INSERT INTO `states` VALUES (3801, 'Sharjha', 229, NULL, NULL);
INSERT INTO `states` VALUES (3802, 'Umm al Qaywayn', 229, NULL, NULL);
INSERT INTO `states` VALUES (3803, 'al-Fujayrah', 229, NULL, NULL);
INSERT INTO `states` VALUES (3804, 'ash-Shariqah', 229, NULL, NULL);
INSERT INTO `states` VALUES (3805, 'Aberdeen', 230, NULL, NULL);
INSERT INTO `states` VALUES (3806, 'Aberdeenshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3807, 'Argyll', 230, NULL, NULL);
INSERT INTO `states` VALUES (3808, 'Armagh', 230, NULL, NULL);
INSERT INTO `states` VALUES (3809, 'Bedfordshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3810, 'Belfast', 230, NULL, NULL);
INSERT INTO `states` VALUES (3811, 'Berkshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3812, 'Birmingham', 230, NULL, NULL);
INSERT INTO `states` VALUES (3813, 'Brechin', 230, NULL, NULL);
INSERT INTO `states` VALUES (3814, 'Bridgnorth', 230, NULL, NULL);
INSERT INTO `states` VALUES (3815, 'Bristol', 230, NULL, NULL);
INSERT INTO `states` VALUES (3816, 'Buckinghamshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3817, 'Cambridge', 230, NULL, NULL);
INSERT INTO `states` VALUES (3818, 'Cambridgeshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3819, 'Channel Islands', 230, NULL, NULL);
INSERT INTO `states` VALUES (3820, 'Cheshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3821, 'Cleveland', 230, NULL, NULL);
INSERT INTO `states` VALUES (3822, 'Co Fermanagh', 230, NULL, NULL);
INSERT INTO `states` VALUES (3823, 'Conwy', 230, NULL, NULL);
INSERT INTO `states` VALUES (3824, 'Cornwall', 230, NULL, NULL);
INSERT INTO `states` VALUES (3825, 'Coventry', 230, NULL, NULL);
INSERT INTO `states` VALUES (3826, 'Craven Arms', 230, NULL, NULL);
INSERT INTO `states` VALUES (3827, 'Cumbria', 230, NULL, NULL);
INSERT INTO `states` VALUES (3828, 'Denbighshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3829, 'Derby', 230, NULL, NULL);
INSERT INTO `states` VALUES (3830, 'Derbyshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3831, 'Devon', 230, NULL, NULL);
INSERT INTO `states` VALUES (3832, 'Dial Code Dungannon', 230, NULL, NULL);
INSERT INTO `states` VALUES (3833, 'Didcot', 230, NULL, NULL);
INSERT INTO `states` VALUES (3834, 'Dorset', 230, NULL, NULL);
INSERT INTO `states` VALUES (3835, 'Dunbartonshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3836, 'Durham', 230, NULL, NULL);
INSERT INTO `states` VALUES (3837, 'East Dunbartonshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3838, 'East Lothian', 230, NULL, NULL);
INSERT INTO `states` VALUES (3839, 'East Midlands', 230, NULL, NULL);
INSERT INTO `states` VALUES (3840, 'East Sussex', 230, NULL, NULL);
INSERT INTO `states` VALUES (3841, 'East Yorkshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3842, 'England', 230, NULL, NULL);
INSERT INTO `states` VALUES (3843, 'Essex', 230, NULL, NULL);
INSERT INTO `states` VALUES (3844, 'Fermanagh', 230, NULL, NULL);
INSERT INTO `states` VALUES (3845, 'Fife', 230, NULL, NULL);
INSERT INTO `states` VALUES (3846, 'Flintshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3847, 'Fulham', 230, NULL, NULL);
INSERT INTO `states` VALUES (3848, 'Gainsborough', 230, NULL, NULL);
INSERT INTO `states` VALUES (3849, 'Glocestershire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3850, 'Gwent', 230, NULL, NULL);
INSERT INTO `states` VALUES (3851, 'Hampshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3852, 'Hants', 230, NULL, NULL);
INSERT INTO `states` VALUES (3853, 'Herefordshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3854, 'Hertfordshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3855, 'Ireland', 230, NULL, NULL);
INSERT INTO `states` VALUES (3856, 'Isle Of Man', 230, NULL, NULL);
INSERT INTO `states` VALUES (3857, 'Isle of Wight', 230, NULL, NULL);
INSERT INTO `states` VALUES (3858, 'Kenford', 230, NULL, NULL);
INSERT INTO `states` VALUES (3859, 'Kent', 230, NULL, NULL);
INSERT INTO `states` VALUES (3860, 'Kilmarnock', 230, NULL, NULL);
INSERT INTO `states` VALUES (3861, 'Lanarkshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3862, 'Lancashire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3863, 'Leicestershire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3864, 'Lincolnshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3865, 'Llanymynech', 230, NULL, NULL);
INSERT INTO `states` VALUES (3866, 'London', 230, NULL, NULL);
INSERT INTO `states` VALUES (3867, 'Ludlow', 230, NULL, NULL);
INSERT INTO `states` VALUES (3868, 'Manchester', 230, NULL, NULL);
INSERT INTO `states` VALUES (3869, 'Mayfair', 230, NULL, NULL);
INSERT INTO `states` VALUES (3870, 'Merseyside', 230, NULL, NULL);
INSERT INTO `states` VALUES (3871, 'Mid Glamorgan', 230, NULL, NULL);
INSERT INTO `states` VALUES (3872, 'Middlesex', 230, NULL, NULL);
INSERT INTO `states` VALUES (3873, 'Mildenhall', 230, NULL, NULL);
INSERT INTO `states` VALUES (3874, 'Monmouthshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3875, 'Newton Stewart', 230, NULL, NULL);
INSERT INTO `states` VALUES (3876, 'Norfolk', 230, NULL, NULL);
INSERT INTO `states` VALUES (3877, 'North Humberside', 230, NULL, NULL);
INSERT INTO `states` VALUES (3878, 'North Yorkshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3879, 'Northamptonshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3880, 'Northants', 230, NULL, NULL);
INSERT INTO `states` VALUES (3881, 'Northern Ireland', 230, NULL, NULL);
INSERT INTO `states` VALUES (3882, 'Northumberland', 230, NULL, NULL);
INSERT INTO `states` VALUES (3883, 'Nottinghamshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3884, 'Oxford', 230, NULL, NULL);
INSERT INTO `states` VALUES (3885, 'Powys', 230, NULL, NULL);
INSERT INTO `states` VALUES (3886, 'Roos-shire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3887, 'SUSSEX', 230, NULL, NULL);
INSERT INTO `states` VALUES (3888, 'Sark', 230, NULL, NULL);
INSERT INTO `states` VALUES (3889, 'Scotland', 230, NULL, NULL);
INSERT INTO `states` VALUES (3890, 'Scottish Borders', 230, NULL, NULL);
INSERT INTO `states` VALUES (3891, 'Shropshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3892, 'Somerset', 230, NULL, NULL);
INSERT INTO `states` VALUES (3893, 'South Glamorgan', 230, NULL, NULL);
INSERT INTO `states` VALUES (3894, 'South Wales', 230, NULL, NULL);
INSERT INTO `states` VALUES (3895, 'South Yorkshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3896, 'Southwell', 230, NULL, NULL);
INSERT INTO `states` VALUES (3897, 'Staffordshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3898, 'Strabane', 230, NULL, NULL);
INSERT INTO `states` VALUES (3899, 'Suffolk', 230, NULL, NULL);
INSERT INTO `states` VALUES (3900, 'Surrey', 230, NULL, NULL);
INSERT INTO `states` VALUES (3901, 'Sussex', 230, NULL, NULL);
INSERT INTO `states` VALUES (3902, 'Twickenham', 230, NULL, NULL);
INSERT INTO `states` VALUES (3903, 'Tyne and Wear', 230, NULL, NULL);
INSERT INTO `states` VALUES (3904, 'Tyrone', 230, NULL, NULL);
INSERT INTO `states` VALUES (3905, 'Utah', 230, NULL, NULL);
INSERT INTO `states` VALUES (3906, 'Wales', 230, NULL, NULL);
INSERT INTO `states` VALUES (3907, 'Warwickshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3908, 'West Lothian', 230, NULL, NULL);
INSERT INTO `states` VALUES (3909, 'West Midlands', 230, NULL, NULL);
INSERT INTO `states` VALUES (3910, 'West Sussex', 230, NULL, NULL);
INSERT INTO `states` VALUES (3911, 'West Yorkshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3912, 'Whissendine', 230, NULL, NULL);
INSERT INTO `states` VALUES (3913, 'Wiltshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3914, 'Wokingham', 230, NULL, NULL);
INSERT INTO `states` VALUES (3915, 'Worcestershire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3916, 'Wrexham', 230, NULL, NULL);
INSERT INTO `states` VALUES (3917, 'Wurttemberg', 230, NULL, NULL);
INSERT INTO `states` VALUES (3918, 'Yorkshire', 230, NULL, NULL);
INSERT INTO `states` VALUES (3919, 'Alabama', 231, NULL, NULL);
INSERT INTO `states` VALUES (3920, 'Alaska', 231, NULL, NULL);
INSERT INTO `states` VALUES (3921, 'Arizona', 231, NULL, NULL);
INSERT INTO `states` VALUES (3922, 'Arkansas', 231, NULL, NULL);
INSERT INTO `states` VALUES (3923, 'Byram', 231, NULL, NULL);
INSERT INTO `states` VALUES (3924, 'California', 231, NULL, NULL);
INSERT INTO `states` VALUES (3925, 'Cokato', 231, NULL, NULL);
INSERT INTO `states` VALUES (3926, 'Colorado', 231, NULL, NULL);
INSERT INTO `states` VALUES (3927, 'Connecticut', 231, NULL, NULL);
INSERT INTO `states` VALUES (3928, 'Delaware', 231, NULL, NULL);
INSERT INTO `states` VALUES (3929, 'District of Columbia', 231, NULL, NULL);
INSERT INTO `states` VALUES (3930, 'Florida', 231, NULL, NULL);
INSERT INTO `states` VALUES (3931, 'Georgia', 231, NULL, NULL);
INSERT INTO `states` VALUES (3932, 'Hawaii', 231, NULL, NULL);
INSERT INTO `states` VALUES (3933, 'Idaho', 231, NULL, NULL);
INSERT INTO `states` VALUES (3934, 'Illinois', 231, NULL, NULL);
INSERT INTO `states` VALUES (3935, 'Indiana', 231, NULL, NULL);
INSERT INTO `states` VALUES (3936, 'Iowa', 231, NULL, NULL);
INSERT INTO `states` VALUES (3937, 'Kansas', 231, NULL, NULL);
INSERT INTO `states` VALUES (3938, 'Kentucky', 231, NULL, NULL);
INSERT INTO `states` VALUES (3939, 'Louisiana', 231, NULL, NULL);
INSERT INTO `states` VALUES (3940, 'Lowa', 231, NULL, NULL);
INSERT INTO `states` VALUES (3941, 'Maine', 231, NULL, NULL);
INSERT INTO `states` VALUES (3942, 'Maryland', 231, NULL, NULL);
INSERT INTO `states` VALUES (3943, 'Massachusetts', 231, NULL, NULL);
INSERT INTO `states` VALUES (3944, 'Medfield', 231, NULL, NULL);
INSERT INTO `states` VALUES (3945, 'Michigan', 231, NULL, NULL);
INSERT INTO `states` VALUES (3946, 'Minnesota', 231, NULL, NULL);
INSERT INTO `states` VALUES (3947, 'Mississippi', 231, NULL, NULL);
INSERT INTO `states` VALUES (3948, 'Missouri', 231, NULL, NULL);
INSERT INTO `states` VALUES (3949, 'Montana', 231, NULL, NULL);
INSERT INTO `states` VALUES (3950, 'Nebraska', 231, NULL, NULL);
INSERT INTO `states` VALUES (3951, 'Nevada', 231, NULL, NULL);
INSERT INTO `states` VALUES (3952, 'New Hampshire', 231, NULL, NULL);
INSERT INTO `states` VALUES (3953, 'New Jersey', 231, NULL, NULL);
INSERT INTO `states` VALUES (3954, 'New Jersy', 231, NULL, NULL);
INSERT INTO `states` VALUES (3955, 'New Mexico', 231, NULL, NULL);
INSERT INTO `states` VALUES (3956, 'New York', 231, NULL, NULL);
INSERT INTO `states` VALUES (3957, 'North Carolina', 231, NULL, NULL);
INSERT INTO `states` VALUES (3958, 'North Dakota', 231, NULL, NULL);
INSERT INTO `states` VALUES (3959, 'Ohio', 231, NULL, NULL);
INSERT INTO `states` VALUES (3960, 'Oklahoma', 231, NULL, NULL);
INSERT INTO `states` VALUES (3961, 'Ontario', 231, NULL, NULL);
INSERT INTO `states` VALUES (3962, 'Oregon', 231, NULL, NULL);
INSERT INTO `states` VALUES (3963, 'Pennsylvania', 231, NULL, NULL);
INSERT INTO `states` VALUES (3964, 'Ramey', 231, NULL, NULL);
INSERT INTO `states` VALUES (3965, 'Rhode Island', 231, NULL, NULL);
INSERT INTO `states` VALUES (3966, 'South Carolina', 231, NULL, NULL);
INSERT INTO `states` VALUES (3967, 'South Dakota', 231, NULL, NULL);
INSERT INTO `states` VALUES (3968, 'Sublimity', 231, NULL, NULL);
INSERT INTO `states` VALUES (3969, 'Tennessee', 231, NULL, NULL);
INSERT INTO `states` VALUES (3970, 'Texas', 231, NULL, NULL);
INSERT INTO `states` VALUES (3971, 'Trimble', 231, NULL, NULL);
INSERT INTO `states` VALUES (3972, 'Utah', 231, NULL, NULL);
INSERT INTO `states` VALUES (3973, 'Vermont', 231, NULL, NULL);
INSERT INTO `states` VALUES (3974, 'Virginia', 231, NULL, NULL);
INSERT INTO `states` VALUES (3975, 'Washington', 231, NULL, NULL);
INSERT INTO `states` VALUES (3976, 'West Virginia', 231, NULL, NULL);
INSERT INTO `states` VALUES (3977, 'Wisconsin', 231, NULL, NULL);
INSERT INTO `states` VALUES (3978, 'Wyoming', 231, NULL, NULL);
INSERT INTO `states` VALUES (3979, 'United States Minor Outlying I', 232, NULL, NULL);
INSERT INTO `states` VALUES (3980, 'Artigas', 233, NULL, NULL);
INSERT INTO `states` VALUES (3981, 'Canelones', 233, NULL, NULL);
INSERT INTO `states` VALUES (3982, 'Cerro Largo', 233, NULL, NULL);
INSERT INTO `states` VALUES (3983, 'Colonia', 233, NULL, NULL);
INSERT INTO `states` VALUES (3984, 'Durazno', 233, NULL, NULL);
INSERT INTO `states` VALUES (3985, 'FLorida', 233, NULL, NULL);
INSERT INTO `states` VALUES (3986, 'Flores', 233, NULL, NULL);
INSERT INTO `states` VALUES (3987, 'Lavalleja', 233, NULL, NULL);
INSERT INTO `states` VALUES (3988, 'Maldonado', 233, NULL, NULL);
INSERT INTO `states` VALUES (3989, 'Montevideo', 233, NULL, NULL);
INSERT INTO `states` VALUES (3990, 'Paysandu', 233, NULL, NULL);
INSERT INTO `states` VALUES (3991, 'Rio Negro', 233, NULL, NULL);
INSERT INTO `states` VALUES (3992, 'Rivera', 233, NULL, NULL);
INSERT INTO `states` VALUES (3993, 'Rocha', 233, NULL, NULL);
INSERT INTO `states` VALUES (3994, 'Salto', 233, NULL, NULL);
INSERT INTO `states` VALUES (3995, 'San Jose', 233, NULL, NULL);
INSERT INTO `states` VALUES (3996, 'Soriano', 233, NULL, NULL);
INSERT INTO `states` VALUES (3997, 'Tacuarembo', 233, NULL, NULL);
INSERT INTO `states` VALUES (3998, 'Treinta y Tres', 233, NULL, NULL);
INSERT INTO `states` VALUES (3999, 'Andijon', 234, NULL, NULL);
INSERT INTO `states` VALUES (4000, 'Buhoro', 234, NULL, NULL);
INSERT INTO `states` VALUES (4001, 'Buxoro Viloyati', 234, NULL, NULL);
INSERT INTO `states` VALUES (4002, 'Cizah', 234, NULL, NULL);
INSERT INTO `states` VALUES (4003, 'Fargona', 234, NULL, NULL);
INSERT INTO `states` VALUES (4004, 'Horazm', 234, NULL, NULL);
INSERT INTO `states` VALUES (4005, 'Kaskadar', 234, NULL, NULL);
INSERT INTO `states` VALUES (4006, 'Korakalpogiston', 234, NULL, NULL);
INSERT INTO `states` VALUES (4007, 'Namangan', 234, NULL, NULL);
INSERT INTO `states` VALUES (4008, 'Navoi', 234, NULL, NULL);
INSERT INTO `states` VALUES (4009, 'Samarkand', 234, NULL, NULL);
INSERT INTO `states` VALUES (4010, 'Sirdare', 234, NULL, NULL);
INSERT INTO `states` VALUES (4011, 'Surhondar', 234, NULL, NULL);
INSERT INTO `states` VALUES (4012, 'Toskent', 234, NULL, NULL);
INSERT INTO `states` VALUES (4013, 'Malampa', 235, NULL, NULL);
INSERT INTO `states` VALUES (4014, 'Penama', 235, NULL, NULL);
INSERT INTO `states` VALUES (4015, 'Sanma', 235, NULL, NULL);
INSERT INTO `states` VALUES (4016, 'Shefa', 235, NULL, NULL);
INSERT INTO `states` VALUES (4017, 'Tafea', 235, NULL, NULL);
INSERT INTO `states` VALUES (4018, 'Torba', 235, NULL, NULL);
INSERT INTO `states` VALUES (4019, 'Vatican City State (Holy See)', 236, NULL, NULL);
INSERT INTO `states` VALUES (4020, 'Amazonas', 237, NULL, NULL);
INSERT INTO `states` VALUES (4021, 'Anzoategui', 237, NULL, NULL);
INSERT INTO `states` VALUES (4022, 'Apure', 237, NULL, NULL);
INSERT INTO `states` VALUES (4023, 'Aragua', 237, NULL, NULL);
INSERT INTO `states` VALUES (4024, 'Barinas', 237, NULL, NULL);
INSERT INTO `states` VALUES (4025, 'Bolivar', 237, NULL, NULL);
INSERT INTO `states` VALUES (4026, 'Carabobo', 237, NULL, NULL);
INSERT INTO `states` VALUES (4027, 'Cojedes', 237, NULL, NULL);
INSERT INTO `states` VALUES (4028, 'Delta Amacuro', 237, NULL, NULL);
INSERT INTO `states` VALUES (4029, 'Distrito Federal', 237, NULL, NULL);
INSERT INTO `states` VALUES (4030, 'Falcon', 237, NULL, NULL);
INSERT INTO `states` VALUES (4031, 'Guarico', 237, NULL, NULL);
INSERT INTO `states` VALUES (4032, 'Lara', 237, NULL, NULL);
INSERT INTO `states` VALUES (4033, 'Merida', 237, NULL, NULL);
INSERT INTO `states` VALUES (4034, 'Miranda', 237, NULL, NULL);
INSERT INTO `states` VALUES (4035, 'Monagas', 237, NULL, NULL);
INSERT INTO `states` VALUES (4036, 'Nueva Esparta', 237, NULL, NULL);
INSERT INTO `states` VALUES (4037, 'Portuguesa', 237, NULL, NULL);
INSERT INTO `states` VALUES (4038, 'Sucre', 237, NULL, NULL);
INSERT INTO `states` VALUES (4039, 'Tachira', 237, NULL, NULL);
INSERT INTO `states` VALUES (4040, 'Trujillo', 237, NULL, NULL);
INSERT INTO `states` VALUES (4041, 'Vargas', 237, NULL, NULL);
INSERT INTO `states` VALUES (4042, 'Yaracuy', 237, NULL, NULL);
INSERT INTO `states` VALUES (4043, 'Zulia', 237, NULL, NULL);
INSERT INTO `states` VALUES (4044, 'Bac Giang', 238, NULL, NULL);
INSERT INTO `states` VALUES (4045, 'Binh Dinh', 238, NULL, NULL);
INSERT INTO `states` VALUES (4046, 'Binh Duong', 238, NULL, NULL);
INSERT INTO `states` VALUES (4047, 'Da Nang', 238, NULL, NULL);
INSERT INTO `states` VALUES (4048, 'Dong Bang Song Cuu Long', 238, NULL, NULL);
INSERT INTO `states` VALUES (4049, 'Dong Bang Song Hong', 238, NULL, NULL);
INSERT INTO `states` VALUES (4050, 'Dong Nai', 238, NULL, NULL);
INSERT INTO `states` VALUES (4051, 'Dong Nam Bo', 238, NULL, NULL);
INSERT INTO `states` VALUES (4052, 'Duyen Hai Mien Trung', 238, NULL, NULL);
INSERT INTO `states` VALUES (4053, 'Hanoi', 238, NULL, NULL);
INSERT INTO `states` VALUES (4054, 'Hung Yen', 238, NULL, NULL);
INSERT INTO `states` VALUES (4055, 'Khu Bon Cu', 238, NULL, NULL);
INSERT INTO `states` VALUES (4056, 'Long An', 238, NULL, NULL);
INSERT INTO `states` VALUES (4057, 'Mien Nui Va Trung Du', 238, NULL, NULL);
INSERT INTO `states` VALUES (4058, 'Thai Nguyen', 238, NULL, NULL);
INSERT INTO `states` VALUES (4059, 'Thanh Pho Ho Chi Minh', 238, NULL, NULL);
INSERT INTO `states` VALUES (4060, 'Thu Do Ha Noi', 238, NULL, NULL);
INSERT INTO `states` VALUES (4061, 'Tinh Can Tho', 238, NULL, NULL);
INSERT INTO `states` VALUES (4062, 'Tinh Da Nang', 238, NULL, NULL);
INSERT INTO `states` VALUES (4063, 'Tinh Gia Lai', 238, NULL, NULL);
INSERT INTO `states` VALUES (4064, 'Anegada', 239, NULL, NULL);
INSERT INTO `states` VALUES (4065, 'Jost van Dyke', 239, NULL, NULL);
INSERT INTO `states` VALUES (4066, 'Tortola', 239, NULL, NULL);
INSERT INTO `states` VALUES (4067, 'Saint Croix', 240, NULL, NULL);
INSERT INTO `states` VALUES (4068, 'Saint John', 240, NULL, NULL);
INSERT INTO `states` VALUES (4069, 'Saint Thomas', 240, NULL, NULL);
INSERT INTO `states` VALUES (4070, 'Alo', 241, NULL, NULL);
INSERT INTO `states` VALUES (4071, 'Singave', 241, NULL, NULL);
INSERT INTO `states` VALUES (4072, 'Wallis', 241, NULL, NULL);
INSERT INTO `states` VALUES (4073, 'Bu Jaydur', 242, NULL, NULL);
INSERT INTO `states` VALUES (4074, 'Wad-adh-Dhahab', 242, NULL, NULL);
INSERT INTO `states` VALUES (4075, 'al-\'\'Ayun', 242, NULL, NULL);
INSERT INTO `states` VALUES (4076, 'as-Samarah', 242, NULL, NULL);
INSERT INTO `states` VALUES (4077, 'Adan', 243, NULL, NULL);
INSERT INTO `states` VALUES (4078, 'Abyan', 243, NULL, NULL);
INSERT INTO `states` VALUES (4079, 'Dhamar', 243, NULL, NULL);
INSERT INTO `states` VALUES (4080, 'Hadramaut', 243, NULL, NULL);
INSERT INTO `states` VALUES (4081, 'Hajjah', 243, NULL, NULL);
INSERT INTO `states` VALUES (4082, 'Hudaydah', 243, NULL, NULL);
INSERT INTO `states` VALUES (4083, 'Ibb', 243, NULL, NULL);
INSERT INTO `states` VALUES (4084, 'Lahij', 243, NULL, NULL);
INSERT INTO `states` VALUES (4085, 'Ma\'\'rib', 243, NULL, NULL);
INSERT INTO `states` VALUES (4086, 'Madinat San\'\'a', 243, NULL, NULL);
INSERT INTO `states` VALUES (4087, 'Sa\'\'dah', 243, NULL, NULL);
INSERT INTO `states` VALUES (4088, 'Sana', 243, NULL, NULL);
INSERT INTO `states` VALUES (4089, 'Shabwah', 243, NULL, NULL);
INSERT INTO `states` VALUES (4090, 'Ta\'\'izz', 243, NULL, NULL);
INSERT INTO `states` VALUES (4091, 'al-Bayda', 243, NULL, NULL);
INSERT INTO `states` VALUES (4092, 'al-Hudaydah', 243, NULL, NULL);
INSERT INTO `states` VALUES (4093, 'al-Jawf', 243, NULL, NULL);
INSERT INTO `states` VALUES (4094, 'al-Mahrah', 243, NULL, NULL);
INSERT INTO `states` VALUES (4095, 'al-Mahwit', 243, NULL, NULL);
INSERT INTO `states` VALUES (4096, 'Central Serbia', 244, NULL, NULL);
INSERT INTO `states` VALUES (4097, 'Kosovo and Metohija', 244, NULL, NULL);
INSERT INTO `states` VALUES (4098, 'Montenegro', 244, NULL, NULL);
INSERT INTO `states` VALUES (4099, 'Republic of Serbia', 244, NULL, NULL);
INSERT INTO `states` VALUES (4100, 'Serbia', 244, NULL, NULL);
INSERT INTO `states` VALUES (4101, 'Vojvodina', 244, NULL, NULL);
INSERT INTO `states` VALUES (4102, 'Central', 245, NULL, NULL);
INSERT INTO `states` VALUES (4103, 'Copperbelt', 245, NULL, NULL);
INSERT INTO `states` VALUES (4104, 'Eastern', 245, NULL, NULL);
INSERT INTO `states` VALUES (4105, 'Luapala', 245, NULL, NULL);
INSERT INTO `states` VALUES (4106, 'Lusaka', 245, NULL, NULL);
INSERT INTO `states` VALUES (4107, 'North-Western', 245, NULL, NULL);
INSERT INTO `states` VALUES (4108, 'Northern', 245, NULL, NULL);
INSERT INTO `states` VALUES (4109, 'Southern', 245, NULL, NULL);
INSERT INTO `states` VALUES (4110, 'Western', 245, NULL, NULL);
INSERT INTO `states` VALUES (4111, 'Bulawayo', 246, NULL, NULL);
INSERT INTO `states` VALUES (4112, 'Harare', 246, NULL, NULL);
INSERT INTO `states` VALUES (4113, 'Manicaland', 246, NULL, NULL);
INSERT INTO `states` VALUES (4114, 'Mashonaland Central', 246, NULL, NULL);
INSERT INTO `states` VALUES (4115, 'Mashonaland East', 246, NULL, NULL);
INSERT INTO `states` VALUES (4116, 'Mashonaland West', 246, NULL, NULL);
INSERT INTO `states` VALUES (4117, 'Masvingo', 246, NULL, NULL);
INSERT INTO `states` VALUES (4118, 'Matabeleland North', 246, NULL, NULL);
INSERT INTO `states` VALUES (4119, 'Matabeleland South', 246, NULL, NULL);
INSERT INTO `states` VALUES (4120, 'Midlands', 246, NULL, NULL);
INSERT INTO `states` VALUES (4121, 'Lienchiang County', 214, NULL, NULL);

-- ----------------------------
-- Table structure for stores
-- ----------------------------
DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `stores_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stores
-- ----------------------------
INSERT INTO `stores` VALUES (4, 'BKK1', '095888248', '136 Street 51, Phnom Penh 12302', '11.551717046927013, 104.92663946066088', NULL, '2024-07-29 02:54:46', '2024-07-29 09:00:28');

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `suppliers_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of suppliers
-- ----------------------------

-- ----------------------------
-- Table structure for transfer_items
-- ----------------------------
DROP TABLE IF EXISTS `transfer_items`;
CREATE TABLE `transfer_items`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `transfer_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `product_price` double NULL DEFAULT NULL,
  `net_unit_price` double NULL DEFAULT NULL,
  `tax_type` int NOT NULL,
  `tax_value` double NULL DEFAULT NULL,
  `tax_amount` double NULL DEFAULT NULL,
  `discount_type` int NOT NULL,
  `discount_value` double NULL DEFAULT NULL,
  `discount_amount` double NULL DEFAULT NULL,
  `quantity` double NULL DEFAULT NULL,
  `sub_total` double NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transfer_items_transfer_id_foreign`(`transfer_id`) USING BTREE,
  INDEX `transfer_items_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `transfer_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transfer_items_transfer_id_foreign` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transfer_items
-- ----------------------------

-- ----------------------------
-- Table structure for transfers
-- ----------------------------
DROP TABLE IF EXISTS `transfers`;
CREATE TABLE `transfers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `from_warehouse_id` bigint UNSIGNED NOT NULL,
  `to_warehouse_id` bigint UNSIGNED NOT NULL,
  `tax_rate` double NULL DEFAULT NULL,
  `tax_amount` double NULL DEFAULT NULL,
  `discount` double NULL DEFAULT NULL,
  `shipping` double NULL DEFAULT NULL,
  `grand_total` double NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `reference_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transfers_from_warehouse_id_foreign`(`from_warehouse_id`) USING BTREE,
  INDEX `transfers_to_warehouse_id_foreign`(`to_warehouse_id`) USING BTREE,
  CONSTRAINT `transfers_from_warehouse_id_foreign` FOREIGN KEY (`from_warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transfers_to_warehouse_id_foreign` FOREIGN KEY (`to_warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transfers
-- ----------------------------

-- ----------------------------
-- Table structure for units
-- ----------------------------
DROP TABLE IF EXISTS `units`;
CREATE TABLE `units`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_unit` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `units_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of units
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', NULL, 'admin@hieatapps.com', NULL, '2024-03-27 15:30:32', '$2y$10$PxMjpdL2VjUdAzzGs9jyyOVe9YaEK4n77XNbzMAbdbxr2Hja.e/gO', NULL, '2024-03-27 15:30:32', '2024-03-27 15:30:32', 1, 'en');

-- ----------------------------
-- Table structure for variation_products
-- ----------------------------
DROP TABLE IF EXISTS `variation_products`;
CREATE TABLE `variation_products`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `main_product_id` bigint UNSIGNED NULL DEFAULT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `variation_id` bigint UNSIGNED NOT NULL,
  `variation_type_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `variation_products_product_id_foreign`(`product_id`) USING BTREE,
  INDEX `variation_products_variation_id_foreign`(`variation_id`) USING BTREE,
  INDEX `variation_products_variation_type_id_foreign`(`variation_type_id`) USING BTREE,
  INDEX `variation_products_main_product_id_foreign`(`main_product_id`) USING BTREE,
  CONSTRAINT `variation_products_main_product_id_foreign` FOREIGN KEY (`main_product_id`) REFERENCES `main_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `variation_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `variation_products_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `variation_products_variation_type_id_foreign` FOREIGN KEY (`variation_type_id`) REFERENCES `variation_types` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of variation_products
-- ----------------------------

-- ----------------------------
-- Table structure for variation_types
-- ----------------------------
DROP TABLE IF EXISTS `variation_types`;
CREATE TABLE `variation_types`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `variation_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `variation_types_variation_id_foreign`(`variation_id`) USING BTREE,
  CONSTRAINT `variation_types_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of variation_types
-- ----------------------------

-- ----------------------------
-- Table structure for variations
-- ----------------------------
DROP TABLE IF EXISTS `variations`;
CREATE TABLE `variations`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `variations_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of variations
-- ----------------------------

-- ----------------------------
-- Table structure for warehouses
-- ----------------------------
DROP TABLE IF EXISTS `warehouses`;
CREATE TABLE `warehouses`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `zip_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `warehouses_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouses
-- ----------------------------
INSERT INTO `warehouses` VALUES (1, 'warehouse', '123456789', 'india', 'mumbai', 'warehouse1@infypos.com', '12345', '2024-03-27 15:30:32', '2024-07-29 05:01:35');

SET FOREIGN_KEY_CHECKS = 1;
