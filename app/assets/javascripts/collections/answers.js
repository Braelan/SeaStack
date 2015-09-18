SeaStack.Collections.Answers = Backbone.Collection.extend({
  //this collection will be created when a question is fetched from the database.
  // the rails answer model only has a create controller, located at /api/answers
  //have fun!
  url: "/api/answers",

  initialize: function (options) {
    this.question = options.question;
  }
})
