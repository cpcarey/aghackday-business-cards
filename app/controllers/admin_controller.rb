require 'rubygems'
require 'oauth'
require 'yaml'
require 'json'

class AdminController < ApplicationController
  
  skip_before_filter :authorize, :only => ['login_callback']
  
  def self.consumer
    config = YAML.load(File.open("config/oauth.yml"))
    oauth_options = config['linkedin']
    consumer_options = { 
      :site => oauth_options['api_host'],
      :authorize_path => oauth_options['authorize_path'],
      :request_token_path => oauth_options['request_token_path'],
      :access_token_path => oauth_options['access_token_path']
    }
    
    OAuth::Consumer.new(oauth_options['consumer_key'], oauth_options['consumer_secret'], consumer_options)
  end
  
  def login
    callback_url = 'http://cpc2273-mac.wireless.rit.edu:3000/admin/login_callback'
    request_token = AdminController.consumer.get_request_token(:oauth_callback => callback_url)
    session[:request_token] = request_token
    @authorize_url = request_token.authorize_url

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
  
  def login_callback
    if params[:oauth_verifier]
      oauth_token = params[:oauth_token]
      oauth_verifier = params[:oauth_verifier]
      
      fields = ['id'].join(',')
      
      access_token = session[:request_token].get_access_token(:oauth_verifier => oauth_verifier)
      json_txt = access_token.get("/v1/people/~:(#{fields})", 'x-li-format' => 'json').body
      login_id = JSON.parse(json_txt).to_s

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
