
# Customer Churn Analysis

In today's telecommunication market, globalization and technological advancements have dramatically increased the number of operators which has elevated the competition. companies need to maximize profits continually, and this can be achieved by adopting various strategies, such as acquiring new customers, upselling existing customers, and retaining existing customers. Any business cannot succeed without having a strong customer base and especially in the telecommunication industry, customers are the most vital asset. Consumer dissatisfaction with the customer service and support system is the major reason for churn, and forecasting which customers are at risk of leaving this company could be the key to finding solutions to this issue. This project explores the Customer Churn analysis of the IBM Telecommunication company and provides information about the impact of Artificial intelligence and Data Science on customer churn analysis, and lastly the suggestions to improve the customer retention rate to increase their profit.
## Data Analysis Steps

Below are the steps to be followed throughout this project,

1. DataCollection
2. Data Preprocessing

    a. Data Cleaning

    b. Feature Selection

3. Exploratory Data Analysis
4. ML Modelling

    a. Train set

    b. Test Set
    
5. Model Evaluation


## Dataset
Dataset Link:

https://community.ibm.com/accelerators/?context=analytics&query=telco%20churn&type=Data&product=Cognos%20Analytics

## Dataset Description
FEATURE_NAME - DESCRIPTION - TYPE

CustomerID - A unique ID that identifies each customer – Numerical

Gender - The customer’s gender: Male, Female – Categorical

Senior Citizen - Indicates if the customer is 65 or older: Yes, no - Categorical

Partner - Indicate if the customer has a partner: Yes, no - Categorical

Dependents - Indicates if the customer lives with any dependents: Yes, No. Dependents could be children, parents, grandparents, etc	- Categorical

Tenure - Indicates the total amount of months that the customer has been with the company by the end of the quarter specified above	- Numerical

Phone Service - Indicates if the customer subscribes to home phone service with the company: Yes, no - Categorical

Multiple Lines - Indicates if the customer subscribes to multiple telephone lines with the company: Yes, no - Categorical

Internet Service - Indicates if the customer subscribes to Internet service with the company: No, DSL, Fiber Optic, Cable - Categorical

Online Security - Indicates if the customer subscribes to an additional online security service provided by the company: Yes, no - Categorical

Online Backup - Indicates if the customer subscribes to an additional online backup service provided by the company: Yes, no - Categorical

Device Protection - Indicates if the customer subscribes to an additional device protection plan for their Internet equipment provided by the company: Yes, no - Categorical

Tech Support - Indicates if the customer subscribes to an additional technical support plan from the company with reduced wait times: Yes, no - Categorical

Streaming TV - Indicates if the customer uses their Internet service to stream television programs from a third-party provider: Yes, No. The company does not charge an additional fee for this service - Categorical

Streaming Movies - Indicates if the customer uses their Internet service to stream movies from a third-party provider: Yes, No. The company does not charge an additional fee for this service - Categorical

Contract - Indicates the customer’s current contract type: Month-to-Month, One Year, Two Year - Categorical

Paperless Billing - Indicates if the customer has chosen paperless billing: Yes, no	- Categorical

Payment Method - Indicates how the customer pays their bill: Bank Withdrawal, Credit Card, Mailed Check - Categorical

Monthly Charge - Indicates the customer’s current total monthly charge for all their services from the company - Numerical

Total Charges - Indicates the customer’s total charges, calculated to the end of the quarter - Numerical

Churn - A customer leaves the company or not: Yes, no - Categorical

## Data Preprocessing

https://github.com/ElakkiyaKarthikeyan/Customer-Churn-Analysis/blob/main/Data%20Preprocess

Below image is the missing value count in the dataset

![Missing Value Image](/Missing_Values.png)

## Exploratory Data Analysis

The objective of the analysis is to explore the dataset and create a visualization to recognize 
which features and combinations of features are correlated with the target feature churn.

https://github.com/ElakkiyaKarthikeyan/Customer-Churn-Analysis/blob/main/Exploratory%20Data%20Analysis

**Customer Churn Category**

The target feature churn distribution according to the dataset.

![Customer_Churn](/Customer_Churn_Category.png)

**Customer Churn Distribution by Seniority and Gender**

By seeing this, could understand the gender factors Male and Female are in almost the same proposition. On the other hand, another factor explains younger group customers’ churn rate is 49% higher than the senior customers.

![Customer_Churn_Gender](/Customer_Churn_Distribution_by_Gender_SeniorCitizen.png)

**Customer Churn by Phone Service**

The IBM Cognos Telco has diverse types of Phone Services such as Single, Multiple, and No phone line users. All the three categories are on the same level, but Multiple line users are a 3-4% higher chance of churn than other phone line service users.

![Customer_Churn_Phone_Service](/Customer_Churn_Distribution_by_Gender_SeniorCitizen.png)

**Customer Churn by Internet Service**

The customer churn distribution based on the three different internet services provided by the IBM Telco. According to the plot, the customers who used internet services are in a high proportion of churn risk compared to non-internet customers. Furthermore, fiber optic internet service users are more likely to churn and in addition to that most of them have not opted for any security or backup service from the service provider Telco. 

![Customer_Churn_Internet_Service](/Customer_Churn_Internet_Services.png)

**Customer Churn by Support and Protection Service**

The customer churn rate is more affected by the customers who do not subscribe to the technical support and protection service from the service provider while compared with the technical support and protection service subscribers.

![Customer_Churn_Support](/Customer_Churn_Support&Protection_Service.png)

**Customer Churn by Contract and Payments**

The churned customers’ average tenure with the company was 18 months and the active customers’ average tenure is 38 months. On the other hand, the average monthly charge paid by churned customers was $74.44 which represents $13 higher than the active customer’s average monthly charges. Furthermore, when comparing Monthly charges based on contract type, the churned customers paid more charges than active customers.

![Customer_Churn_Contract_Payments](/Customer_churn_Contract_Payments.png)

**Customer Churn by Monthly Charges**

The churned customers’ average tenure with the company was 18 months and the active customers’ average tenure is 38 months. On the other hand, the average monthly charge paid by churned customers was $74.44 which represents $13 higher than the active customer’s average monthly charges. Furthermore, when comparing Monthly charges based on contract type, the churned customers paid more charges than active customers.

![Customer_Churn_Monthly_Charges](/Customer_Churn_MonthlyCharges.png)