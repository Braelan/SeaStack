window.SeaStack = {
  Collections: {},
  Models: {},
  Routers: {},
  Views: {},

  initialize: function () {
    SeaStack.questions = new SeaStack.Collections.Questions();
    SeaStack.tags = new SeaStack.Collections.Tags();
    SeaStack.questions.fetch({
      success: function() {
        // console.log("fetched") // nice to see if it is fetching
      },
      error: function() {
        console.log("failed to fetch collection")
      }
    }
    );
    SeaStack.tags.fetch();
     // this puts html into App/Views/site/root
    new SeaStack.Routers.Router({$rootEl: $("div")});
    Backbone.history.stop();
    Backbone.history.start();
  }

};
//Initialize SeaStack is moved to Views/site/root.
