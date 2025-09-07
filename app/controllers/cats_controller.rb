class CatsController < ApplicationController
    before_action :set_user, only: [:index, :create, :show, :update, :destroy]  # run for all actions
    before_action :set_cat, only: [:show, :update, :destroy]
  
    def index
      Rails.logger.debug "params: #{params.inspect}"
      render json: CatBlueprint.render(@user.cats)
    end
  
    def show
      render json: CatBlueprint.render(@cat, view: :with_entries)
    end
  
    def create
      @cat = @user.cats.build(cat_params)
      if @cat.save
        render json: CatBlueprint.render(@cat), status: :created
      else
        render json: @cat.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @cat.update(cat_params)
        render json: CatBlueprint.render(@cat)
      else
        render json: @cat.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @cat.destroy
      head :no_content
    end
  
    private
  
    def set_user
      @user = User.find(params[:user_id])
    end
  
    def set_cat
      @cat = @user.cats.find(params[:id])  # user-scoped cat
    end
  
    def cat_params
      params.require(:cat).permit(:name, :age, :weight, :breed, :color)
    end
  end
  
