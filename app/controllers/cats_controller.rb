class CatsController < ApplicationController
    before_action :set_user
    before_action :set_cat, only: [:show, :update, :destroy]
  
    # GET /users/:user_id/cats
    def index
      render json: CatBlueprint.render(@user.cats)
    end
  
    # GET /users/:user_id/cats/:id
    def show
      render json: CatBlueprint.render(@cat, view: :with_entries)
    end
  
    # POST /users/:user_id/cats
    def create
      @cat = @user.cats.build(cat_params)
      if @cat.save
        render json: CatBlueprint.render(@cat), status: :created
      else
        render json: { errors: @cat.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /users/:user_id/cats/:id
    def update
      if @cat.update(cat_params)
        render json: CatBlueprint.render(@cat)
      else
        render json: { errors: @cat.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/:user_id/cats/:id
    def destroy
      @cat.destroy
      head :no_content
    end
  
    private
  
    def set_user
      @user = User.find(params[:user_id])
    end
  
    def set_cat
      @cat = @user.cats.find(params[:id])
    end
  
    def cat_params
      params.require(:cat).permit(:name, :age, :weight, :breed, :color)
    end
  end
  