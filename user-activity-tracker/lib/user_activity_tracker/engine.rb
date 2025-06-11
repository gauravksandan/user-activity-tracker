module ::UserActivityTracker
    class Engine < ::Rails::Engine
      engine_name "user_activity_tracker"
      isolate_namespace UserActivityTracker
    end
  end
# This code defines a Rails engine for the UserActivityTracker module.
# The engine is isolated, meaning it has its own namespace and does not interfere with the main application.
# The engine name is set to "user_activity_tracker".
# This allows the UserActivityTracker module to be used as a standalone component within a Rails application.