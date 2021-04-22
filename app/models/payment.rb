class Payment < ActiveRecord::Base
    belongs_to :loan
    after_save :outstanding_balance, :on => :create
    validates :amount, presence: true

    def outstanding_balance
        loan.update(outstanding_payment: loan.outstanding_payment - amount)
    end
end
