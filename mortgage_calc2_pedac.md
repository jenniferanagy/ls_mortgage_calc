EXPECTED INPUT & OUTPUT
  User Input:
    - mortgage amount
    - mortgage duration in years
    - Annual Percentage Rate (APR)
  Output:
    - Monthly Payment

REQUIREMENTS & RULES
  - Use formula: monthly_payment = loan_amt * 
    (month_interest_rate / (1 - (1 + month_interest_rate)**(-loan_duration)))
  - Use explicit names for variables
  - Convert APR to monthly interest rate
  - Convert mortgage duration from years to months

CLARIFYING QUESTIONS
  - What are the required formats for user inputs?
  - Is 0 allowed for any input?
  - How does the calculator handle a user entering non-integers/floats?
  - How does the calculator handle no user input?
  - How does formula handle calculating with 0% interest rate?

MENTAL MODEL OF PROBLEM
  Store user inputs as floats. Convert inputs to required output.
  Use formula to calculate monthly payment depending on interest rate.
  
TEST CASES
  - Example 1:
    - Mortgage Amount: 100 > $100.00
    - Duration years to months: 1 year >  12.0 months
    - APR: 24.00% > 0.02 monthly interest rate
    - monthly_payment = 100.00 * (0.02 / (1 - (1 + 0.02)**(-12.0)))
    - monthly_payment = $9.46
  - Example 2:
    - Mortgage Amount: 100000 > $100,000.00
    - Duration years to months: 10 years > 120.0 months
    - APR: 12.00% > 0.01 monthly interest rate
    - monthly_payment = 100000 * ( 0.01 / (1 - (1 + 0.01)**(-120.0)))
    - monthly_payment = $1434.71
  - Example 3:
    - Mortgage Amount: 1,000 > $1,000.00
    - Duration years to months: 5 years > 60.0 months
    - APR: 0.00 > 0.0% monthly interest rate
    - Use formula for monthly_payment: > loan amount / months
    * monthly_payment = $16.67
  
DATA STRUCTURE / ALGORITHM  
  Welcome  
  Prompt User Input
    - Get mortgage_amt:
      - Only allow integer greater than zero.
      - Prompt if invalid integer or empty.
      - Convert input to float. 
      - Display float as dollar amount to two decimal places.
    - Get Mortgage Duration in mortgage_years:
      - Only allow integer greater than zero.
      - Prompt if invalid integer or empty.
      - Convert input to float.
      - Display float to one decimal place.
    - Get Annual Percentage Rate, apr: 
      - Allow float to be entered.
      - Allow zero and greater to be entered.
      - Prompt if invalid float.
      - Display input as percentage to two decimal places.
  Convert
    - Convert mortage_years to mortgage_months: years * 12 = months
    - Convert apr to month_interest_rate: (apr / 100) / 100 = month_interest_rate
  Calculator Output:
    - Display calculating message    
    - Display monthly_payment:
      - If month_interest_rate > 0 use: mortgage_amt * (month_interest_rate /
        (1 - (1 + month_interest_rate)**(-mortgage_duration)))
      - If month_interest_rate = 0 use: mortgage_amt / mortgage_months
  Calculate Again:
    - If yes, go back through loop
    - If no, break and display goodbye message