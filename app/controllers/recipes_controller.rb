class RecipesController < ApplicationController
    def new 

    end
    def index 
        @recipes = Recipe.all
    end

    def show 
        @recipe = Recipe.find_by(id: params[:id])
    end
    def create 
        @recipe = Recipe.create(recipe_params)
        if @recipe.save
            current_user.recipes << @recipe
            puts current_user.recipes
            redirect_to '/'
        else
        redirect_to upload_path
        end
    end


    def recipe_params
        params.require(:recipe).permit(:title,:text,:difficulty_level,:calories,:carbs,:protein)
    end
end
