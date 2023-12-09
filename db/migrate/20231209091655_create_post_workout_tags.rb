class CreatePostWorkoutTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_workout_tags do |t|

      t.timestamps
    end
  end
end
