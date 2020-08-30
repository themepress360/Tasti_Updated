
CREATE TABLE `ti_activities` (
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `log_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_updated` datetime NOT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_addresses`
--

CREATE TABLE `ti_addresses` (
  `address_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `address_1` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_2` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_assignable_logs`
--

CREATE TABLE `ti_assignable_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `assignable_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignable_id` bigint(20) UNSIGNED NOT NULL,
  `assignee_id` int(10) UNSIGNED DEFAULT NULL,
  `assignee_group_id` int(10) UNSIGNED DEFAULT NULL,
  `status_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_banners`
--

CREATE TABLE `ti_banners` (
  `banner_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_url` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  `alt_text` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_code` text COLLATE utf8mb4_unicode_ci,
  `custom_code` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_categories`
--

CREATE TABLE `ti_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `image` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `permalink_slug` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_countries`
--

CREATE TABLE `ti_countries` (
  `country_id` int(10) UNSIGNED NOT NULL,
  `country_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_code_2` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_code_3` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `format` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_coupons`
--

CREATE TABLE `ti_coupons` (
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(15,4) DEFAULT NULL,
  `min_total` decimal(15,4) DEFAULT NULL,
  `redemptions` int(11) NOT NULL DEFAULT '0',
  `customer_redemptions` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `date_added` date NOT NULL,
  `validity` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_date` date DEFAULT NULL,
  `fixed_from_time` time DEFAULT NULL,
  `fixed_to_time` time DEFAULT NULL,
  `period_start_date` date DEFAULT NULL,
  `period_end_date` date DEFAULT NULL,
  `recurring_every` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurring_from_time` time DEFAULT NULL,
  `recurring_to_time` time DEFAULT NULL,
  `order_restriction` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_coupons_history`
--

CREATE TABLE `ti_coupons_history` (
  `coupon_history_id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_total` decimal(15,4) DEFAULT NULL,
  `amount` decimal(15,4) DEFAULT NULL,
  `date_used` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_currencies`
--

CREATE TABLE `ti_currencies` (
  `currency_id` int(10) UNSIGNED NOT NULL,
  `country_id` int(11) NOT NULL,
  `currency_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` decimal(15,8) NOT NULL,
  `symbol_position` tinyint(1) DEFAULT NULL,
  `thousand_sign` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_sign` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_position` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_alpha2` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_alpha3` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_numeric` int(11) DEFAULT NULL,
  `flag` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_status` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_customers`
--

CREATE TABLE `ti_customers` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `newsletter` tinyint(1) DEFAULT NULL,
  `customer_group_id` int(11) NOT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `reset_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_time` datetime DEFAULT NULL,
  `activation_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  `date_activated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_customers_online`
--

CREATE TABLE `ti_customers_online` (
  `activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `access_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_uri` text COLLATE utf8mb4_unicode_ci,
  `referrer_uri` text COLLATE utf8mb4_unicode_ci,
  `date_added` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `user_agent` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_customer_groups`
--

CREATE TABLE `ti_customer_groups` (
  `customer_group_id` int(10) UNSIGNED NOT NULL,
  `group_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `approval` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_custom_users`
--

CREATE TABLE `ti_custom_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_primary` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_extensions`
--

CREATE TABLE `ti_extensions` (
  `extension_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '1.0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_extension_settings`
--

CREATE TABLE `ti_extension_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_failed_jobs`
--

CREATE TABLE `ti_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_igniter_cart_cart`
--

CREATE TABLE `ti_igniter_cart_cart` (
  `identifier` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_igniter_frontend_sliders`
--

CREATE TABLE `ti_igniter_frontend_sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_igniter_frontend_subscribers`
--

CREATE TABLE `ti_igniter_frontend_subscribers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statistics` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_igniter_pages_menus`
--

CREATE TABLE `ti_igniter_pages_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme_code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_igniter_pages_menu_items`
--

CREATE TABLE `ti_igniter_pages_menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_jobs`
--

CREATE TABLE `ti_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_languages`
--

CREATE TABLE `ti_languages` (
  `language_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idiom` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `original_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_language_translations`
--

CREATE TABLE `ti_language_translations` (
  `translation_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namespace` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `group` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unstable` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_locationables`
--

CREATE TABLE `ti_locationables` (
  `location_id` int(11) NOT NULL,
  `locationable_id` int(11) NOT NULL,
  `locationable_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_locations`
--

CREATE TABLE `ti_locations` (
  `location_id` int(10) UNSIGNED NOT NULL,
  `location_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `location_address_1` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_address_2` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_city` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_state` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_country_id` int(11) DEFAULT NULL,
  `location_telephone` text COLLATE utf8mb4_unicode_ci,
  `location_lat` double DEFAULT NULL,
  `location_lng` double DEFAULT NULL,
  `location_radius` int(11) DEFAULT NULL,
  `location_status` tinyint(1) DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `location_image` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permalink_slug` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_location_areas`
--

CREATE TABLE `ti_location_areas` (
  `area_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `boundaries` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `conditions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_location_tables`
--

CREATE TABLE `ti_location_tables` (
  `location_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_mail_layouts`
--

CREATE TABLE `ti_mail_layouts` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `layout` text COLLATE utf8mb4_unicode_ci,
  `plain_layout` text COLLATE utf8mb4_unicode_ci,
  `layout_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_mail_partials`
--

CREATE TABLE `ti_mail_partials` (
  `partial_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `html` text COLLATE utf8mb4_unicode_ci,
  `text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_mail_templates`
--

CREATE TABLE `ti_mail_templates` (
  `template_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_custom` tinyint(1) DEFAULT NULL,
  `plain_body` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_mealtimes`
--

CREATE TABLE `ti_mealtimes` (
  `mealtime_id` int(11) NOT NULL,
  `mealtime_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL DEFAULT '00:00:00',
  `end_time` time NOT NULL DEFAULT '23:59:59',
  `mealtime_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_media_attachments`
--

CREATE TABLE `ti_media_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `tag` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `custom_properties` text COLLATE utf8mb4_unicode_ci,
  `priority` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menus`
--

CREATE TABLE `ti_menus` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_price` decimal(15,4) NOT NULL,
  `menu_photo` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_qty` int(11) NOT NULL DEFAULT '0',
  `minimum_qty` int(11) NOT NULL DEFAULT '0',
  `subtract_stock` tinyint(1) DEFAULT NULL,
  `menu_status` tinyint(1) NOT NULL,
  `menu_priority` int(11) NOT NULL DEFAULT '0',
  `order_restriction` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menus_specials`
--

CREATE TABLE `ti_menus_specials` (
  `special_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `special_price` decimal(15,4) DEFAULT NULL,
  `special_status` tinyint(1) NOT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validity` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurring_every` text COLLATE utf8mb4_unicode_ci,
  `recurring_from` time DEFAULT NULL,
  `recurring_to` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menu_categories`
--

CREATE TABLE `ti_menu_categories` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menu_item_options`
--

CREATE TABLE `ti_menu_item_options` (
  `menu_option_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `min_selected` int(11) NOT NULL DEFAULT '0',
  `max_selected` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menu_item_option_values`
--

CREATE TABLE `ti_menu_item_option_values` (
  `menu_option_value_id` int(11) NOT NULL,
  `menu_option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `new_price` decimal(15,4) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `subtract_stock` tinyint(1) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menu_mealtimes`
--

CREATE TABLE `ti_menu_mealtimes` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `mealtime_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menu_options`
--

CREATE TABLE `ti_menu_options` (
  `option_id` int(11) NOT NULL,
  `option_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menu_option_values`
--

CREATE TABLE `ti_menu_option_values` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,4) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_migrations`
--

CREATE TABLE `ti_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `group` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `migration` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_orders`
--

CREATE TABLE `ti_orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_items` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `payment` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `order_time` time NOT NULL,
  `order_date` date NOT NULL,
  `order_total` decimal(15,4) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `assignee_group_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_prefix` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processed` tinyint(1) DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  `assignee_updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_order_menus`
--

CREATE TABLE `ti_order_menus` (
  `order_menu_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(15,4) DEFAULT NULL,
  `subtotal` decimal(15,4) DEFAULT NULL,
  `option_values` text COLLATE utf8mb4_unicode_ci,
  `comment` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_order_menu_options`
--

CREATE TABLE `ti_order_menu_options` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `order_option_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_option_price` decimal(15,4) DEFAULT NULL,
  `order_menu_id` int(11) NOT NULL,
  `order_menu_option_id` int(11) NOT NULL,
  `menu_option_value_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_order_totals`
--

CREATE TABLE `ti_order_totals` (
  `order_total_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `priority` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_pages`
--

CREATE TABLE `ti_pages` (
  `page_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `permalink_slug` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_payments`
--

CREATE TABLE `ti_payments` (
  `payment_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `data` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_payment_logs`
--

CREATE TABLE `ti_payment_logs` (
  `payment_log_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `response` text COLLATE utf8mb4_unicode_ci,
  `is_success` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_payment_profiles`
--

CREATE TABLE `ti_payment_profiles` (
  `payment_profile_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last4` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_data` text COLLATE utf8mb4_unicode_ci,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_request_logs`
--

CREATE TABLE `ti_request_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `url` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_code` int(11) DEFAULT NULL,
  `referrer` text COLLATE utf8mb4_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_reservations`
--

CREATE TABLE `ti_reservations` (
  `reservation_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `guest_num` int(11) NOT NULL,
  `occasion_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `reserve_time` time NOT NULL,
  `reserve_date` date NOT NULL,
  `date_added` date NOT NULL,
  `date_modified` date NOT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `assignee_group_id` int(10) UNSIGNED DEFAULT NULL,
  `notify` tinyint(1) DEFAULT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` tinyint(1) NOT NULL,
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `processed` tinyint(1) DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  `assignee_updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_reservation_tables`
--

CREATE TABLE `ti_reservation_tables` (
  `reservation_id` int(10) UNSIGNED NOT NULL,
  `table_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_restaurants`
--

CREATE TABLE `ti_restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subdomain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_reviews`
--

CREATE TABLE `ti_reviews` (
  `review_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `sale_id` int(11) NOT NULL,
  `sale_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `author` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `quality` int(11) NOT NULL,
  `delivery` int(11) NOT NULL,
  `service` int(11) NOT NULL,
  `review_text` text COLLATE utf8mb4_unicode_ci,
  `date_added` datetime NOT NULL,
  `review_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_sessions`
--

CREATE TABLE `ti_sessions` (
  `id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_settings`
--

CREATE TABLE `ti_settings` (
  `setting_id` int(11) NOT NULL,
  `sort` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `serialized` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_staffs`
--

CREATE TABLE `ti_staffs` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_role_id` int(11) NOT NULL,
  `staff_location_id` int(11) NOT NULL,
  `timezone` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `date_added` date NOT NULL,
  `staff_status` tinyint(1) NOT NULL,
  `sale_permission` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_staffs_groups`
--

CREATE TABLE `ti_staffs_groups` (
  `staff_id` int(10) UNSIGNED NOT NULL,
  `staff_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_staffs_locations`
--

CREATE TABLE `ti_staffs_locations` (
  `staff_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_staff_groups`
--

CREATE TABLE `ti_staff_groups` (
  `staff_group_id` int(11) NOT NULL,
  `staff_group_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_assign` tinyint(1) DEFAULT '0',
  `auto_assign_mode` tinyint(4) DEFAULT '1',
  `auto_assign_limit` int(11) DEFAULT '20',
  `auto_assign_availability` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_staff_roles`
--

CREATE TABLE `ti_staff_roles` (
  `staff_role_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_statuses`
--

CREATE TABLE `ti_statuses` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci,
  `notify_customer` tinyint(1) DEFAULT NULL,
  `status_for` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_color` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_status_history`
--

CREATE TABLE `ti_status_history` (
  `status_history_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `object_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `notify` tinyint(1) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_tables`
--

CREATE TABLE `ti_tables` (
  `table_id` int(11) NOT NULL,
  `table_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_capacity` int(11) NOT NULL,
  `max_capacity` int(11) NOT NULL,
  `table_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_themes`
--

CREATE TABLE `ti_themes` (
  `theme_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `version` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '0.0.1',
  `data` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_users`
--

CREATE TABLE `ti_users` (
  `user_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `super_user` tinyint(1) DEFAULT NULL,
  `reset_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_time` datetime DEFAULT NULL,
  `activation_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  `date_activated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_user_preferences`
--

CREATE TABLE `ti_user_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_working_hours`
--

CREATE TABLE `ti_working_hours` (
  `location_id` int(11) NOT NULL,
  `weekday` int(11) NOT NULL,
  `opening_time` time NOT NULL DEFAULT '00:00:00',
  `closing_time` time NOT NULL DEFAULT '00:00:00',
  `status` tinyint(1) NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ti_activities`
--
ALTER TABLE `ti_activities`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `ti_addresses`
--
ALTER TABLE `ti_addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `ti_assignable_logs`
--
ALTER TABLE `ti_assignable_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignable_logs_assignable_type_assignable_id_index` (`assignable_type`,`assignable_id`);

--
-- Indexes for table `ti_banners`
--
ALTER TABLE `ti_banners`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `ti_categories`
--
ALTER TABLE `ti_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `ti_countries`
--
ALTER TABLE `ti_countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `ti_coupons`
--
ALTER TABLE `ti_coupons`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `ti_coupons_history`
--
ALTER TABLE `ti_coupons_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Indexes for table `ti_currencies`
--
ALTER TABLE `ti_currencies`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `ti_customers`
--
ALTER TABLE `ti_customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `ti_customers_online`
--
ALTER TABLE `ti_customers_online`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `ti_customer_groups`
--
ALTER TABLE `ti_customer_groups`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `ti_custom_users`
--
ALTER TABLE `ti_custom_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `ti_extensions`
--
ALTER TABLE `ti_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD UNIQUE KEY `extensions_name_unique` (`name`);

--
-- Indexes for table `ti_extension_settings`
--
ALTER TABLE `ti_extension_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `extension_settings_item_unique` (`item`);

--
-- Indexes for table `ti_failed_jobs`
--
ALTER TABLE `ti_failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ti_igniter_cart_cart`
--
ALTER TABLE `ti_igniter_cart_cart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `ti_igniter_frontend_sliders`
--
ALTER TABLE `ti_igniter_frontend_sliders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `igniter_frontend_sliders_code_unique` (`code`);

--
-- Indexes for table `ti_igniter_frontend_subscribers`
--
ALTER TABLE `ti_igniter_frontend_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ti_igniter_pages_menus`
--
ALTER TABLE `ti_igniter_pages_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `igniter_pages_menus_theme_code_index` (`theme_code`);

--
-- Indexes for table `ti_igniter_pages_menu_items`
--
ALTER TABLE `ti_igniter_pages_menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `igniter_pages_menu_items_menu_id_index` (`menu_id`),
  ADD KEY `igniter_pages_menu_items_parent_id_index` (`parent_id`);

--
-- Indexes for table `ti_jobs`
--
ALTER TABLE `ti_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `ti_languages`
--
ALTER TABLE `ti_languages`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `ti_language_translations`
--
ALTER TABLE `ti_language_translations`
  ADD PRIMARY KEY (`translation_id`),
  ADD UNIQUE KEY `language_translations_locale_namespace_group_item_unique` (`locale`,`namespace`,`group`,`item`),
  ADD KEY `language_translations_group_index` (`group`);

--
-- Indexes for table `ti_locations`
--
ALTER TABLE `ti_locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `ti_location_areas`
--
ALTER TABLE `ti_location_areas`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `ti_location_tables`
--
ALTER TABLE `ti_location_tables`
  ADD PRIMARY KEY (`location_id`,`table_id`);

--
-- Indexes for table `ti_mail_layouts`
--
ALTER TABLE `ti_mail_layouts`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indexes for table `ti_mail_partials`
--
ALTER TABLE `ti_mail_partials`
  ADD PRIMARY KEY (`partial_id`);

--
-- Indexes for table `ti_mail_templates`
--
ALTER TABLE `ti_mail_templates`
  ADD PRIMARY KEY (`template_id`),
  ADD UNIQUE KEY `mail_templates_data_template_id_code_unique` (`layout_id`,`code`);

--
-- Indexes for table `ti_mealtimes`
--
ALTER TABLE `ti_mealtimes`
  ADD PRIMARY KEY (`mealtime_id`);

--
-- Indexes for table `ti_media_attachments`
--
ALTER TABLE `ti_media_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_attachments_attachment_type_attachment_id_index` (`attachment_type`,`attachment_id`),
  ADD KEY `media_attachments_tag_index` (`tag`);

--
-- Indexes for table `ti_menus`
--
ALTER TABLE `ti_menus`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `ti_menus_specials`
--
ALTER TABLE `ti_menus_specials`
  ADD PRIMARY KEY (`special_id`),
  ADD UNIQUE KEY `menus_specials_special_id_menu_id_unique` (`special_id`,`menu_id`);

--
-- Indexes for table `ti_menu_categories`
--
ALTER TABLE `ti_menu_categories`
  ADD UNIQUE KEY `menu_categories_menu_id_category_id_unique` (`menu_id`,`category_id`),
  ADD KEY `menu_categories_menu_id_index` (`menu_id`),
  ADD KEY `menu_categories_category_id_index` (`category_id`);

--
-- Indexes for table `ti_menu_item_options`
--
ALTER TABLE `ti_menu_item_options`
  ADD PRIMARY KEY (`menu_option_id`);

--
-- Indexes for table `ti_menu_item_option_values`
--
ALTER TABLE `ti_menu_item_option_values`
  ADD PRIMARY KEY (`menu_option_value_id`);

--
-- Indexes for table `ti_menu_mealtimes`
--
ALTER TABLE `ti_menu_mealtimes`
  ADD UNIQUE KEY `menu_mealtimes_menu_id_mealtime_id_unique` (`menu_id`,`mealtime_id`),
  ADD KEY `menu_mealtimes_menu_id_index` (`menu_id`),
  ADD KEY `menu_mealtimes_mealtime_id_index` (`mealtime_id`);

--
-- Indexes for table `ti_menu_options`
--
ALTER TABLE `ti_menu_options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `ti_menu_option_values`
--
ALTER TABLE `ti_menu_option_values`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Indexes for table `ti_migrations`
--
ALTER TABLE `ti_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ti_orders`
--
ALTER TABLE `ti_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `orders_hash_index` (`hash`);

--
-- Indexes for table `ti_order_menus`
--
ALTER TABLE `ti_order_menus`
  ADD PRIMARY KEY (`order_menu_id`);

--
-- Indexes for table `ti_order_menu_options`
--
ALTER TABLE `ti_order_menu_options`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Indexes for table `ti_order_totals`
--
ALTER TABLE `ti_order_totals`
  ADD PRIMARY KEY (`order_total_id`);

--
-- Indexes for table `ti_pages`
--
ALTER TABLE `ti_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `ti_payments`
--
ALTER TABLE `ti_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `payments_code_unique` (`code`);

--
-- Indexes for table `ti_payment_logs`
--
ALTER TABLE `ti_payment_logs`
  ADD PRIMARY KEY (`payment_log_id`);

--
-- Indexes for table `ti_payment_profiles`
--
ALTER TABLE `ti_payment_profiles`
  ADD PRIMARY KEY (`payment_profile_id`),
  ADD KEY `payment_profiles_customer_id_index` (`customer_id`),
  ADD KEY `payment_profiles_payment_id_index` (`payment_id`);

--
-- Indexes for table `ti_request_logs`
--
ALTER TABLE `ti_request_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ti_reservations`
--
ALTER TABLE `ti_reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `reservations_location_id_table_id_index` (`location_id`,`table_id`),
  ADD KEY `reservations_hash_index` (`hash`);

--
-- Indexes for table `ti_reservation_tables`
--
ALTER TABLE `ti_reservation_tables`
  ADD UNIQUE KEY `reservation_tables_reservation_id_table_id_unique` (`reservation_id`,`table_id`),
  ADD KEY `reservation_tables_reservation_id_index` (`reservation_id`),
  ADD KEY `reservation_tables_table_id_index` (`table_id`);

--
-- Indexes for table `ti_restaurants`
--
ALTER TABLE `ti_restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ti_reviews`
--
ALTER TABLE `ti_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `reviews_review_id_sale_type_sale_id_index` (`review_id`,`sale_type`,`sale_id`);

--
-- Indexes for table `ti_sessions`
--
ALTER TABLE `ti_sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `ti_settings`
--
ALTER TABLE `ti_settings`
  ADD PRIMARY KEY (`setting_id`),
  ADD UNIQUE KEY `settings_sort_item_unique` (`sort`,`item`);

--
-- Indexes for table `ti_staffs`
--
ALTER TABLE `ti_staffs`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `staff_email` (`staff_email`);

--
-- Indexes for table `ti_staffs_groups`
--
ALTER TABLE `ti_staffs_groups`
  ADD PRIMARY KEY (`staff_id`,`staff_group_id`);

--
-- Indexes for table `ti_staffs_locations`
--
ALTER TABLE `ti_staffs_locations`
  ADD PRIMARY KEY (`staff_id`,`location_id`);

--
-- Indexes for table `ti_staff_groups`
--
ALTER TABLE `ti_staff_groups`
  ADD PRIMARY KEY (`staff_group_id`);

--
-- Indexes for table `ti_staff_roles`
--
ALTER TABLE `ti_staff_roles`
  ADD PRIMARY KEY (`staff_role_id`);

--
-- Indexes for table `ti_statuses`
--
ALTER TABLE `ti_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `ti_status_history`
--
ALTER TABLE `ti_status_history`
  ADD PRIMARY KEY (`status_history_id`);

--
-- Indexes for table `ti_tables`
--
ALTER TABLE `ti_tables`
  ADD PRIMARY KEY (`table_id`);

--
-- Indexes for table `ti_themes`
--
ALTER TABLE `ti_themes`
  ADD PRIMARY KEY (`theme_id`),
  ADD UNIQUE KEY `themes_code_unique` (`code`);

--
-- Indexes for table `ti_users`
--
ALTER TABLE `ti_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_staff_id_unique` (`staff_id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `ti_user_preferences`
--
ALTER TABLE `ti_user_preferences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ti_working_hours`
--
ALTER TABLE `ti_working_hours`
  ADD KEY `working_hours_location_id_weekday_type_index` (`location_id`,`weekday`,`type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ti_activities`
--
ALTER TABLE `ti_activities`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_addresses`
--
ALTER TABLE `ti_addresses`
  MODIFY `address_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_assignable_logs`
--
ALTER TABLE `ti_assignable_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_banners`
--
ALTER TABLE `ti_banners`
  MODIFY `banner_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_categories`
--
ALTER TABLE `ti_categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `ti_countries`
--
ALTER TABLE `ti_countries`
  MODIFY `country_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;
--
-- AUTO_INCREMENT for table `ti_coupons`
--
ALTER TABLE `ti_coupons`
  MODIFY `coupon_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ti_coupons_history`
--
ALTER TABLE `ti_coupons_history`
  MODIFY `coupon_history_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_currencies`
--
ALTER TABLE `ti_currencies`
  MODIFY `currency_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ti_customers`
--
ALTER TABLE `ti_customers`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_customers_online`
--
ALTER TABLE `ti_customers_online`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_customer_groups`
--
ALTER TABLE `ti_customer_groups`
  MODIFY `customer_group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ti_custom_users`
--
ALTER TABLE `ti_custom_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `ti_extensions`
--
ALTER TABLE `ti_extensions`
  MODIFY `extension_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `ti_extension_settings`
--
ALTER TABLE `ti_extension_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_failed_jobs`
--
ALTER TABLE `ti_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_igniter_frontend_sliders`
--
ALTER TABLE `ti_igniter_frontend_sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ti_igniter_frontend_subscribers`
--
ALTER TABLE `ti_igniter_frontend_subscribers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_igniter_pages_menus`
--
ALTER TABLE `ti_igniter_pages_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ti_igniter_pages_menu_items`
--
ALTER TABLE `ti_igniter_pages_menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `ti_jobs`
--
ALTER TABLE `ti_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_languages`
--
ALTER TABLE `ti_languages`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ti_language_translations`
--
ALTER TABLE `ti_language_translations`
  MODIFY `translation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_locations`
--
ALTER TABLE `ti_locations`
  MODIFY `location_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ti_location_areas`
--
ALTER TABLE `ti_location_areas`
  MODIFY `area_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_mail_layouts`
--
ALTER TABLE `ti_mail_layouts`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ti_mail_partials`
--
ALTER TABLE `ti_mail_partials`
  MODIFY `partial_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ti_mail_templates`
--
ALTER TABLE `ti_mail_templates`
  MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `ti_mealtimes`
--
ALTER TABLE `ti_mealtimes`
  MODIFY `mealtime_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ti_media_attachments`
--
ALTER TABLE `ti_media_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ti_menus`
--
ALTER TABLE `ti_menus`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `ti_menus_specials`
--
ALTER TABLE `ti_menus_specials`
  MODIFY `special_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_menu_item_options`
--
ALTER TABLE `ti_menu_item_options`
  MODIFY `menu_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `ti_menu_item_option_values`
--
ALTER TABLE `ti_menu_item_option_values`
  MODIFY `menu_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `ti_menu_options`
--
ALTER TABLE `ti_menu_options`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ti_menu_option_values`
--
ALTER TABLE `ti_menu_option_values`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `ti_migrations`
--
ALTER TABLE `ti_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `ti_orders`
--
ALTER TABLE `ti_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_order_menus`
--
ALTER TABLE `ti_order_menus`
  MODIFY `order_menu_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_order_menu_options`
--
ALTER TABLE `ti_order_menu_options`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_order_totals`
--
ALTER TABLE `ti_order_totals`
  MODIFY `order_total_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_pages`
--
ALTER TABLE `ti_pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ti_payments`
--
ALTER TABLE `ti_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_payment_logs`
--
ALTER TABLE `ti_payment_logs`
  MODIFY `payment_log_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_payment_profiles`
--
ALTER TABLE `ti_payment_profiles`
  MODIFY `payment_profile_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_request_logs`
--
ALTER TABLE `ti_request_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ti_reservations`
--
ALTER TABLE `ti_reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_restaurants`
--
ALTER TABLE `ti_restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `ti_reviews`
--
ALTER TABLE `ti_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_settings`
--
ALTER TABLE `ti_settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `ti_staffs`
--
ALTER TABLE `ti_staffs`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ti_staff_groups`
--
ALTER TABLE `ti_staff_groups`
  MODIFY `staff_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ti_staff_roles`
--
ALTER TABLE `ti_staff_roles`
  MODIFY `staff_role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ti_statuses`
--
ALTER TABLE `ti_statuses`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `ti_status_history`
--
ALTER TABLE `ti_status_history`
  MODIFY `status_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ti_tables`
--
ALTER TABLE `ti_tables`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `ti_themes`
--
ALTER TABLE `ti_themes`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ti_users`
--
ALTER TABLE `ti_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ti_user_preferences`
--
ALTER TABLE `ti_user_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
