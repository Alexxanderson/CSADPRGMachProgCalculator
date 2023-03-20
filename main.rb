
def main()

  puts "What is your Monthly Income?"
  monthly_income = gets.to_i

  # Tax Computations
  puts "Tax Computations:"
  if ( monthly_income < 50000)
    puts "₱ 0 - Tax Exempted"
    tax_computations = 0
  else
    tax_computations = 0
  end

  net_pay_after_tax = monthly_income - tax_computations
  puts "Net Pay After Tax: #{net_pay_after_tax}"





end

main()
