class TransactionsController < ApplicationController
  # load_and_authorize_resource

  def index
    @category = Category.find(params[:category_id])
    # @transactions = @category.transactions.all.order(created_at: :desc)
  end

  def new
    @params = params
    @category = Category.find(params[:category_id])
    @transaction = Transaction.new
    # @transaction = Transaction.new
  end

  def create
    @params = params
    # @category = Category.find(params[:category_id])
    @transaction = Transaction.create!(name: transaction_params[:name], amount: transaction_params[:amount],
                                       author_id: current_user.id, categories_id: params[:category_id])

    respond_to do |format|
      format.html do
        if @transaction.save
          redirect_to "/categories/#{params[:category_id]}", notice: 'You have successfully created a transaction.'
        else
          render :new, alert: 'Error: Transaction could not be saved'
        end
      end
    end
  end

  def destroy; end

  def show; end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end
end
