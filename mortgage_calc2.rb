require 'yaml'
MESSAGES = YAML.load_file('mortgage_calc2.yml')

# define methods
def prompt(message)
  puts("#{message}")
end

def welcome_message
  prompt(MESSAGES['welcome'])
  sleep(1)
  prompt(MESSAGES['user_instructions'])
end

def valid_number(input)
  input > 0
end

def valid_rate(input)
  input >= 0
end

def get_mortgage_amt
  amt_input = nil
  loop do
    prompt(MESSAGES['user_mortgage_amt'])
    amt_input = gets.chomp.delete(',').to_f
    if valid_number(amt_input)
      prompt("=> You have entered $#{format('%.2f', amt_input)}")
      break
    else  
      prompt(MESSAGES['invalid_input'])
    end 
  end
  amt_input
end

def get_mortgage_years
  years_input = nil
  loop do
    prompt(MESSAGES['user_mortgage_years'])
    years_input = gets.chomp.delete(',').to_f
    if valid_number(years_input)
      prompt("=> You have entered #{format('%.1f', years_input)} years")
      break
    else
      prompt(MESSAGES['invalid_input']) 
    end
  end
  years_input
end

def get_user_apr
  rate_input = nil
  loop do
    prompt(MESSAGES['user_apr'])
    rate_input = gets.chomp.to_f
    if valid_rate(rate_input)
      puts "=> You have entered #{rate_input}% APR"
      break 
    else
      prompt(MESSAGES['invalid_input'])
    end
  end
  rate_input
end

def calculate_monthly_payment(amt, rate, duration)
  if rate == 0.0
    amt / duration
  else
    amt * (rate / (1 - (1 + rate)**(-duration)))
  end
end

def again?_answer
  
end

# begin code
system('clear')

prompt(welcome_message)
sleep(2)

loop do #main loop begin
  mortgage_amt = get_mortgage_amt()

  prompt("")

  mortgage_years = get_mortgage_years()

  prompt("")

  user_apr = get_user_apr()
  
  prompt("")

  mortgage_months = mortgage_years * 12
  
  month_interest_rate = (user_apr / 100) / 12

  prompt("")
  
  monthly_payment = calculate_monthly_payment(mortgage_amt, month_interest_rate, mortgage_months)
  
  sleep(1)
  prompt("=> Your monthly payment is: $#{format('%.2f', monthly_payment)}")

  prompt("")

  prompt(MESSAGES['again?'])
  choice = gets.chomp.downcase
  break unless choice.start_with?('y')
  system('clear')
end # main loop end

prompt("")

prompt(MESSAGES['goodbye'])
prompt("")
# end code
