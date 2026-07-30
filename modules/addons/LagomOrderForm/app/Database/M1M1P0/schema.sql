--
-- `#prefix#order_fields`
--
CREATE TABLE IF NOT EXISTS `#prefix#order_fields` (
    `id`                        INT(10) NOT NULL AUTO_INCREMENT,
    `name`                      VARCHAR(255) NOT NULL,
    `type`                      VARCHAR(255) NOT NULL,
    `required`                  VARCHAR(255) NOT NULL,
    `description`               TEXT,
    `extra`                     TEXT,
    `order`                     INT(10) NULL,
    PRIMARY KEY (`id`)
    )   ENGINE=InnoDB       DEFAULT
    CHARSET=#charset#   DEFAULT COLLATE #collation#;

--
-- `#prefix#order_details`
--
CREATE TABLE IF NOT EXISTS `#prefix#order_details` (
    `id`                        INT(10) NOT NULL AUTO_INCREMENT,
    `order_id`                  INT(10) NOT NULL,
    `data`                      TEXT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`order_id`) REFERENCES tblorders(id) ON DELETE CASCADE
    )   ENGINE=InnoDB       DEFAULT
    CHARSET=#charset#   DEFAULT COLLATE #collation#;


--
-- `#prefix#config_option_settings`
--
CREATE TABLE IF NOT EXISTS `#prefix#config_option_settings` (
    `id`                        INT(10) unsigned NOT NULL AUTO_INCREMENT,
    `description`               TEXT NULL,
    `description_type`          VARCHAR(255) NULL,
    `image`                     VARCHAR(255) NULL,
    `display_type`              VARCHAR(255) NULL,
    `illustration_type`         VARCHAR(255) NULL,
    `hide_zero_prices`          BOOL NULL,
    `option_id`                 INT(10) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`option_id`) REFERENCES tblproductconfigoptions(id) ON DELETE CASCADE
    )   ENGINE=InnoDB       DEFAULT
    CHARSET=#charset#   DEFAULT COLLATE #collation#;

--
-- `#prefix#config_suboption_settings`
--
CREATE TABLE IF NOT EXISTS `#prefix#config_suboption_settings` (
    `id`                        INT(10) unsigned NOT NULL AUTO_INCREMENT,
    `description`               TEXT(255) NULL,
    `image`                     VARCHAR(255) NULL,
    `color`                     VARCHAR(255) NULL,
    `overrideColor`             VARCHAR(255) NULL,
    `suboption_id`              INT(10) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`suboption_id`) REFERENCES tblproductconfigoptionssub(id) ON DELETE CASCADE
    )   ENGINE=InnoDB       DEFAULT
    CHARSET=#charset#   DEFAULT COLLATE #collation#;

--
-- `#prefix#order_settings`
--
CREATE TABLE IF NOT EXISTS `#prefix#order_settings` (
    `order_id`                  INT(10) NOT NULL,
    `setting`                   VARCHAR(255) NOT NULL,
    `value`                     VARCHAR(255) NOT NULL,
    PRIMARY KEY (`order_id`, `setting`),
    FOREIGN KEY (`order_id`) REFERENCES tblorders(id) ON DELETE CASCADE
    )   ENGINE=InnoDB       DEFAULT
    CHARSET=#charset#   DEFAULT COLLATE #collation#;


--
-- `#prefix#config_suboptions_groups`
--
CREATE TABLE IF NOT EXISTS `#prefix#config_suboptions_groups` (
    `id`                  INT(10) NOT NULL  AUTO_INCREMENT,
    `option_id`           INT(10) NOT NULL,
    `name`                VARCHAR(255) NOT NULL,
    `description`         TEXT NULL,
    `enable`              BOOL NULL,
    `image`               VARCHAR(255) NULL,
    `order`               INT(10) NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`option_id`) REFERENCES tblproductconfigoptions(id) ON DELETE CASCADE
    )   ENGINE=InnoDB       DEFAULT
    CHARSET=#charset#   DEFAULT COLLATE #collation#;

--
-- `#prefix#config_suboptions_relations`
--
CREATE TABLE IF NOT EXISTS `#prefix#config_suboptions_relations` (
    `id`                  INT(10) NOT NULL  AUTO_INCREMENT,
    `suboption_id`        INT(10) NOT NULL,
    `group_id`            INT(10) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`suboption_id`) REFERENCES tblproductconfigoptionssub(id) ON DELETE CASCADE,
    FOREIGN KEY (`group_id`) REFERENCES #prefix#config_suboptions_groups(id) ON DELETE CASCADE
    )   ENGINE=InnoDB       DEFAULT
    CHARSET=#charset#   DEFAULT COLLATE #collation#;

--
-- `#prefix#addons_settings`
--
CREATE TABLE IF NOT EXISTS `#prefix#addons_settings` (
    `id`                  INT(10) NOT NULL AUTO_INCREMENT,
    `image`               VARCHAR(255) NULL,
    `illustrationType`               VARCHAR(255) NULL,
    `color`               VARCHAR(255) NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id`) REFERENCES tbladdons(id) ON DELETE CASCADE
    )   ENGINE=InnoDB       DEFAULT
    CHARSET=#charset#   DEFAULT COLLATE #collation#;

CREATE TABLE IF NOT EXISTS `#prefix#config_options_group_settings` (
    `id`                        INT(10) NOT NULL AUTO_INCREMENT,
    `single_section`            VARCHAR(255),
    `section_title`             VARCHAR(255),
    `section_description`       TEXT,
    `section_description_type`  VARCHAR(255),
    `config_group_id`           INT(10) NOT NULL,
    PRIMARY KEY (`id`),
    )   ENGINE=InnoDB       DEFAULT
    CHARSET=#charset#   DEFAULT COLLATE #collation#;