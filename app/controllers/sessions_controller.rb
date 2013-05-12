class SessionsController < ApplicationController
  
  def new #automatically goes to create upon submit, passes params hash to method
  end
  
  def create
    #gets params hash data from #new submit
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      #error and re-rerender new
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
  
end
