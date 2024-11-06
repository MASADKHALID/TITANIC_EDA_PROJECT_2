--create database
create database titanic;
--use database
use titanic;
--create table
create table clean_table(
	ID	int primary key,
	survived	int,
	sex	varchar(7),
	age	float,
	sibsp	int,
	parch	int,
	fare	float,
	class	varchar(7),
	who	varchar(6),
	adult_male	varchar(6),
	embark_town	varchar(255),
	alone varchar(6)
);
--cjeck table
select *
from clean_table;
--survival count
select count(alone) as count,survived
into survival
from clean_table
group by survived;
--chack table
select *
from survival;
--survival w..r.t male and female
SELECT 'male' AS sex, COUNT(sex) AS no_of_survived
INTO survival_stats
FROM clean_table
WHERE survived = 1 AND sex = 'male'
UNION ALL
SELECT 'female' AS sex, COUNT(sex) AS no_of_survived
FROM clean_table
WHERE survived = 1 AND sex = 'female';
--check table
select *
from survival_stats
--not survival w..r.t male and female
select 'male' AS sex,count(sex) as no_of_not_survied
into not_survival_stats
from clean_table
where survived=0 and sex='male'
union all
select 'female' AS sex,count(sex) as no_of_not_survied
from clean_table
where survived=0 and sex='female'
--check table
select *
from not_survival_stats
--passenger category ,man,women,chhild
select who,count(who) as passenger_category_count
into passenger_category
from clean_table
group by who
--check table
select *
from passenger_category
--passenger class count
select class,count(class) as passenger_class_count
into class_count
from clean_table
group by class
--check table
select *
from class_count
--average fare
select class,count(class) as passenger_class_count,avg(fare)as average_fare
into average_fare
from clean_table
group by class
--check table
select *
from average_fare
--destination
select  embark_town,count(embark_town) as destination
into destination
from clean_table
group by embark_town
--check table
select * 
from destination 
--aerage age w.r.t survived and not survived
select 'survied'as survival ,avg(age) as average_age
into averag_age_survival
from clean_table
group by survived
having survived=1
union all
select 'not_survied'as survival , avg(age) as average_age
from clean_table
group by survived
having survived=0
--check table
select *
from averag_age_survival









