class OrdersController < ActionController::Base
  layout "application"
  def index
    #    render :text => params.inspect and return
    @orders = Order.all
  end
  
  def new
    @order = Order.new
  end

  def create
    #raise params.inspect
  @orders = Order.all
  @products = Product.all
    @order = Order.new(:shipping_address => params[:orders][:shipping_address], :billing_address=>params[:orders][:billing_address])
    @order.user_id = session[:id]
    #   render :text => params.inspect and return
    unless params[:orders][:products].blank?
      @ordered_products =  params[:orders][:products]
      if @order.save
        n = 0
        @ordered_products.each do |product_id|
          product = Product.find product_id.to_i
          order_line_item = @order.orderlineitems.create(:user_id => session[:id], :product_id => product_id, :quantity => params[:orders][:quantity][n])
#          if Stock < 0
#            flash[:notice] = "Your Quantity exceeds the stock"
#            redirect_to :action => "index"
#          end
          stock = product.product_stock.to_i - order_line_item.quantity.to_i 
          product.update_attributes(:product_stock => stock)
          n +=1
        end
        #      flash[:notice] = "You have been Successfully Ordered your products"
        redirect_to :action => "index"
      else
        render :action => "/products/index"
#         flash[:notice] = @order.errors.full_messages
       
      end
    else
      render :action => "/products/index"
    end

  end

  def edit
    @order = Order.find(params[:id])
  end
  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      redirect_to :action => "index"
    else
      render :action =>"edit"
    end
  end
  def show
    @order = Order.find(params[:id])
  end
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to :action => "index"
  end
end