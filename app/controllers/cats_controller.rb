class CatsController < ApplicationController
    def index
      cats = @current_user.cats
      render json: cats
    end
  
    def show
      cat = @current_user.cats.find(params[:id])
      render json: cat
    end
  
    def create
      cat = @current_user.cats.build(cat_params)
      if cat.save
        render json: cat, status: :created
      else
        render json: { errors: cat.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      cat = @current_user.cats.find(params[:id])
      if cat.update(cat_params)
        render json: cat
      else
        render json: { errors: cat.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      cat = @current_user.cats.find(params[:id])
      cat.destroy
      head :no_content
    end
  
    private
  
    def cat_params
      params.require(:cat).permit(:name, :age, :breed)
    end
  end
  
