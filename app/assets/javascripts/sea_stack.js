window.SeaStack = {
  Collections: {},
  Models: {},
  Routers: {},
  Views: {},

  initialize: function () {
    SeaStack.questions = new SeaStack.Collections.Questions();
    SeaStack.questions.fetch({
      success: function() {
        console.log("fetched")
      },
      error: function() {
        console.log("fail")
      }
    }
    );
    new SeaStack.Routers.Router({$rootEl: $("div")});
    Backbone.history.start();
  }

};
$(document).ready(function(){
  SeaStack.initialize();
});
