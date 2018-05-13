class FoodsController < ApplicationController

	def index
		@food = Food.all
		@search = Food.where(nil)
		filtering_params(params).each do |key, value|
			@search = @search.public_send(key, value) if value.present?	
		end

		respond_to do |format| 
			format.html
			format.js 
		end 
	end

	def create
		@food = current_user.foods.new(food_params)
		if @food.save
			redirect_to root_path
		else
			redirect_to new_food_path
		end

	end

	def new
		@food = Food.new
	end


	def show
	end

	def edit
		@food = current_user.foods.find(params[:id])
	end
	
	def update
		@food = Food.find(params[:id])
		@food.update_attributes(food_params)
		redirect_to root_path
	end

    def destroy
    	@food = Food.delete(params[:id])
    	@number = params[:id]
    	redirect_to root_path
    end

	private
	 def find_food
      @food = Food.find(params[:id])
    end

    def food_params
      params.require(:food).permit(:item, :price, :location, :description, {image:[]})
    end

    def filtering_params(params)
    	params.slice(:item , :location)
    end
end
