create database hospitality_db;
use hospitality_db;
select * from hospitality;

#Total Revenue
select concat(round(sum(revenue_generated) /1000000,2),'M')  as total_revenue from hospitality;

#Occupancy rate
SELECT 
    CONCAT(ROUND((SUM(successful_bookings) * 100 / SUM(capacity)), 2), '%') AS OccupancyRate
FROM hospitality;
    
#Cancellation rate 
SELECT 
    CONCAT(ROUND((SUM(CASE WHEN booking_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(booking_id)) * 100, 2), '%') AS CancellationRate
FROM hospitality;

    
#Total Bookings
select count(booking_id) as total_bookings from hospitality;

#Capacity Utilized
SELECT 
    CONCAT(ROUND(SUM(successful_bookings) / 1000000, 2), 'M') AS Total_Capacity_Utilized
FROM hospitality;
    
#Trend Analysis
SELECT 
    DATE_FORMAT(STR_TO_DATE(booking_date, '%d-%m-%Y'), '%Y-%m') AS Month,
    COUNT(booking_id) AS TotalBookings,
    CONCAT(ROUND(SUM(revenue_generated) / 1000000, 2), 'M') AS TotalRevenue  
FROM hospitality
GROUP BY 
    Month
ORDER BY 
    Month;
    
#Weekday and weekend revenue and booking
SELECT 
  CASE WHEN DAYOFWEEK(STR_TO_DATE(booking_date, '%d-%m-%Y')) IN (1, 7) THEN 'Weekend' 
        ELSE 'Weekday' 
    end AS DayType,
    COUNT(booking_id) AS TotalBookings,
    CONCAT(ROUND(SUM(revenue_generated) / 1000000, 2), 'M') AS TotalRevenue
FROM hospitality
GROUP BY DayType
ORDER BY DayType;
    
#Revenue by state 
SELECT 
    state,
    CONCAT(ROUND(SUM(revenue_generated) / 1000000, 2), 'M') AS TotalRevenue
FROM hospitality
GROUP BY state
ORDER BY state;
    
#class wise revenue
SELECT 
    room_class,
    CONCAT(ROUND(SUM(revenue_generated) / 1000000, 2), 'M') AS TotalRevenue
FROM hospitality
GROUP BY room_class
ORDER BY room_class;
    
#booking status 
SELECT 
    booking_status,
    COUNT(booking_id) AS TotalBookings
FROM hospitality
GROUP BY 
    booking_status
ORDER BY 
    booking_status;
    
#Weekly trend
SELECT 
    YEAR(STR_TO_DATE(booking_date, '%d-%m-%Y')) AS Year,
    WEEK(STR_TO_DATE(booking_date, '%d-%m-%Y'),1) AS Week,
    COUNT(booking_id) AS TotalBookings,
    CONCAT(ROUND(SUM(revenue_generated) / 1000000, 2), 'M') AS TotalRevenue
FROM hospitality
GROUP BY 
    Year, Week
ORDER BY 
    Year, Week;
    








