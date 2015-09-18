SeaStack.Models.Question = Backbone.Model.extend({
  urlRoot: "/api/questions",

  comments: function () {
    this._comments = this._comments ||
    new SeaStack.Collections.QuestionComments([], {question: this});
    return this._comments;
  },

  parse: function (payload) {
    debugger
    if(payload.comments) {
      this.comments().set(payload.comments, {parse: true});
      delete payload.comments;
    }
    return payload;
  }

});
