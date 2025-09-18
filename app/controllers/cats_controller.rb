class CatsController < ApplicationController
  before_action :authenticate_request
  before_action :set_cat, only: [:show, :update, :destroy]

  # GET /cats
  def index
    render json: CatBlueprint.render(@current_user.cats)
  end

  # GET /cats/:id
  def show
    render json: CatBlueprint.render(@cat)
  end

  # POST /cats
  def create
    cat = @current_user.cats.build(cat_params)
    if cat.save
      render json: CatBlueprint.render(cat), status: :created
    else
      render json: { errors: cat.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cats/:id
  def update
    if @cat.update(cat_params)
      render json: CatBlueprint.render(@cat)
    else
      render json: { errors: @cat.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /cats/:id
  def destroy
    @cat.destroy
    head :no_content
  end

  private

  def set_cat
    @cat = @current_user.cats.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :age, :weight, :breed, :color)
  end
end


  # PATCH/PUT /cats/:id
  def update
    if @cat.update(cat_params)
      render json: CatBlueprint.render(@cat)
    else
      render json: { errors: @cat.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /cats/:id
  def destroy
    @cat.destroy
    head :no_content
  end

  private

  def set_cat
    @cat = @current_user.cats.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :age, :weight, :breed, :color)
  end
