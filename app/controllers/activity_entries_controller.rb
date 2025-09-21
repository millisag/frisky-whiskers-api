class ActivityEntriesController < ApplicationController
    before_action :set_cat
  
    def index
        render json: ActivityEntryBlueprint.render(@cat.activity_entries)
      end
      
      def create
        entry = @cat.activity_entries.build(activity_entry_params)
        if entry.save
          render json: ActivityEntryBlueprint.render(entry), status: :created
        else
          render json: entry.errors, status: :unprocessable_entity
        end
      end
      def destroy
        entry = @cat.activity_entries.find(params[:id])
        entry.destroy
        head :no_content
      end   
  
    private
  
    def set_cat
      @cat = Cat.find(params[:cat_id])
    end
  
    def activity_entry_params
      params.require(:activity_entry).permit(:activity_type, :duration, :calories_burned)
    end
  end
  
