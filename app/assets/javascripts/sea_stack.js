window.SeaStack = {
  Collections: {},
  Models: {},
  Routers: {},
  Views: {},

  initialize: function () {
    SeaStack.questions = new SeaStack.Collections.Questions();
    SeaStack.questions.fetch({
      success: function() {
        console.log("fetched") // nice to see if it is fetching
      },
      error: function() {
        console.log("fail")
      }
    }
    );
     // this puts html into App/Views/site/root
    new SeaStack.Routers.Router({$rootEl: $("div")});
    Backbone.history.start();
  }

};
