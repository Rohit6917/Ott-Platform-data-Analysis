SELECT * FROM ott_data.ott_record_data;

# total users by location:

select User_Location ,
count(distinct user_id) as total_users 
from ott_data.ott_record_data 
group by 
 User_Location
 order by 
 total_users desc;

# average rating by platform:

select
 platform,round(avg(user_rating),2) as average_rating 
 from ott_data.ott_record_data
 group by 
 platform ;
 
 # popular subscription plan of  users;
 
 select subscription_plan,count(user_id) as user from ott_data.ott_record_data group by Subscription_Plan ;
 
 # content count by genre and platform ;
 
select platform, genre ,count(content_type) as content from ott_data.ott_record_data group by platform,genre;

# gender distribution by state;

select 
user_location ,user_gender, count(user_id) as users 
from ott_data.ott_record_data
 group by 
 user_location,user_gender; 


 
 
 


