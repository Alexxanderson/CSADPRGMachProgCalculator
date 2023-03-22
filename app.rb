require 'tk'
require 'bigdecimal'
load "compute_functions.rb"

root = TkRoot.new { title "Tax Calculator" }
monthly_income_label = TkLabel.new(root) { text "Monthly Income:";  anchor 'w'; pack(side: 'top', padx: 5, pady: 5)}
sss_label = TkLabel.new(root) { text "SSS:"; anchor 'w'; pack(side: 'top', padx: 5, pady: 5) }
phil_health_label = TkLabel.new(root) { text "PhilHealth:"; anchor 'w'; pack(side: 'top', padx: 5, pady: 5) }
pagibig_label = TkLabel.new(root) { text "Pag-IBIG:"; anchor 'w'; pack(side: 'top', padx: 5, pady: 5) }
total_contributions_label = TkLabel.new(root) { text "Total Contributions:"; anchor 'w'; pack(side: 'top', padx: 5, pady: 5) }
income_tax_label = TkLabel.new(root) { text "Income Tax:"; anchor 'w'; anchor 'w'; pack(side: 'top', padx: 5, pady: 5) }
net_after_tax_label = TkLabel.new(root) { text "Net Pay After Tax:"; anchor 'w'; pack(side: 'top', padx: 5, pady: 5) }
total_deductions_label = TkLabel.new(root) { text "Total Deductions:"; anchor 'w'; pack(side: 'top', padx: 5, pady: 5) }
net_after_deductions_label = TkLabel.new(root) { text "Net Pay After Deductions:"; anchor 'w'; pack(side: 'top', padx: 5, pady: 5) }

# Create a label to prompt the user
TkLabel.new(root) {
  text "Enter a value:"
  pack(side: 'left', padx: 5, pady: 5)
}

# Create an entry widget for the user to enter the value
prompt_entry = TkEntry.new(root) {
  font TkFont.new('arial 12')
  width 20
  pack(side: 'left', padx: 5, pady: 5)
}

# Create a button to submit the value
TkButton.new(root) {
  text "Submit"
  command {
    begin
      # Get the value from the entry widget
      value = BigDecimal(prompt_entry.get)

      # Validate that the value is a positive BigDecimal
      if value <= 0
        raise ArgumentError, "Value must be positive"
      end

      # assign value to monthly_income variable

      $monthly_income = value
      $sss = sss_compute($monthly_income)
      $phil_health = philhealth_compute($monthly_income)
      $pagibig = pagibig_compute($monthly_income)
      $total_contributions = $sss + $phil_health + $pagibig
      $income_tax = incometax_compute($monthly_income - $total_contributions)
      $net_pay_after_tax = $monthly_income - $income_tax
      $total_deductions = $income_tax + $total_contributions
      $net_pay_after_deductions = $monthly_income - ($income_tax + $total_contributions)

      monthly_income_label.configure("text", "Monthly Income #{$monthly_income.to_f}")
      sss_label.configure("text", "SSS: #{$sss.to_f}")
      phil_health_label.configure("text", "PhilHealth: #{$phil_health.to_f}")
      pagibig_label.configure("text", "Pag-IBIG: #{$pagibig.to_f}")
      total_contributions_label.configure("text", "Total Contributions: #{$total_contributions.to_f}")
      income_tax_label.configure("text", "Income Tax: #{$income_tax.to_f}")
      net_after_tax_label.configure("text", "Net Pay After Tax: #{$net_pay_after_tax.to_f}")
      total_deductions_label.configure("text", "Total Deductions: #{$total_deductions.to_f}")
      net_after_deductions_label.configure("text", "Net Pay After Deductions: #{$net_pay_after_deductions.to_f}")

    rescue
      Tk.messageBox(
        title: "Error",
        message: "Positive values only!",
        icon: "error",
        type: "ok"
      )
    end
  }
  pack(side: 'left', padx: 5, pady: 5)
}

Tk.mainloop