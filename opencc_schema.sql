-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: opencc
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agent_states`
--

DROP TABLE IF EXISTS `agent_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_states` (
  `id` varchar(45) NOT NULL,
  `state_name` varchar(45) DEFAULT NULL,
  `state_time` varchar(45) DEFAULT NULL,
  `state_start_time` timestamp NULL DEFAULT NULL,
  `state_end_time` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `login_history_id` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_agent_states_users1_idx` (`user_id`),
  KEY `fk_agent_states_login_histories1_idx` (`login_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_facebook`
--

DROP TABLE IF EXISTS `api_facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_facebook` (
  `page_id` char(36) NOT NULL,
  `page_name` char(36) DEFAULT NULL,
  `page_access_token` varchar(255) DEFAULT NULL,
  `company_id` char(36) DEFAULT NULL,
  `status` int(11) unsigned zerofill DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_business_hours_general`
--

DROP TABLE IF EXISTS `app_business_hours_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_business_hours_general` (
  `business_hour_uuid` char(36) NOT NULL,
  `type` enum('day','date','day_time') DEFAULT NULL,
  `time_from` varchar(45) DEFAULT NULL,
  `time_to` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `day` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_uuid` varchar(36) NOT NULL,
  `hospital_uuid` char(36) NOT NULL,
  PRIMARY KEY (`business_hour_uuid`),
  KEY `fk_business_hours_user_info1_idx` (`user_uuid`),
  KEY `time_from` (`time_from`(2)),
  KEY `time_to` (`time_to`(2)),
  KEY `hospital_uuid` (`hospital_uuid`),
  KEY `day` (`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_business_hours_specific`
--

DROP TABLE IF EXISTS `app_business_hours_specific`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_business_hours_specific` (
  `business_hour_specific_uuid` char(36) NOT NULL,
  `time_from` varchar(50) DEFAULT NULL,
  `time_to` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `user_uuid` varchar(50) DEFAULT NULL,
  `hospital_uuid` varchar(50) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`business_hour_specific_uuid`),
  KEY `time_from` (`time_from`),
  KEY `time_to` (`time_to`),
  KEY `type` (`type`),
  KEY `date` (`date`),
  KEY `user_uuid` (`user_uuid`),
  KEY `hospital_uuid` (`hospital_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_doctor_timeslot`
--

DROP TABLE IF EXISTS `app_doctor_timeslot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_doctor_timeslot` (
  `user_uuid` varchar(45) DEFAULT NULL,
  `hospital_uuid` varchar(45) DEFAULT NULL,
  `appointment_slot_ratio` varchar(20) DEFAULT NULL,
  KEY `hospital_uuid` (`hospital_uuid`),
  KEY `user_uuid` (`user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_hospitals`
--

DROP TABLE IF EXISTS `app_hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_hospitals` (
  `hospital_uuid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  PRIMARY KEY (`hospital_uuid`),
  KEY `name` (`name`(10)),
  KEY `city` (`city`),
  KEY `deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_integration`
--

DROP TABLE IF EXISTS `app_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_integration` (
  `app` varchar(50) DEFAULT NULL,
  `app_uuid` char(50) DEFAULT NULL,
  `host` varchar(50) DEFAULT NULL,
  `iframe_host` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `port` varchar(50) DEFAULT NULL,
  `authorization_code` varchar(100) DEFAULT NULL,
  `allow_authorization` varchar(5) DEFAULT NULL,
  `domain_uuid` varchar(50) DEFAULT NULL,
  `client_id` varchar(150) DEFAULT NULL,
  `client_secret` varchar(150) DEFAULT NULL,
  `access_token` mediumtext DEFAULT NULL,
  `refresh_token` varchar(200) DEFAULT NULL,
  `app_enable` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `app_integration_data` varchar(512) DEFAULT NULL,
  `domain_name` varchar(50) DEFAULT NULL,
  `api_domain` varchar(100) DEFAULT NULL,
  `single_sign_on` mediumtext DEFAULT NULL,
  `app_type` varchar(100) DEFAULT NULL,
  `app_name` varchar(50) DEFAULT NULL,
  KEY `app_uuid` (`app_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_linked_page_dtl`
--

DROP TABLE IF EXISTS `app_linked_page_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_linked_page_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(100) DEFAULT NULL,
  `page_name` varchar(100) DEFAULT NULL,
  `page_accesstoken` varchar(45) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_patients`
--

DROP TABLE IF EXISTS `app_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_patients` (
  `patient_uuid` varchar(36) NOT NULL,
  `patient_code` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `user_token` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `email_id` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `pincode` varchar(45) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `alternet_phone_number` varchar(45) DEFAULT NULL,
  `age` varchar(45) DEFAULT NULL,
  `more_info` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`patient_uuid`),
  KEY `username` (`username`(15)),
  KEY `pincode` (`pincode`(4)),
  KEY `city` (`city`(7)),
  KEY `phone_number` (`phone_number`(6)),
  KEY `deleted_at` (`deleted_at`),
  KEY `name` (`name`(15)),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_pincode_mapping`
--

DROP TABLE IF EXISTS `app_pincode_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_pincode_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pincode` varchar(25) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `subdistrict` varchar(100) DEFAULT NULL,
  `office_bo_so_ho` varchar(100) DEFAULT NULL,
  `locality` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `state` (`state`),
  KEY `pincode` (`pincode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_specializations`
--

DROP TABLE IF EXISTS `app_specializations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_specializations` (
  `specialization_uuid` varchar(36) NOT NULL,
  `specialization` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`specialization_uuid`),
  KEY `deleted_at` (`deleted_at`),
  KEY `specialization` (`specialization`(5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_symptoms`
--

DROP TABLE IF EXISTS `app_symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_symptoms` (
  `symptoms_uuid` varchar(45) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`symptoms_uuid`),
  KEY `name` (`name`(5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_user_info`
--

DROP TABLE IF EXISTS `app_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user_info` (
  `user_uuid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `more_info` text DEFAULT NULL,
  `appointment_slot_ratio` varchar(45) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_uuid`),
  KEY `type` (`type`),
  KEY `appointment_slot_ratio` (`appointment_slot_ratio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_user_info_has_hospitals`
--

DROP TABLE IF EXISTS `app_user_info_has_hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user_info_has_hospitals` (
  `user_info_user_uuid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `hospitals_hospital_uuid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`user_info_user_uuid`,`hospitals_hospital_uuid`),
  KEY `fk_user_info_has_hospitals_hospitals1_idx` (`hospitals_hospital_uuid`),
  KEY `fk_user_info_has_hospitals_user_info1_idx` (`user_info_user_uuid`),
  CONSTRAINT `fk_user_info_has_hospitals_hospitals1` FOREIGN KEY (`hospitals_hospital_uuid`) REFERENCES `app_hospitals` (`hospital_uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_info_has_hospitals_user_info1` FOREIGN KEY (`user_info_user_uuid`) REFERENCES `app_user_info` (`user_uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bots`
--

DROP TABLE IF EXISTS `bots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bots` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `page` varchar(45) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `language` varchar(45) DEFAULT NULL,
  `website_id` int(10) unsigned NOT NULL,
  `server_token` varchar(255) DEFAULT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `cleint_token` varchar(45) DEFAULT NULL,
  `pre_intent_status` tinyint(1) DEFAULT 0,
  `bot_loaded` tinyint(1) DEFAULT 0,
  `pre_intents` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` varchar(45) DEFAULT NULL,
  `deleted_at` varchar(45) DEFAULT NULL,
  `sync_status` tinyint(1) DEFAULT 1,
  `preintent_message_status` tinyint(1) DEFAULT 0,
  `preintent_message` mediumtext DEFAULT NULL,
  `textbox_enabled` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_bots_websites1_idx` (`website_id`),
  CONSTRAINT `fk_bots_websites1` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `break_statuses`
--

DROP TABLE IF EXISTS `break_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `break_statuses` (
  `id` varchar(45) NOT NULL,
  `break_reason` varchar(100) DEFAULT NULL,
  `break_start_time` timestamp NULL DEFAULT NULL,
  `break_end_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `login_history_id` varchar(45) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_break_stutuses_login_histories1_idx` (`login_history_id`),
  KEY `fk_break_stutuses_users1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `breaks`
--

DROP TABLE IF EXISTS `breaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `breaks` (
  `company_information_id` int(10) unsigned NOT NULL,
  `break_id` varchar(45) NOT NULL,
  `break_name` varchar(45) DEFAULT NULL,
  `break_desc` varchar(1000) DEFAULT NULL,
  `break_type` varchar(45) DEFAULT NULL,
  `break_status` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`break_id`),
  KEY `fk_table1_company_informations1_idx` (`company_information_id`),
  CONSTRAINT `fk_table1_company_informations1` FOREIGN KEY (`company_information_id`) REFERENCES `company_informations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_assigns`
--

DROP TABLE IF EXISTS `chat_assigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_assigns` (
  `id` varchar(32) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` varchar(45) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `chat_accepted` tinyint(1) DEFAULT 0,
  `total_assign` varchar(10) DEFAULT '1',
  `request_rejected` tinyint(1) DEFAULT 0,
  `request_by_customer` tinyint(1) DEFAULT 1,
  `chat_transferred` tinyint(1) DEFAULT 0,
  `rejected_user_id` int(10) unsigned DEFAULT NULL,
  `concurrent_chat` int(10) unsigned DEFAULT NULL,
  `transfer_user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chat_assigns_customers1_idx` (`customer_id`),
  KEY `fk_chat_assigns_users1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_settings`
--

DROP TABLE IF EXISTS `chat_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_settings` (
  `chat_settings_uuid` varchar(36) NOT NULL,
  `settings_name` varchar(50) NOT NULL,
  `settings_type` varchar(50) NOT NULL,
  `company_information_id` int(10) unsigned NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chatbot_processes`
--

DROP TABLE IF EXISTS `chatbot_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatbot_processes` (
  `id` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `website_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chatbot_processes_websites1_idx` (`website_id`),
  CONSTRAINT `fk_chatbot_processes_websites1` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chatbots`
--

DROP TABLE IF EXISTS `chatbots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatbots` (
  `id` varchar(45) NOT NULL,
  `tag` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `website_id` int(10) unsigned NOT NULL,
  `patterns` text DEFAULT NULL,
  `responses` text DEFAULT NULL,
  `context_set` varchar(255) DEFAULT NULL,
  `context_filter` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_with_param` varchar(45) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `fk_chatbots_websites1_idx` (`website_id`),
  CONSTRAINT `fk_chatbots_websites1` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_informations`
--

DROP TABLE IF EXISTS `company_informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_informations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `industry` varchar(45) DEFAULT NULL,
  `number_of_employee` varchar(10) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `registered_from` varchar(100) DEFAULT 'chatinbox',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `console_log_to_table`
--

DROP TABLE IF EXISTS `console_log_to_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `console_log_to_table` (
  `agent_uuid` char(36) DEFAULT NULL,
  `usertoken` char(36) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  KEY `agent_uuid` (`agent_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `system_ip` varchar(45) DEFAULT NULL,
  `customer_system_info` mediumtext DEFAULT NULL,
  `analitics_data` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `website_id` int(10) unsigned NOT NULL,
  `customer_geo_info` mediumtext DEFAULT NULL,
  `customer_page_search_info` mediumtext DEFAULT NULL,
  `attended_by` varchar(45) DEFAULT NULL,
  `visited_pages` mediumtext DEFAULT NULL,
  `prev_page` mediumtext DEFAULT NULL,
  `note` mediumtext DEFAULT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  `quetion_info` mediumtext DEFAULT NULL,
  `chat_status` varchar(255) DEFAULT NULL,
  `chat_comments` mediumtext DEFAULT NULL,
  `is_transfer` tinyint(1) DEFAULT 0,
  `sound_notification` tinyint(1) DEFAULT 1,
  `chat_ratiing` varchar(45) DEFAULT 'no_rating',
  `resolve_status` varchar(45) DEFAULT 'no_status',
  `chat_ended` tinyint(1) DEFAULT 0,
  `chat_end_by` varchar(36) DEFAULT '',
  `page_title` varchar(255) DEFAULT NULL,
  `wait_time` time DEFAULT NULL,
  `chat_time` time DEFAULT NULL,
  `chat_for_agent` tinyint(1) DEFAULT 0,
  `country` varchar(45) DEFAULT 'India',
  `quetion_label` mediumtext DEFAULT NULL,
  `contact_broadcast_uuid` char(36) DEFAULT NULL,
  `user_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_customers_websites1_idx` (`website_id`),
  KEY `fk_customers_departments1_idx` (`department_id`),
  CONSTRAINT `fk_customers_departments1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_customers_websites1` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard_logs`
--

DROP TABLE IF EXISTS `dashboard_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cpudata` varchar(20) DEFAULT NULL,
  `kbmemfree` varchar(20) DEFAULT NULL,
  `kbmemused` varchar(20) DEFAULT NULL,
  `kbbuffers` varchar(20) DEFAULT NULL,
  `kbcached` varchar(20) DEFAULT NULL,
  `swpused` varchar(20) DEFAULT NULL,
  `rx` float DEFAULT NULL,
  `tx` float DEFAULT NULL,
  `dashboard_logs` varchar(20) DEFAULT NULL,
  `host_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `datetime` (`datetime`) USING BTREE,
  KEY `host_name` (`host_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `website_id` int(10) unsigned NOT NULL,
  `company_information_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_departments_websites1_idx` (`website_id`),
  KEY `fk_departments_company_informations1_idx` (`company_information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(64) NOT NULL,
  `did` varchar(64) DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_idx` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_attrs`
--

DROP TABLE IF EXISTS `domain_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_attrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `did` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  PRIMARY KEY (`id`),
  KEY `domain_attrs_idx` (`did`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_configuration`
--

DROP TABLE IF EXISTS `email_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_configuration` (
  `id_uuid` char(36) NOT NULL,
  `email_name` varchar(25) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `email_password` varchar(45) DEFAULT NULL,
  `incoming_email_status` varchar(20) DEFAULT NULL,
  `outgoing_email_status` varchar(20) DEFAULT NULL,
  `incoming_host` varchar(50) DEFAULT NULL,
  `incoming_port` varchar(5) DEFAULT NULL,
  `protocol` varchar(45) DEFAULT NULL,
  `imap_encryption` varchar(10) DEFAULT NULL,
  `fetch_frequency` varchar(45) DEFAULT NULL,
  `email_per_fetch` varchar(10) DEFAULT NULL,
  `fetched_emails` varchar(45) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `entdate` datetime DEFAULT NULL,
  `outgoing_host` varchar(50) DEFAULT NULL,
  `outgoing_port` varchar(5) DEFAULT NULL,
  `smtp_encryption` varchar(10) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `is_deleted` varchar(1) DEFAULT NULL,
  `domain_uuid` char(36) NOT NULL,
  `queue_id` char(36) NOT NULL,
  `file_stroage_path` varchar(500) DEFAULT NULL,
  KEY `id_uuid` (`id_uuid`),
  KEY `is_active` (`is_active`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `queue_id` (`queue_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_message_attachment`
--

DROP TABLE IF EXISTS `email_message_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_message_attachment` (
  `id_uuid` char(36) NOT NULL,
  `email_message_mst_id` char(36) NOT NULL,
  `comment_id` char(36) DEFAULT NULL,
  `attachment_file_name` text DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL DEFAULT current_timestamp(),
  KEY `id_uuid` (`id_uuid`),
  KEY `email_message_mst_id` (`email_message_mst_id`),
  KEY `comment_id` (`comment_id`),
  KEY `created_date` (`created_date`),
  KEY `modify_date` (`modify_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_message_comment`
--

DROP TABLE IF EXISTS `email_message_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_message_comment` (
  `id_uuid` char(36) NOT NULL,
  `email_message_mst_id` char(36) NOT NULL,
  `from_email_addr` varchar(250) DEFAULT NULL,
  `email_replyto` varchar(254) DEFAULT NULL,
  `to` varchar(3000) NOT NULL,
  `cc` varchar(3000) DEFAULT NULL,
  `bcc` varchar(3000) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `comment_type` varchar(3) DEFAULT NULL COMMENT '/* Possible Values : SR- System Reply, AE - Agent Replay , CR - Customer Reply */',
  `content_type` varchar(100) DEFAULT NULL,
  `email_status` enum('read','unread') DEFAULT 'unread',
  `user_uuid` char(36) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `isdeleted` char(1) DEFAULT 'N',
  KEY `id_uuid` (`id_uuid`),
  KEY `email_message_mst_id` (`email_message_mst_id`),
  KEY `comment_type` (`comment_type`),
  KEY `user_uuid` (`user_uuid`),
  KEY `created_date` (`created_date`),
  KEY `isdeleted` (`isdeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_message_draft`
--

DROP TABLE IF EXISTS `email_message_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_message_draft` (
  `draft_uuid` char(36) NOT NULL,
  `email_config_id` char(36) DEFAULT NULL,
  `email_message_mst_id` char(36) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `from_email_addr` varchar(250) DEFAULT NULL,
  `email_replyto` varchar(250) DEFAULT NULL,
  `to` varchar(3000) DEFAULT NULL,
  `cc` varchar(3000) DEFAULT NULL,
  `bcc` varchar(3000) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `previous_mail_comment` text DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `isdeleted` char(1) DEFAULT NULL,
  KEY `created_date` (`created_date`) USING BTREE,
  KEY `email_message_mst_id` (`email_message_mst_id`) USING BTREE,
  KEY `id_uuid` (`draft_uuid`) USING BTREE,
  KEY `isdeleted` (`isdeleted`) USING BTREE,
  KEY `user_uuid` (`user_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_message_mst`
--

DROP TABLE IF EXISTS `email_message_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_message_mst` (
  `id_uuid` char(36) NOT NULL,
  `from_email_addr` varchar(254) NOT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `status` varchar(6) DEFAULT NULL,
  `assign_user_uuid` char(36) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `queue_id` char(36) DEFAULT NULL,
  `cc` varchar(1000) DEFAULT NULL,
  `bcc` varchar(1000) DEFAULT NULL,
  `is_locked` varchar(1) DEFAULT NULL,
  `locked_by` int(11) DEFAULT NULL,
  `locked_time` datetime NOT NULL,
  `created_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `mail_recieved_date` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `email_config_id` char(36) DEFAULT NULL,
  `domain_uuid` char(36) NOT NULL,
  KEY `id_uuid` (`id_uuid`),
  KEY `subject` (`subject`),
  KEY `created_date` (`created_date`),
  KEY `email_config_id` (`email_config_id`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `assign_user_uuid` (`assign_user_uuid`),
  KEY `queue_id` (`queue_id`),
  KEY `from_email_addr` (`from_email_addr`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entities`
--

DROP TABLE IF EXISTS `entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entities` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `values` mediumtext DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `website_id` int(10) unsigned NOT NULL,
  `bot_id` varchar(50) NOT NULL,
  `sync_status` tinyint(1) DEFAULT 1,
  `roles` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entities_websites1_idx` (`website_id`),
  KEY `fk_entities_bots1_idx` (`bot_id`),
  CONSTRAINT `fk_entities_bots1` FOREIGN KEY (`bot_id`) REFERENCES `bots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_entities_websites1` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facebook_chat_detail`
--

DROP TABLE IF EXISTS `facebook_chat_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facebook_chat_detail` (
  `chat_detail_uuid` char(36) NOT NULL,
  `conversation_uuid` char(36) NOT NULL,
  `sender_uuid` char(40) NOT NULL,
  `user_uuid` char(36) NOT NULL,
  `status` varchar(15) NOT NULL,
  `disposition_uuid` char(36) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `closed_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facebook_users`
--

DROP TABLE IF EXISTS `facebook_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facebook_users` (
  `facebook_user_uuid` char(36) NOT NULL,
  `sender_uuid` char(36) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `profile_pic` varchar(150) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpinbox_campaign_mapping`
--

DROP TABLE IF EXISTS `helpinbox_campaign_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpinbox_campaign_mapping` (
  `campaign_mapping_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `helpinbox_dept_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpinbox_drafts`
--

DROP TABLE IF EXISTS `helpinbox_drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpinbox_drafts` (
  `draft_uuid` char(36) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `comment` mediumtext DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `customer_email` varchar(70) DEFAULT NULL,
  `filepath` mediumtext DEFAULT NULL,
  `filename` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `created_at` (`created_at`) USING BTREE,
  KEY `customer_email` (`customer_email`) USING BTREE,
  KEY `draft_uuid` (`draft_uuid`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `ticket_id` (`ticket_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpinbox_integration`
--

DROP TABLE IF EXISTS `helpinbox_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpinbox_integration` (
  `integration_uuid` char(36) DEFAULT NULL,
  `host_url` varchar(70) NOT NULL,
  `sub_domain` varchar(50) DEFAULT NULL,
  `callback_url` varchar(70) NOT NULL,
  `email_notify_url` varchar(70) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `domain_intalk_name` varchar(50) NOT NULL,
  `api_key` varchar(50) NOT NULL,
  `user_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpinbox_queue_mapping`
--

DROP TABLE IF EXISTS `helpinbox_queue_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpinbox_queue_mapping` (
  `queue_mapping_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `helpinbox_team_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpinbox_user_mapping`
--

DROP TABLE IF EXISTS `helpinbox_user_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpinbox_user_mapping` (
  `user_mapping_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `helpinbox_user_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidays` (
  `id` varchar(45) NOT NULL,
  `date` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `website_id` int(10) unsigned NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_holidays_websites1_idx` (`website_id`),
  CONSTRAINT `fk_holidays_websites1` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `icici_rmid_mapping`
--

DROP TABLE IF EXISTS `icici_rmid_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icici_rmid_mapping` (
  `user_uuid` char(36) NOT NULL,
  `rm_id` char(36) DEFAULT NULL,
  `pincode` longtext NOT NULL,
  PRIMARY KEY (`user_uuid`),
  KEY `rm_id` (`rm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insert_disposition_count_hourly_based`
--

DROP TABLE IF EXISTS `insert_disposition_count_hourly_based`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insert_disposition_count_hourly_based` (
  `insert_disposition_count_hourly_based_uuid` char(36) NOT NULL,
  `disposition_name` varchar(50) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `lead_data_uuid` char(36) NOT NULL,
  `hour` int(5) NOT NULL,
  `disposition_count` int(50) NOT NULL,
  PRIMARY KEY (`insert_disposition_count_hourly_based_uuid`),
  KEY `created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insert_lead_data_hourly_based`
--

DROP TABLE IF EXISTS `insert_lead_data_hourly_based`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insert_lead_data_hourly_based` (
  `lead_data_uuid` char(36) NOT NULL,
  `hour` int(5) NOT NULL,
  `list_uuid` char(36) NOT NULL,
  `total_customer_uploaded` int(11) NOT NULL,
  `list_name` varchar(100) NOT NULL,
  `count_new_call` varchar(100) NOT NULL,
  `count_attempted_call` varchar(100) NOT NULL,
  `call_broadcast_uuid` char(36) NOT NULL,
  `call_center_queue_uuid` char(36) NOT NULL,
  `total_call_attempts` int(11) NOT NULL,
  `total_connected_call` int(11) NOT NULL,
  `total_failed_call` int(11) NOT NULL,
  `total_unique_attempted_call` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intent_reports`
--

DROP TABLE IF EXISTS `intent_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intent_reports` (
  `id` varchar(45) NOT NULL,
  `slot_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `bot_intent_id` varchar(50) NOT NULL,
  `bot_id` varchar(50) NOT NULL,
  `website_id` int(10) unsigned NOT NULL,
  `customer_id` varchar(45) NOT NULL,
  `rating` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_intent_report_bot_intents1_idx` (`bot_intent_id`),
  KEY `fk_intent_report_bots1_idx` (`bot_id`),
  KEY `fk_intent_report_websites1_idx` (`website_id`),
  KEY `fk_intent_reports_customers1_idx` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) DEFAULT NULL,
  `contact` varchar(512) NOT NULL DEFAULT '',
  `received` varchar(128) DEFAULT NULL,
  `path` varchar(512) DEFAULT NULL,
  `expires` datetime NOT NULL DEFAULT '2030-05-28 21:32:15',
  `q` float(10,2) NOT NULL DEFAULT 1.00,
  `callid` varchar(255) NOT NULL DEFAULT 'Default-Call-ID',
  `cseq` int(11) NOT NULL DEFAULT 1,
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  `flags` int(11) NOT NULL DEFAULT 0,
  `cflags` int(11) NOT NULL DEFAULT 0,
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `socket` varchar(64) DEFAULT NULL,
  `methods` int(11) DEFAULT NULL,
  `instance` varchar(255) DEFAULT NULL,
  `reg_id` int(11) NOT NULL DEFAULT 0,
  `server_id` int(11) NOT NULL DEFAULT 0,
  `connection_id` int(11) NOT NULL DEFAULT 0,
  `keepalive` int(11) NOT NULL DEFAULT 0,
  `partition` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ruid_idx` (`ruid`),
  KEY `expires_idx` (`expires`),
  KEY `connection_idx` (`server_id`,`connection_id`),
  KEY `account_contact_idx` (`username`,`domain`,`contact`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location_attrs`
--

DROP TABLE IF EXISTS `location_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_attrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) DEFAULT NULL,
  `aname` varchar(64) NOT NULL DEFAULT '',
  `atype` int(11) NOT NULL DEFAULT 0,
  `avalue` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  PRIMARY KEY (`id`),
  KEY `account_record_idx` (`username`,`domain`,`ruid`),
  KEY `last_modified_idx` (`last_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location_history_log`
--

DROP TABLE IF EXISTS `location_history_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_history_log` (
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  `ruid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) DEFAULT NULL,
  `contact` varchar(512) NOT NULL DEFAULT '',
  `received` varchar(128) DEFAULT NULL,
  `path` varchar(512) DEFAULT NULL,
  `expires` datetime NOT NULL DEFAULT '2030-05-28 21:32:15',
  `q` float(10,2) NOT NULL DEFAULT 1.00,
  `callid` varchar(255) NOT NULL DEFAULT 'Default-Call-ID',
  `cseq` int(11) NOT NULL DEFAULT 1,
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  `flags` int(11) NOT NULL DEFAULT 0,
  `cflags` int(11) NOT NULL DEFAULT 0,
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `socket` varchar(64) DEFAULT NULL,
  `methods` int(11) DEFAULT NULL,
  `instance` varchar(255) DEFAULT NULL,
  `reg_id` int(11) NOT NULL DEFAULT 0,
  `server_id` int(11) NOT NULL DEFAULT 0,
  `connection_id` int(11) NOT NULL DEFAULT 0,
  `keepalive` int(11) NOT NULL DEFAULT 0,
  `partition` int(11) NOT NULL DEFAULT 0,
  `action` varchar(10) DEFAULT NULL,
  `log_created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_histories`
--

DROP TABLE IF EXISTS `login_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_histories` (
  `id` varchar(45) NOT NULL,
  `login_time` timestamp NULL DEFAULT NULL,
  `logout_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_login_histories_users1_idx` (`user_id`),
  CONSTRAINT `fk_login_histories_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_history_details`
--

DROP TABLE IF EXISTS `login_history_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_history_details` (
  `id` varchar(45) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `geo_detail` text DEFAULT NULL,
  `system_detail` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `login_history_id` varchar(45) NOT NULL,
  `user_token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_login_history_details_login_histories1_idx` (`login_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_configs`
--

DROP TABLE IF EXISTS `mail_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_configs` (
  `id` varchar(45) NOT NULL,
  `host` varchar(100) DEFAULT NULL,
  `port` varchar(45) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `from_name` varchar(45) DEFAULT NULL,
  `mail_username` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `encryption` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `website_id` int(10) unsigned NOT NULL,
  `driver` varchar(45) DEFAULT 'sendmail',
  PRIMARY KEY (`id`),
  KEY `fk_mail_configs_websites1_idx` (`website_id`),
  CONSTRAINT `fk_mail_configs_websites1` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mobile_app_versions`
--

DROP TABLE IF EXISTS `mobile_app_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_app_versions` (
  `mobile_app_version_uuid` char(36) NOT NULL,
  `current_version` varchar(20) NOT NULL,
  `apk_file_path` varchar(100) NOT NULL,
  `api_path` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mosl_ivrcall_path`
--

DROP TABLE IF EXISTS `mosl_ivrcall_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mosl_ivrcall_path` (
  `call_uuid` char(36) NOT NULL,
  `source_number` char(20) NOT NULL,
  `uniqueCallID` varchar(50) DEFAULT NULL,
  `lan` char(30) DEFAULT NULL,
  `language` char(10) DEFAULT NULL,
  `registeredCaller` char(5) DEFAULT '''No''',
  `Language_Selection_Menu` char(10) DEFAULT NULL,
  `Confirm_Preferred_Language` char(10) DEFAULT NULL,
  `isExisting` char(5) DEFAULT NULL,
  `New_loan_inquery` char(5) DEFAULT NULL,
  `lan_input` char(10) DEFAULT NULL,
  `lan_Confirmation` char(5) DEFAULT NULL,
  `dob_input` char(10) DEFAULT NULL,
  `dob_Confirmation` char(5) DEFAULT NULL,
  `main_menu_choice` char(10) DEFAULT NULL,
  `sub_menu_choice` char(10) DEFAULT NULL,
  `Main_menu_Loan_account_count` int(2) DEFAULT NULL,
  `Sub_Menu_Loan_account_details_count` int(2) DEFAULT NULL,
  `Sub_Menu_Insurance_details_count` int(2) DEFAULT NULL,
  `Sub_Menu_SOA_IC_count` int(2) DEFAULT NULL,
  `Sub_Menu_ROI_count` int(2) DEFAULT NULL,
  `Main_menu_PMAY_count` int(2) DEFAULT NULL,
  `Main_menu_LOD_count` int(2) DEFAULT NULL,
  `Sub_Menu_LOD_Request_count` int(2) DEFAULT NULL,
  `Sub_Menu_LOD_Status_count` int(2) DEFAULT NULL,
  `Main_Menu_FCL_count` int(2) DEFAULT NULL,
  `Sub_Menu_New_FCL_count` int(2) DEFAULT NULL,
  `Sub_Menu_FCL_Status_count` int(2) DEFAULT NULL,
  `Sub_Menu_Status_FCL_Original_Doc_count` int(2) DEFAULT NULL,
  `Main_Menu_Top_UP_Loan_count` int(2) DEFAULT NULL,
  `Main_Menu_Payment_details_count` int(2) DEFAULT NULL,
  `Sub_Menu_last_5_payment_count` int(2) DEFAULT NULL,
  `Sub_Menu_NEFT_details_count` int(2) DEFAULT NULL,
  `Sub_Menu_present_NACH_for_bounced_EMI_count` int(2) DEFAULT NULL,
  `NACH_date` char(5) DEFAULT NULL,
  `Sub_Menu_Part_payment_count` int(2) DEFAULT NULL,
  `Part_payment_amount_confirmed` char(10) DEFAULT NULL,
  `Part_payment_adjustement_against_your_loan_Tenure_EMI` char(10) DEFAULT NULL,
  `Callback_Requested` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `narang_did_mapping`
--

DROP TABLE IF EXISTS `narang_did_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `narang_did_mapping` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `did` varchar(30) NOT NULL,
  `project_name` varchar(100) NOT NULL,
  `inquiry_source` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `did` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `numbers_origination`
--

DROP TABLE IF EXISTS `numbers_origination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numbers_origination` (
  `origination_uuid` char(36) NOT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `total_calls` int(11) NOT NULL DEFAULT 0,
  `fail_calls` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `fails_within_5sec` int(11) NOT NULL,
  `abandoned_calls` int(11) NOT NULL DEFAULT 0,
  `answered_calls` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`origination_uuid`),
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`),
  KEY `deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permission_types`
--

DROP TABLE IF EXISTS `permission_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_types` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `input_type` varchar(45) DEFAULT NULL,
  `values` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `default` varchar(45) DEFAULT NULL,
  `for_helpinbox` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permissions_roles1_idx` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugin_widget`
--

DROP TABLE IF EXISTS `plugin_widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_widget` (
  `plugin_id` char(36) NOT NULL,
  `extension_uuid` char(36) DEFAULT NULL,
  `plugin_name` varchar(50) DEFAULT NULL,
  `ask_customer_info` enum('Y','N') DEFAULT NULL,
  `call_type` enum('BOTH','CALLBACK','WEBRTC') DEFAULT NULL,
  `destination_type` enum('QUEUE','CAMPAIGN') DEFAULT NULL,
  `destination_id` varchar(50) DEFAULT NULL,
  `destination_number` varchar(50) DEFAULT NULL,
  `sip_username` varchar(10) DEFAULT NULL,
  `sip_password` varchar(10) DEFAULT NULL,
  `plugin_token` varchar(150) DEFAULT NULL,
  `plugin_status` enum('Y','N','X') DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `domain_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`plugin_id`),
  KEY `extension_uuid` (`extension_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `predictive_logs`
--

DROP TABLE IF EXISTS `predictive_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `predictive_logs` (
  `origination_uuid` char(36) NOT NULL,
  `call_center_queue_uuid` char(36) NOT NULL,
  `waiting_agents` int(11) NOT NULL DEFAULT 0,
  `answered_calls` int(11) NOT NULL DEFAULT 0,
  `abandoned_calls` int(11) NOT NULL DEFAULT 0,
  `avg_abandoned_rate` decimal(4,2) NOT NULL DEFAULT 0.00,
  `total_calls` int(11) NOT NULL DEFAULT 0,
  `calls_in_queue` int(11) NOT NULL DEFAULT 0,
  `fail_calls` int(11) NOT NULL,
  `ringing_calls` int(11) NOT NULL DEFAULT 0,
  `active_calls` int(11) NOT NULL DEFAULT 0,
  `max_drop_call_percentage` decimal(4,2) NOT NULL DEFAULT 0.00,
  `blast_limit` int(11) NOT NULL DEFAULT 0,
  `call_generated` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`),
  KEY `origination_uuid` (`origination_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `company_information_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_roles_company_informations1_idx` (`company_information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedulers`
--

DROP TABLE IF EXISTS `schedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedulers` (
  `id` varchar(45) NOT NULL,
  `status` tinyint(1) DEFAULT 0,
  `city` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `website_id` int(10) unsigned NOT NULL,
  `timezone_offset` varchar(45) DEFAULT NULL,
  `business_hours` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_schedulers_websites1_idx` (`website_id`),
  CONSTRAINT `fk_schedulers_websites1` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shortcuts`
--

DROP TABLE IF EXISTS `shortcuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortcuts` (
  `id` varchar(45) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `access` enum('public','personal') DEFAULT 'public',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `website_id` int(10) unsigned NOT NULL,
  `company_information_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`website_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_shortcuts_websites1_idx` (`website_id`),
  KEY `fk_shortcuts_company_informations1_idx` (`company_information_id`),
  CONSTRAINT `fk_shortcuts_company_informations1` FOREIGN KEY (`company_information_id`) REFERENCES `company_informations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_shortcuts_websites1` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `social_app_mst`
--

DROP TABLE IF EXISTS `social_app_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_app_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(100) DEFAULT NULL,
  `app_secret` varchar(100) DEFAULT NULL,
  `app_accesstoken` varchar(100) DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT current_timestamp(),
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `social_media_integration`
--

DROP TABLE IF EXISTS `social_media_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_media_integration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_uuid` varchar(36) NOT NULL,
  `source` varchar(100) NOT NULL,
  `setting` mediumtext NOT NULL,
  `auth_key` mediumtext NOT NULL,
  `permission` int(11) NOT NULL DEFAULT 0,
  `api_key` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscriber`
--

DROP TABLE IF EXISTS `subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriber` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `domain` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `ha1` varchar(128) DEFAULT NULL,
  `ha1b` varchar(128) DEFAULT NULL,
  `request_from` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_idx` (`username`,`domain`),
  KEY `username_idx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `website_id` int(10) unsigned NOT NULL,
  `company_information_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_tags_websites1_idx` (`website_id`),
  KEY `fk_tags_company_informations1_idx` (`company_information_id`),
  CONSTRAINT `fk_tags_company_informations1` FOREIGN KEY (`company_information_id`) REFERENCES `company_informations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_websites1` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_broadcasts_contacts1742101992`
--

DROP TABLE IF EXISTS `temp_broadcasts_contacts1742101992`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_broadcasts_contacts1742101992` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_broadcast_uuid` char(36) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `alternate_number1` varchar(15) DEFAULT NULL,
  `alternate_number2` varchar(15) DEFAULT NULL,
  `alternate_number3` varchar(15) DEFAULT NULL,
  `alternate_number4` varchar(15) DEFAULT NULL,
  `alternate_number5` varchar(15) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email_id` varchar(55) DEFAULT NULL,
  `othedata` mediumtext DEFAULT NULL,
  `crm_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_unique_id` char(36) DEFAULT NULL,
  `call_status` varchar(255) DEFAULT NULL,
  `call_attempts` varchar(40) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `contact_priority` int(5) DEFAULT NULL,
  `contact_score` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`contact_broadcast_uuid`),
  KEY `contact_unique_id` (`contact_unique_id`) USING BTREE,
  KEY `list_uuid` (`list_uuid`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `phone_number` (`phone_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3585 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_broadcasts_contacts1742102057`
--

DROP TABLE IF EXISTS `temp_broadcasts_contacts1742102057`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_broadcasts_contacts1742102057` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_broadcast_uuid` char(36) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `alternate_number1` varchar(15) DEFAULT NULL,
  `alternate_number2` varchar(15) DEFAULT NULL,
  `alternate_number3` varchar(15) DEFAULT NULL,
  `alternate_number4` varchar(15) DEFAULT NULL,
  `alternate_number5` varchar(15) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email_id` varchar(55) DEFAULT NULL,
  `othedata` mediumtext DEFAULT NULL,
  `crm_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_unique_id` char(36) DEFAULT NULL,
  `call_status` varchar(255) DEFAULT NULL,
  `call_attempts` varchar(40) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `contact_priority` int(5) DEFAULT NULL,
  `contact_score` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`contact_broadcast_uuid`),
  KEY `contact_unique_id` (`contact_unique_id`) USING BTREE,
  KEY `list_uuid` (`list_uuid`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `phone_number` (`phone_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3585 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_broadcasts_contacts1742102095`
--

DROP TABLE IF EXISTS `temp_broadcasts_contacts1742102095`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_broadcasts_contacts1742102095` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_broadcast_uuid` char(36) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `alternate_number1` varchar(15) DEFAULT NULL,
  `alternate_number2` varchar(15) DEFAULT NULL,
  `alternate_number3` varchar(15) DEFAULT NULL,
  `alternate_number4` varchar(15) DEFAULT NULL,
  `alternate_number5` varchar(15) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email_id` varchar(55) DEFAULT NULL,
  `othedata` mediumtext DEFAULT NULL,
  `crm_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_unique_id` char(36) DEFAULT NULL,
  `call_status` varchar(255) DEFAULT NULL,
  `call_attempts` varchar(40) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `contact_priority` int(5) DEFAULT NULL,
  `contact_score` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`contact_broadcast_uuid`),
  KEY `contact_unique_id` (`contact_unique_id`) USING BTREE,
  KEY `list_uuid` (`list_uuid`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `phone_number` (`phone_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3585 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_broadcasts_contacts1742102697`
--

DROP TABLE IF EXISTS `temp_broadcasts_contacts1742102697`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_broadcasts_contacts1742102697` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_broadcast_uuid` char(36) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `alternate_number1` varchar(15) DEFAULT NULL,
  `alternate_number2` varchar(15) DEFAULT NULL,
  `alternate_number3` varchar(15) DEFAULT NULL,
  `alternate_number4` varchar(15) DEFAULT NULL,
  `alternate_number5` varchar(15) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email_id` varchar(55) DEFAULT NULL,
  `othedata` mediumtext DEFAULT NULL,
  `crm_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_unique_id` char(36) DEFAULT NULL,
  `call_status` varchar(255) DEFAULT NULL,
  `call_attempts` varchar(40) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `contact_priority` int(5) DEFAULT NULL,
  `contact_score` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`contact_broadcast_uuid`),
  KEY `contact_unique_id` (`contact_unique_id`) USING BTREE,
  KEY `list_uuid` (`list_uuid`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `phone_number` (`phone_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_broadcasts_contacts1742102719`
--

DROP TABLE IF EXISTS `temp_broadcasts_contacts1742102719`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_broadcasts_contacts1742102719` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_broadcast_uuid` char(36) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `alternate_number1` varchar(15) DEFAULT NULL,
  `alternate_number2` varchar(15) DEFAULT NULL,
  `alternate_number3` varchar(15) DEFAULT NULL,
  `alternate_number4` varchar(15) DEFAULT NULL,
  `alternate_number5` varchar(15) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email_id` varchar(55) DEFAULT NULL,
  `othedata` mediumtext DEFAULT NULL,
  `crm_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_unique_id` char(36) DEFAULT NULL,
  `call_status` varchar(255) DEFAULT NULL,
  `call_attempts` varchar(40) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `contact_priority` int(5) DEFAULT NULL,
  `contact_score` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`contact_broadcast_uuid`),
  KEY `contact_unique_id` (`contact_unique_id`) USING BTREE,
  KEY `list_uuid` (`list_uuid`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `phone_number` (`phone_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_broadcasts_contacts1742102769`
--

DROP TABLE IF EXISTS `temp_broadcasts_contacts1742102769`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_broadcasts_contacts1742102769` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_broadcast_uuid` char(36) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `alternate_number1` varchar(15) DEFAULT NULL,
  `alternate_number2` varchar(15) DEFAULT NULL,
  `alternate_number3` varchar(15) DEFAULT NULL,
  `alternate_number4` varchar(15) DEFAULT NULL,
  `alternate_number5` varchar(15) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email_id` varchar(55) DEFAULT NULL,
  `othedata` mediumtext DEFAULT NULL,
  `crm_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_unique_id` char(36) DEFAULT NULL,
  `call_status` varchar(255) DEFAULT NULL,
  `call_attempts` varchar(40) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `contact_priority` int(5) DEFAULT NULL,
  `contact_score` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`contact_broadcast_uuid`),
  KEY `contact_unique_id` (`contact_unique_id`) USING BTREE,
  KEY `list_uuid` (`list_uuid`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `phone_number` (`phone_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_broadcasts_contacts1742103835`
--

DROP TABLE IF EXISTS `temp_broadcasts_contacts1742103835`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_broadcasts_contacts1742103835` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_broadcast_uuid` char(36) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `alternate_number1` varchar(15) DEFAULT NULL,
  `alternate_number2` varchar(15) DEFAULT NULL,
  `alternate_number3` varchar(15) DEFAULT NULL,
  `alternate_number4` varchar(15) DEFAULT NULL,
  `alternate_number5` varchar(15) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email_id` varchar(55) DEFAULT NULL,
  `othedata` mediumtext DEFAULT NULL,
  `crm_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_unique_id` char(36) DEFAULT NULL,
  `call_status` varchar(255) DEFAULT NULL,
  `call_attempts` varchar(40) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `contact_priority` int(5) DEFAULT NULL,
  `contact_score` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`contact_broadcast_uuid`),
  KEY `contact_unique_id` (`contact_unique_id`) USING BTREE,
  KEY `list_uuid` (`list_uuid`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `phone_number` (`phone_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_broadcasts_contacts1742104002`
--

DROP TABLE IF EXISTS `temp_broadcasts_contacts1742104002`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_broadcasts_contacts1742104002` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_broadcast_uuid` char(36) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `alternate_number1` varchar(15) DEFAULT NULL,
  `alternate_number2` varchar(15) DEFAULT NULL,
  `alternate_number3` varchar(15) DEFAULT NULL,
  `alternate_number4` varchar(15) DEFAULT NULL,
  `alternate_number5` varchar(15) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email_id` varchar(55) DEFAULT NULL,
  `othedata` mediumtext DEFAULT NULL,
  `crm_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_unique_id` char(36) DEFAULT NULL,
  `call_status` varchar(255) DEFAULT NULL,
  `call_attempts` varchar(40) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `contact_priority` int(5) DEFAULT NULL,
  `contact_score` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`contact_broadcast_uuid`),
  KEY `contact_unique_id` (`contact_unique_id`) USING BTREE,
  KEY `list_uuid` (`list_uuid`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `phone_number` (`phone_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_broadcasts_contacts1742104562`
--

DROP TABLE IF EXISTS `temp_broadcasts_contacts1742104562`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_broadcasts_contacts1742104562` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_broadcast_uuid` char(36) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `alternate_number1` varchar(15) DEFAULT NULL,
  `alternate_number2` varchar(15) DEFAULT NULL,
  `alternate_number3` varchar(15) DEFAULT NULL,
  `alternate_number4` varchar(15) DEFAULT NULL,
  `alternate_number5` varchar(15) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email_id` varchar(55) DEFAULT NULL,
  `othedata` mediumtext DEFAULT NULL,
  `crm_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_unique_id` char(36) DEFAULT NULL,
  `call_status` varchar(255) DEFAULT NULL,
  `call_attempts` varchar(40) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `contact_priority` int(5) DEFAULT NULL,
  `contact_score` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`contact_broadcast_uuid`),
  KEY `contact_unique_id` (`contact_unique_id`) USING BTREE,
  KEY `list_uuid` (`list_uuid`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `phone_number` (`phone_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_broadcasts_contacts1745495755`
--

DROP TABLE IF EXISTS `temp_broadcasts_contacts1745495755`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_broadcasts_contacts1745495755` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_broadcast_uuid` char(36) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `alternate_number1` varchar(15) DEFAULT NULL,
  `alternate_number2` varchar(15) DEFAULT NULL,
  `alternate_number3` varchar(15) DEFAULT NULL,
  `alternate_number4` varchar(15) DEFAULT NULL,
  `alternate_number5` varchar(15) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email_id` varchar(55) DEFAULT NULL,
  `othedata` mediumtext DEFAULT NULL,
  `crm_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_unique_id` char(36) DEFAULT NULL,
  `call_status` varchar(255) DEFAULT NULL,
  `call_attempts` varchar(40) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `contact_priority` int(5) DEFAULT NULL,
  `contact_score` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`contact_broadcast_uuid`),
  KEY `contact_unique_id` (`contact_unique_id`) USING BTREE,
  KEY `list_uuid` (`list_uuid`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `phone_number` (`phone_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13631 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_broadcasts_contacts1745563288`
--

DROP TABLE IF EXISTS `temp_broadcasts_contacts1745563288`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_broadcasts_contacts1745563288` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_broadcast_uuid` char(36) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `alternate_number1` varchar(15) DEFAULT NULL,
  `alternate_number2` varchar(15) DEFAULT NULL,
  `alternate_number3` varchar(15) DEFAULT NULL,
  `alternate_number4` varchar(15) DEFAULT NULL,
  `alternate_number5` varchar(15) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email_id` varchar(55) DEFAULT NULL,
  `othedata` mediumtext DEFAULT NULL,
  `crm_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_unique_id` char(36) DEFAULT NULL,
  `call_status` varchar(255) DEFAULT NULL,
  `call_attempts` varchar(40) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `contact_priority` int(5) DEFAULT NULL,
  `contact_score` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`contact_broadcast_uuid`),
  KEY `contact_unique_id` (`contact_unique_id`) USING BTREE,
  KEY `list_uuid` (`list_uuid`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `phone_number` (`phone_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13631 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_chatbox_report`
--

DROP TABLE IF EXISTS `tmp_chatbox_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_chatbox_report` (
  `tmp_report_id` char(36) NOT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `avg_chat_time` varchar(20) DEFAULT NULL,
  `avg_response_time` varchar(20) DEFAULT NULL,
  `chat_accepted` int(5) DEFAULT NULL,
  `max_chat_time` varchar(20) DEFAULT NULL,
  `total_assign` int(5) DEFAULT NULL,
  `total_chat_time` varchar(20) DEFAULT NULL,
  `waiting` varchar(20) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`tmp_report_id`),
  KEY `user_uuid` (`user_uuid`) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trigger_action_types`
--

DROP TABLE IF EXISTS `trigger_action_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_action_types` (
  `action_name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trigger_condition_name_types`
--

DROP TABLE IF EXISTS `trigger_condition_name_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_condition_name_types` (
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_name` varchar(45) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trigger_condition_types`
--

DROP TABLE IF EXISTS `trigger_condition_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_condition_types` (
  `id` varchar(35) NOT NULL,
  `condition` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `label` varchar(45) DEFAULT NULL,
  `display_for` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trigger_types`
--

DROP TABLE IF EXISTS `trigger_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_types` (
  `id` varchar(45) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `triggers`
--

DROP TABLE IF EXISTS `triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triggers` (
  `id` varchar(45) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `fire_only_once_per_visitor` tinyint(1) DEFAULT NULL,
  `check_condition` varchar(45) DEFAULT 'all',
  `website_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `trigger_type_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_triggers_websites1_idx` (`website_id`),
  KEY `fk_triggers_trigger_types1_idx` (`trigger_type_id`),
  CONSTRAINT `fk_triggers_trigger_types1` FOREIGN KEY (`trigger_type_id`) REFERENCES `trigger_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_triggers_websites1` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tts_config`
--

DROP TABLE IF EXISTS `tts_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tts_config` (
  `tts_config_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) NOT NULL,
  `engine` varchar(50) NOT NULL,
  `app_name` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `language` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `format` enum('wav','mp3') DEFAULT 'wav',
  `voice_type` varchar(50) DEFAULT NULL,
  `channel` enum('mono','stereo') DEFAULT 'mono',
  `text` text DEFAULT NULL,
  `audio_file` varchar(255) DEFAULT NULL,
  `recording_uuid` char(36) DEFAULT NULL,
  `speech_rate` char(36) DEFAULT '1.0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_default` enum('y','n') DEFAULT NULL,
  PRIMARY KEY (`tts_config_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tts_country`
--

DROP TABLE IF EXISTS `tts_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tts_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) NOT NULL,
  `country` varchar(100) NOT NULL,
  `enabled` enum('y','n') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_code` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tts_language`
--

DROP TABLE IF EXISTS `tts_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tts_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_code` varchar(6) NOT NULL,
  `language` varchar(100) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_code` (`language_code`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tts_voicedetails`
--

DROP TABLE IF EXISTS `tts_voicedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tts_voicedetails` (
  `tts_voice_uuid` varchar(36) DEFAULT NULL,
  `app_uuid` varchar(36) DEFAULT NULL,
  `app` varchar(36) DEFAULT NULL,
  `domain_uuid` varchar(36) DEFAULT NULL,
  `voice_name` varchar(36) DEFAULT NULL,
  `gender` varchar(36) DEFAULT NULL,
  `language` varchar(36) DEFAULT NULL,
  `country` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_mapping_api`
--

DROP TABLE IF EXISTS `user_mapping_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_mapping_api` (
  `mapping_uuid` varchar(32) NOT NULL,
  `secret_token` longtext NOT NULL,
  `user_uuid` char(36) NOT NULL,
  `username` varchar(32) NOT NULL,
  `map_username` varchar(100) NOT NULL,
  `map_userdata` longtext DEFAULT NULL,
  `domain_uuid` char(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `app_uuid` char(36) DEFAULT NULL,
  `hexcode` varchar(36) DEFAULT NULL,
  `crm_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mapping_uuid`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `user_uuid` (`user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `device_type` varchar(45) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(45) DEFAULT NULL,
  `company_information_id` int(10) unsigned DEFAULT NULL,
  `website_id` int(10) unsigned DEFAULT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_login_time` timestamp NULL DEFAULT NULL,
  `role_id` varchar(45) DEFAULT NULL,
  `visibility` varchar(45) DEFAULT NULL,
  `player_id` varchar(255) DEFAULT NULL,
  `max_chat_allow` tinyint(2) DEFAULT 1,
  `access_token` varchar(100) DEFAULT NULL,
  `device_token` varchar(100) DEFAULT NULL,
  `timezone` varchar(100) DEFAULT 'Asia/Kolkata',
  PRIMARY KEY (`id`),
  KEY `fk_users_company_informations1_idx` (`company_information_id`),
  KEY `fk_users_websites1_idx` (`website_id`),
  KEY `fk_users_departments1_idx` (`department_id`),
  KEY `fk_users_roles1_idx` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_has_departments`
--

DROP TABLE IF EXISTS `users_has_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_has_departments` (
  `user_id` int(10) unsigned NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`department_id`),
  KEY `fk_users_has_departments_departments1_idx` (`department_id`),
  KEY `fk_users_has_departments_users1_idx` (`user_id`),
  CONSTRAINT `fk_users_has_departments_departments1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_departments_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_has_websites`
--

DROP TABLE IF EXISTS `users_has_websites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_has_websites` (
  `user_id` int(10) unsigned NOT NULL,
  `website_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`website_id`),
  KEY `fk_users_has_websites_websites1_idx` (`website_id`),
  KEY `fk_users_has_websites_users1_idx` (`user_id`),
  CONSTRAINT `fk_users_has_websites_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_websites_websites1` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_OSSR_detail`
--

DROP TABLE IF EXISTS `v_OSSR_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_OSSR_detail` (
  `OSSR_detail_uuid` char(36) DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `phone_number` text DEFAULT NULL,
  `transection_id` text DEFAULT NULL,
  `payment_mode` text DEFAULT NULL,
  `payment_method` text DEFAULT NULL,
  `payment_date` text DEFAULT NULL,
  `field_date` text DEFAULT NULL,
  `OSSR_note` text DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_abandoned_call_mapping`
--

DROP TABLE IF EXISTS `v_abandoned_call_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_abandoned_call_mapping` (
  `call_mapping_uuid` char(36) NOT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `abandoned_call_center_queue_uuid` char(36) DEFAULT NULL,
  `type` varchar(25) NOT NULL,
  `status` varchar(8) DEFAULT NULL,
  `duplicate_check` varchar(15) DEFAULT NULL,
  `time_duration` int(4) DEFAULT NULL,
  `disposition` text DEFAULT NULL,
  `listname_uuid` char(36) DEFAULT NULL,
  `abandoned_listname_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `consider_failed_call_based_on` varchar(4) DEFAULT NULL,
  `avoid_call_connected_before_attempt` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`call_mapping_uuid`),
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`),
  KEY `abandoned_call_center_queue_uuid` (`abandoned_call_center_queue_uuid`),
  KEY `status` (`status`),
  KEY `deleted_at` (`deleted_at`),
  KEY `duplicate_check` (`duplicate_check`),
  KEY `time_duration` (`time_duration`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_access_control_nodes`
--

DROP TABLE IF EXISTS `v_access_control_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_access_control_nodes` (
  `access_control_node_uuid` char(36) NOT NULL,
  `access_control_uuid` char(36) DEFAULT NULL,
  `node_type` text DEFAULT NULL,
  `node_cidr` text DEFAULT NULL,
  `node_domain` text DEFAULT NULL,
  `node_description` text DEFAULT NULL,
  PRIMARY KEY (`access_control_node_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_access_controls`
--

DROP TABLE IF EXISTS `v_access_controls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_access_controls` (
  `access_control_uuid` char(36) NOT NULL,
  `access_control_name` text DEFAULT NULL,
  `access_control_default` text DEFAULT NULL,
  `access_control_description` text DEFAULT NULL,
  PRIMARY KEY (`access_control_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_activity`
--

DROP TABLE IF EXISTS `v_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_activity` (
  `activity_uuid` varchar(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `event_for` varchar(100) DEFAULT NULL,
  `event_for_id` char(36) DEFAULT NULL,
  `event_for_name` char(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `data_diff` text DEFAULT NULL,
  `display_data` text DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`activity_uuid`),
  KEY `created_at` (`created_at`),
  KEY `event_for` (`event_for`(10)),
  KEY `action` (`action`(4)),
  KEY `event_for_id` (`event_for_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_agent_ratings`
--

DROP TABLE IF EXISTS `v_agent_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_agent_ratings` (
  `v_rating_id` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `agent_id` char(36) DEFAULT NULL,
  `reviewer_id` char(36) DEFAULT NULL,
  `ratings` int(10) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `evaluation_call_rating_uuid` char(36) NOT NULL,
  PRIMARY KEY (`v_rating_id`),
  KEY `agent_id` (`agent_id`) USING BTREE,
  KEY `call_id` (`call_id`) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `reviewer_id` (`reviewer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_agent_ratings_comments`
--

DROP TABLE IF EXISTS `v_agent_ratings_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_agent_ratings_comments` (
  `v_region_id` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `start` float DEFAULT NULL,
  `end` float DEFAULT NULL,
  `note` text DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  `evaluation_call_rating_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`v_region_id`),
  KEY `call_id` (`call_id`) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_agent_state`
--

DROP TABLE IF EXISTS `v_agent_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_agent_state` (
  `agent_state_uuid` char(36) NOT NULL,
  `agent_uuid` char(36) DEFAULT NULL,
  `login_history_id` char(36) DEFAULT NULL,
  `state_name` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `end_time` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`agent_state_uuid`),
  KEY `created_at` (`created_at`),
  KEY `call_uuid` (`call_uuid`),
  KEY `state_name` (`state_name`(10)),
  KEY `created_at_agent_uuid` (`created_at`,`agent_uuid`),
  KEY `agent_uuid` (`agent_uuid`) USING BTREE,
  KEY `login_history_id` (`login_history_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_agent_state_live_apr`
--

DROP TABLE IF EXISTS `v_agent_state_live_apr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_agent_state_live_apr` (
  `agent_state_uuid` char(36) NOT NULL,
  `agent_uuid` char(36) DEFAULT NULL,
  `login_history_id` char(36) DEFAULT NULL,
  `state_name` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `end_time` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`agent_state_uuid`),
  KEY `agent_uuid` (`agent_uuid`) USING BTREE,
  KEY `login_history_id` (`login_history_id`) USING BTREE,
  KEY `created_at` (`created_at`),
  KEY `state_name` (`state_name`(10)),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_alarm_send_log`
--

DROP TABLE IF EXISTS `v_alarm_send_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_alarm_send_log` (
  `ssp_alaram_uuid` char(36) DEFAULT NULL COMMENT 'this is an foreign key for table v_health_alarm_log',
  `alarm_type` char(10) DEFAULT NULL COMMENT 'Email Or  API',
  `resposne` text DEFAULT NULL,
  `send_time` varchar(22) DEFAULT NULL,
  `alarm_raised_staus` varchar(10) DEFAULT NULL COMMENT 'Raised or Cleared',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_api_token`
--

DROP TABLE IF EXISTS `v_api_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_api_token` (
  `api_uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `domain_parent_uuid` char(36) DEFAULT NULL,
  `domain_parent_name` mediumtext DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`api_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_api_transfer_data_log`
--

DROP TABLE IF EXISTS `v_api_transfer_data_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_api_transfer_data_log` (
  `api_uuid` char(36) NOT NULL,
  `api_url` text DEFAULT NULL,
  `api_type` text DEFAULT NULL,
  `api_data` text DEFAULT NULL,
  `api_date` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `action` varchar(50) DEFAULT NULL,
  `data_log` text DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `api_response` mediumtext DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`api_uuid`),
  KEY `call_uuid` (`call_uuid`),
  KEY `api_date` (`api_date`),
  KEY `api_url` (`api_url`(768))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_apps`
--

DROP TABLE IF EXISTS `v_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_apps` (
  `app_uuid` char(36) NOT NULL,
  `app_category` text DEFAULT NULL,
  `app_version` text DEFAULT NULL,
  `app_enabled` text DEFAULT NULL,
  PRIMARY KEY (`app_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_astute_twocallpatch_callback`
--

DROP TABLE IF EXISTS `v_astute_twocallpatch_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_astute_twocallpatch_callback` (
  `call_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) NOT NULL,
  `caller_number` text NOT NULL,
  `callee_number` text NOT NULL,
  `callback_url_prefix` text NOT NULL,
  `callback_token` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_auto_dialed_statistics`
--

DROP TABLE IF EXISTS `v_auto_dialed_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_auto_dialed_statistics` (
  `auto_dialed_statistics_uuid` char(36) NOT NULL,
  `call_center_queue_uuid` char(36) NOT NULL,
  `origination_uuid` char(36) NOT NULL,
  `waiting_agents` int(11) NOT NULL,
  `answered_calls` int(11) NOT NULL,
  `abandoned_calls` int(11) NOT NULL,
  `avg_abandoned_rate` decimal(10,4) NOT NULL,
  `total_calls` int(11) NOT NULL,
  `calls_in_queue` int(11) NOT NULL,
  `fail_calls` int(11) NOT NULL,
  `ringing_calls` int(11) NOT NULL,
  `active_calls` int(11) NOT NULL,
  `max_drop_call_percentage` decimal(10,4) NOT NULL,
  `blast_limit` int(11) NOT NULL,
  `call_generated` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `auto_call_off_agents` int(11) NOT NULL,
  `on_break_agents` int(11) NOT NULL,
  `on_ringing_agents` int(11) NOT NULL,
  `on_call_agents` int(11) NOT NULL,
  `on_wrapup_agents` int(11) NOT NULL,
  `available_agents` int(11) NOT NULL,
  `pacing_ratio` int(11) NOT NULL,
  PRIMARY KEY (`auto_dialed_statistics_uuid`),
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`),
  KEY `origination_uuid` (`origination_uuid`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_backup_details`
--

DROP TABLE IF EXISTS `v_backup_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_backup_details` (
  `domain_uuid` char(36) DEFAULT NULL,
  `backup_uuid` char(36) NOT NULL,
  `backup_name` text DEFAULT NULL,
  `backup_file_type` text DEFAULT NULL,
  `backup_destination` text DEFAULT NULL,
  `backup_source` text DEFAULT NULL,
  `download_flag` int(10) DEFAULT NULL,
  PRIMARY KEY (`backup_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_backup_history`
--

DROP TABLE IF EXISTS `v_backup_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_backup_history` (
  `backup_report_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `backup_uuid` char(36) DEFAULT NULL,
  `backup_filename` text DEFAULT NULL,
  `backup_file_type` text DEFAULT NULL,
  `backup_destination` text DEFAULT NULL,
  `backup_source` text DEFAULT NULL,
  `start_stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`backup_report_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_backup_scheduler`
--

DROP TABLE IF EXISTS `v_backup_scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_backup_scheduler` (
  `scheduler_details_uuid` char(36) NOT NULL,
  `scheduler_uuid` char(36) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `week_days` varchar(40) DEFAULT NULL,
  `month` varchar(40) DEFAULT NULL,
  `dates` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`scheduler_details_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_batch_recording`
--

DROP TABLE IF EXISTS `v_batch_recording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_batch_recording` (
  `batch_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `batch_name` mediumtext DEFAULT NULL,
  `batch_list` mediumtext DEFAULT NULL,
  `batch_url` mediumtext DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `country_code` char(36) DEFAULT 'XX',
  `lang_code` char(36) DEFAULT 'en-XX'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_branchidwise_queue_mapping`
--

DROP TABLE IF EXISTS `v_branchidwise_queue_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_branchidwise_queue_mapping` (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `branch_id` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `queue_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_break`
--

DROP TABLE IF EXISTS `v_break`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_break` (
  `break_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `domain_parent_uuid` char(36) DEFAULT NULL,
  `break_name` varchar(255) DEFAULT NULL,
  `break_status` varchar(255) DEFAULT NULL,
  `break_type` varchar(255) DEFAULT NULL,
  `digit` text DEFAULT NULL,
  `break_tts` text DEFAULT NULL,
  `break_threshold_time` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `break_desc` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `company_information_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`break_uuid`),
  KEY `break_name` (`break_name`(191)) USING BTREE,
  KEY `break_status` (`break_status`(191)) USING BTREE,
  KEY `break_type` (`break_type`(191)) USING BTREE,
  KEY `domain_parent_uuid` (`domain_parent_uuid`) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_broadcast_caller_id_config`
--

DROP TABLE IF EXISTS `v_broadcast_caller_id_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_broadcast_caller_id_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_broadcast_gateway_uuid` char(36) DEFAULT NULL,
  `caller_id_position` int(11) NOT NULL,
  `caller_id_count` int(11) NOT NULL,
  `caller_id_period_hours` int(11) NOT NULL,
  `caller_id_strategy` varchar(50) DEFAULT NULL,
  `number_prefix` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`config_id`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=648 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_broadcast_caller_id_number`
--

DROP TABLE IF EXISTS `v_broadcast_caller_id_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_broadcast_caller_id_number` (
  `cin_id` int(11) NOT NULL AUTO_INCREMENT,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_broadcast_gateway_uuid` char(36) DEFAULT NULL,
  `number` char(25) DEFAULT NULL,
  PRIMARY KEY (`cin_id`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=628 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_broadcast_contact_more_detail`
--

DROP TABLE IF EXISTS `v_broadcast_contact_more_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_broadcast_contact_more_detail` (
  `contact_broadcast_uuid` char(36) NOT NULL,
  `agent_uuid` char(36) DEFAULT NULL,
  `product` varchar(20) DEFAULT NULL,
  `lead_type` varchar(10) DEFAULT NULL,
  `status` char(36) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `amount` char(15) DEFAULT NULL,
  `lead_id` char(36) DEFAULT NULL,
  `pincode` char(10) DEFAULT NULL,
  PRIMARY KEY (`contact_broadcast_uuid`),
  KEY `agent-uuid` (`agent_uuid`),
  KEY `product` (`product`),
  KEY `lead_type` (`lead_type`),
  KEY `status` (`status`),
  KEY `amount` (`amount`),
  KEY `lead_id` (`lead_id`),
  KEY `pincode` (`pincode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_broadcast_contact_numbers`
--

DROP TABLE IF EXISTS `v_broadcast_contact_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_broadcast_contact_numbers` (
  `broadcast_contact_numbers_uuid` char(36) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `number_order` int(2) NOT NULL,
  `call_broadcast_uuid` char(36) NOT NULL,
  `call_center_queue_uuid` char(36) NOT NULL,
  `contact_broadcast_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`broadcast_contact_numbers_uuid`),
  KEY `phone_number` (`phone_number`),
  KEY `number_order` (`number_order`),
  KEY `contact_broadcast_uuid` (`contact_broadcast_uuid`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`),
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `created_at` (`created_at`),
  KEY `updated_at` (`updated_at`),
  KEY `deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_broadcasts_contacts`
--

DROP TABLE IF EXISTS `v_broadcasts_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_broadcasts_contacts` (
  `contact_broadcast_uuid` char(36) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `alternate_number1` varchar(15) DEFAULT NULL,
  `alternate_number2` varchar(15) DEFAULT NULL,
  `alternate_number3` varchar(15) DEFAULT NULL,
  `alternate_number4` varchar(15) DEFAULT NULL,
  `alternate_number5` varchar(15) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email_id` varchar(55) DEFAULT NULL,
  `crm_uuid` char(36) DEFAULT NULL,
  `othedata` text DEFAULT NULL,
  `input_opt` varchar(5) DEFAULT NULL,
  `cdr_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `call_status` varchar(255) DEFAULT NULL,
  `call_attempts` varchar(40) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `start_stamp` varchar(50) DEFAULT NULL,
  `duration` varchar(25) DEFAULT NULL,
  `next_retry_time` varchar(25) DEFAULT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `parent_contact_broadcast_uuid` char(36) DEFAULT NULL,
  `parent_call_uuid` char(36) DEFAULT NULL,
  `policy_date` mediumtext DEFAULT NULL,
  `policy_current_date` mediumtext DEFAULT NULL,
  `policy_number` mediumtext DEFAULT NULL,
  `policy_recording_name` mediumtext DEFAULT NULL,
  `policy_model` mediumtext DEFAULT NULL,
  `ivr` mediumtext DEFAULT NULL,
  `currentdate` mediumtext DEFAULT NULL,
  `flag_type` mediumtext DEFAULT NULL,
  `dup_check` mediumtext DEFAULT NULL,
  `disposition` mediumtext DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `contact_priority` int(5) DEFAULT NULL,
  `callback_contact_uuid` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `delete_comment` mediumtext DEFAULT NULL,
  `contact_unique_id` varchar(1024) DEFAULT NULL,
  `total_call_attempts` int(10) NOT NULL DEFAULT 0,
  `contact_score` int(5) DEFAULT 0,
  `todays_attempt_completed` date DEFAULT NULL,
  `attempt_completed` enum('yes','no') DEFAULT NULL,
  `last_reseted_at` timestamp NULL DEFAULT NULL,
  `is_hot_lead` varchar(3) DEFAULT NULL,
  `max_attempts` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`contact_broadcast_uuid`),
  KEY `parent_call_uuid` (`parent_call_uuid`),
  KEY `created_on` (`created_on`),
  KEY `contact_unique_id` (`contact_unique_id`(768)),
  KEY `list_uuid_deleted_at` (`list_uuid`,`deleted_at`),
  KEY `alternate_number1` (`alternate_number1`) USING BTREE,
  KEY `callback_contact_uuid` (`callback_contact_uuid`) USING BTREE,
  KEY `call_attempts` (`call_attempts`) USING BTREE,
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`) USING BTREE,
  KEY `call_status` (`call_status`(191)) USING BTREE,
  KEY `cdr_uuid` (`cdr_uuid`) USING BTREE,
  KEY `first_name` (`first_name`) USING BTREE,
  KEY `last_name` (`last_name`) USING BTREE,
  KEY `list_uuid` (`list_uuid`) USING BTREE,
  KEY `next_retry_time` (`next_retry_time`) USING BTREE,
  KEY `phone_number` (`phone_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_broadcasts_contacts_auto_blast`
--

DROP TABLE IF EXISTS `v_broadcasts_contacts_auto_blast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_broadcasts_contacts_auto_blast` (
  `contact_broadcast_uuid` char(36) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `alternate_number1` varchar(15) DEFAULT NULL,
  `alternate_number2` varchar(15) DEFAULT NULL,
  `alternate_number3` varchar(15) DEFAULT NULL,
  `alternate_number4` varchar(15) DEFAULT NULL,
  `alternate_number5` varchar(15) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email_id` varchar(55) DEFAULT NULL,
  `crm_uuid` char(36) DEFAULT NULL,
  `othedata` text DEFAULT NULL,
  `input_opt` varchar(5) DEFAULT NULL,
  `cdr_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `call_status` varchar(255) DEFAULT NULL,
  `call_attempts` varchar(40) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `start_stamp` varchar(50) DEFAULT NULL,
  `duration` varchar(25) DEFAULT NULL,
  `next_retry_time` varchar(25) DEFAULT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `parent_contact_broadcast_uuid` char(36) DEFAULT NULL,
  `parent_call_uuid` char(36) DEFAULT NULL,
  `ivr` text DEFAULT NULL,
  `currentdate` text DEFAULT NULL,
  `flag_type` text DEFAULT NULL,
  `dup_check` text DEFAULT NULL,
  `disposition` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `contact_priority` int(5) DEFAULT NULL,
  `callback_contact_uuid` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `delete_comment` text DEFAULT NULL,
  `contact_unique_id` text DEFAULT NULL,
  `last_reseted_at` timestamp NULL DEFAULT NULL,
  `total_call_attempts` int(10) NOT NULL DEFAULT 0,
  `contact_score` int(5) NOT NULL DEFAULT 0,
  `todays_attempt_completed` date DEFAULT NULL,
  `attempt_completed` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`contact_broadcast_uuid`),
  KEY `alternate_number1` (`alternate_number1`) USING BTREE,
  KEY `callback_contact_uuid` (`callback_contact_uuid`) USING BTREE,
  KEY `call_attempts` (`call_attempts`) USING BTREE,
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`) USING BTREE,
  KEY `cdr_uuid` (`cdr_uuid`) USING BTREE,
  KEY `first_name` (`first_name`) USING BTREE,
  KEY `last_name` (`last_name`) USING BTREE,
  KEY `list_uuid` (`list_uuid`) USING BTREE,
  KEY `next_retry_time` (`next_retry_time`) USING BTREE,
  KEY `phone_number` (`phone_number`) USING BTREE,
  KEY `parent_call_uuid` (`parent_call_uuid`),
  KEY `created_on` (`created_on`),
  KEY `call_status` (`call_status`(191)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_broadcasts_contacts_detail`
--

DROP TABLE IF EXISTS `v_broadcasts_contacts_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_broadcasts_contacts_detail` (
  `contact_broadcast_uuid` char(36) NOT NULL,
  `cdr_uuid` char(36) DEFAULT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `call_status` varchar(255) DEFAULT NULL,
  `call_attempts` varchar(40) DEFAULT NULL,
  `start_stamp` varchar(50) DEFAULT NULL,
  `duration` varchar(25) DEFAULT NULL,
  `next_retry_time` varchar(25) DEFAULT NULL,
  `disposition` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `total_call_attempts` int(11) NOT NULL DEFAULT 0,
  `callback_contact_uuid` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  KEY `list_uuid` (`list_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_broadcasts_contacts_history`
--

DROP TABLE IF EXISTS `v_broadcasts_contacts_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_broadcasts_contacts_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `call_uuid` varchar(50) DEFAULT NULL,
  `dialed_user` varchar(50) DEFAULT NULL,
  `contact_broadcast_uuid` varchar(50) DEFAULT NULL,
  `call_broadcast_uuid` varchar(50) DEFAULT NULL,
  `call_center_queue_uuid` varchar(50) DEFAULT NULL,
  `dialed_domain` varchar(50) DEFAULT NULL,
  `hangup_cause` varchar(50) DEFAULT NULL,
  `hangup_cause_q850` varchar(50) DEFAULT NULL,
  `start_stamp` timestamp NULL DEFAULT NULL,
  `end_stamp` timestamp NULL DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_bulkrecording_task`
--

DROP TABLE IF EXISTS `v_bulkrecording_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_bulkrecording_task` (
  `bulkrecording_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `originator_name` varchar(255) DEFAULT NULL,
  `task_status` text DEFAULT NULL,
  `queue_parameter` text DEFAULT NULL,
  `domain_uuid_list` text DEFAULT NULL,
  `start_date` text DEFAULT NULL,
  `end_date` text DEFAULT NULL,
  `agent_name` text DEFAULT NULL,
  `agent_number` text DEFAULT NULL,
  `direction` text DEFAULT NULL,
  `duration_from` text DEFAULT NULL,
  `duration_to` text DEFAULT NULL,
  `customer_number` text DEFAULT NULL,
  `disposition` text DEFAULT NULL,
  `call_uuid` text DEFAULT NULL,
  `zipfile_link` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`bulkrecording_uuid`),
  KEY `agent_name` (`agent_name`(22)) USING BTREE,
  KEY `agent_number` (`agent_number`(10)) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `domain_uuid_list` (`domain_uuid_list`(36)) USING BTREE,
  KEY `end_date` (`end_date`(22)) USING BTREE,
  KEY `start_date` (`start_date`(22)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_bulkrecording_task_ucp`
--

DROP TABLE IF EXISTS `v_bulkrecording_task_ucp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_bulkrecording_task_ucp` (
  `bulkrecording_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `originator_name` varchar(255) DEFAULT NULL,
  `task_status` text DEFAULT NULL,
  `domain_uuid_list` text DEFAULT NULL,
  `start_date` text DEFAULT NULL,
  `end_date` text DEFAULT NULL,
  `direction` text DEFAULT NULL,
  `duration_from` text DEFAULT NULL,
  `duration_to` text DEFAULT NULL,
  `agent_number` text DEFAULT NULL,
  `customer_number` text DEFAULT NULL,
  `zipfile_link` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`bulkrecording_uuid`),
  KEY `agent_number` (`agent_number`(10)) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `domain_uuid_list` (`domain_uuid_list`(36)) USING BTREE,
  KEY `end_date` (`end_date`(22)) USING BTREE,
  KEY `start_date` (`start_date`(22)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_api`
--

DROP TABLE IF EXISTS `v_call_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_api` (
  `call_api_uuid` char(36) NOT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `api_uuid` char(36) DEFAULT NULL,
  `call_event_name` text DEFAULT NULL,
  `disposition_uuid` text DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `callby` text DEFAULT NULL,
  PRIMARY KEY (`call_api_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_automation`
--

DROP TABLE IF EXISTS `v_call_automation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_automation` (
  `uuid` char(36) NOT NULL,
  `domain_uuid` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `call_broadcast_uuid` text DEFAULT NULL,
  `call_center_queue_uuid` text DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `call_event_name` varchar(100) NOT NULL,
  `api_uuid` char(36) DEFAULT NULL,
  `disposition_uuids` text DEFAULT NULL,
  `other_data` text DEFAULT NULL,
  `allow_skiping_execution` varchar(25) DEFAULT NULL,
  `ivr_uuid` char(36) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `callby` text DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `call_event_name` (`call_event_name`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`(100)),
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_automation_campaigns`
--

DROP TABLE IF EXISTS `v_call_automation_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_automation_campaigns` (
  `uuid` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `call_broadcast_uuid` text NOT NULL,
  `call_center_queue_uuid` text DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `call_event_name` varchar(100) NOT NULL,
  `api_uuid` char(36) DEFAULT NULL,
  `disposition_uuids` text DEFAULT NULL,
  `other_data` text DEFAULT NULL,
  `allow_skiping_execution` varchar(25) DEFAULT NULL,
  `ivr_uuid` char(36) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_automation_event`
--

DROP TABLE IF EXISTS `v_call_automation_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_automation_event` (
  `event_uuid` char(36) NOT NULL,
  `event_name` text DEFAULT NULL,
  `event_filters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_block`
--

DROP TABLE IF EXISTS `v_call_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_block` (
  `call_block_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `call_block_name` text DEFAULT NULL,
  `call_block_number` text DEFAULT NULL,
  `call_block_count` decimal(10,0) DEFAULT NULL,
  `call_block_action` text DEFAULT NULL,
  `date_added` text DEFAULT NULL,
  `call_block_enabled` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `expire_at` int(18) DEFAULT NULL,
  PRIMARY KEY (`call_block_uuid`),
  KEY `call_block_number` (`call_block_number`(15)),
  KEY `deleted_at` (`deleted_at`),
  KEY `call_block_enabled` (`call_block_enabled`(5)),
  KEY `domain_uuid` (`domain_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_broadcasts`
--

DROP TABLE IF EXISTS `v_call_broadcasts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_broadcasts` (
  `call_broadcast_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `teamlead_uuid` char(36) DEFAULT NULL,
  `broadcast_name` text DEFAULT NULL,
  `customer_name` text DEFAULT NULL,
  `broadcast_description` text DEFAULT NULL,
  `broadcast_timeout` decimal(10,0) DEFAULT NULL,
  `broadcast_concurrent_limit` decimal(10,0) DEFAULT NULL,
  `wrapup_time` text DEFAULT NULL,
  `recording_uuid` char(36) DEFAULT NULL,
  `broadcast_caller_id_name` text DEFAULT NULL,
  `broadcast_caller_id_number` text DEFAULT NULL,
  `broadcast_destination_type` text DEFAULT NULL,
  `broadcast_phone_numbers` text DEFAULT NULL,
  `broadcast_avmd` text DEFAULT NULL,
  `broadcast_destination_data` text DEFAULT NULL,
  `broadcast_destination_description` text DEFAULT NULL,
  `broadcast_accountcode` text DEFAULT NULL,
  `broadcast_no_attempts` int(11) DEFAULT NULL,
  `call_block_1_data` text DEFAULT NULL,
  `broadcast_type` text DEFAULT NULL,
  `pacing_ratio` double DEFAULT NULL,
  `broadcast_reattempt_type` text DEFAULT NULL,
  `broadcast_call_retry_interval` text DEFAULT NULL,
  `webform_url` text DEFAULT NULL,
  `crm_history_url` text DEFAULT NULL,
  `webform_url_target` varchar(20) DEFAULT NULL,
  `in_call_recording_file` text DEFAULT NULL,
  `get_call_launch` varchar(5) DEFAULT NULL,
  `play_estimated_hold_time` varchar(5) DEFAULT NULL,
  `number_masking` varchar(5) DEFAULT NULL,
  `transfercall` varchar(50) DEFAULT NULL,
  `dnc_campaign` varchar(50) DEFAULT NULL,
  `dnc_system` varchar(50) DEFAULT NULL,
  `prefix` varchar(20) DEFAULT NULL,
  `gateway_uuid` text DEFAULT NULL,
  `call_threshold_check` int(11) DEFAULT NULL,
  `allowed_call_recording` varchar(60) DEFAULT NULL,
  `queue_full_strategy` varchar(255) DEFAULT NULL,
  `queue_full_strategy_value` varchar(255) DEFAULT NULL,
  `mail_config_uuid` char(36) DEFAULT NULL,
  `msg_config_uuid` char(36) DEFAULT NULL,
  `priority` int(5) DEFAULT NULL,
  `broadcast_record_template` text DEFAULT NULL,
  `off_hour_treatment` varchar(100) DEFAULT NULL,
  `campaign_incoming` varchar(10) DEFAULT NULL,
  `sticky_agent` varchar(191) DEFAULT 'no',
  `allow_setting_callback` varchar(10) DEFAULT NULL,
  `define_incoming_time` varchar(10) DEFAULT NULL,
  `offhour_recording_file` text DEFAULT NULL,
  `campaign_timezone` varchar(100) DEFAULT NULL,
  `customer_feedback_call` varchar(10) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` text DEFAULT NULL,
  `chk_amd` enum('yes','no') DEFAULT NULL,
  `region_uuid` char(36) DEFAULT NULL,
  `thirdparty_crm` varchar(5) DEFAULT NULL,
  `broadcast_no_attempts_lead` int(11) DEFAULT NULL,
  `number_validation` varchar(15) DEFAULT NULL,
  `social_api_config_uuid` varchar(100) DEFAULT NULL,
  `abandon_threshold` int(11) DEFAULT NULL,
  `auto_answer` varchar(10) DEFAULT NULL,
  `knowledgebase_url` text DEFAULT NULL,
  `auto_call_retry_interval` text DEFAULT NULL,
  `delay_play_estimated_hold_time` int(4) DEFAULT 0,
  `answer_sla_threshold` int(11) DEFAULT NULL,
  `callback_time_frame` varchar(20) DEFAULT NULL,
  `callback_expire_period` varchar(20) DEFAULT NULL,
  `callback_default_time` varchar(20) DEFAULT NULL,
  `auto_churn_list` varchar(50) DEFAULT 'no',
  `maximum_channel_utilization_limit` int(10) DEFAULT 0,
  `recording_encrypt` enum('yes','no') DEFAULT 'no',
  `sla_formula` varchar(36) DEFAULT NULL,
  `follow_default_setting` varchar(5) DEFAULT 'true',
  `is_paused` int(11) DEFAULT 0,
  `call_dialing_listwise` varchar(5) DEFAULT NULL,
  `is_disposition_mandatory` char(36) DEFAULT '0',
  `dialing_type` varchar(15) DEFAULT NULL,
  `re_attempt_on_same_number` enum('yes','no') DEFAULT NULL,
  `max_drop_call_percentage` decimal(4,2) DEFAULT 0.00,
  `chk_crm_validations` varchar(5) DEFAULT NULL,
  `list_strategy` varchar(255) DEFAULT NULL,
  `allowed_call_screen_recording` char(15) DEFAULT NULL,
  `default_recording_stop` varchar(5) DEFAULT NULL,
  `list_type` varchar(20) DEFAULT NULL,
  `preview_timeout` int(10) DEFAULT NULL,
  `per_day_attempts` text DEFAULT NULL,
  `recording_retention_period` int(10) DEFAULT NULL,
  `cc_dispose_call` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `lang_code` text DEFAULT NULL,
  `inbound_only` varchar(10) DEFAULT NULL,
  `prefered_agent` enum('yes','no') DEFAULT NULL,
  `sticky_period` int(3) DEFAULT NULL,
  `post_sticky_action` char(15) DEFAULT NULL,
  `split_recording` enum('no','offhours') DEFAULT NULL,
  `get_contact_unique_id_url` varchar(255) DEFAULT NULL,
  `manual_call_restriction` varchar(20) DEFAULT NULL,
  `callback_starttime` time DEFAULT '00:00:00',
  `callback_endtime` time DEFAULT '23:59:59',
  `allow_redial` varchar(5) DEFAULT NULL,
  `dnc_check` varchar(20) DEFAULT NULL,
  `omit_call_recording` varchar(10) DEFAULT NULL,
  `callback_expire_period_value` varchar(10) DEFAULT NULL,
  `remark_character_length` int(11) DEFAULT NULL,
  `dnc_check_country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`call_broadcast_uuid`),
  KEY `broadcast_type` (`broadcast_type`(15)) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `gateway_uuid` (`gateway_uuid`(55)) USING BTREE,
  KEY `mail_config_uuid` (`mail_config_uuid`) USING BTREE,
  KEY `msg_config_uuid` (`msg_config_uuid`) USING BTREE,
  KEY `number_masking` (`number_masking`) USING BTREE,
  KEY `recording_uuid` (`recording_uuid`) USING BTREE,
  KEY `teamlead_uuid` (`teamlead_uuid`) USING BTREE,
  KEY `wrapup_time` (`wrapup_time`(10)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_cdr_dtl`
--

DROP TABLE IF EXISTS `v_call_cdr_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_cdr_dtl` (
  `call_cdr_uuid` char(36) NOT NULL,
  `call_uuid` char(36) NOT NULL,
  `customer_call_setup_time` int(5) DEFAULT NULL,
  `customer_call_ringing_time` int(5) DEFAULT NULL,
  `attempt_number` int(50) DEFAULT NULL,
  `customer_talk_time` int(5) DEFAULT NULL,
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_center_agents`
--

DROP TABLE IF EXISTS `v_call_center_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_center_agents` (
  `call_center_agent_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `agent_name` text DEFAULT NULL,
  `agent_type` text DEFAULT NULL,
  `agent_call_timeout` decimal(10,0) DEFAULT NULL,
  `agent_id` text DEFAULT NULL,
  `agent_password` text DEFAULT NULL,
  `agent_contact` text DEFAULT NULL,
  `agent_status` text DEFAULT NULL,
  `agent_logout` text DEFAULT NULL,
  `agent_max_no_answer` decimal(10,0) DEFAULT NULL,
  `agent_wrap_up_time` decimal(10,0) DEFAULT NULL,
  `agent_reject_delay_time` decimal(10,0) DEFAULT NULL,
  `agent_busy_delay_time` decimal(10,0) DEFAULT NULL,
  `agent_no_answer_delay_time` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_at1` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`call_center_agent_uuid`),
  KEY `agent_id` (`agent_id`(36)) USING BTREE,
  KEY `agent_name` (`agent_name`(22)) USING BTREE,
  KEY `agent_status` (`agent_status`(22)) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_center_queues`
--

DROP TABLE IF EXISTS `v_call_center_queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_center_queues` (
  `call_center_queue_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `dialplan_uuid` char(36) DEFAULT NULL,
  `teamlead_uuid` char(36) DEFAULT NULL,
  `queue_name` text DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `queue_extension` text DEFAULT NULL,
  `queue_strategy` text DEFAULT NULL,
  `queue_moh_sound` text DEFAULT NULL,
  `welcome_greetings` text DEFAULT NULL,
  `hold_music` text DEFAULT NULL,
  `queue_record_template` text DEFAULT NULL,
  `timeout_action` text DEFAULT NULL,
  `queue_time_base_score` text DEFAULT NULL,
  `queue_max_wait_time` decimal(10,0) DEFAULT NULL,
  `queue_max_wait_time_with_no_agent` decimal(10,0) DEFAULT NULL,
  `queue_max_wait_time_with_no_agent_time_reached` decimal(10,0) DEFAULT NULL,
  `queue_tier_rules_apply` text DEFAULT NULL,
  `queue_tier_rule_wait_second` decimal(10,0) DEFAULT NULL,
  `queue_tier_rule_no_agent_no_wait` text DEFAULT NULL,
  `queue_timeout_action` text DEFAULT NULL,
  `queue_discard_abandoned_after` decimal(10,0) DEFAULT NULL,
  `queue_abandoned_resume_allowed` text DEFAULT NULL,
  `queue_tier_rule_wait_multiply_level` text DEFAULT NULL,
  `queue_cid_prefix` text DEFAULT NULL,
  `queue_announce_sound` text DEFAULT NULL,
  `queue_announce_frequency` decimal(10,0) DEFAULT NULL,
  `queue_description` text DEFAULT NULL,
  `call_center_lang_code` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `vm_timeout_action` text DEFAULT NULL,
  `no_agent_action` text DEFAULT NULL,
  `queue_vm_uuid` char(36) DEFAULT NULL,
  `ldap_search_query` text DEFAULT NULL,
  `agentside_music` text DEFAULT NULL,
  `call_connect_message` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`call_center_queue_uuid`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`) USING BTREE,
  KEY `dialplan_uuid` (`dialplan_uuid`) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `queue_name` (`queue_name`(30)) USING BTREE,
  KEY `teamlead_uuid` (`teamlead_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_center_tiers`
--

DROP TABLE IF EXISTS `v_call_center_tiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_center_tiers` (
  `call_center_tier_uuid` char(36) NOT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `agent_name` text DEFAULT NULL,
  `queue_name` text DEFAULT NULL,
  `tier_level` decimal(10,0) DEFAULT NULL,
  `tier_position` decimal(10,0) DEFAULT NULL,
  `auto_call_type` varchar(20) NOT NULL DEFAULT 'on',
  PRIMARY KEY (`call_center_tier_uuid`),
  KEY `agent_name` (`agent_name`(22)) USING BTREE,
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `queue_name` (`queue_name`(30)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_channel_utilization`
--

DROP TABLE IF EXISTS `v_call_channel_utilization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_channel_utilization` (
  `call_uuid` char(36) DEFAULT NULL,
  `start_stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `direction` varchar(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `gateway_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `queue_outbound_count` int(11) NOT NULL,
  `queue_inbound_count` int(11) NOT NULL,
  `campaign_outbound_count` int(11) NOT NULL,
  `campaign_inbound_count` int(11) NOT NULL,
  `gateway_campaign_outbound_count` int(11) NOT NULL,
  `gateway_campaign_inbound_count` int(11) NOT NULL,
  `domain_gateway_outbound_count` int(11) NOT NULL,
  `domain_gateway_inbound_count` int(11) NOT NULL,
  `gateway_outbound_count` int(11) NOT NULL,
  `gateway_inbound_count` int(11) NOT NULL,
  `domain_outbound_count` int(11) NOT NULL,
  `domain_inbound_count` int(11) NOT NULL,
  `system_gateway_outbound_count` int(11) NOT NULL,
  `system_gateway_inbound_count` int(11) NOT NULL,
  `system_outbound_count` int(11) NOT NULL,
  `system_inbound_count` int(11) NOT NULL,
  `campaign_channel_count` int(11) NOT NULL,
  `domain_gateway_channel_count` int(11) DEFAULT NULL,
  `campaign_gateway_channel_count` int(11) DEFAULT NULL,
  `gateway_channel_count` int(11) DEFAULT NULL,
  `domain_channel_count` int(11) NOT NULL,
  `system_channel_count` int(11) NOT NULL,
  `system_gateway_channel_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_channel_utilization_summary`
--

DROP TABLE IF EXISTS `v_call_channel_utilization_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_channel_utilization_summary` (
  `summary_uuid` char(36) NOT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `date` date NOT NULL,
  `concurrent_outbound_count` int(11) NOT NULL,
  `concurrent_inbound_count` int(11) NOT NULL,
  `concurrent_call_count` int(11) NOT NULL,
  `total_calls` int(11) NOT NULL,
  `total_outbound_calls` int(11) NOT NULL,
  `total_inbound_calls` int(11) NOT NULL,
  `level` varchar(20) NOT NULL,
  `report_type` varchar(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_concurrent`
--

DROP TABLE IF EXISTS `v_call_concurrent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_concurrent` (
  `call_concurrent_uuid` char(36) NOT NULL,
  `call_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) NOT NULL,
  `gateway_uuid` char(36) DEFAULT NULL,
  `start_stamp` text DEFAULT NULL,
  `end_stamp` text DEFAULT NULL,
  `concurrent_calls` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`call_concurrent_uuid`),
  KEY `call_uuid` (`call_uuid`),
  KEY `start_stamp` (`start_stamp`(22)),
  KEY `end_stamp` (`end_stamp`(22))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_d_xfer`
--

DROP TABLE IF EXISTS `v_call_d_xfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_d_xfer` (
  `call_dtl_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `source_number` text DEFAULT NULL,
  `destination_number` text DEFAULT NULL,
  `campaign_number` text DEFAULT NULL,
  `call_transfer` varchar(10) DEFAULT NULL,
  `transfer_to` char(36) DEFAULT NULL,
  `transfer_from` char(36) DEFAULT NULL,
  `direction` text DEFAULT NULL,
  `call_status` text DEFAULT NULL,
  `start_stamp` text DEFAULT NULL,
  `end_stamp` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `call_duration` int(11) DEFAULT NULL,
  `answersec` int(11) DEFAULT NULL,
  `waitsec` int(11) DEFAULT NULL,
  `did_number` text DEFAULT NULL,
  `hangup_cause` text DEFAULT NULL,
  `recording_file` text DEFAULT NULL,
  `callby` text DEFAULT NULL,
  `hangupby` text DEFAULT NULL,
  `disposition` text DEFAULT NULL,
  `transfer_type` varchar(60) DEFAULT NULL,
  `disposition_uuid` char(36) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `feedback_ratting` text DEFAULT NULL,
  `feedback_transferred` varchar(10) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `origination_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`call_dtl_uuid`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`),
  KEY `call_duration` (`call_duration`),
  KEY `call_status` (`call_status`(10)),
  KEY `call_uuid` (`call_uuid`),
  KEY `contact_uuid` (`contact_uuid`),
  KEY `destination_number` (`destination_number`(15)),
  KEY `direction` (`direction`(10)),
  KEY `disposition_uuid` (`disposition_uuid`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `end_stamp` (`end_stamp`(22)),
  KEY `hangupby` (`hangupby`(20)),
  KEY `hangup_cause` (`hangup_cause`(20)),
  KEY `source_number` (`source_number`(15)),
  KEY `start_stamp` (`start_stamp`(22)),
  KEY `user_uuid` (`user_uuid`),
  KEY `waitsec` (`waitsec`),
  KEY `origination_uuid` (`origination_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_delacon_crm`
--

DROP TABLE IF EXISTS `v_call_delacon_crm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_delacon_crm` (
  `uuid` char(36) NOT NULL,
  `lead_called_id` varchar(50) DEFAULT NULL,
  `delacon_caller_id` varchar(50) DEFAULT NULL,
  `api_timestamp` varchar(50) DEFAULT NULL,
  `call_timestamp` varchar(50) DEFAULT NULL,
  `broadcast_contact_uuid` char(36) DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `api_json_data` text DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `contact_broadcast_uuid` (`broadcast_contact_uuid`),
  KEY `call_clid` (`delacon_caller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_disposition`
--

DROP TABLE IF EXISTS `v_call_disposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_disposition` (
  `call_disposition_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `disposition_uuid` char(36) DEFAULT NULL,
  `disposition` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `custom_field_name` char(100) DEFAULT NULL,
  `custom_field_value` text DEFAULT NULL,
  `xfer_call_uuid` char(36) DEFAULT NULL,
  `call_state_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`call_disposition_uuid`),
  KEY `call_state_uuid` (`call_state_uuid`),
  KEY `create_at_user_uuid` (`create_at`,`user_uuid`),
  KEY `call_uuid` (`call_uuid`) USING BTREE,
  KEY `create_at` (`create_at`) USING BTREE,
  KEY `disposition` (`disposition`(50)) USING BTREE,
  KEY `disposition_uuid` (`disposition_uuid`) USING BTREE,
  KEY `user_uuid` (`user_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_disposition_custom_fields`
--

DROP TABLE IF EXISTS `v_call_disposition_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_disposition_custom_fields` (
  `call_disposition_custom_field_uuid` char(36) NOT NULL,
  `call_disposition_uuid` char(36) DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `custom_field_name` char(100) DEFAULT NULL,
  `custom_field_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`call_disposition_custom_field_uuid`),
  KEY `call_disposition_uuid` (`call_disposition_uuid`),
  KEY `call_uuid` (`call_uuid`),
  KEY `custom_field_name` (`custom_field_name`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_dtl`
--

DROP TABLE IF EXISTS `v_call_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_dtl` (
  `call_dtl_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `source_number` varchar(20) DEFAULT NULL,
  `destination_number` varchar(42) DEFAULT NULL,
  `campaign_number` text DEFAULT NULL,
  `call_transfer` varchar(10) DEFAULT NULL,
  `transfer_to` char(36) DEFAULT NULL,
  `transfer_from` char(36) DEFAULT NULL,
  `direction` varchar(10) DEFAULT NULL,
  `call_status` varchar(30) DEFAULT NULL,
  `start_stamp` datetime DEFAULT NULL,
  `end_stamp` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `call_duration` int(11) DEFAULT NULL,
  `answersec` int(11) DEFAULT NULL,
  `waitsec` int(11) DEFAULT NULL,
  `did_number` text DEFAULT NULL,
  `hangup_cause` varchar(100) DEFAULT NULL,
  `recording_file` text DEFAULT NULL,
  `callby` text DEFAULT NULL,
  `hangupby` varchar(30) DEFAULT NULL,
  `disposition` text DEFAULT NULL,
  `disposition_uuid` char(36) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `feedback_ratting` text DEFAULT NULL,
  `feedback_transferred` varchar(10) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `origination_uuid` char(36) DEFAULT NULL,
  `hangup_cause_code` varchar(5) DEFAULT NULL,
  `call_setup_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`call_dtl_uuid`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`),
  KEY `call_duration` (`call_duration`),
  KEY `call_status` (`call_status`(10)),
  KEY `call_uuid` (`call_uuid`),
  KEY `contact_uuid` (`contact_uuid`),
  KEY `destination_number` (`destination_number`(15)),
  KEY `disposition_uuid` (`disposition_uuid`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `hangupby` (`hangupby`(20)),
  KEY `hangup_cause` (`hangup_cause`(20)),
  KEY `source_number` (`source_number`(15)),
  KEY `user_uuid` (`user_uuid`),
  KEY `waitsec` (`waitsec`),
  KEY `origination_uuid` (`origination_uuid`),
  KEY `transfer_to` (`transfer_to`),
  KEY `source_number_2` (`source_number`(10)),
  KEY `start_stamp_user_uuid` (`start_stamp`,`user_uuid`),
  KEY `start_stamp_call_status` (`start_stamp`,`call_status`),
  KEY `start_stamp_domain_uuid` (`start_stamp`,`domain_uuid`),
  KEY `start_stamp_call_center_queue_uuid` (`start_stamp`,`call_center_queue_uuid`),
  KEY `direction` (`direction`),
  KEY `end_stamp` (`end_stamp`),
  KEY `start_stamp` (`start_stamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_dtl_ip`
--

DROP TABLE IF EXISTS `v_call_dtl_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_dtl_ip` (
  `call_dtl_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `source_number` text DEFAULT NULL,
  `destination_number` text DEFAULT NULL,
  `campaign_number` text DEFAULT NULL,
  `call_transfer` varchar(10) DEFAULT NULL,
  `transfer_to` char(36) DEFAULT NULL,
  `transfer_from` char(36) DEFAULT NULL,
  `direction` text DEFAULT NULL,
  `call_status` text DEFAULT NULL,
  `start_stamp` text DEFAULT NULL,
  `end_stamp` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `call_duration` int(11) DEFAULT NULL,
  `answersec` int(11) DEFAULT NULL,
  `waitsec` int(11) DEFAULT NULL,
  `did_number` text DEFAULT NULL,
  `hangup_cause` text DEFAULT NULL,
  `recording_file` text DEFAULT NULL,
  `callby` text DEFAULT NULL,
  `hangupby` text DEFAULT NULL,
  `disposition` text DEFAULT NULL,
  `disposition_uuid` char(36) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `feedback_ratting` text DEFAULT NULL,
  `feedback_transferred` varchar(10) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `origination_uuid` char(36) DEFAULT NULL,
  `hangup_cause_code` varchar(5) DEFAULT NULL,
  `call_setup_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`call_dtl_uuid`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`),
  KEY `call_duration` (`call_duration`),
  KEY `call_status` (`call_status`(10)),
  KEY `call_uuid` (`call_uuid`),
  KEY `contact_uuid` (`contact_uuid`),
  KEY `destination_number` (`destination_number`(15)),
  KEY `direction` (`direction`(10)),
  KEY `disposition_uuid` (`disposition_uuid`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `end_stamp` (`end_stamp`(22)),
  KEY `hangupby` (`hangupby`(20)),
  KEY `hangup_cause` (`hangup_cause`(20)),
  KEY `source_number` (`source_number`(15)),
  KEY `start_stamp` (`start_stamp`(22)),
  KEY `user_uuid` (`user_uuid`),
  KEY `waitsec` (`waitsec`),
  KEY `origination_uuid` (`origination_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_dtl_sticky_transfer`
--

DROP TABLE IF EXISTS `v_call_dtl_sticky_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_dtl_sticky_transfer` (
  `call_dtl_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `source_number` varchar(20) DEFAULT NULL,
  `destination_number` varchar(20) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `call_status` varchar(30) DEFAULT NULL,
  `start_stamp` datetime DEFAULT NULL,
  `end_stamp` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `call_duration` int(11) DEFAULT NULL,
  `answersec` int(11) DEFAULT NULL,
  `waitsec` int(11) DEFAULT NULL,
  `did_number` varchar(20) DEFAULT NULL,
  `hangup_cause` varchar(100) DEFAULT NULL,
  `recording_file` text DEFAULT NULL,
  `callby` varchar(20) DEFAULT NULL,
  `hangupby` varchar(30) DEFAULT NULL,
  `hangup_cause_code` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_external_crm`
--

DROP TABLE IF EXISTS `v_call_external_crm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_external_crm` (
  `call_uuid` char(36) NOT NULL,
  `call_state_uuid` char(36) NOT NULL,
  `crm_id` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`call_uuid`),
  KEY `call_state_uuid` (`call_state_uuid`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_farvision`
--

DROP TABLE IF EXISTS `v_call_farvision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_farvision` (
  `call_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `source_number` mediumtext DEFAULT NULL,
  `destination_number` mediumtext DEFAULT NULL,
  `direction` mediumtext DEFAULT NULL,
  `call_status` mediumtext DEFAULT NULL,
  `start_stamp` timestamp NULL DEFAULT NULL,
  `end_stamp` timestamp NULL DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `did_number` mediumtext DEFAULT NULL,
  `hangup_cause` mediumtext DEFAULT NULL,
  `recording_file` mediumtext DEFAULT NULL,
  `callby` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`call_uuid`),
  KEY `duration` (`duration`),
  KEY `call_status` (`call_status`(10)),
  KEY `destination_number` (`destination_number`(15)),
  KEY `direction` (`direction`(10)),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `end_stamp` (`end_stamp`),
  KEY `hangup_cause` (`hangup_cause`(20)),
  KEY `source_number` (`source_number`(15)),
  KEY `start_stamp` (`start_stamp`),
  FULLTEXT KEY `source_number_2` (`source_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_farvision_details`
--

DROP TABLE IF EXISTS `v_call_farvision_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_farvision_details` (
  `call_uuid` char(36) NOT NULL,
  `parent_call_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `source_number` mediumtext DEFAULT NULL,
  `destination_number` mediumtext DEFAULT NULL,
  `direction` mediumtext DEFAULT NULL,
  `call_status` mediumtext DEFAULT NULL,
  `start_stamp` timestamp NULL DEFAULT NULL,
  `end_stamp` timestamp NULL DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `did_number` mediumtext DEFAULT NULL,
  `hangup_cause` mediumtext DEFAULT NULL,
  `recording_file` mediumtext DEFAULT NULL,
  `callby` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`call_uuid`),
  KEY `duration` (`duration`),
  KEY `call_status` (`call_status`(10)),
  KEY `parent_call_uuid` (`parent_call_uuid`),
  KEY `destination_number` (`destination_number`(15)),
  KEY `direction` (`direction`(10)),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `end_stamp` (`end_stamp`),
  KEY `hangup_cause` (`hangup_cause`(20)),
  KEY `source_number` (`source_number`(15)),
  KEY `start_stamp` (`start_stamp`),
  FULLTEXT KEY `source_number_2` (`source_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_flows`
--

DROP TABLE IF EXISTS `v_call_flows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_flows` (
  `domain_uuid` char(36) DEFAULT NULL,
  `call_flow_uuid` char(36) NOT NULL,
  `dialplan_uuid` char(36) DEFAULT NULL,
  `call_flow_name` text DEFAULT NULL,
  `call_flow_extension` text DEFAULT NULL,
  `call_flow_feature_code` text DEFAULT NULL,
  `call_flow_context` text DEFAULT NULL,
  `call_flow_status` text DEFAULT NULL,
  `call_flow_pin_number` text DEFAULT NULL,
  `call_flow_label` text DEFAULT NULL,
  `call_flow_sound` text DEFAULT NULL,
  `call_flow_app` text DEFAULT NULL,
  `call_flow_data` text DEFAULT NULL,
  `call_flow_alternate_label` text DEFAULT NULL,
  `call_flow_alternate_sound` text DEFAULT NULL,
  `call_flow_alternate_app` text DEFAULT NULL,
  `call_flow_alternate_data` text DEFAULT NULL,
  `call_flow_description` text DEFAULT NULL,
  `call_flow_language` text DEFAULT NULL,
  PRIMARY KEY (`call_flow_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_hold_state`
--

DROP TABLE IF EXISTS `v_call_hold_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_hold_state` (
  `call_hold_state_uuid` char(36) NOT NULL,
  `call_state_uuid` char(36) DEFAULT NULL,
  `agent_uuid` char(36) DEFAULT NULL,
  `call_start_stamp` varchar(20) DEFAULT NULL,
  `hold_time` varchar(20) DEFAULT NULL,
  `unhold_time` varchar(20) DEFAULT NULL,
  `group_type` varchar(20) DEFAULT NULL,
  `created_at` varchar(20) NOT NULL,
  PRIMARY KEY (`call_hold_state_uuid`),
  KEY `call_state_uuid` (`call_state_uuid`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_start_stamp` (`call_start_stamp`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_mute_state`
--

DROP TABLE IF EXISTS `v_call_mute_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_mute_state` (
  `call_mute_state_uuid` char(36) NOT NULL,
  `call_state_uuid` char(36) DEFAULT NULL,
  `agent_uuid` char(36) DEFAULT NULL,
  `call_start_stamp` varchar(20) DEFAULT NULL,
  `mute_time` varchar(20) DEFAULT NULL,
  `unmute_time` varchar(20) DEFAULT NULL,
  `group_type` varchar(20) DEFAULT NULL,
  `created_at` varchar(20) NOT NULL,
  PRIMARY KEY (`call_mute_state_uuid`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_phoneagent`
--

DROP TABLE IF EXISTS `v_call_phoneagent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_phoneagent` (
  `domain_uuid` char(36) DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `process` text DEFAULT NULL,
  `source_number` char(20) DEFAULT NULL,
  `did_number` char(20) DEFAULT NULL,
  `agent_number` char(20) DEFAULT NULL,
  `dialed_number` char(20) DEFAULT NULL,
  `start_stamp` char(20) DEFAULT NULL,
  `end_stamp` char(20) DEFAULT NULL,
  `recording_file` text DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `call_duration` int(11) NOT NULL,
  `hangup_cause` char(30) DEFAULT NULL,
  KEY `domain_uuid` (`domain_uuid`),
  KEY `call_uuid` (`call_uuid`),
  KEY `agent_number` (`agent_number`),
  KEY `dialed_number` (`dialed_number`),
  KEY `start_stamp` (`start_stamp`),
  KEY `duration` (`duration`),
  KEY `call_duration` (`call_duration`),
  KEY `hangup_cause` (`hangup_cause`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_recording_state`
--

DROP TABLE IF EXISTS `v_call_recording_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_recording_state` (
  `recording_state_uuid` char(36) NOT NULL,
  `call_uuid` char(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `state` varchar(5) NOT NULL,
  `user_uuid` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_screenrecording`
--

DROP TABLE IF EXISTS `v_call_screenrecording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_screenrecording` (
  `screenrecording_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `call_state_uuid` char(36) DEFAULT NULL,
  `file_path` varchar(150) DEFAULT NULL,
  `blob_data` blob DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`screenrecording_uuid`),
  KEY `call_uuid` (`call_uuid`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_state`
--

DROP TABLE IF EXISTS `v_call_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_state` (
  `call_state_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `agent_uuid` char(36) DEFAULT NULL,
  `broadcast_name` text DEFAULT NULL,
  `ringing` decimal(9,2) DEFAULT NULL,
  `mute` text DEFAULT NULL,
  `hold` decimal(9,2) DEFAULT NULL,
  `wrapup_time` decimal(9,2) DEFAULT NULL,
  `total_talktime` decimal(9,2) DEFAULT NULL,
  `ringing_attempt` int(11) DEFAULT NULL,
  `hold_attempt` int(11) NOT NULL DEFAULT 0,
  `mute_attempt` decimal(10,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_time` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `hangup_cause` varchar(100) DEFAULT NULL,
  `hangup_by` varchar(100) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`call_state_uuid`),
  KEY `created_at` (`created_at`),
  KEY `created_at_agent_uuid` (`created_at`,`agent_uuid`),
  KEY `agent_uuid` (`agent_uuid`) USING BTREE,
  KEY `call_uuid` (`call_uuid`) USING BTREE,
  KEY `hold` (`hold`) USING BTREE,
  KEY `mute` (`mute`(10)) USING BTREE,
  KEY `ringing` (`ringing`) USING BTREE,
  KEY `ringing_attempt` (`ringing_attempt`) USING BTREE,
  KEY `total_talktime` (`total_talktime`) USING BTREE,
  KEY `wrapup_time` (`wrapup_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_state_dtl`
--

DROP TABLE IF EXISTS `v_call_state_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_state_dtl` (
  `call_state_dtl_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `call_state_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `remote_media_ip` char(36) DEFAULT NULL,
  `remote_media_port` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`call_state_dtl_uuid`),
  KEY `call_uuid` (`call_uuid`),
  KEY `call_state_uuid` (`call_state_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_state_live_apr`
--

DROP TABLE IF EXISTS `v_call_state_live_apr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_state_live_apr` (
  `call_state_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `agent_uuid` char(36) DEFAULT NULL,
  `broadcast_name` text DEFAULT NULL,
  `ringing` decimal(9,2) DEFAULT NULL,
  `mute` text DEFAULT NULL,
  `hold` decimal(9,2) DEFAULT NULL,
  `wrapup_time` decimal(9,2) DEFAULT NULL,
  `total_talktime` decimal(9,2) DEFAULT NULL,
  `ringing_attempt` int(11) DEFAULT NULL,
  `hold_attempt` int(11) NOT NULL DEFAULT 0,
  `mute_attempt` decimal(10,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_time` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `hangup_cause` varchar(100) DEFAULT NULL,
  `hangup_by` varchar(100) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`call_state_uuid`),
  KEY `agent_uuid` (`agent_uuid`) USING BTREE,
  KEY `call_uuid` (`call_uuid`) USING BTREE,
  KEY `mute` (`mute`(10)) USING BTREE,
  KEY `ringing_attempt` (`ringing_attempt`) USING BTREE,
  KEY `created_at` (`created_at`),
  KEY `hold` (`hold`) USING BTREE,
  KEY `wrapup_time` (`wrapup_time`) USING BTREE,
  KEY `ringing` (`ringing`) USING BTREE,
  KEY `total_talktime` (`total_talktime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_survey_feedback`
--

DROP TABLE IF EXISTS `v_call_survey_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_survey_feedback` (
  `call_survey_uuid` char(36) NOT NULL,
  `call_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) NOT NULL,
  `survey_uuid` char(36) NOT NULL,
  PRIMARY KEY (`call_survey_uuid`),
  KEY `call_uuid` (`call_uuid`),
  KEY `survey_uuid` (`survey_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_survey_feedback_detail`
--

DROP TABLE IF EXISTS `v_call_survey_feedback_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_survey_feedback_detail` (
  `call_survey_feedback_detail_uuid` char(36) NOT NULL,
  `call_survey_uuid` char(36) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `stop_time` timestamp NULL DEFAULT NULL,
  `question_uuid` char(36) NOT NULL,
  `attempts` int(3) DEFAULT NULL,
  `key_pressed` text DEFAULT NULL,
  `option_picked` text DEFAULT NULL,
  `customer_input_recording` text DEFAULT NULL,
  PRIMARY KEY (`call_survey_feedback_detail_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_system_disposition`
--

DROP TABLE IF EXISTS `v_call_system_disposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_system_disposition` (
  `sys_dis_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `system_disposition` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`sys_dis_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_two_autoblast`
--

DROP TABLE IF EXISTS `v_call_two_autoblast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_two_autoblast` (
  `call_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `phone_number` text DEFAULT NULL,
  `contact_unique_id` varchar(100) DEFAULT NULL,
  `start_stamp` text DEFAULT NULL,
  `end_stamp` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `hangup_cause` text DEFAULT NULL,
  `call_status` text DEFAULT NULL,
  PRIMARY KEY (`call_uuid`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `contact_unique_id` (`contact_unique_id`),
  KEY `start_stamp` (`start_stamp`(20)),
  KEY `end_stamp` (`end_stamp`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_twocallpatch`
--

DROP TABLE IF EXISTS `v_call_twocallpatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_twocallpatch` (
  `call_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `caller_number` text DEFAULT NULL,
  `callee_number` text DEFAULT NULL,
  `contact_unique_id` varchar(100) DEFAULT NULL,
  `start_stamp` text DEFAULT NULL,
  `end_stamp` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `answersec` int(11) DEFAULT NULL,
  `waitsec` int(11) DEFAULT NULL,
  `call_leg1_duration` int(11) DEFAULT NULL,
  `call_leg2_duration` int(11) DEFAULT NULL,
  `total_duration` int(11) DEFAULT NULL,
  `hangup_cause` text DEFAULT NULL,
  `hangup_cause2` text DEFAULT NULL,
  `recording_file` text DEFAULT NULL,
  PRIMARY KEY (`call_uuid`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `contact_unique_id` (`contact_unique_id`),
  KEY `start_stamp` (`start_stamp`(20)),
  KEY `end_stamp` (`end_stamp`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_xfer`
--

DROP TABLE IF EXISTS `v_call_xfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_xfer` (
  `call_dtl_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `source_number` text DEFAULT NULL,
  `destination_number` varchar(45) DEFAULT NULL,
  `campaign_number` text DEFAULT NULL,
  `call_transfer` varchar(10) DEFAULT NULL,
  `transfer_to` char(36) DEFAULT NULL,
  `transfer_from` char(36) DEFAULT NULL,
  `direction` text DEFAULT NULL,
  `call_status` text DEFAULT NULL,
  `start_stamp` datetime DEFAULT NULL,
  `end_stamp` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `call_duration` int(11) DEFAULT NULL,
  `answersec` int(11) DEFAULT NULL,
  `waitsec` int(11) DEFAULT NULL,
  `did_number` text DEFAULT NULL,
  `hangup_cause` text DEFAULT NULL,
  `recording_file` text DEFAULT NULL,
  `callby` text DEFAULT NULL,
  `hangupby` text DEFAULT NULL,
  `disposition` text DEFAULT NULL,
  `disposition_uuid` char(36) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `feedback_ratting` text DEFAULT NULL,
  `feedback_transferred` varchar(10) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `origination_uuid` char(36) DEFAULT NULL,
  `xfer_uuid` char(36) DEFAULT NULL,
  `hangup_cause_code` varchar(5) DEFAULT NULL,
  `call_setup_time` int(11) DEFAULT NULL,
  `call_state_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`call_dtl_uuid`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`),
  KEY `call_duration` (`call_duration`),
  KEY `call_status` (`call_status`(10)),
  KEY `call_uuid` (`call_uuid`),
  KEY `contact_uuid` (`contact_uuid`),
  KEY `destination_number` (`destination_number`(15)),
  KEY `direction` (`direction`(10)),
  KEY `disposition_uuid` (`disposition_uuid`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `hangupby` (`hangupby`(20)),
  KEY `hangup_cause` (`hangup_cause`(20)),
  KEY `source_number` (`source_number`(15)),
  KEY `user_uuid` (`user_uuid`),
  KEY `waitsec` (`waitsec`),
  KEY `origination_uuid` (`origination_uuid`),
  KEY `xfer_uuid` (`xfer_uuid`),
  KEY `user_uuid_start_stamp` (`user_uuid`,`start_stamp`),
  KEY `call_uuid_start_stamp` (`call_uuid`,`start_stamp`),
  KEY `end_stamp` (`end_stamp`),
  KEY `start_stamp` (`start_stamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_call_xfer_details`
--

DROP TABLE IF EXISTS `v_call_xfer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_call_xfer_details` (
  `xfer_detail_uuid` char(36) NOT NULL,
  `call_uuid` char(36) NOT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `transfer_type` varchar(20) DEFAULT NULL,
  `transfer_to` varchar(50) DEFAULT NULL,
  `transfer_from_queue_uuid` char(36) NOT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `destination_number` varchar(42) NOT NULL,
  `waitsec` int(5) DEFAULT NULL,
  `call_status` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `call_state_uuid` char(36) DEFAULT NULL,
  `callby` varchar(20) DEFAULT NULL,
  `hangupby` varchar(30) DEFAULT NULL,
  `feedback_ratting` tinyint(4) DEFAULT NULL,
  `feedback_transferred` tinyint(4) DEFAULT NULL,
  `user_name_number` varchar(40) DEFAULT NULL,
  `hangup_cause` varchar(40) DEFAULT NULL,
  `call_duration` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `hangup_cause_code` varchar(5) DEFAULT NULL,
  `call_setup_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`xfer_detail_uuid`),
  KEY `call_uuid` (`call_uuid`),
  KEY `contact_uuid` (`contact_uuid`),
  KEY `call_state_uuid` (`call_state_uuid`),
  KEY `call_status` (`call_status`(10)),
  KEY `created_at` (`created_at`),
  KEY `user_uuid_created_at` (`user_uuid`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_callback_contacts`
--

DROP TABLE IF EXISTS `v_callback_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_callback_contacts` (
  `callback_contact_uuid` char(36) NOT NULL,
  `call_uuid1` char(36) DEFAULT NULL,
  `call_uuid2` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `callback_time` datetime DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `campaign_uuid` char(36) DEFAULT NULL,
  `callback_finish` varchar(50) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `expire_status` varchar(50) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `callback_set_from` char(36) DEFAULT NULL,
  PRIMARY KEY (`callback_contact_uuid`),
  KEY `call_uuid1` (`call_uuid1`),
  KEY `callback_finish` (`callback_finish`) USING BTREE,
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`) USING BTREE,
  KEY `call_uuid2` (`call_uuid2`) USING BTREE,
  KEY `campaign_uuid` (`campaign_uuid`) USING BTREE,
  KEY `contact_uuid` (`contact_uuid`) USING BTREE,
  KEY `user_uuid` (`user_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_caller_base_routing`
--

DROP TABLE IF EXISTS `v_caller_base_routing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_caller_base_routing` (
  `caller_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `caller_number` varchar(255) DEFAULT NULL,
  `caller_route` varchar(255) DEFAULT NULL,
  `caller_route_text` varchar(255) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`caller_uuid`),
  KEY `domain_uuid` (`domain_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_callflow_api`
--

DROP TABLE IF EXISTS `v_callflow_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_callflow_api` (
  `api_uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `api_number` int(11) DEFAULT NULL,
  `method` enum('get','post') DEFAULT NULL,
  `url` mediumtext DEFAULT NULL,
  `data_type` enum('json','text','html') DEFAULT NULL,
  `data` mediumtext DEFAULT NULL,
  `response_type` enum('json','text','html') DEFAULT NULL,
  `response_data` mediumtext DEFAULT NULL,
  `variable_name` mediumtext DEFAULT NULL,
  `destination_number` char(6) DEFAULT NULL,
  `destination_context` mediumtext DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  KEY `api_uuid` (`api_uuid`),
  CONSTRAINT `v_callflow_api_ibfk_1` FOREIGN KEY (`api_uuid`) REFERENCES `v_api_token` (`api_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_callflow_capture`
--

DROP TABLE IF EXISTS `v_callflow_capture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_callflow_capture` (
  `capture_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `capture_number` char(6) DEFAULT NULL,
  `min_digit` int(11) DEFAULT NULL,
  `max_digit` int(11) DEFAULT NULL,
  `tries_count` int(11) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `terminators` varchar(1) DEFAULT NULL,
  `sound_prompt` text DEFAULT NULL,
  `invalid_prompt` text DEFAULT NULL,
  `variable_name` text DEFAULT NULL,
  `destination_number` char(6) DEFAULT NULL,
  `destination_context` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_callflow_playback`
--

DROP TABLE IF EXISTS `v_callflow_playback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_callflow_playback` (
  `playback_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `playback_number` char(6) DEFAULT NULL,
  `say_type` text DEFAULT NULL,
  `say_method` text DEFAULT NULL,
  `voice_gender` text DEFAULT NULL,
  `variable_text` text DEFAULT NULL,
  `language` enum('en','es') DEFAULT NULL,
  `destination_number` char(6) DEFAULT NULL,
  `destination_context` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_calls_summary`
--

DROP TABLE IF EXISTS `v_calls_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_calls_summary` (
  `Date` date DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `Total_Inbound_Calls` int(11) DEFAULT NULL,
  `Total_Answered_Calls` int(11) DEFAULT NULL,
  `Total_Unanswered_Calls` int(11) DEFAULT NULL,
  `Total_Answered_Calls_Percentage` float DEFAULT NULL,
  `Total_Unanswered_Calls_Percentage` float DEFAULT NULL,
  `Total_Inbound_Unique_Callers` int(11) DEFAULT NULL,
  `Total_Callers_Spoken_By_Calling_Back` int(11) DEFAULT NULL,
  `Total_Unique_Callers_Answered` int(11) DEFAULT NULL,
  `Total_Abandoned_Calls` int(11) DEFAULT NULL,
  `Total_Unique_Abandoned_Calls` int(11) DEFAULT NULL,
  `Total_Missed_Calls` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_campaign_agent`
--

DROP TABLE IF EXISTS `v_campaign_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_campaign_agent` (
  `call_center_tier_uuid` char(36) NOT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `agent_name` text DEFAULT NULL,
  `queue_name` text DEFAULT NULL,
  `tier_level` decimal(10,0) DEFAULT NULL,
  `tier_position` decimal(10,0) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `add` varchar(36) DEFAULT NULL,
  `outbound_queue` varchar(6) DEFAULT NULL,
  `default_queue` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`call_center_tier_uuid`),
  KEY `agent_name` (`agent_name`(20)) USING BTREE,
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `queue_name` (`queue_name`(30)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_campaign_hold_ivr_callback`
--

DROP TABLE IF EXISTS `v_campaign_hold_ivr_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_campaign_hold_ivr_callback` (
  `campaign_hold_ivr_callback_uuid` char(36) NOT NULL,
  `call_broadcast_uuid` char(36) NOT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `cc_approx_hold_moh_iterations` int(11) DEFAULT NULL,
  `cc_queue_position_pre` text DEFAULT NULL,
  `cc_queue_position_post` text DEFAULT NULL,
  `cc_approx_hold_pre` text DEFAULT NULL,
  `cc_approx_hold_post` text DEFAULT NULL,
  `cc_exit_ivr_moh_iterations` int(11) DEFAULT NULL,
  `cc_exit_ivr` text DEFAULT NULL,
  `cc_exit_ivr_regex` int(11) DEFAULT NULL,
  `cc_exit_ivr_dtmf_timeout` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_campaign_list`
--

DROP TABLE IF EXISTS `v_campaign_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_campaign_list` (
  `list_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `active_status` varchar(20) DEFAULT NULL,
  `list_otherdata` text DEFAULT NULL,
  `list_type` varchar(100) DEFAULT NULL,
  `list_description` text DEFAULT NULL,
  `list_name` text DEFAULT NULL,
  `reset_lead` varchar(10) DEFAULT NULL,
  `disposition` text DEFAULT NULL,
  `disposition_list` text DEFAULT NULL,
  `disposition_data` text DEFAULT NULL,
  `campaign_list_status` text DEFAULT NULL,
  `campaign_list_count` int(10) DEFAULT 0,
  `interval_minutes` varchar(50) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `duplicate_check` varchar(20) DEFAULT NULL,
  `duplicate_action` varchar(15) DEFAULT NULL,
  `list_parent_uuid` char(36) DEFAULT NULL,
  `caller_id_number` varchar(30) DEFAULT NULL,
  `list_weight` int(3) DEFAULT NULL,
  `duplicate_checkby` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_time` time NOT NULL DEFAULT '00:00:00',
  `end_time` time NOT NULL DEFAULT '23:59:59',
  PRIMARY KEY (`list_uuid`),
  KEY `deleted_at` (`deleted_at`),
  KEY `active_status` (`active_status`) USING BTREE,
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`) USING BTREE,
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `list_type` (`list_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_campaign_list_agent`
--

DROP TABLE IF EXISTS `v_campaign_list_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_campaign_list_agent` (
  `campaign_list_agent_uuid` char(36) NOT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `agent_uuid` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`campaign_list_agent_uuid`),
  KEY `agent_uuid` (`agent_uuid`) USING BTREE,
  KEY `list_uuid` (`list_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_campaign_processes`
--

DROP TABLE IF EXISTS `v_campaign_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_campaign_processes` (
  `campaign_process_uuid` char(36) NOT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `process_name` text DEFAULT NULL,
  `process_type` enum('chat','facebook','twitter') NOT NULL,
  `process_status` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  KEY `domain_uuid` (`domain_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_campaign_questions_answer`
--

DROP TABLE IF EXISTS `v_campaign_questions_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_campaign_questions_answer` (
  `question_answer_uuid` char(36) NOT NULL,
  `campaign_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `script_uuid` char(36) DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `agent_uuid` char(36) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `answer_json` text DEFAULT NULL,
  PRIMARY KEY (`question_answer_uuid`),
  KEY `agent_uuid` (`agent_uuid`) USING BTREE,
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`) USING BTREE,
  KEY `call_uuid` (`call_uuid`) USING BTREE,
  KEY `campaign_uuid` (`campaign_uuid`) USING BTREE,
  KEY `contact_uuid` (`contact_uuid`) USING BTREE,
  KEY `script_uuid` (`script_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_campaign_schedulers`
--

DROP TABLE IF EXISTS `v_campaign_schedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_campaign_schedulers` (
  `v_campaign_scheduler_uuid` char(36) NOT NULL,
  `broadcast_uuid` char(36) DEFAULT NULL,
  `scheduler_type` varchar(10) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `data` text DEFAULT NULL,
  `campaign_timezone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`v_campaign_scheduler_uuid`),
  KEY `broadcast_uuid` (`broadcast_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_campaign_schedulers_manual`
--

DROP TABLE IF EXISTS `v_campaign_schedulers_manual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_campaign_schedulers_manual` (
  `v_campaign_scheduler_uuid` char(36) NOT NULL,
  `broadcast_uuid` char(36) DEFAULT NULL,
  `scheduler_type` varchar(10) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `data` text DEFAULT NULL,
  `campaign_timezone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`v_campaign_scheduler_uuid`),
  KEY `broadcast_uuid` (`broadcast_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_campaign_thresholds`
--

DROP TABLE IF EXISTS `v_campaign_thresholds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_campaign_thresholds` (
  `campaign_uuid` char(36) NOT NULL,
  `call_time_greenzone` int(5) DEFAULT NULL,
  `call_time_redzone` int(5) DEFAULT NULL,
  `hold_time_greenzone` int(5) DEFAULT NULL,
  `hold_time_redzone` int(5) DEFAULT NULL,
  KEY `campaign_uuid` (`campaign_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_campaigns_app_integrations`
--

DROP TABLE IF EXISTS `v_campaigns_app_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_campaigns_app_integrations` (
  `campaign_app_integration_uuid` char(36) NOT NULL,
  `call_broadcast_uuid` char(36) NOT NULL,
  `app_uuid` char(36) NOT NULL,
  `app` char(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`campaign_app_integration_uuid`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_cdr_report`
--

DROP TABLE IF EXISTS `v_cdr_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_cdr_report` (
  `call_cdr_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `call_uuid` char(36) NOT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `agent_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `remote_media_ip` char(36) DEFAULT NULL,
  `remote_media_port` char(5) DEFAULT NULL,
  `agent_email` char(255) DEFAULT NULL,
  `email_id` char(255) DEFAULT NULL,
  `did_number` varchar(15) DEFAULT NULL,
  `hangup_cause_code` varchar(5) DEFAULT NULL,
  `agentname` varchar(255) DEFAULT NULL,
  `list_name` varchar(100) DEFAULT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `crm_uuid` char(36) DEFAULT NULL,
  `contact_priority` int(5) DEFAULT NULL,
  `othedata` text DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `disposition_type` varchar(50) DEFAULT NULL,
  `start_stamp` datetime DEFAULT NULL,
  `end_stamp` datetime DEFAULT NULL,
  `direction` varchar(10) DEFAULT NULL,
  `destination_number` varchar(42) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `wrapup_duration` varchar(100) DEFAULT NULL,
  `hold_duration` varchar(100) DEFAULT NULL,
  `hangup_cause` varchar(100) DEFAULT NULL,
  `system_disposition` varchar(100) DEFAULT NULL,
  `call_time_greenzone` int(5) DEFAULT NULL,
  `call_time_redzone` int(5) DEFAULT NULL,
  `hold_time_greenzone` int(5) DEFAULT NULL,
  `hold_time_redzone` int(5) DEFAULT NULL,
  `total_t` int(11) DEFAULT NULL,
  `total_h` int(11) DEFAULT NULL,
  `custom_field` char(255) DEFAULT NULL,
  `hold_time` varchar(255) DEFAULT NULL,
  `unhold_time` varchar(255) DEFAULT NULL,
  `hold_state_duration` varchar(255) DEFAULT NULL,
  `hold_child_count` int(11) DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `inquiry_source` varchar(255) DEFAULT NULL,
  `mute_time` varchar(20) DEFAULT NULL,
  `unmute_time` varchar(20) DEFAULT NULL,
  `mute_state_duration` varchar(255) DEFAULT NULL,
  `mute_duration` varchar(255) DEFAULT NULL,
  `mute_child_count` int(11) DEFAULT NULL,
  `inbound_pulse` int(11) DEFAULT NULL,
  `auto_pulse` int(11) DEFAULT NULL,
  `total_ringing_duration` varchar(20) DEFAULT NULL,
  `Queue_Wait_Time` varchar(20) DEFAULT NULL,
  `setup_time` varchar(20) DEFAULT NULL,
  `disconnectby` varchar(30) DEFAULT NULL,
  `crm_ticket` varchar(50) DEFAULT NULL,
  `total_call_duration` varchar(20) DEFAULT NULL,
  `ivr_duration` varchar(20) DEFAULT NULL,
  `dtmf` varchar(20) DEFAULT NULL,
  `abandoned_username_conc` char(255) DEFAULT NULL,
  `email_subject` varchar(255) DEFAULT NULL,
  `email_content` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `email_cc` varchar(255) DEFAULT NULL,
  `email_bcc` varchar(255) DEFAULT NULL,
  `sent_mail_uuid` char(36) DEFAULT NULL,
  `sent_msg_number` varchar(255) DEFAULT NULL,
  `sent_message` varchar(255) DEFAULT NULL,
  `sent_msg_uuid` char(36) DEFAULT NULL,
  `mail_template_name` varchar(255) DEFAULT NULL,
  `msg_template_name` varchar(255) DEFAULT NULL,
  `call_type` varchar(40) DEFAULT NULL,
  `username_conc` varchar(255) DEFAULT NULL,
  `recording_file` varchar(255) DEFAULT NULL,
  `webform_url` varchar(255) DEFAULT NULL,
  `wrapup_time` varchar(20) DEFAULT NULL,
  `get_call_launch` varchar(5) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `broadcast_name` varchar(36) DEFAULT NULL,
  `queue_name` varchar(36) DEFAULT NULL,
  `username` varchar(36) DEFAULT NULL,
  `recording_retention_period` int(10) DEFAULT NULL,
  `number_masking` varchar(5) DEFAULT NULL,
  `contact_unique_id` varchar(1024) DEFAULT NULL,
  `first_name` varchar(36) DEFAULT NULL,
  `last_name` varchar(36) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `disposition` varchar(36) DEFAULT NULL,
  `disposition_uuid` char(36) DEFAULT NULL,
  `source_number` varchar(15) DEFAULT NULL,
  `callback_time` datetime DEFAULT NULL,
  `call_survey_uuid` char(36) DEFAULT NULL,
  `feedback_transferred` tinyint(4) DEFAULT NULL,
  `feedback_ratting` tinyint(4) DEFAULT NULL,
  `transfer_to` char(36) DEFAULT NULL,
  `callby` varchar(20) DEFAULT NULL,
  `xfer_type` varchar(20) DEFAULT NULL,
  `announce_call_xfer_count` int(11) DEFAULT NULL,
  `xfer_callby` varchar(20) DEFAULT NULL,
  `emergency_name` varchar(36) DEFAULT NULL,
  `ivr_menu_name` varchar(36) DEFAULT NULL,
  `outbound_pulse` int(11) DEFAULT NULL,
  `crm_ans` text DEFAULT NULL,
  `crm_name` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`call_cdr_uuid`),
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`),
  KEY `list_uuid` (`list_uuid`),
  KEY `user_uuid` (`user_uuid`),
  KEY `call_uuid` (`call_uuid`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `created_on` (`created_on`),
  KEY `start_stamp` (`start_stamp`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`),
  KEY `source_number` (`source_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_chat`
--

DROP TABLE IF EXISTS `v_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_chat` (
  `chat_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `sender_uuid` char(36) DEFAULT NULL,
  `receiver_uuid` char(36) DEFAULT NULL,
  `group_id` char(36) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `message_type` varchar(50) DEFAULT NULL,
  `file_path` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`chat_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_chat_group_users`
--

DROP TABLE IF EXISTS `v_chat_group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_chat_group_users` (
  `chat_group_user_uuid` char(36) NOT NULL,
  `chat_group_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`chat_group_user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_chat_groups`
--

DROP TABLE IF EXISTS `v_chat_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_chat_groups` (
  `chat_group_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`chat_group_uuid`),
  KEY `domain_uuid` (`domain_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_chat_notification`
--

DROP TABLE IF EXISTS `v_chat_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_chat_notification` (
  `notification_uuid` char(36) DEFAULT NULL,
  `chat_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `chat_group_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  KEY `user_uuid` (`user_uuid`),
  KEY `chat_group_uuid` (`chat_group_uuid`),
  KEY `deleted_at` (`deleted_at`),
  KEY `chat_uuid` (`chat_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_clap_call_info`
--

DROP TABLE IF EXISTS `v_clap_call_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_clap_call_info` (
  `tiss_call_info_uuid` char(36) NOT NULL,
  `tiss_customer_uuid` char(36) NOT NULL,
  `call_uuid` char(36) NOT NULL,
  `language` varchar(45) DEFAULT NULL,
  `relationship` varchar(150) DEFAULT NULL,
  `callfor` varchar(150) DEFAULT NULL,
  `calltype` varchar(36) DEFAULT NULL,
  `callnature` text DEFAULT NULL,
  `callnature_type` text DEFAULT NULL,
  `covid_concern` text DEFAULT NULL,
  `city_location` text DEFAULT NULL,
  `unique_location` text DEFAULT NULL,
  `educational` text DEFAULT NULL,
  `employment` text DEFAULT NULL,
  `employment_type` text DEFAULT NULL,
  `followup_detail` mediumtext DEFAULT NULL,
  `intervention` text DEFAULT NULL,
  `intervention_detail` mediumtext DEFAULT NULL,
  `primary_concern` text DEFAULT NULL,
  `secondary_concern` text DEFAULT NULL,
  `referral_provided` text DEFAULT NULL,
  `referral_provided_type` text DEFAULT NULL,
  `source_of_referral` text DEFAULT NULL,
  `clap_ref_inv` varchar(20) DEFAULT NULL,
  `plan_of_action` text DEFAULT NULL,
  `referral_provided_data` text DEFAULT NULL,
  `caller_src_ref` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tiss_call_info_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_clips`
--

DROP TABLE IF EXISTS `v_clips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_clips` (
  `clip_uuid` char(36) NOT NULL,
  `clip_name` text DEFAULT NULL,
  `clip_folder` text DEFAULT NULL,
  `clip_text_start` text DEFAULT NULL,
  `clip_text_end` text DEFAULT NULL,
  `clip_order` text DEFAULT NULL,
  `clip_desc` text DEFAULT NULL,
  PRIMARY KEY (`clip_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_cocr_list`
--

DROP TABLE IF EXISTS `v_cocr_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_cocr_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cocr_list_uuid` char(36) DEFAULT NULL,
  `agent_number` varchar(13) DEFAULT NULL,
  `cust_number` varchar(13) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `status` enum('enable','disable') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_concurrent_login`
--

DROP TABLE IF EXISTS `v_concurrent_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_concurrent_login` (
  `login_history_id` char(36) NOT NULL,
  `user_uuid` char(36) NOT NULL,
  `group_type` char(20) NOT NULL,
  `logintime` varchar(50) NOT NULL,
  `concurrent_group_login` int(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`login_history_id`),
  KEY `logintime` (`logintime`),
  KEY `concurrent_login` (`concurrent_group_login`),
  KEY `user_uuid` (`user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_concurrent_login_summary`
--

DROP TABLE IF EXISTS `v_concurrent_login_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_concurrent_login_summary` (
  `concurrent_uuid` char(36) NOT NULL,
  `user_uuid` char(36) NOT NULL,
  `group_type` char(20) NOT NULL,
  `concurrent_group_login` int(6) NOT NULL,
  `report_capacity` int(6) NOT NULL,
  `supervisor_current_capacity` int(6) NOT NULL,
  `agent_current_capacity` int(6) NOT NULL,
  `users_current_capacity` int(6) NOT NULL,
  `report_type` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_id_utilization` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_conference_centers`
--

DROP TABLE IF EXISTS `v_conference_centers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_conference_centers` (
  `domain_uuid` char(36) DEFAULT NULL,
  `conference_center_uuid` char(36) NOT NULL,
  `dialplan_uuid` char(36) DEFAULT NULL,
  `conference_center_name` text DEFAULT NULL,
  `conference_center_extension` text DEFAULT NULL,
  `conference_center_pin_length` decimal(10,0) DEFAULT NULL,
  `conference_center_greeting` text DEFAULT NULL,
  `conference_center_description` text DEFAULT NULL,
  `conference_center_enabled` text DEFAULT NULL,
  PRIMARY KEY (`conference_center_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_conference_control_details`
--

DROP TABLE IF EXISTS `v_conference_control_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_conference_control_details` (
  `conference_control_detail_uuid` char(36) NOT NULL,
  `conference_control_uuid` char(36) DEFAULT NULL,
  `control_digits` text DEFAULT NULL,
  `control_action` text DEFAULT NULL,
  `control_data` text DEFAULT NULL,
  `control_enabled` text DEFAULT NULL,
  PRIMARY KEY (`conference_control_detail_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_conference_control_parameter`
--

DROP TABLE IF EXISTS `v_conference_control_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_conference_control_parameter` (
  `control_parameter_id` int(11) NOT NULL AUTO_INCREMENT,
  `control_parameter` varchar(50) DEFAULT NULL,
  `control_description` text DEFAULT NULL,
  `control_values` text DEFAULT NULL,
  PRIMARY KEY (`control_parameter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_conference_controls`
--

DROP TABLE IF EXISTS `v_conference_controls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_conference_controls` (
  `conference_control_uuid` char(36) NOT NULL,
  `control_name` text DEFAULT NULL,
  `control_enabled` text DEFAULT NULL,
  `control_description` text DEFAULT NULL,
  PRIMARY KEY (`conference_control_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_conference_profile_parameter`
--

DROP TABLE IF EXISTS `v_conference_profile_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_conference_profile_parameter` (
  `profile_parameter_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_parameter` varchar(50) DEFAULT NULL,
  `profile_description` text DEFAULT NULL,
  `profile_values` text DEFAULT NULL,
  PRIMARY KEY (`profile_parameter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_conference_profile_params`
--

DROP TABLE IF EXISTS `v_conference_profile_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_conference_profile_params` (
  `conference_profile_param_uuid` char(36) NOT NULL,
  `conference_profile_uuid` char(36) DEFAULT NULL,
  `profile_param_name` text DEFAULT NULL,
  `profile_param_value` text DEFAULT NULL,
  `profile_param_enabled` text DEFAULT NULL,
  `profile_param_description` text DEFAULT NULL,
  PRIMARY KEY (`conference_profile_param_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_conference_profiles`
--

DROP TABLE IF EXISTS `v_conference_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_conference_profiles` (
  `conference_profile_uuid` char(36) NOT NULL,
  `profile_name` text DEFAULT NULL,
  `profile_enabled` text DEFAULT NULL,
  `profile_description` text DEFAULT NULL,
  PRIMARY KEY (`conference_profile_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_conference_rooms`
--

DROP TABLE IF EXISTS `v_conference_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_conference_rooms` (
  `domain_uuid` char(36) DEFAULT NULL,
  `conference_room_uuid` char(36) NOT NULL,
  `conference_center_uuid` char(36) DEFAULT NULL,
  `meeting_uuid` char(36) DEFAULT NULL,
  `conference_room_name` text DEFAULT NULL,
  `participante_email` text DEFAULT NULL,
  `profile` text DEFAULT NULL,
  `record` text DEFAULT NULL,
  `max_members` decimal(10,0) DEFAULT NULL,
  `start_datetime` text DEFAULT NULL,
  `stop_datetime` text DEFAULT NULL,
  `wait_mod` text DEFAULT NULL,
  `announce` text DEFAULT NULL,
  `sounds` text DEFAULT NULL,
  `mute` text DEFAULT NULL,
  `created` text DEFAULT NULL,
  `created_by` text DEFAULT NULL,
  `enabled` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`conference_room_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_conference_session_details`
--

DROP TABLE IF EXISTS `v_conference_session_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_conference_session_details` (
  `domain_uuid` char(36) DEFAULT NULL,
  `conference_session_detail_uuid` char(36) NOT NULL,
  `conference_session_uuid` char(36) DEFAULT NULL,
  `meeting_uuid` char(36) DEFAULT NULL,
  `username` text DEFAULT NULL,
  `caller_id_name` text DEFAULT NULL,
  `caller_id_number` text DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL,
  `moderator` text DEFAULT NULL,
  `network_addr` text DEFAULT NULL,
  `start_epoch` decimal(10,0) DEFAULT NULL,
  `end_epoch` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`conference_session_detail_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_conference_sessions`
--

DROP TABLE IF EXISTS `v_conference_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_conference_sessions` (
  `domain_uuid` char(36) DEFAULT NULL,
  `conference_session_uuid` char(36) NOT NULL,
  `meeting_uuid` char(36) DEFAULT NULL,
  `profile` text DEFAULT NULL,
  `recording` text DEFAULT NULL,
  `start_epoch` decimal(10,0) DEFAULT NULL,
  `end_epoch` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`conference_session_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_conference_users`
--

DROP TABLE IF EXISTS `v_conference_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_conference_users` (
  `conference_user_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `conference_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`conference_user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_conferences`
--

DROP TABLE IF EXISTS `v_conferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_conferences` (
  `domain_uuid` char(36) DEFAULT NULL,
  `conference_uuid` char(36) NOT NULL,
  `dialplan_uuid` char(36) DEFAULT NULL,
  `conference_name` text DEFAULT NULL,
  `conference_extension` text DEFAULT NULL,
  `conference_pin_number` text DEFAULT NULL,
  `conference_profile` text DEFAULT NULL,
  `conference_flags` text DEFAULT NULL,
  `conference_order` decimal(10,0) DEFAULT NULL,
  `conference_description` text DEFAULT NULL,
  `conference_enabled` text DEFAULT NULL,
  PRIMARY KEY (`conference_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_contact_addresses`
--

DROP TABLE IF EXISTS `v_contact_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_contact_addresses` (
  `contact_address_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `address_type` text DEFAULT NULL,
  `address_label` text DEFAULT NULL,
  `address_primary` decimal(10,0) DEFAULT NULL,
  `address_street` text DEFAULT NULL,
  `address_extended` text DEFAULT NULL,
  `address_community` text DEFAULT NULL,
  `address_locality` text DEFAULT NULL,
  `address_region` text DEFAULT NULL,
  `address_postal_code` text DEFAULT NULL,
  `address_country` text DEFAULT NULL,
  `address_latitude` text DEFAULT NULL,
  `address_longitude` text DEFAULT NULL,
  `address_description` text DEFAULT NULL,
  PRIMARY KEY (`contact_address_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_contact_emails`
--

DROP TABLE IF EXISTS `v_contact_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_contact_emails` (
  `contact_email_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `email_label` text DEFAULT NULL,
  `email_primary` decimal(10,0) DEFAULT NULL,
  `email_address` text DEFAULT NULL,
  `email_description` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `email_password` text DEFAULT NULL,
  `email_username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`contact_email_uuid`),
  KEY `contact_uuid` (`contact_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_contact_groups`
--

DROP TABLE IF EXISTS `v_contact_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_contact_groups` (
  `contact_group_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `group_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`contact_group_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_contact_notes`
--

DROP TABLE IF EXISTS `v_contact_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_contact_notes` (
  `contact_note_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `contact_note` text DEFAULT NULL,
  `last_mod_date` text DEFAULT NULL,
  `last_mod_user` text DEFAULT NULL,
  PRIMARY KEY (`contact_note_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_contact_phones`
--

DROP TABLE IF EXISTS `v_contact_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_contact_phones` (
  `contact_phone_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `phone_type_voice` decimal(10,0) DEFAULT NULL,
  `phone_type_fax` decimal(10,0) DEFAULT NULL,
  `phone_type_video` decimal(10,0) DEFAULT NULL,
  `phone_type_text` decimal(10,0) DEFAULT NULL,
  `phone_label` text DEFAULT NULL,
  `phone_primary` decimal(10,0) DEFAULT NULL,
  `phone_number` text DEFAULT NULL,
  `phone_extension` text DEFAULT NULL,
  `phone_speed_dial` text DEFAULT NULL,
  `phone_description` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`contact_phone_uuid`),
  KEY `contact_uuid` (`contact_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_contact_relations`
--

DROP TABLE IF EXISTS `v_contact_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_contact_relations` (
  `contact_relation_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `relation_label` text DEFAULT NULL,
  `relation_contact_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`contact_relation_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_contact_settings`
--

DROP TABLE IF EXISTS `v_contact_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_contact_settings` (
  `contact_setting_uuid` char(36) NOT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `contact_setting_category` text DEFAULT NULL,
  `contact_setting_subcategory` text DEFAULT NULL,
  `contact_setting_name` text DEFAULT NULL,
  `contact_setting_value` text DEFAULT NULL,
  `contact_setting_order` decimal(10,0) DEFAULT NULL,
  `contact_setting_enabled` text DEFAULT NULL,
  `contact_setting_description` text DEFAULT NULL,
  PRIMARY KEY (`contact_setting_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_contact_times`
--

DROP TABLE IF EXISTS `v_contact_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_contact_times` (
  `domain_uuid` char(36) DEFAULT NULL,
  `contact_time_uuid` char(36) NOT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `time_start` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `time_stop` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `time_description` text DEFAULT NULL,
  PRIMARY KEY (`contact_time_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_contact_today_attempts`
--

DROP TABLE IF EXISTS `v_contact_today_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_contact_today_attempts` (
  `contact_attempts_uuid` char(36) NOT NULL,
  `contact_broadcast_uuid` char(36) NOT NULL,
  `attempts` varchar(40) DEFAULT NULL,
  `phonenumber` varchar(15) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`contact_attempts_uuid`),
  KEY `created_on` (`created_on`),
  KEY `attempts` (`attempts`),
  KEY `contact_broadcast_uuid` (`contact_broadcast_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_contact_urls`
--

DROP TABLE IF EXISTS `v_contact_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_contact_urls` (
  `contact_url_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `url_type` text DEFAULT NULL,
  `url_label` text DEFAULT NULL,
  `url_primary` decimal(10,0) DEFAULT NULL,
  `url_address` text DEFAULT NULL,
  `url_description` text DEFAULT NULL,
  PRIMARY KEY (`contact_url_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_contact_users`
--

DROP TABLE IF EXISTS `v_contact_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_contact_users` (
  `contact_user_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`contact_user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_contacts`
--

DROP TABLE IF EXISTS `v_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_contacts` (
  `contact_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `contact_parent_uuid` char(36) DEFAULT NULL,
  `contact_type` text DEFAULT NULL,
  `contact_organization` text DEFAULT NULL,
  `contact_name_prefix` text DEFAULT NULL,
  `contact_name_given` text DEFAULT NULL,
  `contact_name_middle` text DEFAULT NULL,
  `contact_name_family` text DEFAULT NULL,
  `contact_name_suffix` text DEFAULT NULL,
  `contact_nickname` text DEFAULT NULL,
  `contact_title` text DEFAULT NULL,
  `contact_role` text DEFAULT NULL,
  `contact_category` text DEFAULT NULL,
  `contact_url` text DEFAULT NULL,
  `contact_time_zone` text DEFAULT NULL,
  `contact_note` text DEFAULT NULL,
  `last_mod_date` text DEFAULT NULL,
  `last_mod_user` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`contact_uuid`),
  KEY `contact_nickname` (`contact_nickname`(15)),
  KEY `contact_parent_uuid` (`contact_parent_uuid`) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_countries`
--

DROP TABLE IF EXISTS `v_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_countries` (
  `country_uuid` char(36) NOT NULL,
  `country` text DEFAULT NULL,
  `iso_a2` text DEFAULT NULL,
  `iso_a3` text DEFAULT NULL,
  `num` decimal(10,0) DEFAULT NULL,
  `calling_code` text DEFAULT NULL,
  PRIMARY KEY (`country_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_crm_ans`
--

DROP TABLE IF EXISTS `v_crm_ans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_crm_ans` (
  `crm_ans_uuid` char(36) NOT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `crm_uuid` char(36) DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `crm_ans` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `call_state_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`crm_ans_uuid`),
  KEY `user_uuid` (`user_uuid`),
  KEY `crm_uuid` (`crm_uuid`),
  KEY `created_at` (`created_at`),
  KEY `deleted_at` (`deleted_at`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_crm_design`
--

DROP TABLE IF EXISTS `v_crm_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_crm_design` (
  `crm_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `crm_name` varchar(50) DEFAULT NULL,
  `status` enum('1','0') DEFAULT NULL,
  `type` char(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `crm_data` text DEFAULT NULL,
  PRIMARY KEY (`crm_uuid`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_crm_has_campaign`
--

DROP TABLE IF EXISTS `v_crm_has_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_crm_has_campaign` (
  `has_campaign` int(11) NOT NULL AUTO_INCREMENT,
  `crm_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`has_campaign`),
  KEY `crm_uuid` (`crm_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_dashboard_setting`
--

DROP TABLE IF EXISTS `v_dashboard_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_dashboard_setting` (
  `user_uuid` char(36) DEFAULT 'NULL',
  `customize_data_string` text DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_data_archive`
--

DROP TABLE IF EXISTS `v_data_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_data_archive` (
  `data_archive_uuid` char(36) NOT NULL,
  `old_archive_month` int(11) DEFAULT NULL,
  `archival_start_date` int(3) DEFAULT NULL,
  `archival_start_time` varchar(50) DEFAULT NULL,
  `hour_duration` int(11) DEFAULT NULL,
  `last_data_archival_date` date DEFAULT NULL,
  `fail_comment` text DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`data_archive_uuid`),
  KEY `archival_start_date` (`archival_start_date`),
  KEY `archival_start_time` (`archival_start_time`),
  KEY `hour_duration` (`hour_duration`),
  KEY `last_data_archival_date` (`last_data_archival_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_database_transactions`
--

DROP TABLE IF EXISTS `v_database_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_database_transactions` (
  `domain_uuid` char(36) DEFAULT NULL,
  `database_transaction_uuid` char(36) NOT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `app_name` text DEFAULT NULL,
  `app_uuid` char(36) DEFAULT NULL,
  `transaction_code` text DEFAULT NULL,
  `transaction_address` text DEFAULT NULL,
  `transaction_type` text DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `transaction_old` text DEFAULT NULL,
  `transaction_new` text DEFAULT NULL,
  `transaction_result` mediumtext DEFAULT NULL,
  PRIMARY KEY (`database_transaction_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_databases`
--

DROP TABLE IF EXISTS `v_databases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_databases` (
  `database_uuid` char(36) NOT NULL,
  `database_driver` text DEFAULT NULL,
  `database_type` text DEFAULT NULL,
  `database_host` text DEFAULT NULL,
  `database_port` text DEFAULT NULL,
  `database_name` text DEFAULT NULL,
  `database_username` text DEFAULT NULL,
  `database_password` text DEFAULT NULL,
  `database_path` text DEFAULT NULL,
  `database_description` text DEFAULT NULL,
  PRIMARY KEY (`database_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_default_settings`
--

DROP TABLE IF EXISTS `v_default_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_default_settings` (
  `default_setting_uuid` char(36) NOT NULL,
  `app_uuid` char(36) DEFAULT NULL,
  `default_setting_category` text DEFAULT NULL,
  `default_setting_subcategory` text DEFAULT NULL,
  `default_setting_name` text DEFAULT NULL,
  `default_setting_value` text DEFAULT NULL,
  `default_setting_order` decimal(10,0) DEFAULT NULL,
  `default_setting_enabled` text DEFAULT NULL,
  `default_setting_description` text DEFAULT NULL,
  PRIMARY KEY (`default_setting_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_destinations`
--

DROP TABLE IF EXISTS `v_destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_destinations` (
  `domain_uuid` char(36) DEFAULT NULL,
  `destination_uuid` char(36) NOT NULL,
  `dialplan_uuid` char(36) DEFAULT NULL,
  `fax_uuid` char(36) DEFAULT NULL,
  `destination_type` text DEFAULT NULL,
  `destination_number` text DEFAULT NULL,
  `destination_number_regex` text DEFAULT NULL,
  `destination_caller_id_name` text DEFAULT NULL,
  `destination_caller_id_number` text DEFAULT NULL,
  `destination_cid_name_prefix` text DEFAULT NULL,
  `destination_context` text DEFAULT NULL,
  `destination_app` text DEFAULT NULL,
  `destination_data` text DEFAULT NULL,
  `destination_enabled` text DEFAULT NULL,
  `destination_description` text DEFAULT NULL,
  `destination_accountcode` text DEFAULT NULL,
  `old_dialplan_uuid` char(36) DEFAULT NULL,
  `destination_gateway` text DEFAULT NULL,
  PRIMARY KEY (`destination_uuid`),
  KEY `destination_number` (`destination_number`(768)),
  KEY `dialplan_uuid` (`dialplan_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_device_keys`
--

DROP TABLE IF EXISTS `v_device_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_device_keys` (
  `domain_uuid` char(36) DEFAULT NULL,
  `device_key_uuid` char(36) NOT NULL,
  `device_uuid` char(36) DEFAULT NULL,
  `device_profile_uuid` char(36) DEFAULT NULL,
  `device_key_id` decimal(10,0) DEFAULT NULL,
  `device_key_category` text DEFAULT NULL,
  `device_key_vendor` text DEFAULT NULL,
  `device_key_type` text DEFAULT NULL,
  `device_key_line` decimal(10,0) DEFAULT NULL,
  `device_key_value` text DEFAULT NULL,
  `device_key_extension` text DEFAULT NULL,
  `device_key_protected` text DEFAULT NULL,
  `device_key_label` text DEFAULT NULL,
  PRIMARY KEY (`device_key_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_device_lines`
--

DROP TABLE IF EXISTS `v_device_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_device_lines` (
  `domain_uuid` char(36) DEFAULT NULL,
  `device_line_uuid` char(36) NOT NULL,
  `device_uuid` char(36) DEFAULT NULL,
  `line_number` text DEFAULT NULL,
  `server_address` text DEFAULT NULL,
  `outbound_proxy_primary` text DEFAULT NULL,
  `outbound_proxy_secondary` text DEFAULT NULL,
  `display_name` text DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `auth_id` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `sip_port` decimal(10,0) DEFAULT NULL,
  `sip_transport` text DEFAULT NULL,
  `register_expires` decimal(10,0) DEFAULT NULL,
  `enabled` text DEFAULT NULL,
  PRIMARY KEY (`device_line_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_device_profiles`
--

DROP TABLE IF EXISTS `v_device_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_device_profiles` (
  `device_profile_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `device_profile_name` text DEFAULT NULL,
  `device_profile_enabled` text DEFAULT NULL,
  `device_profile_description` text DEFAULT NULL,
  PRIMARY KEY (`device_profile_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_device_settings`
--

DROP TABLE IF EXISTS `v_device_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_device_settings` (
  `device_setting_uuid` char(36) NOT NULL,
  `device_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `device_setting_category` text DEFAULT NULL,
  `device_setting_subcategory` text DEFAULT NULL,
  `device_setting_name` text DEFAULT NULL,
  `device_setting_value` text DEFAULT NULL,
  `device_setting_enabled` text DEFAULT NULL,
  `device_setting_description` text DEFAULT NULL,
  `device_profile_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`device_setting_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_device_vendor_function_groups`
--

DROP TABLE IF EXISTS `v_device_vendor_function_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_device_vendor_function_groups` (
  `device_vendor_function_group_uuid` char(36) NOT NULL,
  `device_vendor_function_uuid` char(36) DEFAULT NULL,
  `device_vendor_uuid` char(36) DEFAULT NULL,
  `group_name` text DEFAULT NULL,
  `group_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`device_vendor_function_group_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_device_vendor_functions`
--

DROP TABLE IF EXISTS `v_device_vendor_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_device_vendor_functions` (
  `device_vendor_function_uuid` char(36) NOT NULL,
  `device_vendor_uuid` char(36) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `value` text DEFAULT NULL,
  `enabled` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`device_vendor_function_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_device_vendors`
--

DROP TABLE IF EXISTS `v_device_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_device_vendors` (
  `device_vendor_uuid` char(36) NOT NULL,
  `name` text DEFAULT NULL,
  `enabled` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`device_vendor_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_devices`
--

DROP TABLE IF EXISTS `v_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_devices` (
  `device_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `device_profile_uuid` char(36) DEFAULT NULL,
  `device_mac_address` text DEFAULT NULL,
  `device_label` text DEFAULT NULL,
  `device_vendor` text DEFAULT NULL,
  `device_model` text DEFAULT NULL,
  `device_firmware_version` text DEFAULT NULL,
  `device_enabled` text DEFAULT NULL,
  `device_template` text DEFAULT NULL,
  `device_user_uuid` char(36) DEFAULT NULL,
  `device_username` text DEFAULT NULL,
  `device_password` text DEFAULT NULL,
  `device_uuid_alternate` char(36) DEFAULT NULL,
  `device_description` text DEFAULT NULL,
  `device_provisioned_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `device_provisioned_method` text DEFAULT NULL,
  `device_provisioned_ip` text DEFAULT NULL,
  PRIMARY KEY (`device_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_dialplan_details`
--

DROP TABLE IF EXISTS `v_dialplan_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_dialplan_details` (
  `domain_uuid` char(36) DEFAULT NULL,
  `dialplan_uuid` char(36) DEFAULT NULL,
  `dialplan_detail_uuid` char(36) NOT NULL,
  `dialplan_detail_tag` text DEFAULT NULL,
  `dialplan_detail_type` text DEFAULT NULL,
  `dialplan_detail_data` text DEFAULT NULL,
  `dialplan_detail_break` text DEFAULT NULL,
  `dialplan_detail_inline` text DEFAULT NULL,
  `dialplan_detail_group` decimal(10,0) DEFAULT NULL,
  `dialplan_detail_order` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`dialplan_detail_uuid`),
  KEY `dialplan_uuid` (`dialplan_uuid`),
  KEY `domain_uuid` (`domain_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_dialplans`
--

DROP TABLE IF EXISTS `v_dialplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_dialplans` (
  `domain_uuid` char(36) DEFAULT NULL,
  `dialplan_uuid` char(36) NOT NULL,
  `app_uuid` char(36) DEFAULT NULL,
  `hostname` text DEFAULT NULL,
  `dialplan_context` text DEFAULT NULL,
  `dialplan_name` text DEFAULT NULL,
  `dialplan_number` text DEFAULT NULL,
  `dialplan_continue` text DEFAULT NULL,
  `dialplan_xml` text DEFAULT NULL,
  `dialplan_order` decimal(10,0) DEFAULT NULL,
  `dialplan_enabled` text DEFAULT NULL,
  `dialplan_description` text DEFAULT NULL,
  `dialplans_lang_code` text DEFAULT NULL,
  `caller_id` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `tc_timezone` char(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `default_queue_uuid` char(36) DEFAULT NULL,
  `default_broadcast_uuid` char(36) DEFAULT NULL,
  `region_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`dialplan_uuid`),
  KEY `domain_uuid` (`domain_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_disposition`
--

DROP TABLE IF EXISTS `v_disposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_disposition` (
  `disposition_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `domain_parent_uuid` char(36) DEFAULT NULL,
  `disposition_name` text DEFAULT NULL,
  `disposition_name_link` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `digit` text DEFAULT NULL,
  `disposition_tts` text DEFAULT NULL,
  `parent_dispostion` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `last_node` int(11) DEFAULT NULL,
  `main_disposition_uuid` char(36) DEFAULT NULL,
  `disposition_type` varchar(50) DEFAULT NULL,
  `lead_type` varchar(50) DEFAULT NULL,
  `number_of_attempts` int(11) DEFAULT NULL,
  `interval_between_attempts` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_remark_mandatory` char(36) DEFAULT '0',
  `custom_field` text DEFAULT NULL,
  `custom_field_name` char(100) DEFAULT NULL,
  `custom_field_type` char(36) DEFAULT NULL,
  `dnc_expire` int(11) DEFAULT NULL,
  PRIMARY KEY (`disposition_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_disposition_has_campaign`
--

DROP TABLE IF EXISTS `v_disposition_has_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_disposition_has_campaign` (
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `disposition_uuid` char(36) DEFAULT NULL,
  `max_attempts` int(11) DEFAULT NULL,
  `retry_interval` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_dmi_agencies`
--

DROP TABLE IF EXISTS `v_dmi_agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_dmi_agencies` (
  `agency_uuid` char(36) NOT NULL,
  `agency_name` varchar(25) NOT NULL,
  `agency_zone` varchar(40) NOT NULL,
  `agency_source` varchar(40) NOT NULL,
  `other_fields` text DEFAULT NULL,
  `pre_campaign_uuid` char(36) NOT NULL,
  `pre_queue_uuid` char(36) NOT NULL,
  `post_campaign_uuid` char(36) NOT NULL,
  `post_queue_uuid` char(36) NOT NULL,
  `enabled` int(1) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_dnc`
--

DROP TABLE IF EXISTS `v_dnc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_dnc` (
  `dnc_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dnc_list_type` varchar(50) DEFAULT NULL,
  `dnc_campaign_uuid` text DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`dnc_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_dnc_has_campaign`
--

DROP TABLE IF EXISTS `v_dnc_has_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_dnc_has_campaign` (
  `dnc_queue_uuid` char(36) NOT NULL,
  `dnc_uuid` char(36) NOT NULL,
  `call_broadcast_uuid` char(36) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`dnc_queue_uuid`),
  KEY `dnc_uuid` (`dnc_uuid`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_dnc_list`
--

DROP TABLE IF EXISTS `v_dnc_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_dnc_list` (
  `dnc_list_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `dnc_uuid` char(36) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `number_type` varchar(2) NOT NULL DEFAULT 'NA',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `dnc_expire_on` datetime DEFAULT NULL,
  PRIMARY KEY (`dnc_list_uuid`),
  KEY `phone_number` (`phone_number`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_domain_settings`
--

DROP TABLE IF EXISTS `v_domain_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_domain_settings` (
  `domain_uuid` char(36) DEFAULT NULL,
  `domain_setting_uuid` char(36) NOT NULL,
  `app_uuid` char(36) DEFAULT NULL,
  `domain_setting_category` text DEFAULT NULL,
  `domain_setting_subcategory` text DEFAULT NULL,
  `domain_setting_name` text DEFAULT NULL,
  `domain_setting_value` text DEFAULT NULL,
  `domain_setting_order` decimal(10,0) DEFAULT NULL,
  `domain_setting_enabled` text DEFAULT NULL,
  `domain_setting_description` text DEFAULT NULL,
  PRIMARY KEY (`domain_setting_uuid`),
  KEY `domain_setting_uuid` (`domain_setting_uuid`) USING BTREE,
  KEY `app_uuid` (`app_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_domain_transaction`
--

DROP TABLE IF EXISTS `v_domain_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_domain_transaction` (
  `domain_uuid` char(36) DEFAULT NULL,
  `domain_transaction_uuid` char(36) NOT NULL,
  `num_of_extension` int(11) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  PRIMARY KEY (`domain_transaction_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_domains`
--

DROP TABLE IF EXISTS `v_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_domains` (
  `domain_uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `domain_parent_uuid` char(36) DEFAULT NULL,
  `domain_name` mediumtext DEFAULT NULL,
  `domain_location` mediumtext DEFAULT NULL,
  `extension_limit` int(11) DEFAULT NULL,
  `domain_enabled` mediumtext DEFAULT NULL,
  `domain_description` mediumtext DEFAULT NULL,
  `login_by_captcha` char(10) DEFAULT NULL,
  `company_information_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`domain_uuid`),
  KEY `domain_enabled` (`domain_enabled`(10)) USING BTREE,
  KEY `domain_parent_uuid` (`domain_parent_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_dt_crm`
--

DROP TABLE IF EXISTS `v_dt_crm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_dt_crm` (
  `dt_crm_uuid` char(36) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `agent_id` char(36) DEFAULT NULL,
  `user_token` varchar(100) DEFAULT NULL,
  `extension` varchar(15) DEFAULT NULL,
  `location_id` char(36) DEFAULT NULL,
  `location_name` text DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `agent_status` varchar(50) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_emails`
--

DROP TABLE IF EXISTS `v_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_emails` (
  `email_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `sent_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  PRIMARY KEY (`email_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_emergency_numbers`
--

DROP TABLE IF EXISTS `v_emergency_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_emergency_numbers` (
  `uuid` char(36) DEFAULT NULL,
  `emergency_name` varchar(50) DEFAULT NULL,
  `emergency_number` varchar(20) NOT NULL,
  `status` enum('0','1') DEFAULT NULL,
  `domain_uuid` char(36) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT 'NULL',
  KEY `emergency_name` (`emergency_name`),
  KEY `emergency_number` (`emergency_number`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_evaluation_additional_info_mapping`
--

DROP TABLE IF EXISTS `v_evaluation_additional_info_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_evaluation_additional_info_mapping` (
  `additional_info_mapping_uuid` char(50) NOT NULL,
  `evaluation_uuid` char(50) NOT NULL,
  `script_uuid` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_evaluation_additional_info_mapping_rating`
--

DROP TABLE IF EXISTS `v_evaluation_additional_info_mapping_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_evaluation_additional_info_mapping_rating` (
  `additional_info_mapping_rating_uuid` char(36) NOT NULL,
  `evaluation_form_uuid` char(36) NOT NULL,
  `script_uuid` char(36) NOT NULL,
  `evaluation_call_list_uuid` char(36) NOT NULL,
  `call_uuid` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_evalution_call_list`
--

DROP TABLE IF EXISTS `v_evalution_call_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_evalution_call_list` (
  `evalution_call_uuid` char(36) NOT NULL,
  `task_uuid` char(36) NOT NULL,
  `evalution_call_start_time` text DEFAULT NULL,
  `evalution_call_end_time` text DEFAULT NULL,
  `evalution_call_status` text DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `duration` text DEFAULT NULL,
  `disconnectby` text DEFAULT NULL,
  `call_xfer` text DEFAULT NULL,
  `is_disable` text DEFAULT NULL,
  `deleted_at` text DEFAULT NULL,
  `evaluator_uuid` char(36) DEFAULT NULL,
  `reevaluation_uuid` char(36) DEFAULT NULL,
  `call_reevaluated` char(36) DEFAULT 'no',
  `evaluation_call_list_uuid` char(36) DEFAULT NULL,
  KEY `evalution_call_uuid` (`evalution_call_uuid`),
  KEY `task_uuid` (`task_uuid`),
  KEY `evalution_call_start_time` (`evalution_call_start_time`(20)),
  KEY `evalution_call_status` (`evalution_call_status`(10)),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `is_disable` (`is_disable`(5)),
  KEY `deleted_at` (`deleted_at`(20)),
  KEY `evaluator_uuid` (`evaluator_uuid`),
  KEY `reevaluation_uuid` (`reevaluation_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_evalution_call_ratings`
--

DROP TABLE IF EXISTS `v_evalution_call_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_evalution_call_ratings` (
  `call_rating_form_uuid` char(36) NOT NULL,
  `start_time` text DEFAULT NULL,
  `end_time` text DEFAULT NULL,
  `call_rating_status` text DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `form_id` char(36) DEFAULT NULL,
  `call_rating_form_total_value` text DEFAULT NULL,
  `call_rating_form_assign_value` text DEFAULT NULL,
  `task_uuid` char(36) DEFAULT NULL,
  `form_remark` text DEFAULT NULL,
  `evaluation_call_list_uuid` char(36) DEFAULT NULL,
  `is_autofail` text DEFAULT NULL,
  KEY `evalution_form_uuid` (`call_rating_form_uuid`) USING BTREE,
  KEY `task_uuid` (`task_uuid`) USING BTREE,
  KEY `call_id` (`call_id`),
  KEY `form_id` (`form_id`),
  KEY `domain_uuid` (`domain_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_evalution_call_section_ratings`
--

DROP TABLE IF EXISTS `v_evalution_call_section_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_evalution_call_section_ratings` (
  `call_rating_section_uuid` char(36) NOT NULL,
  `call_rating_form_uuid` char(36) DEFAULT NULL,
  `section_total_rating_points` text DEFAULT NULL,
  `section_total_assign_rating_points` text DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `section_id` char(36) DEFAULT NULL,
  `section_name` char(36) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  `task_uuid` char(36) DEFAULT NULL,
  `evaluation_call_list_uuid` char(36) DEFAULT NULL,
  KEY `task_uuid` (`task_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_evalution_call_work_time`
--

DROP TABLE IF EXISTS `v_evalution_call_work_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_evalution_call_work_time` (
  `v_evalution_call_work_time_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `start_time` text DEFAULT NULL,
  `end_time` text DEFAULT NULL,
  PRIMARY KEY (`v_evalution_call_work_time_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_evalution_form`
--

DROP TABLE IF EXISTS `v_evalution_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_evalution_form` (
  `evalution_form_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `evalution_form_name` text DEFAULT NULL,
  `evalution_form_status` text DEFAULT NULL,
  `evalution_form_desc` text DEFAULT NULL,
  `created_by` text DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_uuid` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`evalution_form_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_evalution_form_for_report`
--

DROP TABLE IF EXISTS `v_evalution_form_for_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_evalution_form_for_report` (
  `evalution_form_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `evalution_form_name` text DEFAULT NULL,
  `evalution_form_status` text DEFAULT NULL,
  `evalution_form_desc` text DEFAULT NULL,
  `call_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_evalution_form_question_rating`
--

DROP TABLE IF EXISTS `v_evalution_form_question_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_evalution_form_question_rating` (
  `call_rating_question_uuid` char(36) NOT NULL,
  `call_rating_section_uuid` char(36) DEFAULT NULL,
  `parameter_title` text DEFAULT NULL,
  `total_rating_points` text DEFAULT NULL,
  `total_assign_rating_points` text DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `question_id` char(36) DEFAULT NULL,
  `question_name` text DEFAULT NULL,
  `call_id` text DEFAULT NULL,
  `task_uuid` char(36) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `evaluation_call_list_uuid` char(36) DEFAULT NULL,
  `parent_question_uuid` char(36) DEFAULT NULL,
  KEY `task_uuid` (`task_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_evalution_form_section`
--

DROP TABLE IF EXISTS `v_evalution_form_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_evalution_form_section` (
  `evalution_section_uuid` char(36) NOT NULL,
  `evalution_form_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `evalution_section_name` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_evalution_form_section_for_report`
--

DROP TABLE IF EXISTS `v_evalution_form_section_for_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_evalution_form_section_for_report` (
  `evalution_section_uuid` char(36) NOT NULL,
  `evalution_form_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `evalution_section_name` text DEFAULT NULL,
  `call_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_evalution_task`
--

DROP TABLE IF EXISTS `v_evalution_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_evalution_task` (
  `task_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `task_creator_uuid` char(36) DEFAULT NULL,
  `task_assignee_uuid` char(36) DEFAULT NULL,
  `task_start_time` text DEFAULT NULL,
  `task_end_time` text DEFAULT NULL,
  `task_status` text DEFAULT NULL,
  `no_of_calls` text DEFAULT NULL,
  `task_filter_json` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `task_name` text DEFAULT NULL,
  `deleted_at` text DEFAULT NULL,
  `task_reassign` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`task_uuid`),
  KEY `task_assignee_uuid` (`task_assignee_uuid`),
  KEY `task_creator_uuid` (`task_creator_uuid`),
  KEY `created_at` (`created_at`),
  KEY `updated_at` (`updated_at`),
  KEY `deleted_at` (`deleted_at`(22)),
  KEY `task_status` (`task_status`(10)),
  KEY `task_start_time` (`task_start_time`(20)),
  KEY `task_end_time` (`task_end_time`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_evalutionform_has_campaign`
--

DROP TABLE IF EXISTS `v_evalutionform_has_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_evalutionform_has_campaign` (
  `v_evalutionform_campaign_id` char(36) NOT NULL,
  `v_evalutionform_queue_id` char(36) NOT NULL,
  `evalution_form_uuid` char(36) NOT NULL,
  `status` text NOT NULL,
  KEY `v_evalutionform_queue_id` (`v_evalutionform_queue_id`),
  KEY `v_evalutionform_campaign_id` (`v_evalutionform_campaign_id`),
  KEY `evalution_form_uuid` (`evalution_form_uuid`),
  KEY `status` (`status`(5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_evalutionform_parameters`
--

DROP TABLE IF EXISTS `v_evalutionform_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_evalutionform_parameters` (
  `evalutionform_parameters_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) NOT NULL,
  `evalution_form_uuid` char(36) DEFAULT NULL,
  `evalution_section_uuid` char(36) DEFAULT NULL,
  `parameter_title` text DEFAULT NULL,
  `input_type` text DEFAULT NULL,
  `input_value` text DEFAULT NULL,
  `input_points` text DEFAULT NULL,
  `maximum_input_points` text DEFAULT NULL,
  `default_value` text DEFAULT NULL,
  `input_name` text DEFAULT NULL,
  `inpur_required` text DEFAULT NULL,
  `ordering` text DEFAULT NULL,
  `default_point` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `not_applicable` text DEFAULT NULL,
  `allow_auto_fail` text DEFAULT NULL,
  `parent_question_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`evalutionform_parameters_uuid`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `evalution_form_uuid` (`evalution_form_uuid`),
  KEY `evalution_section_uuid` (`evalution_section_uuid`),
  KEY `ordering` (`ordering`(5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_evalutionform_parameters_for_report`
--

DROP TABLE IF EXISTS `v_evalutionform_parameters_for_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_evalutionform_parameters_for_report` (
  `evalutionform_parameters_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `evalution_form_uuid` char(36) DEFAULT NULL,
  `evalution_section_uuid` char(36) DEFAULT NULL,
  `parameter_title` text DEFAULT NULL,
  `input_type` text DEFAULT NULL,
  `input_value` text DEFAULT NULL,
  `input_points` text DEFAULT NULL,
  `maximum_input_points` text DEFAULT NULL,
  `default_value` text DEFAULT NULL,
  `input_name` text DEFAULT NULL,
  `inpur_required` text DEFAULT NULL,
  `ordering` text DEFAULT NULL,
  `default_point` text DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `task_uuid` char(36) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `form_remark` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `not_applicable` text DEFAULT NULL,
  `not_applicable_for_report` text DEFAULT NULL,
  `evaluation_call_list_uuid` char(36) DEFAULT NULL,
  `allow_auto_fail` text DEFAULT NULL,
  `autofail` text DEFAULT NULL,
  `parent_question_uuid` char(36) DEFAULT NULL,
  KEY `task_uuid` (`task_uuid`) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`),
  KEY `evalution_form_uuid` (`evalution_form_uuid`),
  KEY `evalution_section_uuid` (`evalution_section_uuid`),
  KEY `deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs`
--

DROP TABLE IF EXISTS `v_event_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20241224`
--

DROP TABLE IF EXISTS `v_event_logs_20241224`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20241224` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20241225`
--

DROP TABLE IF EXISTS `v_event_logs_20241225`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20241225` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20241226`
--

DROP TABLE IF EXISTS `v_event_logs_20241226`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20241226` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20241227`
--

DROP TABLE IF EXISTS `v_event_logs_20241227`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20241227` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20241229`
--

DROP TABLE IF EXISTS `v_event_logs_20241229`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20241229` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20241230`
--

DROP TABLE IF EXISTS `v_event_logs_20241230`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20241230` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20241231`
--

DROP TABLE IF EXISTS `v_event_logs_20241231`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20241231` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=446 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250101`
--

DROP TABLE IF EXISTS `v_event_logs_20250101`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250101` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250102`
--

DROP TABLE IF EXISTS `v_event_logs_20250102`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250102` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250103`
--

DROP TABLE IF EXISTS `v_event_logs_20250103`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250103` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=678 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250107`
--

DROP TABLE IF EXISTS `v_event_logs_20250107`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250107` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250109`
--

DROP TABLE IF EXISTS `v_event_logs_20250109`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250109` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250110`
--

DROP TABLE IF EXISTS `v_event_logs_20250110`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250110` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250111`
--

DROP TABLE IF EXISTS `v_event_logs_20250111`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250111` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250113`
--

DROP TABLE IF EXISTS `v_event_logs_20250113`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250113` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=897 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250114`
--

DROP TABLE IF EXISTS `v_event_logs_20250114`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250114` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250115`
--

DROP TABLE IF EXISTS `v_event_logs_20250115`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250115` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250116`
--

DROP TABLE IF EXISTS `v_event_logs_20250116`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250116` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=712 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250117`
--

DROP TABLE IF EXISTS `v_event_logs_20250117`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250117` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=526 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250118`
--

DROP TABLE IF EXISTS `v_event_logs_20250118`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250118` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250119`
--

DROP TABLE IF EXISTS `v_event_logs_20250119`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250119` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=551 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250121`
--

DROP TABLE IF EXISTS `v_event_logs_20250121`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250121` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250122`
--

DROP TABLE IF EXISTS `v_event_logs_20250122`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250122` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250124`
--

DROP TABLE IF EXISTS `v_event_logs_20250124`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250124` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1069 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250206`
--

DROP TABLE IF EXISTS `v_event_logs_20250206`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250206` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250207`
--

DROP TABLE IF EXISTS `v_event_logs_20250207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250207` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=596 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250208`
--

DROP TABLE IF EXISTS `v_event_logs_20250208`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250208` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250210`
--

DROP TABLE IF EXISTS `v_event_logs_20250210`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250210` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250211`
--

DROP TABLE IF EXISTS `v_event_logs_20250211`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250211` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250213`
--

DROP TABLE IF EXISTS `v_event_logs_20250213`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250213` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=790 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250214`
--

DROP TABLE IF EXISTS `v_event_logs_20250214`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250214` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1304 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250215`
--

DROP TABLE IF EXISTS `v_event_logs_20250215`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250215` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250216`
--

DROP TABLE IF EXISTS `v_event_logs_20250216`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250216` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250217`
--

DROP TABLE IF EXISTS `v_event_logs_20250217`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250217` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=2821 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250218`
--

DROP TABLE IF EXISTS `v_event_logs_20250218`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250218` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1537 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250219`
--

DROP TABLE IF EXISTS `v_event_logs_20250219`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250219` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250220`
--

DROP TABLE IF EXISTS `v_event_logs_20250220`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250220` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250221`
--

DROP TABLE IF EXISTS `v_event_logs_20250221`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250221` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3495 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250222`
--

DROP TABLE IF EXISTS `v_event_logs_20250222`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250222` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=4716 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250223`
--

DROP TABLE IF EXISTS `v_event_logs_20250223`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250223` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3060 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250224`
--

DROP TABLE IF EXISTS `v_event_logs_20250224`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250224` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=24523 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250225`
--

DROP TABLE IF EXISTS `v_event_logs_20250225`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250225` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=23081 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250226`
--

DROP TABLE IF EXISTS `v_event_logs_20250226`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250226` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=27885 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250227`
--

DROP TABLE IF EXISTS `v_event_logs_20250227`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250227` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=17667 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250228`
--

DROP TABLE IF EXISTS `v_event_logs_20250228`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250228` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=21440 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250504`
--

DROP TABLE IF EXISTS `v_event_logs_20250504`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250504` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=494344 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250505`
--

DROP TABLE IF EXISTS `v_event_logs_20250505`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250505` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=607020 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250506`
--

DROP TABLE IF EXISTS `v_event_logs_20250506`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250506` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=567550 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250507`
--

DROP TABLE IF EXISTS `v_event_logs_20250507`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250507` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=576828 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250508`
--

DROP TABLE IF EXISTS `v_event_logs_20250508`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250508` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=680377 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_event_logs_20250509`
--

DROP TABLE IF EXISTS `v_event_logs_20250509`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_event_logs_20250509` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `agent_uuid` varchar(100) DEFAULT NULL,
  `call_uuid` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `call_uuid` (`call_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=508776 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_export_reports`
--

DROP TABLE IF EXISTS `v_export_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_export_reports` (
  `uuid` char(36) NOT NULL,
  `user_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) NOT NULL,
  `api_path` varchar(100) NOT NULL,
  `func_name` varchar(100) NOT NULL,
  `data` mediumtext NOT NULL,
  `file_path` text DEFAULT NULL,
  `status` char(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `user_uuid` (`user_uuid`),
  KEY `domain_uuid` (`domain_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_extension_users`
--

DROP TABLE IF EXISTS `v_extension_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_extension_users` (
  `extension_user_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `extension_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`extension_user_uuid`),
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `extension_uuid` (`extension_uuid`) USING BTREE,
  KEY `user_uuid` (`user_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_extensions`
--

DROP TABLE IF EXISTS `v_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_extensions` (
  `extension_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `extension` text DEFAULT NULL,
  `number_alias` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `accountcode` text DEFAULT NULL,
  `effective_caller_id_name` text DEFAULT NULL,
  `effective_caller_id_number` text DEFAULT NULL,
  `outbound_caller_id_name` text DEFAULT NULL,
  `outbound_caller_id_number` text DEFAULT NULL,
  `emergency_caller_id_name` text DEFAULT NULL,
  `emergency_caller_id_number` text DEFAULT NULL,
  `directory_full_name` text DEFAULT NULL,
  `directory_visible` text DEFAULT NULL,
  `directory_exten_visible` text DEFAULT NULL,
  `limit_max` decimal(10,0) DEFAULT NULL,
  `limit_destination` text DEFAULT NULL,
  `missed_call_app` text DEFAULT NULL,
  `missed_call_data` text DEFAULT NULL,
  `user_context` text DEFAULT NULL,
  `toll_allow` text DEFAULT NULL,
  `call_timeout` decimal(10,0) DEFAULT NULL,
  `call_group` text DEFAULT NULL,
  `call_screen_enabled` text DEFAULT NULL,
  `user_record` text DEFAULT NULL,
  `hold_music` text DEFAULT NULL,
  `auth_acl` text DEFAULT NULL,
  `cidr` text DEFAULT NULL,
  `sip_force_contact` text DEFAULT NULL,
  `nibble_account` decimal(10,0) DEFAULT NULL,
  `sip_force_expires` decimal(10,0) DEFAULT NULL,
  `mwi_account` text DEFAULT NULL,
  `sip_bypass_media` text DEFAULT NULL,
  `unique_id` decimal(10,0) DEFAULT NULL,
  `dial_string` text DEFAULT NULL,
  `dial_user` text DEFAULT NULL,
  `dial_domain` text DEFAULT NULL,
  `do_not_disturb` text DEFAULT NULL,
  `forward_all_destination` text DEFAULT NULL,
  `forward_all_enabled` text DEFAULT NULL,
  `forward_busy_destination` text DEFAULT NULL,
  `forward_busy_enabled` text DEFAULT NULL,
  `forward_no_answer_destination` text DEFAULT NULL,
  `forward_no_answer_enabled` text DEFAULT NULL,
  `forward_user_not_registered_destination` text DEFAULT NULL,
  `forward_user_not_registered_enabled` text DEFAULT NULL,
  `follow_me_uuid` char(36) DEFAULT NULL,
  `enabled` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `forward_caller_id_uuid` char(36) DEFAULT NULL,
  `absolute_codec_string` char(36) DEFAULT NULL,
  `force_ping` text DEFAULT NULL,
  `ext_use` enum('OTHER','PLUGIN') DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `allow_multiple_registrations` enum('true','false') DEFAULT NULL,
  PRIMARY KEY (`extension_uuid`),
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `extension` (`extension`(15)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_faasos_crm`
--

DROP TABLE IF EXISTS `v_faasos_crm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_faasos_crm` (
  `call_uuid` char(36) DEFAULT NULL,
  `paramter_post` text DEFAULT NULL,
  `response` text DEFAULT NULL,
  `mood` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `call_state_uuid` char(36) DEFAULT NULL,
  KEY `call_uuid` (`call_uuid`),
  KEY `mood` (`mood`(10)),
  KEY `created_at` (`created_at`),
  KEY `call_state_uuid` (`call_state_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_facebook_chat`
--

DROP TABLE IF EXISTS `v_facebook_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_facebook_chat` (
  `chat_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) NOT NULL,
  `user_uuid` char(36) NOT NULL,
  `sender_uuid` char(36) NOT NULL,
  `receiver_uuid` char(36) NOT NULL,
  `conversation_uuid` char(36) NOT NULL,
  `message` text DEFAULT NULL,
  `message_type` varchar(30) NOT NULL,
  `attachments` text DEFAULT NULL,
  `page_id` char(36) NOT NULL,
  `timestamp` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_facebook_post`
--

DROP TABLE IF EXISTS `v_facebook_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_facebook_post` (
  `uuid` char(36) NOT NULL,
  `page_id` char(36) NOT NULL,
  `post_id` char(36) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `customer_id` char(36) NOT NULL,
  `customer_name` varchar(70) NOT NULL,
  `agent_id` char(36) DEFAULT NULL,
  `post_message` text NOT NULL,
  `is_complete` varchar(5) NOT NULL DEFAULT 'N',
  `is_replied` varchar(5) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_facebook_post_comment`
--

DROP TABLE IF EXISTS `v_facebook_post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_facebook_post_comment` (
  `uuid` char(36) NOT NULL,
  `post_id` varchar(50) NOT NULL,
  `comment_id` varchar(50) NOT NULL,
  `parent_comment_id` varchar(50) DEFAULT NULL,
  `comment_by` char(10) NOT NULL,
  `agent_id` char(36) DEFAULT NULL,
  `customer_id` char(36) NOT NULL,
  `customer_name` varchar(70) NOT NULL,
  `post_message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `post_id` (`post_id`),
  KEY `comment_id` (`comment_id`),
  KEY `created_at` (`created_at`),
  KEY `agent_id` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_fax`
--

DROP TABLE IF EXISTS `v_fax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_fax` (
  `fax_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `dialplan_uuid` char(36) DEFAULT NULL,
  `fax_extension` text DEFAULT NULL,
  `fax_destination_number` text DEFAULT NULL,
  `fax_prefix` text DEFAULT NULL,
  `fax_name` text DEFAULT NULL,
  `fax_email` text DEFAULT NULL,
  `fax_email_connection_type` text DEFAULT NULL,
  `fax_email_connection_host` text DEFAULT NULL,
  `fax_email_connection_port` text DEFAULT NULL,
  `fax_email_connection_security` text DEFAULT NULL,
  `fax_email_connection_validate` text DEFAULT NULL,
  `fax_email_connection_username` text DEFAULT NULL,
  `fax_email_connection_password` text DEFAULT NULL,
  `fax_email_connection_mailbox` text DEFAULT NULL,
  `fax_email_inbound_subject_tag` text DEFAULT NULL,
  `fax_email_outbound_subject_tag` text DEFAULT NULL,
  `fax_email_outbound_authorized_senders` text DEFAULT NULL,
  `fax_pin_number` text DEFAULT NULL,
  `fax_caller_id_name` text DEFAULT NULL,
  `fax_caller_id_number` text DEFAULT NULL,
  `fax_forward_number` text DEFAULT NULL,
  `fax_send_greeting` text DEFAULT NULL,
  `fax_send_channels` decimal(10,0) DEFAULT NULL,
  `fax_description` text DEFAULT NULL,
  `accountcode` text DEFAULT NULL,
  PRIMARY KEY (`fax_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_fax_files`
--

DROP TABLE IF EXISTS `v_fax_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_fax_files` (
  `domain_uuid` char(36) DEFAULT NULL,
  `fax_file_uuid` char(36) NOT NULL,
  `fax_uuid` char(36) DEFAULT NULL,
  `fax_mode` text DEFAULT NULL,
  `fax_destination` text DEFAULT NULL,
  `fax_file_type` text DEFAULT NULL,
  `fax_file_path` text DEFAULT NULL,
  `fax_caller_id_name` text DEFAULT NULL,
  `fax_caller_id_number` text DEFAULT NULL,
  `fax_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fax_epoch` bigint(20) DEFAULT NULL,
  `fax_base64` text DEFAULT NULL,
  PRIMARY KEY (`fax_file_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_fax_logs`
--

DROP TABLE IF EXISTS `v_fax_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_fax_logs` (
  `fax_log_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `fax_uuid` char(36) DEFAULT NULL,
  `fax_success` text DEFAULT NULL,
  `fax_result_code` decimal(10,0) DEFAULT NULL,
  `fax_result_text` text DEFAULT NULL,
  `fax_file` text DEFAULT NULL,
  `fax_ecm_used` text DEFAULT NULL,
  `fax_local_station_id` text DEFAULT NULL,
  `fax_document_transferred_pages` decimal(10,0) DEFAULT NULL,
  `fax_document_total_pages` decimal(10,0) DEFAULT NULL,
  `fax_image_resolution` text DEFAULT NULL,
  `fax_image_size` decimal(10,0) DEFAULT NULL,
  `fax_bad_rows` decimal(10,0) DEFAULT NULL,
  `fax_transfer_rate` decimal(10,0) DEFAULT NULL,
  `fax_retry_attempts` decimal(10,0) DEFAULT NULL,
  `fax_retry_limit` decimal(10,0) DEFAULT NULL,
  `fax_retry_sleep` decimal(10,0) DEFAULT NULL,
  `fax_uri` text DEFAULT NULL,
  `fax_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fax_epoch` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`fax_log_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_fax_tasks`
--

DROP TABLE IF EXISTS `v_fax_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_fax_tasks` (
  `fax_task_uuid` char(36) NOT NULL,
  `fax_uuid` char(36) DEFAULT NULL,
  `task_next_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `task_lock_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `task_fax_file` text DEFAULT NULL,
  `task_wav_file` text DEFAULT NULL,
  `task_uri` text DEFAULT NULL,
  `task_dial_string` text DEFAULT NULL,
  `task_dtmf` text DEFAULT NULL,
  `task_reply_address` text DEFAULT NULL,
  `task_interrupted` text DEFAULT NULL,
  `task_status` decimal(10,0) DEFAULT NULL,
  `task_no_answer_counter` decimal(10,0) DEFAULT NULL,
  `task_no_answer_retry_counter` decimal(10,0) DEFAULT NULL,
  `task_retry_counter` decimal(10,0) DEFAULT NULL,
  `task_description` text DEFAULT NULL,
  PRIMARY KEY (`fax_task_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_fax_users`
--

DROP TABLE IF EXISTS `v_fax_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_fax_users` (
  `fax_user_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `fax_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`fax_user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_featurecode`
--

DROP TABLE IF EXISTS `v_featurecode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_featurecode` (
  `featurecode_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `featurecode_name` text DEFAULT NULL,
  `login` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  `break_in` text DEFAULT NULL,
  `break_out` text DEFAULT NULL,
  PRIMARY KEY (`featurecode_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_featurecode_has_campaign`
--

DROP TABLE IF EXISTS `v_featurecode_has_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_featurecode_has_campaign` (
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `featurecode_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_follow_me`
--

DROP TABLE IF EXISTS `v_follow_me`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_follow_me` (
  `domain_uuid` char(36) DEFAULT NULL,
  `follow_me_uuid` char(36) NOT NULL,
  `cid_name_prefix` text DEFAULT NULL,
  `cid_number_prefix` text DEFAULT NULL,
  `dial_string` text DEFAULT NULL,
  `follow_me_enabled` text DEFAULT NULL,
  `follow_me_caller_id_uuid` char(36) DEFAULT NULL,
  `follow_me_ignore_busy` text DEFAULT NULL,
  PRIMARY KEY (`follow_me_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_follow_me_destinations`
--

DROP TABLE IF EXISTS `v_follow_me_destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_follow_me_destinations` (
  `domain_uuid` char(36) DEFAULT NULL,
  `follow_me_uuid` char(36) DEFAULT NULL,
  `follow_me_destination_uuid` char(36) NOT NULL,
  `follow_me_destination` text DEFAULT NULL,
  `follow_me_delay` text DEFAULT NULL,
  `follow_me_timeout` text DEFAULT NULL,
  `follow_me_prompt` text DEFAULT NULL,
  `follow_me_order` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`follow_me_destination_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_gateways`
--

DROP TABLE IF EXISTS `v_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_gateways` (
  `gateway_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `gateway` text DEFAULT NULL,
  `username` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `distinct_to` text DEFAULT NULL,
  `auth_username` text DEFAULT NULL,
  `realm` text DEFAULT NULL,
  `from_user` text DEFAULT NULL,
  `from_domain` text DEFAULT NULL,
  `proxy` text DEFAULT NULL,
  `register_proxy` text DEFAULT NULL,
  `outbound_proxy` text DEFAULT NULL,
  `expire_seconds` decimal(10,0) DEFAULT NULL,
  `register` text DEFAULT NULL,
  `register_transport` text DEFAULT NULL,
  `retry_seconds` decimal(10,0) DEFAULT NULL,
  `extension` text DEFAULT NULL,
  `ping` text DEFAULT NULL,
  `caller_id_in_from` text DEFAULT NULL,
  `supress_cng` text DEFAULT NULL,
  `sip_cid_type` text DEFAULT NULL,
  `codec_prefs` text DEFAULT NULL,
  `channels` decimal(10,0) unsigned DEFAULT 0,
  `extension_in_contact` text DEFAULT NULL,
  `context` text DEFAULT NULL,
  `profile` text DEFAULT NULL,
  `hostname` char(255) DEFAULT NULL,
  `enabled` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `addn_variables` text DEFAULT NULL,
  `v_gateways` text DEFAULT NULL,
  `region_uuid` char(36) DEFAULT NULL,
  `cps` decimal(3,0) unsigned DEFAULT 25,
  `maximum_channel_utilization_limit` int(10) unsigned NOT NULL DEFAULT 0,
  `prefix` char(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gateway_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_geo_circle`
--

DROP TABLE IF EXISTS `v_geo_circle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_geo_circle` (
  `gc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Circle ID',
  `gc_state` varchar(150) DEFAULT NULL,
  `gc_code` char(2) DEFAULT NULL,
  PRIMARY KEY (`gc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_geo_location`
--

DROP TABLE IF EXISTS `v_geo_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_geo_location` (
  `geo_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geolocation ID',
  `geo_prefix_number` char(4) DEFAULT NULL,
  `geo_code` char(2) DEFAULT NULL,
  PRIMARY KEY (`geo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_geo_location_routing`
--

DROP TABLE IF EXISTS `v_geo_location_routing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_geo_location_routing` (
  `gl_uuid` char(36) DEFAULT NULL,
  `gl_code` char(2) DEFAULT NULL,
  `gl_route_type` enum('QUEUE') DEFAULT NULL,
  `gl_route_number` char(6) DEFAULT NULL,
  `gl_domain_uuid` char(36) DEFAULT NULL,
  KEY `gl_domain_uuid` (`gl_domain_uuid`),
  KEY `gl_route_type` (`gl_route_type`),
  KEY `gl_code` (`gl_code`),
  KEY `gl_route_number` (`gl_route_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_group_contact`
--

DROP TABLE IF EXISTS `v_group_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_group_contact` (
  `group_contact_uuid` char(36) NOT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `group_contact_name` varchar(50) DEFAULT NULL,
  `group_contact_type` varchar(10) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`group_contact_uuid`),
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `user_uuid` (`user_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_group_permissions`
--

DROP TABLE IF EXISTS `v_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_group_permissions` (
  `group_permission_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `permission_name` text DEFAULT NULL,
  `group_name` text DEFAULT NULL,
  `group_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`group_permission_uuid`),
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `group_uuid` (`group_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_group_users`
--

DROP TABLE IF EXISTS `v_group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_group_users` (
  `group_user_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `group_name` text DEFAULT NULL,
  `group_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`group_user_uuid`),
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `group_uuid` (`group_uuid`) USING BTREE,
  KEY `user_uuid` (`user_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_groups`
--

DROP TABLE IF EXISTS `v_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_groups` (
  `group_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `group_name` text DEFAULT NULL,
  `group_type` text DEFAULT NULL,
  `group_protected` text DEFAULT NULL,
  `group_description` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`group_uuid`),
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `group_type` (`group_type`(20)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_gsm_configuration`
--

DROP TABLE IF EXISTS `v_gsm_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_gsm_configuration` (
  `gsm_configuration_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `gateway_ip` text DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `mobile_number` text DEFAULT NULL,
  `agent_uuid` char(36) DEFAULT NULL,
  `configuration_status` enum('Y','N') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  KEY `mobile_number` (`mobile_number`(10)),
  KEY `deleted_at` (`deleted_at`),
  KEY `configuration_status` (`configuration_status`),
  KEY `agent_uuid` (`agent_uuid`),
  KEY `domain_uuid` (`domain_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_gw_list_details`
--

DROP TABLE IF EXISTS `v_gw_list_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_gw_list_details` (
  `gw_list_detail_uuid` char(36) NOT NULL,
  `gw_list_uuid` char(36) DEFAULT NULL,
  `gw_uuid` char(36) DEFAULT NULL,
  `gw_weight` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`gw_list_detail_uuid`),
  KEY `gw_list_uuid` (`gw_list_uuid`),
  KEY `gw_uuid` (`gw_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_gw_lists`
--

DROP TABLE IF EXISTS `v_gw_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_gw_lists` (
  `gw_list_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `gw_list_name` text DEFAULT NULL,
  PRIMARY KEY (`gw_list_uuid`),
  KEY `gw_list_name` (`gw_list_name`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_health_alarm_log`
--

DROP TABLE IF EXISTS `v_health_alarm_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_health_alarm_log` (
  `ssp_alaram_uuid` char(36) DEFAULT NULL,
  `system_uuid` char(36) DEFAULT NULL,
  `alarm_for` char(10) DEFAULT NULL COMMENT 'Service, System, PRI',
  `health_alarm_uuid` char(36) DEFAULT NULL,
  `alarm_raise_status` char(20) DEFAULT NULL COMMENT 'RAISED or CLEARED',
  `raise_time` datetime DEFAULT NULL COMMENT 'Time on which alarm raised',
  `clear_time` datetime DEFAULT NULL COMMENT 'Time on which alarm clear',
  `raise_value` varchar(100) DEFAULT NULL,
  `clear_value` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  KEY `system_uuid` (`system_uuid`),
  KEY `raise_value` (`raise_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_health_monitoring_alarm`
--

DROP TABLE IF EXISTS `v_health_monitoring_alarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_health_monitoring_alarm` (
  `alarm_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) NOT NULL,
  `alarmname` varchar(50) NOT NULL,
  `alarm_for` varchar(50) DEFAULT NULL,
  `system_uuid` char(36) DEFAULT NULL,
  `servicename` varchar(50) DEFAULT NULL,
  `pri_gateway` char(36) DEFAULT NULL,
  `parameters` varchar(100) DEFAULT NULL,
  `alarm_threshold` int(10) DEFAULT NULL,
  `intervaltime` int(10) DEFAULT NULL,
  `clear_threshold` int(10) DEFAULT NULL,
  `email_notification` enum('true','false') DEFAULT 'false',
  `subject` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `api_notification` enum('true','false') DEFAULT 'false',
  `email_configuration` varchar(50) DEFAULT NULL,
  `sent_to` varchar(50) DEFAULT NULL,
  `callapi` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `active_status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`alarm_uuid`),
  KEY `updated_at` (`updated_at`),
  KEY `created_at` (`created_at`),
  KEY `system_uuid` (`system_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_holidays`
--

DROP TABLE IF EXISTS `v_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_holidays` (
  `holiday_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `holiday_date` datetime DEFAULT NULL,
  `holiday_name` varchar(66) DEFAULT NULL,
  `level` varchar(66) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`holiday_uuid`),
  KEY `domain_uuid` (`domain_uuid`),
  CONSTRAINT `v_holidays_ibfk_1` FOREIGN KEY (`domain_uuid`) REFERENCES `v_domains` (`domain_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_holidays_shifts`
--

DROP TABLE IF EXISTS `v_holidays_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_holidays_shifts` (
  `holiday_uuid` char(36) DEFAULT NULL,
  `shift_uuid` char(36) DEFAULT NULL,
  `effective_from` datetime DEFAULT NULL,
  `effective_till` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_images`
--

DROP TABLE IF EXISTS `v_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_images` (
  `uuid` varchar(255) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon_icon` varchar(255) DEFAULT NULL,
  `home_page_image` varchar(255) DEFAULT NULL,
  `notification_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`(4))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_integrated_user`
--

DROP TABLE IF EXISTS `v_integrated_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_integrated_user` (
  `integrated_uuid` char(36) NOT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `instaview_user_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`integrated_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_internal_call`
--

DROP TABLE IF EXISTS `v_internal_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_internal_call` (
  `internal_call_uuid` char(36) NOT NULL,
  `type` char(36) NOT NULL,
  `value` char(36) NOT NULL,
  `regex` char(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `domain_uuid` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_internal_call_dtl`
--

DROP TABLE IF EXISTS `v_internal_call_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_internal_call_dtl` (
  `call_dtl_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `source_number` varchar(20) DEFAULT NULL,
  `destination_number` varchar(20) DEFAULT NULL,
  `source_user_uuid` char(36) DEFAULT NULL,
  `destination_user_uuid` char(36) DEFAULT NULL,
  `direction` varchar(10) DEFAULT NULL,
  `call_status` varchar(30) DEFAULT NULL,
  `start_stamp` datetime DEFAULT NULL,
  `end_stamp` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `call_duration` int(11) DEFAULT NULL,
  `answersec` int(11) DEFAULT NULL,
  `waitsec` int(11) DEFAULT NULL,
  `did_number` varchar(20) DEFAULT NULL,
  `hangup_cause` varchar(30) DEFAULT NULL,
  `recording_file` varchar(150) DEFAULT NULL,
  `callby` varchar(20) DEFAULT NULL,
  `hangupby` varchar(30) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`call_dtl_uuid`),
  KEY `call_duration` (`call_duration`),
  KEY `call_uuid` (`call_uuid`),
  KEY `direction` (`direction`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `user_uuid` (`source_user_uuid`),
  KEY `call_status` (`call_status`),
  KEY `destination_number` (`destination_number`),
  KEY `hangupby` (`hangupby`),
  KEY `hangup_cause` (`hangup_cause`),
  KEY `source_number` (`source_number`),
  KEY `start_stamp` (`start_stamp`),
  KEY `end_stamp` (`end_stamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_internal_call_hold_state`
--

DROP TABLE IF EXISTS `v_internal_call_hold_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_internal_call_hold_state` (
  `uuid` char(36) NOT NULL,
  `call_uuid` char(36) NOT NULL,
  `user_uuid` char(36) NOT NULL,
  `hold_time_stamp` datetime DEFAULT NULL,
  `unhold_time_stamp` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT '0000-00-00 00:00:00',
  KEY `call_uuid` (`call_uuid`),
  KEY `user_uuid` (`user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_internal_call_mute_state`
--

DROP TABLE IF EXISTS `v_internal_call_mute_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_internal_call_mute_state` (
  `uuid` char(36) NOT NULL,
  `call_uuid` char(36) NOT NULL,
  `user_uuid` char(36) NOT NULL,
  `mute_time_stamp` datetime DEFAULT NULL,
  `unmute_time_stamp` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT '0000-00-00 00:00:00',
  KEY `call_uuid` (`call_uuid`),
  KEY `user_uuid` (`user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_ip_range_restrictions`
--

DROP TABLE IF EXISTS `v_ip_range_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_ip_range_restrictions` (
  `ip_uuid` char(36) NOT NULL,
  `ip_address` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_ivr_call_dtl_node_wise`
--

DROP TABLE IF EXISTS `v_ivr_call_dtl_node_wise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_ivr_call_dtl_node_wise` (
  `ivr_uuid` char(36) NOT NULL,
  `call_uuid` char(36) NOT NULL,
  `node_name` varchar(50) NOT NULL,
  `node_type` varchar(20) NOT NULL,
  `node_entry_time` datetime NOT NULL,
  `node_exit_time` datetime(6) NOT NULL,
  `node_exit_type` varchar(30) DEFAULT NULL,
  `node_data` mediumtext DEFAULT NULL,
  KEY `call_uuid` (`call_uuid`),
  KEY `ivr_uuid` (`ivr_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_ivr_designer`
--

DROP TABLE IF EXISTS `v_ivr_designer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_ivr_designer` (
  `ivr_uuid` char(36) NOT NULL,
  `extension_number` mediumtext DEFAULT NULL,
  `name` mediumtext DEFAULT NULL,
  `node_data` mediumtext DEFAULT NULL,
  `node_property` text DEFAULT NULL,
  `menu_option` mediumtext DEFAULT NULL,
  `enabled` enum('true','false') DEFAULT NULL,
  `region_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `dialplan_uuid` char(36) DEFAULT NULL,
  `did_number` mediumtext DEFAULT NULL,
  `ivr_menu_uuids` mediumtext DEFAULT NULL,
  `ivr_timecondition_uuids` mediumtext DEFAULT NULL,
  `time_condition_alter` mediumtext DEFAULT NULL,
  `time_condition` mediumtext DEFAULT NULL,
  `case_when` mediumtext DEFAULT NULL,
  `zoom_range` double DEFAULT NULL,
  `ivr_json_data` mediumtext DEFAULT NULL,
  `version` mediumtext NOT NULL DEFAULT 'v1',
  `country_language` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ivr_uuid`),
  KEY `domain_uuid` (`domain_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_ivr_did_mappaign`
--

DROP TABLE IF EXISTS `v_ivr_did_mappaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_ivr_did_mappaign` (
  `uuid` char(36) NOT NULL,
  `ivr_uuid` char(36) NOT NULL,
  `did_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_ivr_menu_options`
--

DROP TABLE IF EXISTS `v_ivr_menu_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_ivr_menu_options` (
  `ivr_menu_option_uuid` char(36) NOT NULL,
  `ivr_menu_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `ivr_menu_option_digits` text DEFAULT NULL,
  `ivr_menu_option_action` text DEFAULT NULL,
  `ivr_menu_option_param` text DEFAULT NULL,
  `ivr_menu_option_param2` text DEFAULT NULL,
  `ivr_menu_option_order` decimal(10,0) DEFAULT NULL,
  `ivr_menu_option_description` text DEFAULT NULL,
  `ivr_menu_option_additionalparam` text DEFAULT NULL,
  PRIMARY KEY (`ivr_menu_option_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_ivr_menus`
--

DROP TABLE IF EXISTS `v_ivr_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_ivr_menus` (
  `ivr_menu_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `dialplan_uuid` char(36) DEFAULT NULL,
  `ivr_menu_name` text DEFAULT NULL,
  `ivr_menu_extension` text DEFAULT NULL,
  `ivr_menu_greet_long` text DEFAULT NULL,
  `ivr_menu_greet_short` text DEFAULT NULL,
  `ivr_menu_invalid_sound` text DEFAULT NULL,
  `ivr_menu_timeout_sound` text DEFAULT NULL,
  `ivr_menu_exit_sound` text DEFAULT NULL,
  `ivr_menu_invalid_destination_app` text DEFAULT NULL,
  `ivr_menu_invalid_destination_data` text DEFAULT NULL,
  `ivr_menu_invalid_timeout_app` text DEFAULT NULL,
  `ivr_menu_invalid_timeout_data` text DEFAULT NULL,
  `ivr_menu_confirm_macro` text DEFAULT NULL,
  `ivr_menu_confirm_key` text DEFAULT NULL,
  `ivr_menu_tts_engine` text DEFAULT NULL,
  `ivr_menu_tts_voice` text DEFAULT NULL,
  `ivr_menu_confirm_attempts` decimal(10,0) DEFAULT NULL,
  `ivr_menu_timeout` decimal(10,0) DEFAULT NULL,
  `ivr_menu_exit_app` text DEFAULT NULL,
  `ivr_menu_exit_data` text DEFAULT NULL,
  `ivr_menu_inter_digit_timeout` decimal(10,0) DEFAULT NULL,
  `ivr_menu_max_failures` decimal(10,0) DEFAULT NULL,
  `ivr_menu_max_timeouts` decimal(10,0) DEFAULT NULL,
  `ivr_menu_digit_len` decimal(10,0) DEFAULT NULL,
  `ivr_menu_direct_dial` text DEFAULT NULL,
  `ivr_menu_ringback` text DEFAULT NULL,
  `ivr_menu_cid_prefix` text DEFAULT NULL,
  `ivr_menu_enabled` text DEFAULT NULL,
  `ivr_menu_description` text DEFAULT NULL,
  `ivr_lang_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ivr_menu_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_ivrcalls`
--

DROP TABLE IF EXISTS `v_ivrcalls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_ivrcalls` (
  `ivrcall_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `ivr_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `contact_broadcast_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `source_number` varchar(50) DEFAULT NULL,
  `destination_number` varchar(50) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `exit_datetime` datetime DEFAULT NULL,
  `dtmf` varchar(20) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`ivrcall_uuid`),
  KEY `ivrcall_uuid` (`ivrcall_uuid`),
  KEY `call_uuid` (`call_uuid`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `entry_datetime` (`entry_datetime`),
  KEY `exit_datetime` (`exit_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_languages`
--

DROP TABLE IF EXISTS `v_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_languages` (
  `language_uuid` char(36) NOT NULL,
  `language` text DEFAULT NULL,
  `code` text DEFAULT NULL,
  PRIMARY KEY (`language_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_lead_distribution`
--

DROP TABLE IF EXISTS `v_lead_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_lead_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(20) NOT NULL,
  `queue_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_leadsquared_users`
--

DROP TABLE IF EXISTS `v_leadsquared_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_leadsquared_users` (
  `leadsquared_user_uuid` char(36) NOT NULL,
  `app_uuid` mediumtext DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `other_info` mediumtext DEFAULT NULL,
  `id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`leadsquared_user_uuid`),
  KEY `email_address` (`email_address`),
  KEY `first_name` (`first_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_leave_halfday`
--

DROP TABLE IF EXISTS `v_leave_halfday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_leave_halfday` (
  `leave_uuid` char(36) NOT NULL,
  `user_uuid` char(36) NOT NULL,
  `available_time` datetime DEFAULT NULL,
  `offline_time` datetime DEFAULT NULL,
  PRIMARY KEY (`leave_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_leaves_users`
--

DROP TABLE IF EXISTS `v_leaves_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_leaves_users` (
  `leave_uuid` char(36) NOT NULL,
  `user_uuid` char(36) NOT NULL,
  `leave_sdate` datetime NOT NULL,
  `leave_edate` datetime NOT NULL,
  `leave_type` varchar(15) NOT NULL,
  `emegency_leave` varchar(3) NOT NULL,
  `leave_remark` text DEFAULT NULL,
  `approval_status` varchar(3) NOT NULL,
  `approved_by` char(36) DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `created_on` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`leave_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_list_churn_details`
--

DROP TABLE IF EXISTS `v_list_churn_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_list_churn_details` (
  `churn_detail_uuid` char(36) NOT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `disposition` text DEFAULT NULL,
  `no_of_records` int(11) NOT NULL,
  `type` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`churn_detail_uuid`),
  KEY `list_uuid` (`list_uuid`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_list_states`
--

DROP TABLE IF EXISTS `v_list_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_list_states` (
  `list_state_uuid` char(36) NOT NULL,
  `list_uuid` char(36) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `success_total` int(11) DEFAULT NULL,
  `duplicate_number` text DEFAULT NULL,
  `invalid_number` text DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `import_type` varchar(10) DEFAULT NULL,
  `fail_row` int(11) DEFAULT NULL,
  `fail_numbers_file` text DEFAULT NULL,
  `dnc_number` text DEFAULT NULL,
  `duplicate_number_ignore` text DEFAULT NULL,
  `duplicate_alternatenumbers` text DEFAULT NULL,
  `temp_duplicate_update` longtext DEFAULT NULL,
  `temp_duplicate_ignore` longtext DEFAULT NULL,
  PRIMARY KEY (`list_state_uuid`),
  KEY `list_uuid` (`list_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_live_apr`
--

DROP TABLE IF EXISTS `v_live_apr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_live_apr` (
  `user_uuid` char(36) NOT NULL,
  `username` varchar(50) NOT NULL,
  `breaks_json_data` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `inbound` int(4) DEFAULT NULL,
  `count_conference` int(4) DEFAULT NULL,
  `count_att_xfer` int(4) DEFAULT NULL,
  `autooutbound` int(4) DEFAULT NULL,
  `Transfer_call` int(4) DEFAULT NULL,
  `manualoutbound` int(4) DEFAULT NULL,
  `total_connected_call` int(4) DEFAULT NULL,
  `total_failed_call` int(4) DEFAULT NULL,
  `Ringing` varchar(10) DEFAULT NULL,
  `manual_call_state_ringing` varchar(10) DEFAULT NULL,
  `auto_call_state_ringing` varchar(10) DEFAULT NULL,
  `inbound_call_state_ringing` varchar(10) DEFAULT NULL,
  `TalkTime` varchar(10) DEFAULT NULL,
  `manual_plus_total_talktime` varchar(10) DEFAULT NULL,
  `inbound_total_talktime` varchar(10) DEFAULT NULL,
  `auto_total_talktime` varchar(10) DEFAULT NULL,
  `Hold_Duration` varchar(10) DEFAULT NULL,
  `inbound_Hold` varchar(10) DEFAULT NULL,
  `manual_plus_Hold` varchar(10) DEFAULT NULL,
  `auto_Hold` varchar(10) DEFAULT NULL,
  `inbound_wrapup_time` varchar(10) DEFAULT NULL,
  `auto_wrapup_time` varchar(10) DEFAULT NULL,
  `manual_plus_wrapup_time` varchar(10) DEFAULT NULL,
  `AvgAutoRinging` varchar(10) DEFAULT NULL,
  `wrapup_time` varchar(10) DEFAULT NULL,
  `callback_calls` int(4) DEFAULT NULL,
  `Handling_Time` varchar(10) DEFAULT NULL,
  `inbound_handling_time` varchar(10) DEFAULT NULL,
  `manual_plus_handling_time` varchar(10) DEFAULT NULL,
  `auto_handling_time` varchar(10) DEFAULT NULL,
  `AvgRinging` varchar(10) DEFAULT NULL,
  `AvgInboundTalkTime` varchar(10) DEFAULT NULL,
  `AvgManualPlusRinging` varchar(10) DEFAULT NULL,
  `AvgInboundRinging` varchar(10) DEFAULT NULL,
  `AvgAutoTalkTime` varchar(10) DEFAULT NULL,
  `AvgManualPlusTalkTime` varchar(10) DEFAULT NULL,
  `AvgHold` varchar(10) DEFAULT NULL,
  `AvgInboundHold` varchar(10) DEFAULT NULL,
  `AvgAutoHold` varchar(10) DEFAULT NULL,
  `AvgManualPlusHold` varchar(10) DEFAULT NULL,
  `AvgTalkTime` varchar(10) DEFAULT NULL,
  `AvgDispositionTime` varchar(10) DEFAULT NULL,
  `AvgInboundDispositionTime` varchar(10) DEFAULT NULL,
  `AvgAutoDispositionTime` varchar(10) DEFAULT NULL,
  `AvgManualPlusDispositionTime` varchar(10) DEFAULT NULL,
  `AvgHandlineTime` varchar(10) DEFAULT NULL,
  `AvgInboundHandlineTime` varchar(10) DEFAULT NULL,
  `AvgAutoHandlineTime` varchar(10) DEFAULT NULL,
  `AvgManualPlusHandlineTime` varchar(10) DEFAULT NULL,
  `preview_manualoutbound` int(4) DEFAULT NULL,
  `previewautooutbound` int(4) DEFAULT NULL,
  `login_duration` varchar(10) DEFAULT NULL,
  `AutoCalloff` varchar(10) DEFAULT NULL,
  `AutoCalloff_Idle` varchar(10) DEFAULT NULL,
  `readyduration` varchar(10) DEFAULT NULL,
  `break_duration` varchar(10) DEFAULT NULL,
  `NetLoginDuration` varchar(10) DEFAULT NULL,
  `AgentProductivity` varchar(10) DEFAULT NULL,
  `Total_Break_duration` varchar(10) DEFAULT NULL,
  `Total_Productive_Offline` varchar(10) DEFAULT NULL,
  `Total_Break` varchar(10) DEFAULT NULL,
  `call_center_queue_uuid` text DEFAULT NULL,
  `Campaigns_name` text DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`user_uuid`),
  KEY `user_uuid` (`user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_location_gateway_mapping`
--

DROP TABLE IF EXISTS `v_location_gateway_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_location_gateway_mapping` (
  `uuid` char(36) NOT NULL,
  `source_location` varchar(20) NOT NULL,
  `destination_location` varchar(20) NOT NULL,
  `gateway_uuid` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_locationwise_queue_mapping`
--

DROP TABLE IF EXISTS `v_locationwise_queue_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_locationwise_queue_mapping` (
  `uuid` char(36) NOT NULL,
  `location` varchar(20) NOT NULL,
  `caller` enum('National','International') NOT NULL,
  `queue_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_log_exception_query`
--

DROP TABLE IF EXISTS `v_log_exception_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_log_exception_query` (
  `error_message` text DEFAULT NULL,
  `sql_query` text DEFAULT NULL,
  `exceptionat` datetime DEFAULT NULL,
  KEY `exceptionat` (`exceptionat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_login_autocalloff_details`
--

DROP TABLE IF EXISTS `v_login_autocalloff_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_login_autocalloff_details` (
  `login_detail_uuid` char(36) NOT NULL,
  `login_history_uuid` char(36) DEFAULT NULL,
  `autocalloff_time` varchar(50) DEFAULT NULL,
  `available_time` varchar(50) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `auto_call_off_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`login_detail_uuid`),
  KEY `login_history_uuid` (`login_history_uuid`) USING BTREE,
  KEY `offline_time` (`autocalloff_time`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_login_campaign`
--

DROP TABLE IF EXISTS `v_login_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_login_campaign` (
  `login_campaign_uuid` varchar(45) NOT NULL,
  `login_history_id` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `campaign_login_time` timestamp NULL DEFAULT NULL,
  `campaign_logout_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`login_campaign_uuid`),
  KEY `campaign_login_time` (`campaign_login_time`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`) USING BTREE,
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`) USING BTREE,
  KEY `login_history_id` (`login_history_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_login_campaign_autocall_off`
--

DROP TABLE IF EXISTS `v_login_campaign_autocall_off`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_login_campaign_autocall_off` (
  `login_campaign_uuid` varchar(45) NOT NULL,
  `login_detail_uuid` char(36) NOT NULL,
  `autocalloff_time` timestamp NULL DEFAULT NULL,
  `available_time` timestamp NULL DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `login_campaign_autocall_off` char(36) NOT NULL,
  KEY `login_campaign_uuid` (`login_campaign_uuid`),
  KEY `login_detail_uuid` (`login_detail_uuid`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`),
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_login_campaign_break`
--

DROP TABLE IF EXISTS `v_login_campaign_break`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_login_campaign_break` (
  `login_campaign_uuid` varchar(45) DEFAULT NULL,
  `login_detail_uuid` char(36) DEFAULT NULL,
  `offline_time` timestamp NULL DEFAULT NULL,
  `available_time` timestamp NULL DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `break_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL,
  `login_campaign_break_uuid` text DEFAULT NULL,
  KEY `login_campaign_uuid` (`login_campaign_uuid`),
  KEY `login_detail_uuid` (`login_detail_uuid`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`),
  KEY `break_uuid` (`break_uuid`) USING BTREE,
  KEY `call_center_queue_uuid` (`call_center_queue_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_login_details`
--

DROP TABLE IF EXISTS `v_login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_login_details` (
  `login_detail_uuid` char(36) NOT NULL,
  `login_history_uuid` char(36) DEFAULT NULL,
  `offline_time` varchar(50) DEFAULT NULL,
  `available_time` varchar(50) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `break_uuid` char(36) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`login_detail_uuid`),
  KEY `offline_time` (`offline_time`(20)),
  KEY `break_uuid` (`break_uuid`) USING BTREE,
  KEY `login_history_uuid` (`login_history_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_login_details_live_apr`
--

DROP TABLE IF EXISTS `v_login_details_live_apr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_login_details_live_apr` (
  `login_detail_uuid` char(36) NOT NULL,
  `login_history_uuid` char(36) DEFAULT NULL,
  `offline_time` varchar(50) DEFAULT NULL,
  `available_time` varchar(50) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `break_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`login_detail_uuid`),
  KEY `break_uuid` (`break_uuid`) USING BTREE,
  KEY `login_history_uuid` (`login_history_uuid`) USING BTREE,
  KEY `offline_time` (`offline_time`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_login_endpoint`
--

DROP TABLE IF EXISTS `v_login_endpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_login_endpoint` (
  `login_history_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `endpoint` varchar(36) DEFAULT NULL,
  `extension` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_login_history`
--

DROP TABLE IF EXISTS `v_login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_login_history` (
  `login_history_id` char(36) NOT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `user_token` varchar(50) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `logintime` varchar(50) DEFAULT NULL,
  `last_login_time` varchar(50) DEFAULT NULL,
  `logout_time` varchar(50) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `region_uuid` char(36) DEFAULT NULL,
  `browser_details` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `login_ip` varchar(20) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`login_history_id`),
  KEY `logintime` (`logintime`(20)),
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `user_token` (`user_token`) USING BTREE,
  KEY `user_uuid` (`user_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_login_history_live_apr`
--

DROP TABLE IF EXISTS `v_login_history_live_apr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_login_history_live_apr` (
  `login_history_id` char(36) NOT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `region_uuid` char(36) DEFAULT NULL,
  `user_token` varchar(50) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `logintime` varchar(50) DEFAULT NULL,
  `last_login_time` varchar(50) DEFAULT NULL,
  `logout_time` varchar(50) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(10) unsigned DEFAULT NULL,
  `browser_details` text DEFAULT NULL,
  `login_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`login_history_id`),
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `user_token` (`user_token`) USING BTREE,
  KEY `user_uuid` (`user_uuid`) USING BTREE,
  KEY `logintime` (`logintime`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_mail_config`
--

DROP TABLE IF EXISTS `v_mail_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_mail_config` (
  `mail_config_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `config_host_name` varchar(255) DEFAULT NULL,
  `config_port_no` int(11) DEFAULT NULL,
  `config_from_name` varchar(255) DEFAULT NULL,
  `config_username` varchar(255) DEFAULT NULL,
  `config_email` varchar(255) DEFAULT NULL,
  `config_password` varchar(255) DEFAULT NULL,
  `config_encryption` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `config_reply_email` varchar(255) DEFAULT NULL,
  `driver` varchar(45) DEFAULT NULL,
  `website_id` int(10) unsigned DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`mail_config_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_mail_template`
--

DROP TABLE IF EXISTS `v_mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_mail_template` (
  `mail_template_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `mail_template_name` varchar(255) DEFAULT NULL,
  `mail_template_subject` varchar(255) DEFAULT NULL,
  `mail_template_content` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `editable` char(36) DEFAULT 'no',
  `mail_template_bcc` text DEFAULT NULL,
  `mail_template_cc` text DEFAULT NULL,
  PRIMARY KEY (`mail_template_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_mail_template_queue`
--

DROP TABLE IF EXISTS `v_mail_template_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_mail_template_queue` (
  `mt_queue_uuid` char(36) NOT NULL,
  `mail_template_uuid` char(36) DEFAULT NULL,
  `mail_template_queue_uuid` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`mt_queue_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_meeting_users`
--

DROP TABLE IF EXISTS `v_meeting_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_meeting_users` (
  `domain_uuid` char(36) DEFAULT NULL,
  `meeting_user_uuid` char(36) NOT NULL,
  `meeting_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`meeting_user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_meetings`
--

DROP TABLE IF EXISTS `v_meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_meetings` (
  `domain_uuid` char(36) DEFAULT NULL,
  `meeting_uuid` char(36) NOT NULL,
  `moderator_pin` text DEFAULT NULL,
  `participant_pin` text DEFAULT NULL,
  `enabled` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`meeting_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_menu_item_groups`
--

DROP TABLE IF EXISTS `v_menu_item_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_menu_item_groups` (
  `menu_item_group_uuid` char(36) NOT NULL,
  `menu_uuid` char(36) DEFAULT NULL,
  `menu_item_uuid` char(36) DEFAULT NULL,
  `group_name` text DEFAULT NULL,
  `group_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`menu_item_group_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_menu_items`
--

DROP TABLE IF EXISTS `v_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_menu_items` (
  `menu_item_uuid` char(36) NOT NULL,
  `menu_uuid` char(36) DEFAULT NULL,
  `menu_item_parent_uuid` char(36) DEFAULT NULL,
  `menu_item_title` text DEFAULT NULL,
  `menu_item_link` text DEFAULT NULL,
  `menu_item_icon` text DEFAULT NULL,
  `menu_item_category` text DEFAULT NULL,
  `menu_item_protected` text DEFAULT NULL,
  `menu_item_order` decimal(10,0) DEFAULT NULL,
  `menu_item_description` text DEFAULT NULL,
  `menu_item_add_user` text DEFAULT NULL,
  `menu_item_add_date` text DEFAULT NULL,
  `menu_item_mod_user` text DEFAULT NULL,
  `menu_item_mod_date` text DEFAULT NULL,
  `is_mst` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`menu_item_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_menu_languages`
--

DROP TABLE IF EXISTS `v_menu_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_menu_languages` (
  `menu_language_uuid` char(36) NOT NULL,
  `menu_uuid` char(36) DEFAULT NULL,
  `menu_item_uuid` char(36) DEFAULT NULL,
  `menu_language` text DEFAULT NULL,
  `menu_item_title` text DEFAULT NULL,
  PRIMARY KEY (`menu_language_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_menus`
--

DROP TABLE IF EXISTS `v_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_menus` (
  `menu_uuid` char(36) NOT NULL,
  `menu_name` text DEFAULT NULL,
  `menu_language` text DEFAULT NULL,
  `menu_description` text DEFAULT NULL,
  PRIMARY KEY (`menu_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_missed_call_service`
--

DROP TABLE IF EXISTS `v_missed_call_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_missed_call_service` (
  `missed_call_service_uuid` char(36) NOT NULL,
  `missed_call_service_name` varchar(100) DEFAULT NULL,
  `missed_call_service_number` varchar(20) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `api_configuration_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `sms_configuration_uuid` char(36) DEFAULT NULL,
  `sms_template_uuid` char(36) DEFAULT NULL,
  `call_type` varchar(20) DEFAULT NULL,
  `call_type_hour` varchar(20) DEFAULT NULL,
  `service_status` enum('Active','Deactive') DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`missed_call_service_uuid`),
  KEY `phone_number` (`missed_call_service_number`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `api_configuration_uuid` (`api_configuration_uuid`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`),
  KEY `sms_configuration_uuid` (`sms_configuration_uuid`),
  KEY `sms_template_uuid` (`sms_template_uuid`),
  KEY `deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_modules`
--

DROP TABLE IF EXISTS `v_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_modules` (
  `module_uuid` char(36) NOT NULL,
  `module_label` text DEFAULT NULL,
  `module_name` text DEFAULT NULL,
  `module_category` text DEFAULT NULL,
  `module_order` decimal(10,0) DEFAULT NULL,
  `module_enabled` text DEFAULT NULL,
  `module_default_enabled` text DEFAULT NULL,
  `module_description` text DEFAULT NULL,
  PRIMARY KEY (`module_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_msg_config`
--

DROP TABLE IF EXISTS `v_msg_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_msg_config` (
  `msg_config_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `msg_config_name` varchar(255) DEFAULT NULL,
  `msg_config_api` text DEFAULT NULL,
  `msg_config_request_header` text DEFAULT NULL,
  `msg_config_api_type` varchar(255) DEFAULT NULL,
  `msg_config_api_value` text DEFAULT NULL,
  `msg_config_parameter_type` varchar(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`msg_config_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_msg_template`
--

DROP TABLE IF EXISTS `v_msg_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_msg_template` (
  `msg_template_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `msg_template_name` varchar(255) DEFAULT NULL,
  `msg_template_content` text DEFAULT NULL,
  `msg_template_status` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `msg_extra_param` varchar(255) DEFAULT NULL,
  `editable` char(36) DEFAULT 'no',
  `updated_at` text DEFAULT NULL,
  `created_at` text DEFAULT NULL,
  PRIMARY KEY (`msg_template_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_msg_template_queue`
--

DROP TABLE IF EXISTS `v_msg_template_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_msg_template_queue` (
  `msgTemplate_queue_uuid` char(36) NOT NULL,
  `msg_template_uuid` char(36) DEFAULT NULL,
  `msg_template_queue_uuid` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`msgTemplate_queue_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_music_on_hold`
--

DROP TABLE IF EXISTS `v_music_on_hold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_music_on_hold` (
  `music_on_hold_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `music_on_hold_name` text DEFAULT NULL,
  `music_on_hold_path` text DEFAULT NULL,
  `music_on_hold_rate` decimal(10,0) DEFAULT NULL,
  `music_on_hold_shuffle` text DEFAULT NULL,
  `music_on_hold_channels` decimal(10,0) DEFAULT NULL,
  `music_on_hold_interval` decimal(10,0) DEFAULT NULL,
  `music_on_hold_timer_name` text DEFAULT NULL,
  `music_on_hold_chime_list` text DEFAULT NULL,
  `music_on_hold_chime_freq` decimal(10,0) DEFAULT NULL,
  `music_on_hold_chime_max` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`music_on_hold_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_node_connections`
--

DROP TABLE IF EXISTS `v_node_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_node_connections` (
  `uuid` char(36) NOT NULL,
  `host` varchar(50) NOT NULL,
  `port` char(5) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `is_supervisor_node` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `local_port` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `host` (`host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_notifications`
--

DROP TABLE IF EXISTS `v_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_notifications` (
  `notification_uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `notification_type` varchar(100) DEFAULT NULL,
  `project_notifications` mediumtext DEFAULT NULL,
  `cleared_by` char(36) DEFAULT NULL,
  `msg` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cleared_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`notification_uuid`),
  KEY `notification_type` (`notification_type`),
  KEY `created_at` (`created_at`),
  KEY `msg` (`msg`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_notifications_user`
--

DROP TABLE IF EXISTS `v_notifications_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_notifications_user` (
  `notification_user_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `notification_uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `project_notifications` varchar(36) DEFAULT NULL,
  `cleared_by` char(36) DEFAULT NULL,
  `cleared_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `notification_uuid` (`notification_uuid`),
  CONSTRAINT `v_notifications_user_ibfk_1` FOREIGN KEY (`notification_uuid`) REFERENCES `v_notifications` (`notification_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_operator_has_campaign`
--

DROP TABLE IF EXISTS `v_operator_has_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_operator_has_campaign` (
  `call_broadcast_uuid` char(36) NOT NULL,
  `operator_uuid` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_orange_ivr`
--

DROP TABLE IF EXISTS `v_orange_ivr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_orange_ivr` (
  `uuid` char(36) NOT NULL,
  `call_uuid` char(36) NOT NULL,
  `ivr_type` varchar(50) NOT NULL,
  `input_provided` varchar(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  KEY `call_uuid` (`call_uuid`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_permission`
--

DROP TABLE IF EXISTS `v_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_permission` (
  `permission_uuid` char(36) NOT NULL,
  `group_uuid` char(36) DEFAULT NULL,
  `permission_values` text DEFAULT NULL,
  `app` varchar(45) NOT NULL DEFAULT 'intalk',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`permission_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_phonebook`
--

DROP TABLE IF EXISTS `v_phonebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_phonebook` (
  `phonebook_uuid` char(36) NOT NULL,
  `group_contact_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `display_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`phonebook_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_phonebook_dtl`
--

DROP TABLE IF EXISTS `v_phonebook_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_phonebook_dtl` (
  `phonebook_dtl_uuid` char(36) NOT NULL,
  `phonebook_uuid` char(36) DEFAULT NULL,
  `numbers` varchar(15) DEFAULT NULL,
  `phonebook_primary` varchar(10) DEFAULT NULL,
  `phonebook_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`phonebook_dtl_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_phrase_details`
--

DROP TABLE IF EXISTS `v_phrase_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_phrase_details` (
  `phrase_detail_uuid` char(36) NOT NULL,
  `phrase_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `phrase_detail_group` decimal(10,0) DEFAULT NULL,
  `phrase_detail_tag` text DEFAULT NULL,
  `phrase_detail_pattern` text DEFAULT NULL,
  `phrase_detail_function` text DEFAULT NULL,
  `phrase_detail_data` text DEFAULT NULL,
  `phrase_detail_method` text DEFAULT NULL,
  `phrase_detail_type` text DEFAULT NULL,
  `phrase_detail_order` text DEFAULT NULL,
  PRIMARY KEY (`phrase_detail_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_phrases`
--

DROP TABLE IF EXISTS `v_phrases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_phrases` (
  `phrase_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `phrase_name` text DEFAULT NULL,
  `phrase_language` text DEFAULT NULL,
  `phrase_description` text DEFAULT NULL,
  `phrase_enabled` text DEFAULT NULL,
  PRIMARY KEY (`phrase_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_pin_numbers`
--

DROP TABLE IF EXISTS `v_pin_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_pin_numbers` (
  `domain_uuid` char(36) DEFAULT NULL,
  `pin_number_uuid` char(36) NOT NULL,
  `pin_number` text DEFAULT NULL,
  `accountcode` text DEFAULT NULL,
  `enabled` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`pin_number_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_pri_health_data_log`
--

DROP TABLE IF EXISTS `v_pri_health_data_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_pri_health_data_log` (
  `pri_health_uuid` char(36) NOT NULL,
  `system_uuid` char(36) DEFAULT NULL,
  `gateway_uuid` char(36) DEFAULT NULL,
  `pri_status` char(10) DEFAULT NULL,
  `pri_call_failure_frequency` float DEFAULT NULL COMMENT 'In %',
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`pri_health_uuid`),
  KEY `system_uuid` (`system_uuid`),
  KEY `gateway_uuid` (`gateway_uuid`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_pri_summary_report`
--

DROP TABLE IF EXISTS `v_pri_summary_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_pri_summary_report` (
  `pri_report_summary_uuid` char(36) DEFAULT NULL,
  `pri_uuid` char(36) DEFAULT NULL COMMENT 'Gateway UUID',
  `system_uuid` char(36) DEFAULT NULL,
  `pri_status` char(10) DEFAULT NULL,
  `pri_up` float DEFAULT NULL COMMENT 'PRI UP percentage In %',
  `pri_down` float DEFAULT NULL COMMENT 'PRI DOWN percentage In %',
  `pri_fail_call_frequency` float DEFAULT NULL COMMENT 'PRI Fail call Frequency In %',
  `report_type` char(10) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_reassiged_evaluation_tasks`
--

DROP TABLE IF EXISTS `v_reassiged_evaluation_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_reassiged_evaluation_tasks` (
  `reassigened_uuid` char(36) NOT NULL,
  `task_uuid` char(36) NOT NULL,
  `task_assignee_uuid` char(36) NOT NULL,
  `task_assigner_uuid` char(36) NOT NULL,
  `past_assignee_uuid` char(36) NOT NULL,
  `created_at` text DEFAULT NULL,
  `deleted_at` text DEFAULT NULL,
  PRIMARY KEY (`reassigened_uuid`),
  KEY `task_assignee_uuid` (`task_assignee_uuid`),
  KEY `task_assigner_uuid` (`task_assigner_uuid`),
  KEY `past_assignee_uuid` (`past_assignee_uuid`),
  KEY `created_at` (`created_at`(22)),
  KEY `deleted_at` (`deleted_at`(22))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_recording_action`
--

DROP TABLE IF EXISTS `v_recording_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_recording_action` (
  `recording_event_uuid` varchar(36) DEFAULT NULL,
  `domain_uuid` varchar(36) DEFAULT NULL,
  `call_uuid` varchar(36) DEFAULT NULL,
  `supervisor_uuid` varchar(36) DEFAULT NULL,
  `start_stamp` text DEFAULT NULL,
  `end_stamp` text DEFAULT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_recording_archival_campaign_server_mappings`
--

DROP TABLE IF EXISTS `v_recording_archival_campaign_server_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_recording_archival_campaign_server_mappings` (
  `recording_archival_campaign_server_mapping_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `server_configuration_uuid` char(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `active_status` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_recording_archival_campaign_sheduler`
--

DROP TABLE IF EXISTS `v_recording_archival_campaign_sheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_recording_archival_campaign_sheduler` (
  `scheduler_uuid` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `scheduler_time` varchar(255) DEFAULT NULL,
  `scheduler_day` enum('Mon','Tue','Wed','Thu','Fri','Sat','Sun') DEFAULT NULL,
  `scheduler_date` int(11) DEFAULT NULL,
  `scheduler_month` varchar(255) DEFAULT NULL,
  `scheduler_report_type` varchar(255) DEFAULT NULL,
  `scheduler_report_sub_type` varchar(255) DEFAULT NULL,
  `last_day_of_each_month` enum('true','false') DEFAULT NULL,
  `filter_json` text DEFAULT NULL,
  `archival_type` enum('C','M') DEFAULT NULL,
  `enabled` enum('true','false') DEFAULT NULL,
  `include_transfer` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_recording_archival_generated_status`
--

DROP TABLE IF EXISTS `v_recording_archival_generated_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_recording_archival_generated_status` (
  `scheduler_uuid` char(36) NOT NULL,
  `configration_uuid` char(36) DEFAULT NULL,
  `campaign_uuid` char(36) DEFAULT NULL,
  `archival_filters` varchar(20) DEFAULT NULL,
  `host_name` varchar(50) DEFAULT NULL,
  `server_type` varchar(50) DEFAULT NULL,
  `uploded_path` varchar(500) DEFAULT NULL,
  `upload_status` varchar(50) DEFAULT NULL,
  `upload_type` varchar(50) DEFAULT NULL,
  `local_path` varchar(500) DEFAULT NULL,
  `error` varchar(500) DEFAULT NULL,
  `v_recording_archival_generated_uuid` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`scheduler_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_recordings`
--

DROP TABLE IF EXISTS `v_recordings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_recordings` (
  `recording_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `recording_filename` text DEFAULT NULL,
  `recording_name` text DEFAULT NULL,
  `recording_description` text DEFAULT NULL,
  `recording_base64` text DEFAULT NULL,
  `recording_lang_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`recording_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_regions`
--

DROP TABLE IF EXISTS `v_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_regions` (
  `region_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `region_name` text DEFAULT NULL,
  `region_description` text DEFAULT NULL,
  `region_status` text DEFAULT NULL,
  `is_default` text DEFAULT NULL,
  `date_added` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_report`
--

DROP TABLE IF EXISTS `v_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_report` (
  `report_uuid` char(36) NOT NULL,
  `report_name` varchar(255) DEFAULT NULL,
  `report_filters` text DEFAULT NULL,
  `report_export_function_name` text DEFAULT NULL,
  `Default_value` text DEFAULT NULL,
  PRIMARY KEY (`report_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_reports_column_setting`
--

DROP TABLE IF EXISTS `v_reports_column_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_reports_column_setting` (
  `set_id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `report_name` text DEFAULT NULL,
  `column_set` text DEFAULT NULL,
  PRIMARY KEY (`set_id`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `user_uuid` (`user_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_restrict`
--

DROP TABLE IF EXISTS `v_restrict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_restrict` (
  `r_uid` char(36) NOT NULL,
  `p_key` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  `domain` text DEFAULT NULL,
  PRIMARY KEY (`r_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_ring_group_destinations`
--

DROP TABLE IF EXISTS `v_ring_group_destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_ring_group_destinations` (
  `ring_group_destination_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `ring_group_uuid` char(36) DEFAULT NULL,
  `destination_number` varchar(255) DEFAULT NULL,
  `destination_delay` decimal(10,0) DEFAULT NULL,
  `destination_timeout` decimal(10,0) DEFAULT NULL,
  `destination_prompt` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ring_group_destination_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_ring_group_users`
--

DROP TABLE IF EXISTS `v_ring_group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_ring_group_users` (
  `ring_group_user_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `ring_group_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`ring_group_user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_ring_groups`
--

DROP TABLE IF EXISTS `v_ring_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_ring_groups` (
  `domain_uuid` char(36) DEFAULT NULL,
  `ring_group_uuid` char(36) NOT NULL,
  `ring_group_name` text DEFAULT NULL,
  `ring_group_extension` text DEFAULT NULL,
  `ring_group_context` text DEFAULT NULL,
  `ring_group_forward_destination` varchar(255) DEFAULT NULL,
  `ring_group_forward_enabled` text DEFAULT NULL,
  `ring_group_cid_name_prefix` text DEFAULT NULL,
  `ring_group_cid_number_prefix` text DEFAULT NULL,
  `ring_group_strategy` text DEFAULT NULL,
  `ring_group_timeout_app` text DEFAULT NULL,
  `ring_group_timeout_data` text DEFAULT NULL,
  `ring_group_distinctive_ring` text DEFAULT NULL,
  `ring_group_ringback` text DEFAULT NULL,
  `ring_group_missed_call_app` text DEFAULT NULL,
  `ring_group_missed_call_data` text DEFAULT NULL,
  `ring_group_enabled` text DEFAULT NULL,
  `ring_group_description` text DEFAULT NULL,
  `dialplan_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`ring_group_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_salesforce_user_mapping`
--

DROP TABLE IF EXISTS `v_salesforce_user_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_salesforce_user_mapping` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `salesforce_emailid` varchar(100) NOT NULL,
  `intalk_userid` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_scheduler`
--

DROP TABLE IF EXISTS `v_scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_scheduler` (
  `scheduler_uuid` char(36) NOT NULL,
  `scheduler_type` varchar(20) DEFAULT NULL,
  `app_uuid` char(36) DEFAULT NULL,
  `day_type` varchar(20) DEFAULT NULL,
  `enabled` varchar(10) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`scheduler_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_scheduler_api`
--

DROP TABLE IF EXISTS `v_scheduler_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_scheduler_api` (
  `api_uuid` char(36) NOT NULL,
  `scheduler_uuid` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_scheduler_details`
--

DROP TABLE IF EXISTS `v_scheduler_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_scheduler_details` (
  `scheduler_details_uuid` char(36) NOT NULL,
  `scheduler_uuid` char(36) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `week_days` varchar(40) DEFAULT NULL,
  `month` varchar(40) DEFAULT NULL,
  `dates` varchar(40) DEFAULT NULL,
  `break_start_time` time DEFAULT NULL,
  `break_end_time` time DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `running_dates` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`scheduler_details_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_scheduler_report`
--

DROP TABLE IF EXISTS `v_scheduler_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_scheduler_report` (
  `scheduler_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `scheduler_report_title` varchar(255) DEFAULT NULL,
  `mail_config_uuid` char(36) DEFAULT NULL,
  `report_uuid` char(36) DEFAULT NULL,
  `scheduler_report_filters` text DEFAULT NULL,
  `scheduler_report_type` enum('Daily','Week','Month','Year') DEFAULT NULL,
  `scheduler_report_sub_type` varchar(255) DEFAULT NULL,
  `scheduler_time` varchar(255) DEFAULT NULL,
  `scheduler_day` enum('Mon','Tue','Wed','Thu','Fri','Sat','Sun') DEFAULT NULL,
  `scheduler_date` int(11) DEFAULT NULL,
  `scheduler_month` varchar(255) DEFAULT NULL,
  `last_day_of_each_month` enum('true','false') DEFAULT NULL,
  `enabled` enum('true','false') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `storage_path` varchar(255) DEFAULT NULL,
  `schedular_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`scheduler_uuid`),
  KEY `domain_uuid` (`domain_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_scheduler_report_cc_email`
--

DROP TABLE IF EXISTS `v_scheduler_report_cc_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_scheduler_report_cc_email` (
  `scheduler_cc_email_uuid` char(36) NOT NULL,
  `scheduler_uuid` char(36) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scheduler_cc_email_uuid`),
  KEY `scheduler_uuid` (`scheduler_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_scheduler_report_generated`
--

DROP TABLE IF EXISTS `v_scheduler_report_generated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_scheduler_report_generated` (
  `report_generated_uuid` char(36) NOT NULL,
  `scheduler_report_uuid` char(36) DEFAULT NULL,
  `to_email` text DEFAULT NULL,
  `cc_email` text DEFAULT NULL,
  `report_filters` text DEFAULT NULL,
  `report_path` text DEFAULT NULL,
  `mail_status` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`report_generated_uuid`),
  KEY `scheduler_report_uuid` (`scheduler_report_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_scheduler_report_to_email`
--

DROP TABLE IF EXISTS `v_scheduler_report_to_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_scheduler_report_to_email` (
  `scheduler_to_email_uuid` char(36) NOT NULL,
  `scheduler_uuid` char(36) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scheduler_to_email_uuid`),
  KEY `scheduler_uuid` (`scheduler_uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_script`
--

DROP TABLE IF EXISTS `v_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_script` (
  `script_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `script_name` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`script_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_script_formdata`
--

DROP TABLE IF EXISTS `v_script_formdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_script_formdata` (
  `script_uuid` char(36) NOT NULL,
  `form_data` text NOT NULL,
  PRIMARY KEY (`script_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_script_has_campaign`
--

DROP TABLE IF EXISTS `v_script_has_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_script_has_campaign` (
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `script_uuid` char(36) DEFAULT NULL,
  `call_center_queue_uuid` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_script_questions`
--

DROP TABLE IF EXISTS `v_script_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_script_questions` (
  `question_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `script_uuid` char(36) DEFAULT NULL,
  `question_title` text DEFAULT NULL,
  `input_type` text DEFAULT NULL,
  `input_value` text DEFAULT NULL,
  `default_value` text DEFAULT NULL,
  `input_name` text DEFAULT NULL,
  `inpur_required` text DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  PRIMARY KEY (`question_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_sent_mail`
--

DROP TABLE IF EXISTS `v_sent_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_sent_mail` (
  `sent_mail_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `mail_template_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `contact_broadcast_uuid` char(36) DEFAULT NULL,
  `callcenter_queue_uuid` char(36) DEFAULT NULL,
  `email_subject` text DEFAULT NULL,
  `email_content` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `sent_time` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `email_to` text DEFAULT NULL,
  `email_cc` text DEFAULT NULL,
  `email_bcc` text DEFAULT NULL,
  `response_message` text DEFAULT NULL,
  `call_state_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`sent_mail_uuid`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`),
  KEY `user_uuid` (`user_uuid`),
  KEY `call_uuid` (`call_uuid`),
  KEY `contact_broadcast_uuid` (`contact_broadcast_uuid`),
  KEY `call_state_uuid` (`call_state_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_sent_msg`
--

DROP TABLE IF EXISTS `v_sent_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_sent_msg` (
  `sent_msg_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `msg_template_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `contact_broadcast_uuid` char(36) DEFAULT NULL,
  `callcenter_queue_uuid` char(36) DEFAULT NULL,
  `call_broadcast_uuid` char(36) DEFAULT NULL,
  `sent_msg_number` varchar(255) DEFAULT NULL,
  `sent_message` text DEFAULT NULL,
  `api_response` text DEFAULT NULL,
  `sms_response` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `sent_time` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `v_sent_msg` datetime DEFAULT NULL,
  `incoming_sms_id` int(11) DEFAULT NULL,
  `port_number` int(11) DEFAULT NULL,
  `taken_action` enum('YES','NO') DEFAULT NULL,
  `sms_status` enum('received','sent','failed') DEFAULT NULL,
  `api_parameters` text DEFAULT NULL,
  `status_code` text DEFAULT NULL,
  `call_state_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`sent_msg_uuid`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `call_broadcast_uuid` (`call_broadcast_uuid`),
  KEY `contact_broadcast_uuid` (`contact_broadcast_uuid`),
  KEY `user_uuid` (`user_uuid`),
  KEY `call_uuid` (`call_uuid`),
  KEY `call_state_uuid` (`call_state_uuid`),
  KEY `sent_msg_number` (`sent_msg_number`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_server_configuration_recording_archival`
--

DROP TABLE IF EXISTS `v_server_configuration_recording_archival`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_server_configuration_recording_archival` (
  `server_configuration_uuid` char(36) DEFAULT NULL,
  `server_type` varchar(30) DEFAULT NULL,
  `config_name` varchar(100) DEFAULT NULL,
  `host_name` varchar(100) DEFAULT NULL,
  `configuration_json` text DEFAULT NULL,
  `folder_location` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `active_status` varchar(10) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_server_ping_status`
--

DROP TABLE IF EXISTS `v_server_ping_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_server_ping_status` (
  `ping_health_uuid` char(36) DEFAULT NULL,
  `ping_request_server_uuid` char(36) DEFAULT NULL,
  `ping_response_server_uuid` char(36) DEFAULT NULL,
  `ping_status` char(10) DEFAULT NULL,
  `ping_error_code` int(11) DEFAULT NULL,
  `ping_error_message` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  KEY `ping_request_server_uuid` (`ping_request_server_uuid`),
  KEY `ping_response_server_uuid` (`ping_response_server_uuid`),
  KEY `ping_status` (`ping_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_service_summary_report`
--

DROP TABLE IF EXISTS `v_service_summary_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_service_summary_report` (
  `service_report_summary_uuid` char(36) NOT NULL,
  `service_uuid` char(36) DEFAULT NULL,
  `system_uuid` char(36) DEFAULT NULL,
  `service_status` char(10) DEFAULT NULL,
  `cpu_utilization` varchar(100) DEFAULT NULL COMMENT 'CPU Utilization (min , max, avg) In %',
  `memory_utiilzation` varchar(100) DEFAULT NULL COMMENT 'Memory Utilization (min , max, avg) In %',
  `threads` varchar(100) DEFAULT NULL COMMENT 'HDD Utilization (min , max, avg) In %',
  `service_up` varchar(10) DEFAULT NULL,
  `service_down` varchar(10) DEFAULT NULL,
  `service_uptime` varchar(100) DEFAULT NULL,
  `service_downtime` varchar(100) DEFAULT NULL,
  `report_type` char(10) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`service_report_summary_uuid`),
  KEY `service_uuid` (`service_uuid`),
  KEY `system_uuid` (`system_uuid`),
  KEY `service_status` (`service_status`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_services`
--

DROP TABLE IF EXISTS `v_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_services` (
  `service_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `service_name` text DEFAULT NULL,
  `service_type` text DEFAULT NULL,
  `service_data` text DEFAULT NULL,
  `service_cmd_start` text DEFAULT NULL,
  `service_cmd_stop` text DEFAULT NULL,
  `service_cmd_restart` text DEFAULT NULL,
  `service_description` text DEFAULT NULL,
  PRIMARY KEY (`service_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_services_mst`
--

DROP TABLE IF EXISTS `v_services_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_services_mst` (
  `service_uuid` char(36) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `system_uuid` char(36) DEFAULT NULL,
  `service_cmd` varchar(200) DEFAULT NULL,
  `created_at` varchar(20) DEFAULT NULL,
  `deleted_at` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`service_uuid`),
  KEY `system_uuid` (`system_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_services_status`
--

DROP TABLE IF EXISTS `v_services_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_services_status` (
  `service_status_uuid` char(36) DEFAULT NULL,
  `service_uuid` char(36) DEFAULT NULL,
  `status_stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('UP','DOWN') DEFAULT NULL,
  `created_at` varchar(20) DEFAULT NULL,
  `deleted_at` varchar(20) DEFAULT NULL,
  `service_memory_utilized` float DEFAULT 0,
  `service_cpu_utilized` float DEFAULT 0,
  `service_threads` float DEFAULT 0,
  KEY `service_status_uuid` (`service_status_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_settings`
--

DROP TABLE IF EXISTS `v_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_settings` (
  `setting_uuid` char(36) NOT NULL,
  `numbering_plan` text DEFAULT NULL,
  `event_socket_ip_address` text DEFAULT NULL,
  `event_socket_port` text DEFAULT NULL,
  `event_socket_password` text DEFAULT NULL,
  `xml_rpc_http_port` text DEFAULT NULL,
  `xml_rpc_auth_realm` text DEFAULT NULL,
  `xml_rpc_auth_user` text DEFAULT NULL,
  `xml_rpc_auth_pass` text DEFAULT NULL,
  `admin_pin` decimal(10,0) DEFAULT NULL,
  `mod_shout_decoder` text DEFAULT NULL,
  `mod_shout_volume` text DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `day_filter` int(11) DEFAULT NULL,
  `region_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`setting_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_shift_calendar_attendance_data`
--

DROP TABLE IF EXISTS `v_shift_calendar_attendance_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_shift_calendar_attendance_data` (
  `shift_date` date NOT NULL,
  `shift_name` varchar(100) DEFAULT NULL,
  `planned_headcount` int(11) NOT NULL,
  `present_headcount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_shift_calendar_attendance_data_supervisor`
--

DROP TABLE IF EXISTS `v_shift_calendar_attendance_data_supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_shift_calendar_attendance_data_supervisor` (
  `shift_date` date NOT NULL,
  `shift_name` varchar(100) DEFAULT NULL,
  `planned_headcount` int(11) NOT NULL,
  `present_headcount` int(11) NOT NULL,
  KEY `shift_name` (`shift_name`),
  KEY `shift_date` (`shift_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_shift_calendar_user_data`
--

DROP TABLE IF EXISTS `v_shift_calendar_user_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_shift_calendar_user_data` (
  `shift_uuid` char(36) DEFAULT NULL,
  `shift_name` varchar(200) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `login_date` date NOT NULL,
  `shift_login` time NOT NULL,
  `shift_logout` time NOT NULL,
  `shift_duration` time NOT NULL,
  `first_login` time NOT NULL,
  `last_logout` time NOT NULL,
  `actual_login_duration` time NOT NULL,
  `gross_shift_login_duration` time NOT NULL,
  `total_sessions` int(11) NOT NULL,
  `pre_shift_duration` time NOT NULL,
  `post_shift_duration` time NOT NULL,
  `during_shift_duration` time NOT NULL,
  `shift_start` time NOT NULL,
  `shift_end` time NOT NULL,
  `login_adherence` time NOT NULL,
  `break_adherence` time NOT NULL,
  `Occupancy` varchar(36) DEFAULT NULL,
  `Shrinkage` varchar(36) DEFAULT NULL,
  `break_duration` varchar(36) DEFAULT NULL,
  `Break_Duration2` time NOT NULL,
  `call_Duration` time NOT NULL,
  `Wrapup_Duration` time NOT NULL,
  `auto_call_off_Duration` time NOT NULL,
  `Ringing_Duration` time NOT NULL,
  `Waiting_Duration` time NOT NULL,
  `max_chat_time` time DEFAULT '00:00:00',
  `chat_accepted` int(11) DEFAULT 0,
  `total_assign` int(11) DEFAULT 0,
  `chat_time` time DEFAULT '00:00:00',
  `avg_chat_time` time DEFAULT '00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_shift_calendar_user_data_supervisor`
--

DROP TABLE IF EXISTS `v_shift_calendar_user_data_supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_shift_calendar_user_data_supervisor` (
  `shift_uuid` char(36) NOT NULL,
  `shift_name` varchar(200) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `login_date` date NOT NULL,
  `shift_login` time NOT NULL,
  `shift_logout` time NOT NULL,
  `shift_duration` time NOT NULL,
  `first_login` time NOT NULL,
  `last_logout` time NOT NULL,
  `actual_login_duration` time NOT NULL,
  `shift_start` time NOT NULL,
  `shift_end` time NOT NULL,
  `login_adherence` time NOT NULL,
  `break_adherence` time NOT NULL,
  `Occupancy` varchar(36) DEFAULT NULL,
  `Shrinkage` varchar(36) DEFAULT NULL,
  `break_duration` varchar(36) DEFAULT NULL,
  `Break_Duration2` time NOT NULL,
  `call_Duration` time NOT NULL,
  `Wrapup_Duration` time NOT NULL,
  `auto_call_off_Duration` time NOT NULL,
  `Ringing_Duration` time NOT NULL,
  `Waiting_Duration` time NOT NULL,
  `total_sessions` int(11) NOT NULL,
  `chat_time` time DEFAULT '00:00:00',
  `avg_chat_time` time DEFAULT '00:00:00',
  `max_chat_time` time DEFAULT '00:00:00',
  `chat_accepted` int(11) NOT NULL DEFAULT 0,
  `total_assign` int(11) NOT NULL DEFAULT 0,
  `gross_shift_login_duration` time NOT NULL,
  `pre_shift_duration` time NOT NULL,
  `post_shift_duration` time NOT NULL,
  `during_shift_duration` time NOT NULL,
  PRIMARY KEY (`shift_uuid`),
  KEY `user_uuid` (`user_uuid`),
  KEY `shift_start` (`shift_start`),
  KEY `shift_end` (`shift_end`),
  KEY `login_date` (`login_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_shifts`
--

DROP TABLE IF EXISTS `v_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_shifts` (
  `shift_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `shift_name` varchar(66) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `shift_break_time` time NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `shift_color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`shift_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_shifts_schedule`
--

DROP TABLE IF EXISTS `v_shifts_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_shifts_schedule` (
  `shift_uuid` char(36) NOT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `day_of_week` varchar(36) DEFAULT NULL,
  `effective_from` datetime DEFAULT NULL,
  `effective_till` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`shift_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_shifts_users`
--

DROP TABLE IF EXISTS `v_shifts_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_shifts_users` (
  `shift_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `effective_from` datetime DEFAULT NULL,
  `effective_till` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_sip_profile_domains`
--

DROP TABLE IF EXISTS `v_sip_profile_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_sip_profile_domains` (
  `sip_profile_domain_uuid` char(36) NOT NULL,
  `sip_profile_uuid` char(36) DEFAULT NULL,
  `sip_profile_domain_name` text DEFAULT NULL,
  `sip_profile_domain_alias` text DEFAULT NULL,
  `sip_profile_domain_parse` text DEFAULT NULL,
  PRIMARY KEY (`sip_profile_domain_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_sip_profile_settings`
--

DROP TABLE IF EXISTS `v_sip_profile_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_sip_profile_settings` (
  `sip_profile_setting_uuid` char(36) NOT NULL,
  `sip_profile_uuid` char(36) DEFAULT NULL,
  `sip_profile_setting_name` text DEFAULT NULL,
  `sip_profile_setting_value` text DEFAULT NULL,
  `sip_profile_setting_enabled` text DEFAULT NULL,
  `sip_profile_setting_description` text DEFAULT NULL,
  PRIMARY KEY (`sip_profile_setting_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_sip_profiles`
--

DROP TABLE IF EXISTS `v_sip_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_sip_profiles` (
  `sip_profile_uuid` char(36) NOT NULL,
  `sip_profile_name` text DEFAULT NULL,
  `sip_profile_hostname` char(255) DEFAULT NULL,
  `sip_profile_enabled` text DEFAULT NULL,
  `sip_profile_description` text DEFAULT NULL,
  PRIMARY KEY (`sip_profile_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_sms`
--

DROP TABLE IF EXISTS `v_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_sms` (
  `incoming_sms_id` int(11) NOT NULL,
  `port_number` int(11) DEFAULT NULL,
  `sender_number` varchar(15) DEFAULT NULL,
  `receiver_number` varchar(15) DEFAULT NULL,
  `sms_text` text DEFAULT NULL,
  `sms_status` enum('received','sent') DEFAULT NULL,
  `sms_time` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  KEY `sms_status` (`sms_status`),
  KEY `port_number` (`port_number`),
  KEY `sender_number` (`sender_number`),
  KEY `receiver_number` (`receiver_number`),
  KEY `sms_time` (`sms_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_software`
--

DROP TABLE IF EXISTS `v_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_software` (
  `software_uuid` char(36) NOT NULL,
  `software_name` text DEFAULT NULL,
  `software_url` text DEFAULT NULL,
  `software_version` text DEFAULT NULL,
  PRIMARY KEY (`software_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_splitted_recording`
--

DROP TABLE IF EXISTS `v_splitted_recording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_splitted_recording` (
  `split_uuid` char(36) NOT NULL,
  `call_uuid` char(36) NOT NULL,
  `campaign_uuid` char(36) NOT NULL,
  `queue_uuid` char(36) NOT NULL,
  `contact_unique_id` char(36) DEFAULT NULL,
  `recording_file` text NOT NULL,
  `left_channel_file` text DEFAULT NULL,
  `right_channel_file` text DEFAULT NULL,
  `split_status` varchar(36) NOT NULL,
  `process_count` int(1) unsigned zerofill NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `broadcast_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_sticky_agent`
--

DROP TABLE IF EXISTS `v_sticky_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_sticky_agent` (
  `sticky_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `sticky_agent` char(36) DEFAULT NULL,
  `sticky_offered` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sticky_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_sticky_agent_call_detail`
--

DROP TABLE IF EXISTS `v_sticky_agent_call_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_sticky_agent_call_detail` (
  `call_uuid` char(36) NOT NULL,
  `sticky_agent` char(36) NOT NULL,
  `sticky_period` int(11) NOT NULL,
  `sticky_post_action` char(36) NOT NULL,
  `sticky_status` char(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`call_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_supervisor_mst`
--

DROP TABLE IF EXISTS `v_supervisor_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_supervisor_mst` (
  `domain_uuid` char(36) DEFAULT NULL,
  `s_uuid` char(36) DEFAULT NULL,
  `s_name` char(100) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_supervisor_state`
--

DROP TABLE IF EXISTS `v_supervisor_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_supervisor_state` (
  `state_uuid` char(36) NOT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `login_history_id` char(36) DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `state_name` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `end_time` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`state_uuid`),
  KEY `agent_uuid` (`user_uuid`) USING BTREE,
  KEY `login_history_id` (`login_history_id`) USING BTREE,
  KEY `state_name` (`state_name`(10)),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_survey_feedback_designer`
--

DROP TABLE IF EXISTS `v_survey_feedback_designer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_survey_feedback_designer` (
  `survey_feedback_uuid` char(36) NOT NULL,
  `survey_feedback_name` varchar(50) NOT NULL,
  `survey_feedback_extension` int(6) NOT NULL,
  `confirmation_reattempts` int(3) DEFAULT NULL,
  `confirmation_timeout` int(3) DEFAULT NULL,
  `survey_greeting_file` text DEFAULT NULL,
  `begin_confirmation_file` text DEFAULT NULL,
  `begin_confirmation_key` varchar(10) DEFAULT NULL,
  `exist_sound_file` text DEFAULT NULL,
  `dialplan_uuid` char(36) NOT NULL,
  `node_data` text DEFAULT NULL,
  `node_property` text DEFAULT NULL,
  `question_option` text NOT NULL,
  `zoom_range` double NOT NULL,
  `survey_json_data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `domain_uuid` char(36) NOT NULL,
  `survey_reattempts` int(3) DEFAULT NULL,
  `survey_timeout` int(3) DEFAULT NULL,
  `lang_code` varchar(50) DEFAULT 'en-XX',
  PRIMARY KEY (`survey_feedback_uuid`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_survey_feedback_hgs`
--

DROP TABLE IF EXISTS `v_survey_feedback_hgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_survey_feedback_hgs` (
  `survey_feedback_hgs_uuid` char(36) NOT NULL,
  `employee_number` char(36) NOT NULL,
  `request_number` char(36) NOT NULL,
  `call_uuid` char(36) NOT NULL,
  `call_state_uuid` char(36) NOT NULL,
  PRIMARY KEY (`survey_feedback_hgs_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_survey_feedback_question`
--

DROP TABLE IF EXISTS `v_survey_feedback_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_survey_feedback_question` (
  `question_uuid` char(36) NOT NULL,
  `survey_feedback_uuid` char(36) NOT NULL,
  `question_title` varchar(100) NOT NULL,
  `question_description` text DEFAULT NULL,
  `voice_file` varchar(100) NOT NULL,
  `invalid_sound` varchar(100) NOT NULL,
  `timeout_sound` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `default_action` varchar(50) DEFAULT NULL,
  `default_action_data` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_survey_feedback_question_options`
--

DROP TABLE IF EXISTS `v_survey_feedback_question_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_survey_feedback_question_options` (
  `question_option_uuid` char(36) NOT NULL,
  `question_uuid` char(36) NOT NULL,
  `option_title` varchar(50) NOT NULL,
  `digit_press` char(4) NOT NULL,
  `next_action` varchar(100) DEFAULT NULL,
  `next_action_data` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`question_option_uuid`),
  KEY `question_uuid` (`question_uuid`),
  KEY `digit_press` (`digit_press`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_system_health_data_logs`
--

DROP TABLE IF EXISTS `v_system_health_data_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_system_health_data_logs` (
  `system_health_data_uuid` char(36) DEFAULT NULL,
  `system_uuid` char(36) DEFAULT NULL,
  `used_hdd_storage` varchar(50) DEFAULT NULL COMMENT 'IN %',
  `memory_utilization` float DEFAULT NULL COMMENT 'IN %',
  `cpu_utilization` float DEFAULT NULL COMMENT 'IN %',
  `load_average` float DEFAULT NULL COMMENT 'IN %',
  `system_uptime` varchar(20) DEFAULT NULL,
  `system_json_data` text DEFAULT NULL,
  `created_at` varchar(20) DEFAULT 'CURRENT_TIMESTAMP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_system_summary_report`
--

DROP TABLE IF EXISTS `v_system_summary_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_system_summary_report` (
  `system_report_summary_uuid` char(36) NOT NULL,
  `system_uuid` char(36) DEFAULT NULL,
  `system_total_uptime` float DEFAULT NULL COMMENT 'In days',
  `system_status` char(5) DEFAULT NULL,
  `cpu_utilization` varchar(100) DEFAULT NULL COMMENT 'CPU Utilization (min , max, avg) In %',
  `memory_utiilzation` varchar(100) DEFAULT NULL COMMENT 'Memory Utilization (min , max, avg) In %',
  `hdd_utiilzation` varchar(255) DEFAULT NULL COMMENT 'HDD Utilization (min , max, avg) In %',
  `load_utiilzation` varchar(100) DEFAULT NULL COMMENT 'Load Utilization (min , max, avg) In %',
  `report_type` char(10) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `system_up` varchar(10) DEFAULT NULL,
  `system_down` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`system_report_summary_uuid`),
  KEY `report_type` (`report_type`),
  KEY `system_uuid` (`system_uuid`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_systems_mst`
--

DROP TABLE IF EXISTS `v_systems_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_systems_mst` (
  `system_uuid` char(36) NOT NULL,
  `system_name` varchar(100) DEFAULT NULL,
  `ip_addr` varchar(20) DEFAULT NULL,
  `primary_ip` varchar(20) DEFAULT NULL,
  `secondary_ip` varchar(20) DEFAULT NULL,
  `created_at` varchar(20) DEFAULT NULL,
  `deleted_at` varchar(20) DEFAULT NULL,
  `domain_name` varchar(100) DEFAULT NULL,
  `local_ip_address` varchar(20) DEFAULT NULL,
  `server_mail_configuration` char(36) DEFAULT NULL,
  `app_domain_name` varchar(50) DEFAULT NULL,
  `receive_mail_on` varchar(255) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `is_sync` enum('Yes','No') DEFAULT 'No',
  PRIMARY KEY (`system_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_systems_status`
--

DROP TABLE IF EXISTS `v_systems_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_systems_status` (
  `system_status_uuid` char(36) DEFAULT NULL,
  `system_uuid` char(36) DEFAULT NULL,
  `status_stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('UP','DOWN') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_task_work_time`
--

DROP TABLE IF EXISTS `v_task_work_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_task_work_time` (
  `v_task_work_time_uuid` char(36) NOT NULL,
  `task_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `start_time` text DEFAULT NULL,
  `end_time` text DEFAULT NULL,
  `no_of_calls` text DEFAULT NULL,
  `no_of_completed_calls` text DEFAULT NULL,
  `record_id` text DEFAULT NULL,
  `task_creator_uuid` char(36) DEFAULT NULL,
  `task_assignee_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`v_task_work_time_uuid`),
  KEY `task_assignee_uuid` (`task_assignee_uuid`),
  KEY `task_uuid` (`task_uuid`),
  KEY `task_creator_uuid` (`task_creator_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_team_mst`
--

DROP TABLE IF EXISTS `v_team_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_team_mst` (
  `domain_uuid` char(36) DEFAULT NULL,
  `t_uuid` char(36) NOT NULL,
  `t_name` text DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`t_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_team_supervisor_mapping`
--

DROP TABLE IF EXISTS `v_team_supervisor_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_team_supervisor_mapping` (
  `s_uuid` char(36) DEFAULT NULL,
  `t_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_thirdparty_api_log`
--

DROP TABLE IF EXISTS `v_thirdparty_api_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_thirdparty_api_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(120) DEFAULT NULL,
  `request` text DEFAULT NULL,
  `response` text DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `date_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_time` (`date_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_tiss_call_info`
--

DROP TABLE IF EXISTS `v_tiss_call_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_tiss_call_info` (
  `tiss_call_info_uuid` char(36) NOT NULL,
  `tiss_customer_uuid` char(36) DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `call_type` varchar(32) DEFAULT NULL,
  `problem_resantation` mediumtext DEFAULT NULL,
  `call_summary` mediumtext DEFAULT NULL,
  `primary_issue` varchar(150) DEFAULT NULL,
  `primary_sub_issue` varchar(150) DEFAULT NULL,
  `level_of_distress` varchar(50) DEFAULT NULL,
  `secondary_issue` varchar(150) DEFAULT NULL,
  `secondary_sub_issue` varchar(150) DEFAULT NULL,
  `tertailry_issue` varchar(150) DEFAULT NULL,
  `tertailry_sub_issue` varchar(150) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `sub_type` varchar(45) DEFAULT NULL,
  `strategy_used` mediumtext DEFAULT NULL,
  `final_outcome` mediumtext DEFAULT NULL,
  `accesing_mode` varchar(50) DEFAULT NULL,
  `tick_box` varchar(20) DEFAULT NULL,
  `referral_provided` varchar(20) DEFAULT NULL,
  `referral_provided_type` varchar(150) DEFAULT NULL,
  `time_of_session` datetime DEFAULT NULL,
  `counsellor_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `assistance_offered` mediumtext DEFAULT NULL,
  `notes` mediumtext DEFAULT NULL,
  `followup_detail` varchar(255) DEFAULT NULL,
  `other_primary_issue` mediumtext DEFAULT NULL,
  `plan_of_action` mediumtext DEFAULT NULL,
  `feedback` mediumtext DEFAULT NULL,
  `source_of_referral` varchar(100) DEFAULT NULL,
  `other_helpline` varchar(50) DEFAULT NULL,
  `unique_location` mediumtext DEFAULT NULL,
  `nature_of_crisis` varchar(50) DEFAULT NULL,
  `mental_health_type` varchar(50) DEFAULT NULL,
  `extra_info` varchar(150) DEFAULT NULL,
  `language` varchar(45) DEFAULT NULL,
  `other_primary_strategy` mediumtext DEFAULT NULL,
  `relationship` varchar(150) DEFAULT NULL,
  `helping_profession` varchar(45) DEFAULT NULL,
  `organization` varchar(150) DEFAULT NULL,
  `organization_name` mediumtext DEFAULT NULL,
  `organization_type` varchar(50) DEFAULT NULL,
  `covid_related_type` varchar(50) DEFAULT NULL,
  `crisis_type` varchar(50) DEFAULT NULL,
  `primary_suicide_remark` mediumtext DEFAULT NULL,
  `primary_substance_abuse_remark` mediumtext DEFAULT NULL,
  `refered_to` varchar(100) DEFAULT NULL,
  `other_secondary_issue` mediumtext DEFAULT NULL,
  `other_secondary_sub_issue` mediumtext DEFAULT NULL,
  `other_secondary_strategy` mediumtext DEFAULT NULL,
  `secondary_suicide_remark` mediumtext DEFAULT NULL,
  `other_primary_sub_issue` mediumtext DEFAULT NULL,
  `secondary_substance_abuse_remark` mediumtext DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tiss_call_info_uuid`),
  KEY `call_dtl_uuid` (`call_uuid`),
  KEY `tiss_customer_uuid` (`tiss_customer_uuid`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_tiss_call_strategy_info`
--

DROP TABLE IF EXISTS `v_tiss_call_strategy_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_tiss_call_strategy_info` (
  `call_strategy_uuid` char(36) NOT NULL,
  `call_uuid` char(36) NOT NULL,
  `issue_type` varchar(50) NOT NULL,
  `issue_uuid` char(36) NOT NULL,
  `sub_issue_uuid` char(36) NOT NULL,
  `strategy_uuid` char(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `call_uuid` (`call_uuid`),
  KEY `strategy_uuid` (`strategy_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_tiss_customer_info`
--

DROP TABLE IF EXISTS `v_tiss_customer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_tiss_customer_info` (
  `tiss_customer_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `contact_broadcast_uuid` char(36) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `contact_no` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `state` varchar(150) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `location` mediumtext DEFAULT NULL,
  `maretial_status` varchar(45) DEFAULT NULL,
  `source_of_refferal` varchar(100) DEFAULT NULL,
  `language` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `refferal_agency` varchar(100) DEFAULT NULL,
  `caller_type` varchar(100) DEFAULT NULL,
  `other_name` varchar(255) DEFAULT NULL,
  `class` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `id_number` varchar(50) NOT NULL,
  KEY `tiss_customer_uuid` (`tiss_customer_uuid`),
  KEY `broadcast_contact_uuid` (`contact_broadcast_uuid`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `id_number` (`id_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_tiss_issue_info`
--

DROP TABLE IF EXISTS `v_tiss_issue_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_tiss_issue_info` (
  `tiss_issue_uuid` char(36) DEFAULT NULL,
  `parent_uuid` char(36) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `name` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  KEY `tiss_issue_uuid` (`tiss_issue_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_tiss_issue_script_info`
--

DROP TABLE IF EXISTS `v_tiss_issue_script_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_tiss_issue_script_info` (
  `issue_script_uuid` varchar(36) DEFAULT NULL,
  `tiss_issue_uuid` varchar(36) DEFAULT NULL,
  `question` mediumtext NOT NULL,
  `question_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_tiss_issue_strategy_mapping`
--

DROP TABLE IF EXISTS `v_tiss_issue_strategy_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_tiss_issue_strategy_mapping` (
  `issue_strategy_uuid` char(36) NOT NULL,
  `issue_uuid` char(36) NOT NULL,
  `sub_issue_uuid` char(36) NOT NULL,
  `strategy_uuid` char(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_tiss_script_answer_info`
--

DROP TABLE IF EXISTS `v_tiss_script_answer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_tiss_script_answer_info` (
  `script_answer_uuid` varchar(36) DEFAULT NULL,
  `tiss_customer_uuid` varchar(36) DEFAULT NULL,
  `tiss_issue_uuid` varchar(36) DEFAULT NULL,
  `call_uuid` varchar(36) DEFAULT NULL,
  `issue_type` varchar(50) DEFAULT NULL,
  `issue_script_uuid` varchar(36) DEFAULT NULL,
  `answer` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_tiss_strategy_info`
--

DROP TABLE IF EXISTS `v_tiss_strategy_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_tiss_strategy_info` (
  `strategy_uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `strategy_uuid` (`strategy_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_tiss_sub_issue_script_info`
--

DROP TABLE IF EXISTS `v_tiss_sub_issue_script_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_tiss_sub_issue_script_info` (
  `sub_issue_script_uuid` varchar(36) DEFAULT NULL,
  `issue_script_uuid` varchar(36) DEFAULT NULL,
  `question` mediumtext NOT NULL,
  `question_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_user_settings`
--

DROP TABLE IF EXISTS `v_user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_user_settings` (
  `user_setting_uuid` char(36) NOT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `user_setting_category` text DEFAULT NULL,
  `user_setting_subcategory` text DEFAULT NULL,
  `user_setting_name` text DEFAULT NULL,
  `user_setting_value` text DEFAULT NULL,
  `user_setting_order` decimal(10,0) DEFAULT NULL,
  `user_setting_enabled` text DEFAULT NULL,
  `user_setting_description` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_setting_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_user_state_webhook`
--

DROP TABLE IF EXISTS `v_user_state_webhook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_user_state_webhook` (
  `uuid` char(36) NOT NULL,
  `api_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) NOT NULL,
  `user_status` enum('login','logout','break-in','break-out') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  KEY `api_uuid` (`api_uuid`),
  KEY `domain_uuid` (`domain_uuid`),
  KEY `user_status` (`user_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_user_team_mapping`
--

DROP TABLE IF EXISTS `v_user_team_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_user_team_mapping` (
  `user_uuid` char(36) DEFAULT NULL,
  `s_uuid` char(36) DEFAULT NULL,
  `t_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_users`
--

DROP TABLE IF EXISTS `v_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_users` (
  `user_uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `user_token` varchar(100) DEFAULT NULL,
  `main_domain_uuid` varchar(100) DEFAULT NULL,
  `username` mediumtext DEFAULT NULL,
  `password` mediumtext DEFAULT NULL,
  `salt` mediumtext DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `user_status` mediumtext DEFAULT NULL,
  `api_key` char(36) DEFAULT NULL,
  `user_enabled` mediumtext DEFAULT NULL,
  `add_user` mediumtext DEFAULT NULL,
  `login_from` varchar(50) DEFAULT NULL,
  `add_date` mediumtext DEFAULT NULL,
  `default_extension` varchar(36) DEFAULT NULL,
  `default_call_selection` varchar(36) DEFAULT NULL,
  `usage_type` varchar(20) DEFAULT NULL,
  `logintime` varchar(50) DEFAULT NULL,
  `last_login_time` varchar(50) DEFAULT NULL,
  `user_type` char(36) DEFAULT NULL,
  `auto_answer` char(36) DEFAULT NULL,
  `mobile_gateway` mediumtext DEFAULT NULL,
  `teamlead_id` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `password_expires_at` varchar(50) DEFAULT NULL,
  `firebase_token` mediumtext DEFAULT NULL,
  `is_registered` char(36) DEFAULT NULL,
  `ldap_dn` mediumtext DEFAULT NULL,
  `init_pass` varchar(20) DEFAULT 'false',
  `call_evaluation_information` char(36) DEFAULT NULL,
  `supervisor_tl_uuid` char(36) DEFAULT NULL,
  `user_vm_uuid` char(36) DEFAULT NULL,
  `mapped_supervisor_uuid` char(36) DEFAULT NULL,
  `enable_calling` mediumtext DEFAULT NULL,
  `lang_code` varchar(191) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_uuid`),
  KEY `contact_uuid` (`contact_uuid`) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `main_domain_uuid` (`main_domain_uuid`) USING BTREE,
  KEY `teamlead_id` (`teamlead_id`) USING BTREE,
  KEY `username` (`username`(20)) USING BTREE,
  KEY `user_enabled` (`user_enabled`(10)) USING BTREE,
  KEY `user_token` (`user_token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_users_domains`
--

DROP TABLE IF EXISTS `v_users_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_users_domains` (
  `domain_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_users_lock`
--

DROP TABLE IF EXISTS `v_users_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_users_lock` (
  `user_uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_otp` int(11) NOT NULL,
  `failed_attempt` int(11) NOT NULL,
  `lock_status` int(11) NOT NULL,
  `otp_time` timestamp NULL DEFAULT NULL,
  `last_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_uuid`),
  KEY `user_uuid` (`user_uuid`),
  CONSTRAINT `v_users_lock_ibfk_1` FOREIGN KEY (`user_uuid`) REFERENCES `v_users` (`user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_users_lock_history`
--

DROP TABLE IF EXISTS `v_users_lock_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_users_lock_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_uuid` char(36) NOT NULL,
  `user_details` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_users_predefined_filter`
--

DROP TABLE IF EXISTS `v_users_predefined_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_users_predefined_filter` (
  `predefined_filter_uuid` char(36) NOT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `module_name` text DEFAULT NULL,
  `filter_json` text DEFAULT NULL,
  `created_at` char(20) DEFAULT NULL,
  `updated_at` char(20) DEFAULT NULL,
  `deleted_at` char(20) DEFAULT NULL,
  PRIMARY KEY (`predefined_filter_uuid`),
  KEY `user_uuid` (`user_uuid`),
  KEY `domain_uuid` (`domain_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_vars`
--

DROP TABLE IF EXISTS `v_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_vars` (
  `var_uuid` char(36) NOT NULL,
  `var_name` text DEFAULT NULL,
  `var_value` text DEFAULT NULL,
  `var_hostname` char(255) DEFAULT NULL,
  `var_cat` text DEFAULT NULL,
  `var_enabled` text DEFAULT NULL,
  `var_order` decimal(10,0) DEFAULT NULL,
  `var_description` text DEFAULT NULL,
  PRIMARY KEY (`var_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_voicemail_destinations`
--

DROP TABLE IF EXISTS `v_voicemail_destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_voicemail_destinations` (
  `domain_uuid` char(36) DEFAULT NULL,
  `voicemail_destination_uuid` char(36) NOT NULL,
  `voicemail_uuid` char(36) DEFAULT NULL,
  `voicemail_uuid_copy` char(36) DEFAULT NULL,
  PRIMARY KEY (`voicemail_destination_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_voicemail_greetings`
--

DROP TABLE IF EXISTS `v_voicemail_greetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_voicemail_greetings` (
  `voicemail_greeting_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `voicemail_id` varchar(50) DEFAULT NULL,
  `greeting_id` decimal(10,0) DEFAULT NULL,
  `greeting_name` text DEFAULT NULL,
  `greeting_filename` text DEFAULT NULL,
  `greeting_description` text DEFAULT NULL,
  `greeting_base64` text DEFAULT NULL,
  PRIMARY KEY (`voicemail_greeting_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_voicemail_messages`
--

DROP TABLE IF EXISTS `v_voicemail_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_voicemail_messages` (
  `domain_uuid` char(36) DEFAULT NULL,
  `voicemail_message_uuid` char(36) NOT NULL,
  `voicemail_uuid` char(36) DEFAULT NULL,
  `created_epoch` decimal(10,0) DEFAULT NULL,
  `voicemail_read` text DEFAULT NULL,
  `read_epoch` decimal(10,0) DEFAULT NULL,
  `caller_id_name` text DEFAULT NULL,
  `caller_id_number` text DEFAULT NULL,
  `message_length` decimal(10,0) DEFAULT NULL,
  `message_status` text DEFAULT NULL,
  `message_priority` text DEFAULT NULL,
  `message_intro_base64` text DEFAULT NULL,
  `message_base64` text DEFAULT NULL,
  `message_transcription` text DEFAULT NULL,
  `voicemail_recording_file` text DEFAULT NULL,
  `DID_number` char(20) DEFAULT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`voicemail_message_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_voicemail_options`
--

DROP TABLE IF EXISTS `v_voicemail_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_voicemail_options` (
  `voicemail_option_uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `voicemail_uuid` char(36) DEFAULT NULL,
  `voicemail_option_digits` text DEFAULT NULL,
  `voicemail_option_action` text DEFAULT NULL,
  `voicemail_option_param` text DEFAULT NULL,
  `voicemail_option_order` decimal(10,0) DEFAULT NULL,
  `voicemail_option_description` text DEFAULT NULL,
  PRIMARY KEY (`voicemail_option_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_voicemails`
--

DROP TABLE IF EXISTS `v_voicemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_voicemails` (
  `domain_uuid` char(36) DEFAULT NULL,
  `voicemail_uuid` char(36) NOT NULL,
  `voicemail_id` varchar(50) NOT NULL,
  `voicemail_password` text DEFAULT NULL,
  `greeting_id` decimal(10,0) DEFAULT NULL,
  `voicemail_alternate_greet_id` decimal(10,0) DEFAULT NULL,
  `voicemail_mail_to` text DEFAULT NULL,
  `voicemail_sms_to` text DEFAULT NULL,
  `voicemail_transcription_enabled` text DEFAULT NULL,
  `voicemail_attach_file` text DEFAULT NULL,
  `voicemail_file` text DEFAULT NULL,
  `voicemail_local_after_email` text DEFAULT NULL,
  `voicemail_enabled` text DEFAULT NULL,
  `voicemail_description` text DEFAULT NULL,
  `voicemail_name_base64` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`voicemail_uuid`),
  KEY `voicemail_uuid` (`voicemail_uuid`) USING BTREE,
  KEY `deleted_at` (`deleted_at`) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `greeting_id` (`greeting_id`) USING BTREE,
  KEY `voicemail_enabled` (`voicemail_enabled`(10)) USING BTREE,
  KEY `voicemail_id` (`voicemail_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_wakeup_call`
--

DROP TABLE IF EXISTS `v_wakeup_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_wakeup_call` (
  `domain_uuid` char(36) DEFAULT NULL,
  `wakeup_uuid` char(36) NOT NULL,
  `wakeup_time` text DEFAULT NULL,
  `wakeup_destination` text DEFAULT NULL,
  `ring_time` text DEFAULT NULL,
  `retry_time` text DEFAULT NULL,
  `max_retries` text DEFAULT NULL,
  `wakeup_caller_id` text DEFAULT NULL,
  `wakeup_extension_param` text DEFAULT NULL,
  `wakeup_start_date` date DEFAULT NULL,
  `wakeup_end_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wakeup_caller_name` varchar(30) DEFAULT NULL,
  `call_status` varchar(30) DEFAULT NULL,
  `wakeup_name` varchar(30) DEFAULT NULL,
  `call_attempts` varchar(30) DEFAULT NULL,
  `next_retry_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`wakeup_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_wakeup_call_history`
--

DROP TABLE IF EXISTS `v_wakeup_call_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_wakeup_call_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `call_uuid` varchar(50) DEFAULT NULL,
  `dialer_uuid` varchar(50) DEFAULT NULL,
  `wakeup_uuid` varchar(50) DEFAULT NULL,
  `dialed_domain` varchar(50) DEFAULT NULL,
  `hangup_cause` varchar(50) DEFAULT NULL,
  `hangup_cause_q850` varchar(50) DEFAULT NULL,
  `start_stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_stamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `duration` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_websocket_setting`
--

DROP TABLE IF EXISTS `v_websocket_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_websocket_setting` (
  `domain_uuid` char(36) DEFAULT NULL,
  `call_socket_url` text DEFAULT NULL,
  `chatsocket_url` text DEFAULT NULL,
  `freeswitch_ws` text DEFAULT NULL,
  `freeswitch_port` text DEFAULT NULL,
  `freeswitch_url` text DEFAULT NULL,
  `register_proxy` text DEFAULT NULL,
  `register_proxy_endpoint` text DEFAULT NULL,
  `call_recording_mp3` text DEFAULT NULL,
  `recording_only_mp3` text DEFAULT NULL,
  `call_voicemail_mp3` text DEFAULT NULL,
  `voicemail_only_mp3` text DEFAULT NULL,
  `dynamic_extension` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_weeklyoff_users`
--

DROP TABLE IF EXISTS `v_weeklyoff_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_weeklyoff_users` (
  `weeklyoff_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `effective_from` datetime DEFAULT NULL,
  `effective_till` datetime DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_weeklyoffs`
--

DROP TABLE IF EXISTS `v_weeklyoffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_weeklyoffs` (
  `weeklyoff_uuid` char(36) NOT NULL,
  `weeklyoff_name` varchar(136) DEFAULT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `week_of_month` varchar(66) DEFAULT NULL,
  `day_of_week` varchar(66) DEFAULT NULL,
  `level` varchar(66) DEFAULT NULL,
  PRIMARY KEY (`weeklyoff_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_weeklyoffs_shifts`
--

DROP TABLE IF EXISTS `v_weeklyoffs_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_weeklyoffs_shifts` (
  `weeklyoff_uuid` char(36) NOT NULL,
  `shift_uuid` char(36) DEFAULT NULL,
  `effective_from` datetime DEFAULT NULL,
  `effective_till` datetime DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`weeklyoff_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_xfer_first_leg`
--

DROP TABLE IF EXISTS `v_xfer_first_leg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_xfer_first_leg` (
  `call_state_uuid` char(36) NOT NULL,
  `call_uuid` char(36) DEFAULT NULL,
  `agent_uuid` char(36) DEFAULT NULL,
  `org_call_broadcast_uuid` char(36) DEFAULT NULL,
  `org_call_center_queue_uuid` char(36) DEFAULT NULL,
  `xfer_call_broadcast_uuid` char(36) DEFAULT NULL,
  `xfer_call_center_queue_uuid` char(36) DEFAULT NULL,
  `ringing` decimal(9,2) DEFAULT NULL,
  `mute` text DEFAULT NULL,
  `hold` decimal(9,2) DEFAULT NULL,
  `total_talktime` decimal(9,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `hangup_cause` varchar(100) DEFAULT NULL,
  `hangup_by` varchar(100) DEFAULT NULL,
  `contact_uuid` char(36) DEFAULT NULL,
  `transfer_type` varchar(100) DEFAULT NULL,
  `transfer_to` varchar(100) DEFAULT NULL,
  `transfer_to_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`call_state_uuid`),
  KEY `created_at` (`created_at`),
  KEY `mute` (`mute`(10)) USING BTREE,
  KEY `agent_uuid` (`agent_uuid`) USING BTREE,
  KEY `call_uuid` (`call_uuid`) USING BTREE,
  KEY `hold` (`hold`) USING BTREE,
  KEY `ringing` (`ringing`) USING BTREE,
  KEY `total_talktime` (`total_talktime`) USING BTREE,
  KEY `agent_uuid_created_at` (`agent_uuid`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_xml_cdr`
--

DROP TABLE IF EXISTS `v_xml_cdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_xml_cdr` (
  `uuid` char(36) NOT NULL,
  `domain_uuid` char(36) DEFAULT NULL,
  `extension_uuid` char(36) DEFAULT NULL,
  `domain_name` text DEFAULT NULL,
  `accountcode` text DEFAULT NULL,
  `direction` text DEFAULT NULL,
  `default_language` text DEFAULT NULL,
  `context` text DEFAULT NULL,
  `xml` text DEFAULT NULL,
  `json` text DEFAULT NULL,
  `caller_id_name` text DEFAULT NULL,
  `caller_id_number` text DEFAULT NULL,
  `source_number` text DEFAULT NULL,
  `destination_number` text DEFAULT NULL,
  `start_epoch` bigint(20) DEFAULT NULL,
  `start_stamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `answer_stamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `answer_epoch` bigint(20) DEFAULT NULL,
  `end_epoch` bigint(20) DEFAULT NULL,
  `end_stamp` text DEFAULT NULL,
  `duration` decimal(10,0) DEFAULT NULL,
  `mduration` decimal(10,0) DEFAULT NULL,
  `billsec` decimal(10,0) DEFAULT NULL,
  `billmsec` decimal(10,0) DEFAULT NULL,
  `bridge_uuid` text DEFAULT NULL,
  `read_codec` text DEFAULT NULL,
  `read_rate` text DEFAULT NULL,
  `write_codec` text DEFAULT NULL,
  `write_rate` text DEFAULT NULL,
  `remote_media_ip` text DEFAULT NULL,
  `network_addr` text DEFAULT NULL,
  `recording_file` text DEFAULT NULL,
  `leg` char(1) DEFAULT NULL,
  `pdd_ms` smallint(6) DEFAULT NULL,
  `rtp_audio_in_mos` decimal(10,0) DEFAULT NULL,
  `last_app` text DEFAULT NULL,
  `last_arg` text DEFAULT NULL,
  `cc_side` text DEFAULT NULL,
  `cc_member_uuid` char(36) DEFAULT NULL,
  `cc_queue_joined_epoch` text DEFAULT NULL,
  `cc_queue` text DEFAULT NULL,
  `cc_member_session_uuid` char(36) DEFAULT NULL,
  `cc_agent` text DEFAULT NULL,
  `cc_agent_type` text DEFAULT NULL,
  `waitsec` decimal(10,0) DEFAULT NULL,
  `conference_name` text DEFAULT NULL,
  `conference_uuid` char(36) DEFAULT NULL,
  `conference_member_id` text DEFAULT NULL,
  `digits_dialed` text DEFAULT NULL,
  `pin_number` text DEFAULT NULL,
  `hangup_cause` text DEFAULT NULL,
  `hangup_cause_q850` decimal(10,0) DEFAULT NULL,
  `sip_hangup_disposition` text DEFAULT NULL,
  `dnis` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `answer_epoch` (`answer_epoch`) USING BTREE,
  KEY `answer_stamp` (`answer_stamp`) USING BTREE,
  KEY `billsec` (`billsec`) USING BTREE,
  KEY `bridge_uuid` (`bridge_uuid`(36)) USING BTREE,
  KEY `caller_id_name` (`caller_id_name`(25)) USING BTREE,
  KEY `caller_id_number` (`caller_id_number`(20)) USING BTREE,
  KEY `destination_number` (`destination_number`(15)) USING BTREE,
  KEY `direction` (`direction`(20)) USING BTREE,
  KEY `domain_name` (`domain_name`(50)) USING BTREE,
  KEY `domain_uuid` (`domain_uuid`) USING BTREE,
  KEY `duration` (`duration`) USING BTREE,
  KEY `end_epoch` (`end_epoch`) USING BTREE,
  KEY `end_stamp` (`end_stamp`(22)) USING BTREE,
  KEY `extension_uuid` (`extension_uuid`) USING BTREE,
  KEY `hangup_cause` (`hangup_cause`(22)) USING BTREE,
  KEY `source_number` (`source_number`(15)) USING BTREE,
  KEY `start_epoch` (`start_epoch`) USING BTREE,
  KEY `start_stamp` (`start_stamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `table_name` varchar(32) NOT NULL,
  `table_version` int(10) unsigned NOT NULL DEFAULT 0,
  UNIQUE KEY `table_name_idx` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitor_bans`
--

DROP TABLE IF EXISTS `visitor_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitor_bans` (
  `id` varchar(45) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `website_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `company_information_id` int(10) unsigned NOT NULL,
  `visitor_bans_id` varchar(45) NOT NULL,
  `visitor_bans_user_id` int(10) unsigned NOT NULL,
  `visitor_bans_company_information_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`user_id`,`company_information_id`),
  KEY `fk_visitor_bans_websites1_idx` (`website_id`),
  KEY `fk_visitor_bans_users1_idx` (`user_id`),
  KEY `fk_visitor_bans_company_informations1_idx` (`company_information_id`),
  KEY `fk_visitor_bans_visitor_bans1_idx` (`visitor_bans_id`,`visitor_bans_user_id`,`visitor_bans_company_information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `websites`
--

DROP TABLE IF EXISTS `websites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `websites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_information_id` int(10) unsigned NOT NULL,
  `campaign_process_uuid` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_websites_company_informations1_idx` (`company_information_id`),
  CONSTRAINT `fk_websites_company_informations1` FOREIGN KEY (`company_information_id`) REFERENCES `company_informations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_content_types`
--

DROP TABLE IF EXISTS `widget_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_content_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `input_type` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_setting_types`
--

DROP TABLE IF EXISTS `widget_setting_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_setting_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `values` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `widget_type` varchar(45) DEFAULT NULL,
  `input_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_settings`
--

DROP TABLE IF EXISTS `widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `widget_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_widget_settings_widgets1_idx` (`widget_id`),
  CONSTRAINT `fk_widget_settings_widgets1` FOREIGN KEY (`widget_id`) REFERENCES `widgets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `sound_notification` tinyint(1) DEFAULT 1,
  `type` varchar(45) DEFAULT NULL,
  `display_wait_estimated_time` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `widget_online_data` text DEFAULT NULL,
  `widget_offline_data` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `website_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `widget_prechat_data` text DEFAULT NULL,
  `widget_agent_away_data` text DEFAULT NULL,
  `prechat_status` tinyint(1) DEFAULT 1,
  `appearance_data` text DEFAULT NULL,
  `widget_unique_id` varchar(45) DEFAULT NULL,
  `audio_notification_time` varchar(45) DEFAULT NULL,
  `enable_satisfaction_rating` tinyint(1) DEFAULT 1,
  `predefine_intent` tinyint(1) DEFAULT 0,
  `chat_algorithm` varchar(45) DEFAULT 'round_robin',
  `send_transcript` tinyint(1) DEFAULT 0,
  `widget_language` varchar(45) DEFAULT 'en',
  `auto_accept` tinyint(1) DEFAULT 0,
  `media` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_widgets_websites1_idx` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zoho_users_mapping`
--

DROP TABLE IF EXISTS `zoho_users_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zoho_users_mapping` (
  `user_mapping_uuid` char(36) NOT NULL,
  `intalk_user_uuid` char(36) NOT NULL,
  `zoho_user_uuid` char(36) NOT NULL,
  `username` text NOT NULL,
  `email` text NOT NULL,
  PRIMARY KEY (`user_mapping_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-09 15:50:06
