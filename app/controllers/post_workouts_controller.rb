class Public::PostWorkoutsController < ApplicationController
  def create
    @post_workout = PostWorkout.new(post_workout_params)
    @post_workout.end_user_id = current_end_user.id
     # 受け取った値を,で区切って配列にする
    tag_list = params[:post_workout][:name].split(',')
    if @post_workout.save
      @post_workout.save_workout_tags(tag_list)
      redirect_to post_workouts_path, notice:'投稿が完了しました'
    else
      render :new
    end
  end

  def search_tag
    @tag_list = WorkoutTag.all
    @tag = WorkoutTag.find(params[:workout_tag_id])
    @post_workouts = @tag.post_workouts
  end
end