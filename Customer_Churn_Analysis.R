install.packages("dplyr")
library(dplyr)
install.packages("tidyverse")
library(tidyverse)
install.packages("caret")
library(caret)
install.packages("C50")
library(C50)
install.packages("gmodels")
library(gmodels)
library(scales)
library(grid)
install.packages("gridExtra")
library(gridExtra)

CChurn <- read.csv("S:\\UOB\\CourseWork\\SEM2\\AIDS\\Assignment\\Telco_Customer_Attrition.csv",
                   header = TRUE,stringsAsFactors = TRUE)

view(CChurn)
str(CChurn)
sum(is.na(CChurn))
colSums(is.na(CChurn))
rowSums(is.na(CChurn))

CAttrition <- na.exclude(CChurn)


#Exploratory data Analysis

#Churn Distribution

ggplot(data=CAttrition) +
  geom_bar(mapping=aes(x=Churn,fill=Churn),width=0.5)+
  ggtitle("Customer Churn Category")+
  theme(plot.title=element_text(hjust =0.5,size=15,face="bold"),legend.position="none")+
  labs(y="Customer_Count",x="Churn_Label")+
  scale_fill_manual(values=c("cornflowerblue","chartreuse3"))

# Churn rate by gender and senior citizen

CAttrition%>%
  select(Churn,SeniorCitizen,gender)%>%
  mutate(SeniorCitizen = factor(SeniorCitizen, levels = c(1,0), labels = c("Senior","Younger")))%>%
  group_by(Churn,SeniorCitizen,gender) %>%
  count()%>%
  ggplot(aes(x=gender,y=n, fill = Churn))+
  geom_col(position = "fill")+
  facet_grid(. ~ SeniorCitizen)+
  labs(x="Gender", y="Customers", fill="Churn_Category")+
  ggtitle("Customer Churn distribution by Gender and Seniority")+
  theme(plot.title=element_text(hjust=0.5, size=12,face="bold"),legend.position = "right")+
  scale_y_continuous(labels=scales::percent)+
  scale_fill_manual(values=c("deeppink","purple"))
  
#Churn rate by Phone Service Types

CAttrition%>%
  select(Churn,MultipleLines)%>%
  mutate(MultipleLines = factor(MultipleLines, 
                                levels = c("No","Yes","No phone service"),
                                labels = c("Single","Multiple","No Line")))%>%
  group_by(Churn,MultipleLines) %>%
  count()%>%
  ggplot(aes(x=MultipleLines,y=n, fill = Churn))+
  geom_col(position = "fill")+
  labs(x="Different_Phone_Lines", y="Customers", fill="Churn_Category")+
  ggtitle("Customer Churn by Phone Service Types")+
  theme(plot.title=element_text(hjust=0.5, size=12,face="bold"),legend.position = "right")+
  scale_y_continuous(labels=scales::percent)+
  scale_fill_manual(values=c("gray","cyan"))

#Churn rate by Internet Service Types

CAttrition%>%
  select(Churn,InternetService,OnlineSecurity,OnlineBackup)%>%
  mutate(OnlineSecurity = factor(OnlineSecurity, 
                                levels = c("No","Yes","No internet service"),
                                labels = c("No Security","Security","No internet")),
         OnlineBackup = factor(OnlineBackup,
                               levels=c("No","Yes","No internet service"),
                               labels=c("No backup","Backup","No internet")))%>%
  group_by(Churn,InternetService,OnlineSecurity,OnlineBackup) %>%
  count()%>%
  ggplot(aes(x=InternetService,y=n, fill = Churn))+
  geom_col(position = "fill")+
  facet_grid(OnlineBackup ~ OnlineSecurity)+
  labs(y="Customers", fill="Churn_Category")+
  ggtitle("Customer Churn by Internet Service")+
  theme(plot.title=element_text(hjust=0.5, size=12,face="bold"),legend.position = "bottom")+
  scale_y_continuous(labels=scales::percent)+
  scale_fill_manual(values=c("goldenrod3","gold"))

#Churn rate by TV/Phone Service

CAttrition%>%
  select(Churn,PhoneService,StreamingTV,StreamingMovies)%>%
  mutate(StreamingTV = factor(StreamingTV, 
                                 levels = c("No","Yes","No internet service"),
                                 labels = c("No TV","TV","No internet")),
         StreamingMovies = factor(StreamingMovies,
                               levels=c("No","Yes","No internet service"),
                               labels=c("No Streaming","Streaming Movies","No internet")))%>%
  group_by(Churn,PhoneService,StreamingTV,StreamingMovies) %>%
  count()%>%
  ggplot(aes(x=PhoneService,y=n, fill = Churn))+
  geom_col(position = "fill")+
  facet_grid(StreamingTV ~ StreamingMovies)+
  labs(y="Customers", fill="Churn_Category")+
  ggtitle("Customer Churn by TV/Phone Service ")+
  theme(plot.title=element_text(hjust=0.5, size=12,face="bold"),legend.position = "bottom")+
  scale_y_continuous(labels=scales::percent)

