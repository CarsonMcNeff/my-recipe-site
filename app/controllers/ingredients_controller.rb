class IngredientsController < ApplicationController
    def new 

    end

    def create 
        @ingredient = Ingredient.create(name: ingredient_params[:name])
        if params[:user_id]
            add_ingredient(current_user)
        else
            @recipe = Recipe.find_by_id(id: params[:recipe_id])
            add_ingredient(@recipe)
        end

    end


    def index 
        if params[:user_id] && User.find_by(id: params[:user_id]) == current_user
            @user = current_user
            @ingredients = @user.ingredients
            
        end
    end

    private
    def add_amount(object)
        object.ingredients.find(@ingredient).amount = ingredient_params[:amount] 
    end

    def ingredient_params
        params.require(:ingredient).permit(:name,:amount)
    end

    def add_ingredient(object)
        if @ingredient.save
            object.ingredients << @ingredient
            puts object.ingredients
             redirect_to '/'
        else
        redirect_to "ingredient#new"
        end
    end
end
