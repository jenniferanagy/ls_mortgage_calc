# 1) calculate monthly interest rate
# 2) calculate mortgage duration in months
# 3) calculate monthly payment
# monthly_payment = mortgage_amt *
# (month_interest_rate / (1 - (1 + month_interest_rate)**(-mortgage_duration)))

system('clear')

puts ""
puts "Welcome to the Mortgage Loan Calculator."
sleep(1)
puts "Please input the following to determine your monthly mortgage payment."
sleep(2)

puts ""

loop do # main loop begin
  mortgage_amt = ' '
  loop do
    puts "Please enter the total mortgage amount (only numbers, no commas)."
    mortgage_amt = gets.chomp.to_f

    if mortgage_amt <= 0
      puts "Invalid number. Please try again."
    else
      puts "=> You have entered $#{format('%.2f', mortgage_amt)}"
      break
    end
  end

  puts ""

  mortgage_years = ' '
  loop do
    puts "Please enter the duration of your mortgage in years."
    mortgage_years = gets.chomp.to_f

    if mortgage_years <= 0
      puts "Invalid number. Please try again."
    else
      puts "=> You have entered #{mortgage_years} years"
      break
    end
  end

  puts ""

  apr = ' '
  loop do
    puts "Please enter your Annual Interest Rate (APR) (example '4.95')."
    apr = gets.chomp.to_f

    if apr < 0
      puts "Invalid number. Please try again."
    else
      puts "=> You have entered #{apr}% APR"
      break
    end
  end

  mortgage_months = mortgage_years * 12
  month_interest_rate = (apr / 100) / 12

  puts ""

  if month_interest_rate == 0
    monthly_payment = mortgage_amt / mortgage_months
  else
    monthly_payment = (mortgage_amt * (month_interest_rate /
                      (1 - (1 + month_interest_rate)**(-mortgage_months))))
  end

  sleep(1)
  puts "=> Your monthly payment is: $#{format('%.2f', monthly_payment)}."

  puts ""

  puts "Would you like to use the calculator again ('y' if yes, 'n' if no)?"
  choice = gets.chomp.downcase
  break unless choice.start_with?('y')
  system('clear')
end # main loop end

puts ""

puts "Thank you for using the Mortgage Loan Calculator. Goodbye."
puts ""
