use Bank_Loan;

select * from Financial_Loan_Project;
 --Total Loan Application--
select COUNT(id) as Total_Loan_Application from Financial_Loan_Project;

select COUNT(id) as MTD_Total_Loan_Application from Financial_Loan_Project
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

--Total Funded Amount--
select sum(loan_amount) as total_funded_amount from Financial_Loan_Project
where month(issue_date) = 12 and year(issue_date) =2021;

select sum(loan_amount) as MTD_total_funded_amount from Financial_Loan_Project
where month(issue_date) = 11 and year(issue_date) =2021;


--Total Amount Received--
select sum(total_payment) as total_amount_received from Financial_Loan_Project;

select sum(total_payment) as MTD_total_amount_received from Financial_Loan_Project
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

select sum(total_payment) as PMTD_total_amount_received from Financial_Loan_Project
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021;

--Average interest rate--
select ROUND(AVG(int_rate), 4) * 100 as Average_interest_rate from Financial_Loan_Project
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;


--Average DTI--
select ROUND(AVG(dti),4)*100 as Avg_dti from Financial_Loan_Project; 

select ROUND(AVG(dti),4)*100 as MTD_Avg_dti from Financial_Loan_Project
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

select ROUND(AVG(dti),4)*100 as PMTD_Avg_dti from Financial_Loan_Project
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021;



--Good Loan Kpi--
select
	(COUNT(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end)*100)
	/
	count(id) as good_loan_percentage
from Financial_Loan_Project;

select COUNT(id) as Good_Loan_Application from Financial_Loan_Project
where loan_status = 'Fully Paid' or loan_status = 'Current';

select sum(loan_amount) as Good_Loan_funded_amount from Financial_Loan_Project
where loan_status = 'Fully Paid' or loan_status = 'Current';

select sum(total_payment) as Good_Loan_received_amount from Financial_Loan_Project
where loan_status = 'Fully Paid' or loan_status = 'Current';



--Bad Loan Kpi--
select 
	(COUNT(case when loan_status = 'Charged off' then id end)*100.0)
		/count(id) as bad_loan_amount
	from Financial_Loan_Project;

select count(id) as bad_loan_application from Financial_Loan_Project
where loan_status = 'Charged off';

select sum(loan_amount) as bad_loan_funded_amount from Financial_Loan_Project
where loan_status = 'Charged off';

select sum(total_payment) as bad_loan_received from Financial_Loan_Project
where loan_status = 'Charged off';


select
	loan_status,
	COUNT(id) as Total_Applicatons,
	SUM(total_payment) as Total_Payment_Received,
	SUM(loan_amount) as Total_Funded_Amount,
	AVG(int_rate * 100) as Interest_Rate,
	AVG(dti * 100) as DTI
	from Financial_Loan_Project
	Group by loan_status;


	--Grid--
	select 
	DATENAME(Month,issue_date),
	COUNT(id) as Total_loan_Application,
	SUM(loan_amount) as Total_Funded_Amonut,
	SUM(total_payment) as Total_Received_amount
from Financial_Loan_Project
group by DATENAME(Month,issue_date)
order by DATENAME(Month,issue_date);

select
	MONTH(issue_date) as month_number,
	DATENAME(Month,issue_date),
	COUNT(id) as Total_loan_Application,
	SUM(loan_amount) as Total_Funded_Amonut,
	SUM(total_payment) as Total_Received_amount
from Financial_Loan_Project
group by MONTH(issue_date),DATENAME(Month,issue_date)
order by  MONTH(issue_date);

select
	address_state,
	COUNT(id) as Total_loan_Application,
	SUM(loan_amount) as Total_Funded_Amonut,
	SUM(total_payment) as Total_Received_amount
from Financial_Loan_Project
group by address_state
order by address_state;

select
	term,
	COUNT(id) as Total_loan_Application,
	SUM(loan_amount) as Total_Funded_Amonut,
	SUM(total_payment) as Total_Received_amount
from Financial_Loan_Project
group by term
order by term;


select
	emp_length,
	COUNT(id) as Total_loan_Application,
	SUM(loan_amount) as Total_Funded_Amonut,
	SUM(total_payment) as Total_Received_amount
from Financial_Loan_Project
group by emp_length
order by emp_length;

select
	purpose,
	COUNT(id) as Total_loan_Application,
	SUM(loan_amount) as Total_Funded_Amonut,
	SUM(total_payment) as Total_Received_amount
from Financial_Loan_Project
group by purpose
order by purpose;

select
	home_ownership,
	COUNT(id) as Total_loan_Application,
	SUM(loan_amount) as Total_Funded_Amonut,
	SUM(total_payment) as Total_Received_amount
from Financial_Loan_Project
group by home_ownership
order by COUNT(id) DESC;