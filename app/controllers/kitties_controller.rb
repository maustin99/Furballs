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
    
    #### TRADITIONAL WAY #####
    # @kitty = Kitty.new
    # @kitty.name = params[:kitty][:name]
    # @kitty.age = params[:kitty][:age]
    # @kitty.breed = params[:kitty][:breed]
    # @kitty.image = params[:kitty][:image]

        if @kitty.save    #checks if CREATE was successfull (TRUE)

          #obejct saved to DB, ID assigned, redirected to Show page
          redirect_to "/kitties/#{@kitty.id}"
        else
          redirect_to "/kitties/new"    #if failed reutrn to NEW form 
        end # end IF

  end

  def edit

      @kitty = Kitty.find(params[:id])

  end



  def update

    @kitty = Kitty.find(params[:id])

    if @kitty.update(kitty_params)    #checks if UPDATE was successfull (returns TRUE)
          #obejct saved to DB, redirected to Show page
      redirect_to kitty_path(@kitty)   #a new way to redirect using ALIASES
    else
      redirect_to edit_kitty_path(@kitty)    #if failed reutrn to EDIT form 
    end # end IF
  end


  
  def destroy

    @kitty = Kitty.find(params[:id])
    
    if @kitty.destroy
      redirect_to kitties_path    #new paths using aliases
    else
      redirect_to kitty_path(@kitty)  #new paths using aliases
    end

  end



  private    #FOR SECURITY 
  def kitty_params
    return params.require(:kitty).permit(:name, :age, :breed, :neutered, :image)
  end

end
