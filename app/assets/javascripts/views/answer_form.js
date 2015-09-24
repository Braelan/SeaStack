SeaStack.Views.AnswerForm = Backbone.View.extend({
  //intended only as a subview for a question
  //possible to add edit feature.
  tagName: "form",
   template: JST['answers/form'],

   events: {
     "click button" : "submit"
   },

  initialize: function (options) {
    //model is an answer object
    this.model = options.answer
    //a collection of answers from this.question
    this.collection = options.collection
    this.question = options.question
    this.listenTo(this.collection, "sync", this.render)
    this.listenTo(this.model, "change", this.render)
  },
  render: function() {
    //set the question as a hidden input from the form
    var view = this.template({answer: this.model, question: this.question})
    this.$el.html(view);
    return this;
  },

  submit: function(event) {
    event.preventDefault();
    var attrs = this.$el.serializeJSON();
    var that = this;
   this.model.set(attrs);
   this.model.save({}, {
      success: function () {
        that.collection.add(that.model, {merge:true})
      },
       error: function (model, response) {
       console.log(response.responseText)
       window.alert("You have to sign in to submit questions, answers and comments.")
     }
   });
  }
})
