class PostWorkout < ApplicationRecord

  def save_workout_tags(tags)
    current_tags = self.workout_tags.pluck(:name) unless self.workout_tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    old_tags.each do |old_name|
      self.workout_tags.delete WorkoutTag.find_by(name:old_name)
    end

    new_tags.each do |new_name|
      workout_tag = WorkoutTag.find_or_create_by(name:new_name)
      self.workout_tags << workout_tag
    end
  end

end
