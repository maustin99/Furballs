class KittiesController < ApplicationController
  
  def index
   @kitties = Kitty.all   #Kitty is the DB with ALL records

  end

  def show
    @oneKitty = Kitty.find(params[:id])
    
  end

  def new
    @kitty = Kitty.new       # @kitty is new and only surrives as the NEW page is open. This one is used to create the FORM.

  end

  def create
    @kitty = Kitty.new(kitty_params)    #  ORIGINAL CALL:: Kitty.new(params[:kitty]) ::: but use kitty_params for security measures
    
    # @kitty = Kitty.new
    # @kitty.name = params[:kitty][:name]
    # @kitty.age = params[:kitty][:age]
    # @kitty.breed = params[:kitty][:breed]
    # @kitty.image = params[:kitty][:image]

    @kitty.save

    #obejct saved to DB, ID assigned, redirected to Show page
    redirect_to "/kitties/#{@kitty.id}"

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private    #FOR SECURITY 
  def kitty_params
    return params.require(:kitty).permit(:name, :age, :breed, :neutered, :image)
  end

end
