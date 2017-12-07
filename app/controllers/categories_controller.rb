class CategoriesController < ApplicationController

  before_action :set_category, only: [:edit, :show, :update, :destroy]

  def index
    @categories = Category.all.order('name')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category #{@category.name} has been created. Beeeewm."
      redirect_to categories_path
    else
      flash.now[:alert] = "Ah crap. Something went wrong."
      render :new
    end
  end

  def show
    @products = @category.products
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "#{@category.name} has been updated."
      redirect_to @category
    else
      flash.now[:error] = "Whoopsie doopers"
      render :edit
    end
  end

  def destroy
  end

  private

  def set_category
    @category = Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end

end
