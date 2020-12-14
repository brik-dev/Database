-- Имеющаяся у нас схема не очень годится для работы. Нужно привести её в нормальный вид, таблицы должны выглядеть следующим образом: --
-- == Таблица _regions == --
ALTER TABLE `geodata`.`_regions` 
CHANGE COLUMN `region_id` `id` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`id`);

ALTER TABLE `geodata`.`_regions` 
ADD INDEX `fk_countries_regions_idx` (`country_id` ASC) VISIBLE;
;
ALTER TABLE `geodata`.`_regions` 
ADD CONSTRAINT `fk_countries_regions`
  FOREIGN KEY (`country_id`)
  REFERENCES `geodata`.`_countries` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `geodata`.`_regions` 
CHANGE COLUMN `title_ru` `title` VARCHAR(150) NOT NULL ,
ADD INDEX `INDEX` (`title` ASC) VISIBLE;
;

ALTER TABLE `geodata`.`_regions` 
DROP COLUMN `title_cz`,
DROP COLUMN `title_lv`,
DROP COLUMN `title_lt`,
DROP COLUMN `title_ja`,
DROP COLUMN `title_pl`,
DROP COLUMN `title_it`,
DROP COLUMN `title_fr`,
DROP COLUMN `title_de`,
DROP COLUMN `title_pt`,
DROP COLUMN `title_es`,
DROP COLUMN `title_en`,
DROP COLUMN `title_be`,
DROP COLUMN `title_ua`;