# Churn rate by device protection and Tech Support

CAttrition%>%
  select(Churn,DeviceProtection,TechSupport)%>%
  mutate(DeviceProtection = factor(DeviceProtection, 
                                   levels = c("Yes","No","No internet service"), 
                                   labels = c("Protection","No protection","No internet service")),
         TechSupport = factor(TechSupport,
                              levels = c("Yes","No","No internet service"),
                              labels = c("TechSupport", "No TechSupport","No internet service")))%>%
  group_by(Churn,DeviceProtection,TechSupport) %>%
  count()%>%
  ggplot(aes(x=DeviceProtection,y=n, fill = Churn))+
  geom_col(position = "fill")+
  facet_grid(. ~ TechSupport)+
  labs(x="DeviceProtection", y="Customers", fill="Churn_Category")+
  ggtitle("Customer Churn by Support and Protection service")+
  theme(plot.title=element_text(hjust=0.5, size=12,face="bold"),legend.position = "right")+
  scale_y_continuous(labels=scales::percent)+
  scale_fill_manual(values=c("orange","cyan"))

#Churn rate by contract & payments

CAttrition%>%
  select(Churn,Contract,PaperlessBilling,PaymentMethod)%>%
  mutate(PaperlessBilling = factor(PaperlessBilling, 
                              levels = c("No","Yes"),
                              labels = c("Paper Bill","Online Bill")))%>%
  group_by(Churn,Contract,PaperlessBilling,PaymentMethod) %>%
  count()%>%
  ggplot(aes(x=PaymentMethod,y=n, fill = Churn))+
  geom_col(position = "fill")+
  facet_grid(Contract ~ PaperlessBilling)+
  labs(y="Customers", fill="Churn_Category")+
  ggtitle("Customer Churn by Contract & Payments ")+
  theme(plot.title=element_text(hjust=0.5, size=12,face="bold"),legend.position = "bottom")+
  scale_y_continuous(labels=scales::percent)+
  scale_fill_manual(values=c("grey","darkred"))


#Numerical Variable distribution based on the churn rate

CA <- CAttrition %>%
  mutate(Churn = factor(Churn, 
                        levels = c("No","Yes"),
                        labels = c("Current Customers","Former Customers")))

  g1 <- ggplot(CA, aes(x=fct_rev(Churn),y=tenure, fill=fct_rev(Churn)))+
    geom_bar(stat="summary",fun="mean", alpha=0.6, color="grey20",show.legend = F)+
    stat_summary(aes(label=paste(round(..y..,0),"months")),fun=mean,
                geom="text", size=3.5,vjust=-0.5)+
    labs(title="Average Customer Tenure",x="Customer_Type",y="Customer_Tenure")+
    theme(plot.title=element_text(hjust=0.5))+
    scale_fill_manual(values=c("darkorange","purple"))

g2 <- ggplot(CA, aes(x=fct_rev(Churn),y=MonthlyCharges, fill=fct_rev(Churn)))+
  geom_bar(stat="summary",fun="mean", alpha=0.6, color="grey20",show.legend = F)+
  stat_summary(aes(label=dollar(..y..)),fun=mean,
               geom="text", size=3.5,vjust=-0.5)+
  scale_y_continuous(labels=dollar_format())+
  labs(title="Average Monthly Charges",x="Customer_Type",y="Monthly_Charges")+
  theme(plot.title=element_text(hjust=0.5))+
  scale_fill_manual(values=c("darkorange","purple")) 
  
g3 <- ggplot(CA, aes(x=Contract,y=MonthlyCharges, fill=fct_rev(Churn)))+
  geom_bar(position="dodge",stat="summary",fun="mean", alpha=0.6, color="grey20")+
  stat_summary(aes(label=dollar(..y..)),fun=mean,
               geom="text", size=3.5,vjust=-1.0,
               position = position_dodge(width=0.9))+
  coord_cartesian(ylim = c(0,95))+
  scale_y_continuous(labels=dollar_format())+
  labs(title="Average Monthly charges by Contract Type",x="Contract_Type",y="Monthly_Charges", 
       fill="Customer_types")+
  theme(plot.title=element_text(hjust=0.5),legend.position = "right")+
  scale_fill_manual(values=c("darkorange","purple"))
  
options(repr.plot.width=10,repr.plot.height=14)
grid.arrange(g1,g2,nrow=1)

grid.arrange(arrangeGrob(g1,g2,ncol=2), g3)
  
#Model build

summary(CAttrition)

set.seed(123)
train_sample <- sample(10000, 9000)
str(train_sample)
churn_train <- CAttrition %>% slice(train_sample)
churn_test <- CAttrition %>% slice(-train_sample)

prop.table(table(churn_train$Churn))
prop.table(table(churn_test$Churn))

churn_model <- C5.0(churn_train[-21], churn_train$Churn)

churn_model

plot(churn_model)


churn_pred <- predict(churn_model, churn_test)

CrossTable(churn_test$churn, churn_pred,prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,
           dnn = c('actual churn', 'predicted churn'))
