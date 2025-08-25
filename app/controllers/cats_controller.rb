class CatsController < ApplicationController
    before_action :set_user, only: [:index, :create]
    before_action :set_cat, only: [:show, :update, :destroy]
  
    def index
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
      
    private
  
    def set_user
      @user = User.find(params[:user_id])
    end
  
    def set_cat
      @cat = Cat.find(params[:id])
    end
  
    def cat_params
      params.require(:cat).permit(:name, :age, :weight, :breed, :color)
    end
  end
  
