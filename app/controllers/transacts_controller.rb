class TransactsController < ApplicationController
  def index
    @category = Category.includes(:transacts).find(params[:category_id])
    @transacts = @category.transacts.order(created_at: :desc)
  end

  def show
  end

  def new
    @transact = Transact.new
  end

  def create
    @transact = Transact.new(user: current_user, name: params[:name], amount: params[:amount])
    if @transact.save
      CategoryTransact.create(category_id: params[:category_id], transact: @transact)
      flash[:notice] = 'Transaction added successfully'
      redirect_to category_transacts_path
    else
      render 'new'
    end
  end
end