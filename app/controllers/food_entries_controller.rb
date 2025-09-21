class FoodEntriesController < ApplicationController
    before_action :set_cat
  
    def index
        render json: FoodEntryBlueprint.render(@cat.food_entries)
      end
      
      def create
        entry = @cat.food_entries.build(food_entry_params)
        if entry.save
          render json: FoodEntryBlueprint.render(entry), status: :created
        else
          render json: entry.errors, status: :unprocessable_entity
        end
      end 
      def destroy
        entry = @cat.food_entries.find(params[:id])
        entry.destroy
        head :no_content
      end     
  
    private
  
    def set_cat
      @cat = Cat.find(params[:cat_id])
    end
  
    def food_entry_params
      params.require(:food_entry).permit(:name, :calories)
    end
  end
  
