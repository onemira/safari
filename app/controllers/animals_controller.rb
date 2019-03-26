class AnimalsController < ApplicationController
  #READ  
  # GET /animals -> all the animals in the system
    def index
      #Ask the database (Model named Animal)
      @animals = Animal.all
      #Create JSON of all those animals (VIEW)
      render json: @animals
      #The above is a shortcut for:
      #render({ json: all_the_animals })
      #render({ "json" => all_the_animals})
    end
  
    # GET /animals/total
    def total
      @animals = Animal.all
      seen_count = @animals.map do |animal|
        animal.seen_count
      end

      render json: seen_count.sum
    end

    
    # def index
    #   # Lets get the name from the parameters
    #   seen_count = params[:seen_count]
  
    #   # If name is not nil or false
    #   if seen_count
    #     @animals = Animal.where("species ilike ?", "%#{}%")
    #   else
    #     @animals = Animal.all
    #   end
  
    #   render json: @animals
    # end


    def index
      # Lets get the name from the parameters
      species = params[:species]
  
      # If name is not nil or false
      if species
        @animals = Animal.where("species ilike ?", "%#{species}%")
      else
        @animals = Animal.all
      end
  
      render json: @animals
    end

    def index
      # Lets get the name from the parameters
      location = params[:location]
      # If name is not nil or false
      if location
        @animals = Animal.where("last_seen_location ilike ?", "%#{location}%")
      else
        @animals = Animal.all
      end
  
      render json: @animals
    end

    # READ: Show information about ONE animal
    # GET /animals/1 -> get the 'id' parameter from what the user sent us
    # and store that in animal_id
    def show
      animal_id = params[:id]
      # Find that animal (by id) in the database
      @animal = Animal.find(animal_id)
  
      #Give back JSON details of that animal
      render json: @animal
    end


    # POST /animals
    def create
      @animal = Animal.new(animal_params)
  
      if @animal.save

        render json: @animal, status: :created, location: @animal
      else
        render json: @animal.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /animals/1
    def update
      @animal = Animal.find(params[:id])
  
      if @animal.update(animal_params)
        render json: @animal
      else
        render json: @animal.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /animals/count/{id}
    def increment
      # update_attributes(:seen_count=>seen_count+1)
      # @animal.increment!(:seen_count)
      # 1. find the right animal
      # 2. 

      @animal=Animal.find(params[:id])
      @animal.seen_count += 1
      
      if @animal.save
      render json: @animal
      else
         render json: @animal.errors, status: :unprocessable_entity
       end
    end



    # DELETE /animals/1
    def destroy
      @animal = Animal.find(params[:id])
  
      @animal.destroy
    end
  
    private
  
    # Only allow a trusted parameter "white list" through.
    def animal_params
      params.require(:animal).permit(:species, :last_seen_location, :seen_count)
    end
  end




# class AnimalsController < ApplicationController
#  # READ: Show info about ONE animal (api datum)
#  # get all the animals in the system
#  def index
#     #Ask the database (MODEL named Animal)
#     all_the_animals = Animal.all

#     # Create JSON of all those animals (VIEW)
#     render json: @all_the_animals
#     #render({ "json" => all_the_animals})
#     #render({ json: all_the_animals })
#  end

#  # C
# def show
#     animal_id = params[:id]

#     animal = Animal.find(animal_id)
#     render json: animal
# end
#  # R

#  # U

#  # D
# end
