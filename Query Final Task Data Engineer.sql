-- Merge Data
SELECT 
    a.customer_age,
    a.dependent_count, 
    a.gender,
    a.income_category,
    a.months_on_book, 
    a.total_relationship_count,
    a.months_inactive_12_mon,
    a.credit_limit,
    a.total_revolving_bal,
    a.total_trans_amt,
    a.avg_open_to_buy,
    a.total_trans_ct,
    a.avg_utilization_ratio,
    b.status, 
    c.card_category, 
    d.Education_Level, 
    e.Marital_Status 
FROM
    customer_data_history AS a
LEFT JOIN status_db AS b ON a.idstatus = b.id
LEFT JOIN category_db AS c ON a.card_categoryid = c.id
LEFT JOIN education_db AS d ON a.educationid = d.id
LEFT JOIN marital_db AS e ON a.maritalid = e.id; -- corrected '-' to '='

-- People Attired by Gender
SELECT 
    status, 
    customer_age, 
    COUNT(CASE WHEN gender = 'M' THEN gender END) AS male,
    COUNT(CASE WHEN gender = 'F' THEN gender END) AS female
FROM
    all_data 
WHERE
    LOWER(status) = 'attrited customer'
GROUP BY 
    status, customer_age
ORDER BY 
    male DESC
LIMIT 10;

-- Income Perspective
SELECT 
    income_category, 
    COUNT(income_category) AS total_customer 
FROM 
    all_data 
WHERE 
    LOWER(status) = 'attrited customer'
GROUP BY 
    income_category
ORDER BY 
    total_customer DESC
LIMIT 10;
