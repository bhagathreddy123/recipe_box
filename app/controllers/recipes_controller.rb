class RecipesController < ApplicationController
	before_action :set_recipe, :only => [:show,:edit,:update,:destroy]

	def index
		   # @recipes = Recipe.all
		   @recipes = Recipe.all.order("created_at DESC")
	end

	def new
		@recipe = Recipe.new
	end

	def show
	end

	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			redirect_to @recipe, notice: "successfully created new recipe"
		else
			render "new"
		end
	end

	def edit

	end

	def update
		if @recipe.update(recipe_params)
			redirect_to @recipe, notice: "recipe updated successfully"
		else
			render "edit"
		end
	end

	def destroy
		if @recipe.destroy
			redirect_to recipes_path, notice: "recipe deleted sucessfully"
		end
	end

	private

	def set_recipe
		@recipe = Recipe.find(params[:id])
	end

	def recipe_params
		#params.require(:recipe).permit!
		params.require(:recipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
	end

end
