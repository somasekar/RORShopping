class OrderlineitemsController < ActionController::Base
layout "application"
  def index
    @olitems = Orderlineitem.all
  end
  def destroy
    @olitem = Orderlineitem.find(params[:id])
    @olitem.destroy
    redirect_to :action => "index"
  end
end