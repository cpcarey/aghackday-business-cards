class UsersController < ApplicationController

  skip_before_filter :authorize, :only => ['new', 'new_callback', 'create']
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    
    callback_url = 'http://cpc2273-mac.wireless.rit.edu:3000/users/new_callback'
    request_token = AdminController.consumer.get_request_token(:oauth_callback => callback_url)
    session[:request_token] = request_token
    @authorize_url = request_token.authorize_url

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end
  
  def new_callback
    respond_to do |format|
      if params[:oauth_verifier]
        oauth_token = params[:oauth_token]
        oauth_verifier = params[:oauth_verifier]
        
        fields = ['id'].join(',')
        
        access_token = session[:request_token].get_access_token(:oauth_verifier => oauth_verifier)
        json_txt = access_token.get("/v1/people/~:(#{fields})", 'x-li-format' => 'json').body
        login_id = JSON.parse(json_txt).to_s
        
        @user = User.new
        @user.login_id = login_id

        if @user.save
          session[:user_id] = @user.id
          format.html { redirect_to @user, :notice => 'User was successfully created.' }
          format.json { render :json => @user, :status => :created, :location => @user }
        else
          format.html { render :action => "new" }
          format.json { render :json => @user.errors, :status => :unprocessable_entity }
        end
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
