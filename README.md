<h1 align="center">
  USA Consumer Financial Protection Bureau
</h1

<p align="center">This Case Project contains dataset from the Consumer Financial Protection Bureau, a U.S. government agency dedicated to making sure consumers are treated fairly by banks, lenders and other financial institutions from 2013. The project entails cleaning the data, and performing Analytics on the data set on  <b>SQL</b>.</p>

<b>Data source<b>: https://www.consumerfinance.gov/data-research/consumer-complaints/#download-the-data

<b>The following were performed on the data set</b>
# 📒 Data cleaning
# 📊 Basic and Advanced Data Analysis
# 🛠 schema and table alteration



Here's a brief overview of the project goals
- Cleaning Data. 
  1. Convert the date (/) from txt to date format and using new columns to add dates.
  2. Dropping the column with Consumer_consent_provided since it contains "N/A" values and dropping two more columns since they contain an empty rows in all the entries.
  3. Filling the empty rows in the Tags column with "Unavailable" to indicate that no information is available.
  4. Filling the empty sub_issue,sub_product rows with NULLS since they are not available.

  - Basic Analysis
  1. Find out complaints were received and sent on the same day.
  2. Extract the complaints received in the state of New York & Califronia.
  3. Extract all rows with the word "Credit" in the product field & Extract all rows with the word "Late" in the Issue field.
  
  -Advanced exploration and altering of table
  1. Creating a new column that calculates the difference between the dates.
  2. sql statement that auto creates id column based on different names(in text) from product_name column
  3. Adding id column as primary genrated from the company column
