# frozen_string_literal: true
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