# name: user-activity-tracker
# about: Tracks user post activity and shows summary in profile
# version: 0.1
# authors: Gaurav ks
# url: https://github.com/user-name/user-activity-tracker

enabled_site_setting :user_activity_tracker_enabled

after_initialize do
  load File.expand_path("../lib/user_activity_tracker/engine.rb", __FILE__)

  Discourse::Application.routes.append do
    mount ::UserActivityTracker::Engine, at: "/user-activity"
  end

  add_to_serializer(:user_card, :activity_summary) do
    {
      first_post: object.user.posts.order(:created_at).first&.created_at,
      total_posts: object.user.posts.count
    }
  end

  DiscourseEvent.on(:post_created) do |post|
    # Log or process user activity
    Rails.logger.info "[UserActivityTracker] Post created by #{post.user.username}"
  end
end
