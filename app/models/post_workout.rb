class PostWorkout < ApplicationRecord

  def save_workout_tags(tags)
    current_tags = self.workout_tags.pluck(:name) unless self.workout_tags.nil?
  end

end