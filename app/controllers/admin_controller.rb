class AdminController < ApplicationController
  def login
    if request.post?
      login_id = params[:login_id]
      
      if user = User.find_by_login_id(login_id)
        session[:user_id] = user.id
        redirect_to(:controller => 'users', :action => 'show', :id => user.id)
      else
        flash.now[:notice] = 'Login failed.'
      end
    end
  end

  def logout
  end
end
