// in assets/javascripts/discourse/initializers/user-activity.js.es6
export default {
    name: "user-activity-tracker",
  
    initialize(container) {
      const api = container.lookup("widget:app-events");
      api.decorateWidget("user-card-contents:after", dec => {
        const summary = dec.attrs.user.activity_summary;
        if (!summary) return;
  
        return dec.h("div.user-activity-summary", [
          `🗓 First post: ${summary.first_post}`,
          `✍️ Total posts: ${summary.total_posts}`,
        ]);
      });
    }
};
// This code initializes a widget that displays user activity summary information
// in the user card contents section of a web application. It uses the Discourse framework's  