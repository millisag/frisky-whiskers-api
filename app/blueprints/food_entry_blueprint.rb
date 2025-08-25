class FoodEntryBlueprint < Blueprinter::Base
    identifier :id
  
    fields :name, :calories, :cat_id, :created_at
  end
  