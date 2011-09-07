class UsersController < ActionController::Base
  layout "application"
  def index
    @users = User.all
    #    raise response.inspect
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    #@user.dob = Date.civil(params[:user][:"dob(1i)"].to_i,params[:user][:"dob(2i)"].to_i,params[:user][:"dob(3i)"].to_i)
    if @user.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to :action => "show"
    else
      render :action => "edit"
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def activate
    #    raise params[:id].inspect
    @user= User.find(params[:id])
    @user.update_attribute(:active,true)
    redirect_to :action => "index"
  
  end
   def deactivate
    #    raise params[:id].inspect
    @user= User.find(params[:id])
    @user.update_attribute(:active,false)
    redirect_to :action => "index"

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :action => "index"
  end

  def login
    # render :text => "hi" and return
    #  raise params.inspect
    if request.post?
#         raise params.inspect
      user = User.authenticate(params[:username], params[:password])   
#    if params[:username] == "admin" && params[:password] == "admin"
#    redirect_to :controller => "products", :action => "new"
#    end

      if user
         # raise session.inspect
        session[:id] = user.id
        flash[:notice] = "You are now successfully logged in."
        redirect_to(:controller => "products", :action => "index")
      else 
#           raise params.inspect
        flash[:notice] = "Invalid User name or Password combination"
        render("login" )
      end
    end
  end
  
  def logout
#     raise session.inspect
    session[:id]=nil
    flash[:notice] = "You have been logged out."
    redirect_to(:action=>"login")
  end
  
end

