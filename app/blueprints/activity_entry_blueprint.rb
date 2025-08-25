class ActivityEntryBlueprint < Blueprinter::Base
    identifier :id
  
    fields :activity_type, :duration, :calories_burned, :cat_id, :created_at
  end
  