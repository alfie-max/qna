class FollowsController < ApplicationController
  def user
    user = User.find(params[:user_id])
    if current_user == user
      flash.alert = I18n.t('follow.self')
    elsif user.followed_by?(current_user)
      flash.alert = I18n.t('follow.following')
    else
      current_user.follow(user)
    end
    redirect_back(fallback_location: root_path)
  end

  def topic
    topic = Topic.find(params[:topic_id])
    if topic.followed_by?(current_user)
      flash.alert = I18n.t('follow.following')
    else
      current_user.follow(topic)
    end
    redirect_back(fallback_location: root_path)
  end
end
