class PaymentsController < ActionController::API
  before_action :find_loan

  def create
    @payment = @loan.payments.new(payment_params)

    if @payment.save
      render json: { message: 'Payment Successfull' }
    else
      render json: { message: 'Payment Failed' }
    end
  end

  private

  def payment_params
    params.require(:payments).permit(:amount, :loan_id)
  end

  def find_loan
    @loan = Loan.find(params[:loan_id].to_i)
    check_valid_payment
  end

  def check_valid_payment
    return render json: { message: 'Loan already paid' } if @loan.outstanding_payment.zero?

    render json: { message: 'Invalid payment amount' } if @loan.outstanding_payment < params[:payments][:amount].to_i
  end
end
