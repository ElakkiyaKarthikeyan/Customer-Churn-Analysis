
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

![Customer_Churn_Phone_Service](/Customer_Churn_Phone_service.png)

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
## ML Modelling

## The Machine Learning model used in the dataset

 1. Decision Tree


 https://github.com/ElakkiyaKarthikeyan/Customer-Churn-Analysis/blob/main/ML%20Model


**Data Split for Training and Testing**
 
The dataset has been split into train and test data.

**Training Data**

![Data_Split](/Train_Data_Properties.png)

**Test Data**

![Data_Split](/Test_Data_Properties.png)

**Model Build**

According to the model built, the tree size is 10 and it is restricted based on the cases. If the customer contract is month-to-month and opted for either DSL internet service or no internet service that if their tenure is less than or equal to three months with that if they have not subscribed for technical support, then they are 59% likely to churn then other customers. On the other hand, if the customer is using the Fiber optic-based internet services and their tenure is less than or equal to 15 months then their churn rate is nearly 70%. 
However, if the customer tenure is within 51 months and subscribed for multiple lines but with no online security and they are billing their charges via electronic check then they are nearly 58% likely to churn.

![Decision_Tree](/Customer_Churn_Decision_Tree.png)

**Training Evaluation**

The evaluation of the training data describing a 19.7% error rate. From the training observations, 512 indicate false positives and 738 indicate false negatives. So, the accuracy of the training model is (4150+949)/6349 (%) which is 80.3 % accuracy.

![Training_Evaluation](/Training_Evaluation_1.png)
![Training_Evaluation](/Training_Evaluation_2.png)

**Model Evaluation**

Lastly, must check the performance of the model built for this dataset. It shows, that 52 are false positives and 83 are true negatives which mean 19.7 % [(52+83)/683] as the error rate. So, the accuracy of the performance evaluation for this model is 80.3 % which is the same as the training model accuracy.

![Model_Evaluation](/Test_Evaluation.png)

## Key Findings and Suggestions

As a summary of the analysis and machine learning algorithm, the gender variable and phone service variable do not make much impact on the customer churn prediction. The numeric variables such as tenure, and monthly charges are having better association with the target variable. Another important feature is the contract type. 

Only Identifying customer churn will not help the organization, they must take proactive measures to increase customer retention. Following are some of the recommendations to reduce the churn rate. As per the analysis, the more no. churned customers are youngsters, so to attract them, the company can provide novel offers as a half-price on internet services after 10 PM until the next morning at 6 AM. 

Churned customers paid more on monthly charges compared to the active customers which means high monthly charges may be one of the reasons for customer churn. To reduce this, the company can offer them that if they increase their tenure then the monthly charge will get reduced accordingly.

For the customers who have subscribed for multiple lines, the company can offer free technical support to attract multiple-line customers. Companies can target the predicted customers and try to take some surveys about their service. So that, they will get a chance to understand the customers’ expectation and their satisfaction levels with the service. 

Target the customer who does not subscribe for internet services, technical support, backup, etc., as part of marketing, the company can provide 3 months trial for those services to the customers. This will help to attract them to use those services and if they immediately opt for this plan after the trial pack ends, the company can provide a 10% price drop on their monthly charges.

Finally, some of the organizations take this churn analysis at the end of every financial year. But it would be better to take such analysis and prediction every quarter, so that company gets some understanding of their customers to increase business benefit and resolve customer issues. These recommendations can be used not only to retain the existing customers and will be helpful to attract new customers to the organization.
