SeaStack.Views.CommentForm = Backbone.View.extend({
  tagName: "form",
  template: JST['comments/form'],

  events: {
    "click button" : "submit"
  },

 initialize: function (options) {

 this.model = options.comment

 this.collection= options.collection
 this.question = options.question
 this.listenTo(this.collection, "sync", this.render)
 this.listenTo(this.model, "change", this.render)

 },

 render: function() {
   var view = this.template({comment: this.model, question: this.question})
   this.$el.html(view);
   return this;
 },

 submit: function (event) {
   event.preventDefault();
   var attrs = this.$el.serializeJSON();
   var that = this;
   this.model.set(attrs)
   this.model.save({}, {
     success: function () {
       that.collection.add(that.model, {merge: true})
     },
     error: function (model, response) {
     console.log(response.responseText)
     window.alert("You have to sign in to submit questions, answers and comments.")
   }
   });
 }

})
