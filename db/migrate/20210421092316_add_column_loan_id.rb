class AddColumnLoanId < ActiveRecord::Migration[5.2]
  def change
    add_reference :payments, :loan, index: true
    add_column :loans, :outstanding_payment, :decimal
  end
end
