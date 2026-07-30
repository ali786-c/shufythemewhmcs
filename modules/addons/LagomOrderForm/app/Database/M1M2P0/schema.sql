--
-- `#prefix#countries_settings
--
CREATE TABLE IF NOT EXISTS `#prefix#countries_settings` (
    `id`                  INT(10) NOT NULL  AUTO_INCREMENT,
    `country`             VARCHAR(255) NOT NULL,
    `country_code`        VARCHAR(255) NOT NULL,
    `currency`            VARCHAR(255),
    `language`            VARCHAR(255),
    PRIMARY KEY (`id`)
    )   ENGINE=InnoDB       DEFAULT
CHARSET=#charset#   DEFAULT COLLATE #collation#;