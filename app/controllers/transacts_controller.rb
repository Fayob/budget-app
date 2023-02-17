class TransactsController < ApplicationController
  load_and_authorize_resource

  def index
    @category = Category.includes(:transacts).find(params[:category_id])
    @transacts = @category.transacts.order(created_at: :desc)
  end

  def new
    @categories = Category.where(user: current_user)
    @transact = Transact.new
  end

  def create
    @transact = Transact.new(user: current_user, name: params[:name], amount: params[:amount])
    if @transact.save
      CategoryTransact.create(category_id: params[:category], transact: @transact)
      flash[:notice] = 'Transaction added successfully'
      redirect_to category_transacts_path(params[:category])
    else
      render 'new'
    end
  end
end
