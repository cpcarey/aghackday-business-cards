class CardsController < ApplicationController
  include ApplicationHelper
  include CardsHelper

  skip_before_filter :authorize, :only => ['show', 'show_redirect', 'qr_code', 'vcard', 'ics', 'save_to_collection']
  
  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @cards }
    end
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    @card = Card.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @card }
    end
  end

  # GET /cards/new
  # GET /cards/new.json
  def new
    @card = Card.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @card }
    end
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
  end

  # POST /cards
  # POST /cards.json
  def create
    params[:card][:url] = random_code
    @card = Card.new(params[:card])
    @card.info = User.find_by_id(session[:user_id]).info

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, :notice => 'Card was successfully created.' }
        format.json { render :json => @card, :status => :created, :location => @card }
      else
        format.html { render :action => "new" }
        format.json { render :json => @card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cards/1
  # PUT /cards/1.json
  def update
    @card = Card.find(params[:id])

    respond_to do |format|
      if @card.update_attributes(params[:card])
        format.html { redirect_to @card, :notice => 'Card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to cards_url }
      format.json { head :no_content }
    end
  end
  
  def qr_code
    @card = Card.find(params[:id])

    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
  end
  
  def show_redirect
    @card = Card.find(params[:id])

    respond_to do |format|
      format.html { redirect_to @card }
      format.json { render :json => @card }
    end
  end
  
  def vcard
    @card = Card.find(params[:id])
    vcard = create_vcard(@card.info)
    
    send_data vcard, :filename => 'contact.vcf'
  end
  
  def ics
    @card = Card.find(params[:id])
    ics = create_ics(@card.info)
    
    puts ics
    
    send_data ics, :filename => 'contact.ics'
  end
  
  def save_to_collection
    @card = Card.find(params[:id])
    
    if not session[:user_id]
      session[:card_id] = @card.id
      respond_to do |format|
        format.html { redirect_to :controller => 'admin', :action => 'login' }
      end
    else
      @user = User.find_by_id(session[:user_id])
      
      if @card.users.include?(@user)
        respond_to do |format|
          format.html { redirect_to @card, :notice => 'Card already in collection.' }
        end
      else
        @user.cards << @card
        @card.users << @user
        
        @card.save
        
        respond_to do |format|
          if @user.save
            format.html { redirect_to @card, :notice => 'Card was successfully added.' }
            format.json { head :no_content }
          else
            format.html { render :action => "edit" }
            format.json { render :json => @card.errors, :status => :unprocessable_entity }
          end
        end
      end
    end
  end
end
