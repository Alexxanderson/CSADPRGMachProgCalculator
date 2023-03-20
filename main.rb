require 'bigdecimal'

def main

  monthly_income = -1
  while monthly_income < 0 do
    puts "What is your Monthly Income?"
    input = gets.chomp
    begin
      monthly_income = BigDecimal(input)
      puts "The input number is #{monthly_income.to_f}." #does not convert it to a float, just for printing
    rescue ArgumentError
      puts "Invalid input. Please enter a valid decimal number."
    end
    if monthly_income < 0
      puts "Please input a valid income."
    end
  end

  puts "\nTax Computation"
  sss = sss_compute(monthly_income)
  phil_health = philhealth_compute(monthly_income)
  pagibig = pagibig_compute(monthly_income)
  total_contributions = sss + phil_health + pagibig
  income_tax = incometax_compute(monthly_income-total_contributions)

  # monthly contribution panel
  puts "\nMonthly Contribution"
  puts "SSS: #{sss.to_f}"
  puts "PhilHealth: #{phil_health.to_f}"
  puts "Pag-IBIG: #{pagibig.to_f}"
  puts "Total Contribution: #{total_contributions.to_f}"
  puts "\n"

  # tax computation panel
  puts "Income Tax: #{income_tax.to_f}"
  puts "Net pay after Tax: " + (monthly_income - income_tax).to_f.to_s
  puts "\n"

  # total contributions panel
  puts "Total Deductions: " + (income_tax + total_contributions).to_f.to_s
  puts "Net Pay After Deductions: " + (monthly_income - (income_tax + total_contributions)).to_f.to_s
end


def sss_compute(monthly_income)
  sss = 180.00
  case monthly_income # switch case
  when -Float::INFINITY...4250
    sss = 180.00
  when 4250...29750
    value = (monthly_income-4250)/500 + 1
    sss += (value.floor * 22.50)
  else
    sss = 1350.00
  end
  sss # return
end

def philhealth_compute(monthly_income)
  case monthly_income
  when 0...10000
    phil_health = BigDecimal(300)
  when  10000.01...79999.99
    phil_health = monthly_income * 0.03
  else
    phil_health = BigDecimal(1800)
  end
  phil_health # return
end

def pagibig_compute(monthly_income)
  if monthly_income > 5000
    value = 5000
  else
    value = monthly_income
  end
  if value > 1500
    pagibig = value * 0.02
  else
    pagibig = value * 0.01
  end
  pagibig # return
end

def incometax_compute(deducted_income)
  case deducted_income
  when -Float::INFINITY..20832
    tax = 0.00
  when 20833..33332
    tax = 0.00 + ((deducted_income-20833)*0.15)
  when 33333..66666
    tax = 1875.00 + ((deducted_income-33333)*0.20)
  when 66667..166666
    tax = 8541.80 + ((deducted_income-66667)*0.25)
  when 166667..666666
    tax = 33541.80 + ((deducted_income-166667)*0.30)
  else
    tax = 183541.80 + ((deducted_income-666667)*0.35)
  end
  tax # return
end

main