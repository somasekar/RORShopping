class ProductsController < ActionController::Base
  layout "application"
  def index
    @products = Product.all
  end
  def new
    
    @product = Product.new
  end
  def create
    @product = Product.new(params[:product])
    if
      @product.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to :action => "index"
    else
      render :action =>"edit"
    end
  end
  def show
    @product = Product.find(params[:id])
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to :action => "index"
  end
end