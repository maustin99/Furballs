class KittiesController < ApplicationController
  
  def index
   @kitties = Kitty.all   #Kitty is the DB with ALL records

  end

  def show
    @oneKitty = Kitty.find(params[:id])
    
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
