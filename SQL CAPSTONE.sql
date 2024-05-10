-- Total donation

SELECT sum(donation) as Total_donation
from donation_data;

SELECT TO_CHAR(SUM(donation), '999,999,999') AS Total_donation
FROM donation_data;


-- Total donation by gender

select gender,TO_CHAR(SUM(donation), '999,999,999') as Total_Don_Gender
from donation_data
group by gender;


-- Total donation and number of donations by gender

select gender, count(id) as No_of_Donations,TO_CHAR(SUM(donation), '999,999,999') as Total_Don_Gender
from donation_data
group by gender;


-- Total donation made by frequency of donation

select donation_frequency from donor_data;

SELECT dd.donation_frequency, 
TO_CHAR(SUM(d.donation), '999,999,999') AS Total_donation
from donor_data dd
join donation_data d on d.id=dd.id
group by donation_frequency;


-- Total donation and number of donation by Job field
SELECT job_field, 
TO_CHAR(SUM(donation), '999,999,999') AS Total_donation,
count(id) as No_of_Donations
from donation_data
group by job_field;


-- Total donation and number of donations above $200
select id,donation from donation_data
where donation > 200;

SELECT count(id), 
TO_CHAR(SUM(donation), '999,999,999') AS Total_donation
from donation_data
where donation > 200;


-- Total donation and number of donations below $200

select id,donation from donation_data
where donation < 200;

SELECT count(id) as Total_No_of_Donations, 
TO_CHAR(SUM(donation), '999,999,999') AS Total_donation
from donation_data
where donation < 200;


-- Top 10 states that contributes the highest donations

select state, 
TO_CHAR(SUM(donation), '999,999,999') AS Total_donation
from donation_data
group by state
order by Total_donation desc
limit 10;


-- Question 9
-- Top 10 states that contributes the least donations

select state, 
TO_CHAR(SUM(donation), '999,999,999') AS Total_donation
from donation_data
group by state
order by Total_donation asc
limit 10;


-- The top 10 cars driven by the highest donors

SELECT dd.car, 
TO_CHAR(SUM(d.donation), '999,999,999') AS Total_donation
from donor_data dd
join donation_data d on d.id=dd.id
group by car
order by Total_donation desc
limit 10;


-- Patterns in donation frequency based on donor demographics (e.g., gender, age)?

SELECT dd.donation_frequency, 
TO_CHAR(SUM(d.donation), '999,999,999') AS Total_donation, count(d.gender), d.gender
from donor_data dd
join donation_data d on d.id=dd.id
group by donation_frequency,gender;


SELECT 
    dd.donation_frequency, 
    TO_CHAR(SUM(d.donation), '999,999,999') AS Total_donation, 
    COUNT(d.gender) as Gender_Count,
    d.gender
FROM 
    donor_data dd
JOIN 
    donation_data d ON d.id = dd.id
GROUP BY 
    donation_frequency, gender
ORDER BY 
    donation_frequency, 
    CASE WHEN d.gender = 'Female' THEN 1 ELSE 2 END,  -- Order females first within each group
    gender;  -- Then order by gender alphabetically within each group




