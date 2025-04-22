select * from ott_data.ott_record_data;

# average duration min by content type;

select content_type ,round(avg(duration_min),2) as content_duration from ott_data.ott_record_data group by content_type;

# content by release year ;

  select title, platform , release_year from ott_data.ott_record_data where release_year >= 2023;
  
  # Total content by languages ;
  
select language ,count(content_type) as total_content from ott_data.ott_record_data group by language;

# top 10most watched genere by state;

select user_location ,genre ,count(*) as genre_count,
rank() over(partition by user_location order by count(*)desc) as rank_genre from ott_data.ott_record_data
group by user_location ,genre ;


# year over year growth in content release;

select release_year, count(content_type) as content_count,
lag(count(*))over(order by release_year) as previous_year,
(count(*)-lag(count(*)) over (order by release_year)) as yoy_growth 
from ott_data.ott_record_data
group by release_year
order by release_year;

# subscription plan upgrade suggession;
select user_id, subscription_plan,

avg(user_rating) as average_rating 
from ott_data.ott_record_data
group by user_id, subscription_plan
having average_rating >=4 and subscription_plan ="free with ads";

# regional content preference ;

select user_location , language,
count(*) as total_content ,
rank() over(partition by user_location order by count(*)desc ) as language_rank from ott_data.ott_record_data
group by user_location,Language;

# User watching across multiple platform;

select platform , count(distinct user_id) as users  from ott_data.ott_record_data group by platform having count( distinct user_id) >=2;

# best performing platform by generes;

select platform,
genre,
round(avg(user_rating),2) as average_rating,
count(*) as total_views from ott_data.ott_record_data 
group by platform,genre
order by average_rating desc;





















  
  
