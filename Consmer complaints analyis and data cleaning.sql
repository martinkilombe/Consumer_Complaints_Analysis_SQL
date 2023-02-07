SELECT * FROM consumer_complaints.consumercomplaints;

#Data cleaning-- Converting dates from text to date format
#-Convert the date (/) from txt to date format and using new columns to add dates
#a) Alter tables and add Date_Received_new column
ALTER TABLE Consumer_complaints.consumercomplaints
ADD COLUMN Date_Received_new DATE;
#update column created(date_recieved_new) with new dates
UPDATE Consumer_complaints.consumercomplaints
SET Date_Received_new = STR_TO_DATE(Date_Received, '%d/%m/%Y');

#b) Alter tables and add Date_Sent_to_Company_new column replacing the Date_Sent_to_Company
ALTER TABLE Consumer_complaints.consumercomplaints
ADD COLUMN Date_Sent_to_Company_new DATE;
##update column created(Date_Sent_to_Company_new) with new dates
UPDATE Consumer_complaints.consumercomplaints
SET Date_Sent_to_Company_new = STR_TO_DATE(Date_Sent_to_Company, '%d/%m/%Y');

#Dropping the old columns
ALTER TABLE Consumer_complaints.consumercomplaints
DROP COLUMN Date_Received,
DROP COLUMN Date_Sent_to_Company,
DROP COLUMN response_time_days;


#Basic Analytics
#1. Find out complaints were received and sent on the same day
SELECT Date_Received_new , Date_Sent_to_Company_new, Issue ,
	CASE WHEN Date_Received_new = Date_Sent_to_Company_new 
    THEN 'Complaint resolved on same date'
	ELSE 'Complaints Not Resolved on same date'
    END AS resolved_Issue
FROM consumer_complaints.consumercomplaints;

#2.Find out the number of complaints which were received and sent on the same day
SELECT COUNT(CASE WHEN Date_Received_new = Date_Sent_to_Company_new THEN 1 ELSE NULL END) AS same_date_resolved, COUNT(Issue)AS total_complaints FROM consumer_complaints.consumercomplaints;

#3. Extract the complaints received in the state of New York
SELECT Issue,State_Name FROM Consumer_complaints.consumercomplaints
WHERE State_Name LIKE "%NY%";

#4. Extract the complaints received in the state of New York & Califronia
SELECT Issue, State_Name FROM Consumer_complaints.consumercomplaints
WHERE State_Name LIKE "%NY%" OR State_Name LIKE "%CA%"
ORDER BY State_Name;

#5. Extract all rows with the word "Credit" in the product field
SELECT * FROM Consumer_complaints.consumercomplaints 
WHERE Product_Name LIKE "%Credit%";

#6. Extract all rows with the word "Late" in the Issue field
SELECT * FROM Consumer_complaints.consumercomplaints 
WHERE Issue LIKE "%Late%";

#7. Creating a new column that calculates the difference between the dates
ALTER TABLE Consumer_complaints.consumercomplaints 
ADD COLUMN date_difference INT;

UPDATE Consumer_complaints.consumercomplaints 
SET date_difference = ABS(datediff(Date_Sent_to_Company_new, Date_Received_new));


