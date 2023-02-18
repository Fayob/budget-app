class CategoriesController < ApplicationController
  load_and_authorize_resource except: :index

  def index
    if current_user
      @categories = Category.includes(:transacts).where(user: current_user)
    else
      render 'home'
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(user: current_user, name: params['name'], icon: params['icon'])
    if @category.save
      flash[:notice] = 'Category created successfully'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end
end
