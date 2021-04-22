class Loan < ActiveRecord::Base
    has_many :payments
    validates :funded_amount, presence: true
    validates :outstanding_payment, presence: true
end
