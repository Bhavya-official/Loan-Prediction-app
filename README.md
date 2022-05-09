# Loan-Prediction-app
A web application which take some features as input and predict one's approval.

A bank's profit or a loss depends to a large extent on loans i.e. whether the customers are paying back the loan or defaulting. By predicting the loan defaulters, the bank can reduce its Non- Performing Assets. This makes the study of this phenomenon very important.

>SOURCE OF DATA
>>Kaggle

#### Features of Dataset
* Gender
* Married
* Dependents
* Education 
* Self_Employed 
* ApplicantIncome
* CoapplicantIncome
* LoanAmount 
* Loan_Amount_Term 
* Credit_History 
* Property_Area 

### Label of Dataset
* Loan_Status

To run this application on personal system go to [Loan Prediction App](https://developbybhavya.shinyapps.io/Loan_Predictor_App/) or follow following steps:
1. Download RStudio and R.
2. Open RStudio Desktop and run following command: 
```
install.packages(c("shiny", "shinythemes", "tidyr", "randomForest"))
```
3. Now clone this repository and open in RStudio.
4. Click on Run App or Ctrl + Shift + Enter.
![Image](https://shiny.rstudio.com/tutorial/written-tutorial/lesson1/images/run-app.png)
5. So that's all, you have a localhost link to see our application.
