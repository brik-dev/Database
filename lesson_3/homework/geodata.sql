-- == База данных «Страны и города мира»:
USE geodata;
-- 1. Сделать запрос, в котором мы выберем все данные о городе – регион, страна.
SELECT
	ci.title AS city_name,
	r.title AS region_name,
	co.title AS country_name
FROM _cities AS ci
	JOIN _regions AS r ON ci.region_id = r.id
	JOIN _countries AS co ON ci.country_id = co.id
;
-- 2. Выбрать все города из Московской области. --
SELECT
	r.title AS region_name,
    ci.title AS city_name
FROM _regions AS r
	JOIN _cities AS ci ON r.id = ci.region_id
WHERE r.title = 'Московская область'
;