class CatBlueprint < Blueprinter::Base
    identifier :id
  
    fields :name, :age, :weight, :breed, :color, :user_id
  
    view :with_entries do
      association :food_entries, blueprint: FoodEntryBlueprint
      association :activity_entries, blueprint: ActivityEntryBlueprint
    end
  end
  