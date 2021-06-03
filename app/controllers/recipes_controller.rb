class RecipesController < ApplicationController
    def new 

    end
    def index 
        if params[:user_id] && User.find_by(id: params[:user_id]) == current_user
            @user = current_user
            @recipes = @user.recipes
        else
            @recipes = Recipe.all
        end
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
