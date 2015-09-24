SeaStack.Views.QuestionForm = Backbone.View.extend({
 template: JST['questions/form'],
 tagName: "form",

 events: {"click .post-question" : "submit"},

 initialize: function (options) {
   this.model = options.model
   this.collection = options.collection
 },
 render: function () {
   var formView = this.template({question: this.model});
   this.$el.html(formView);
   return this;
 },

 submit: function (event) {
   event.preventDefault()
   var attrs = this.$el.serializeJSON();
   var that = this;
   this.model.set(attrs)
   this.model.save({}, {
   success: function() {
     that.collection.add(that.model, {merge:true})
     Backbone.history.navigate("questions", {trigger: true})
   },
    error: function (model, response) {
      console.log(response.responseText)
      window.alert("You have to sign up or sign in to submit questions, answers and comments.")
    }
   });
 }


})
