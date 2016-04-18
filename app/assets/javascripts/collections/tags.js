SeaStack.Collections.Tags = Backbone.Collection.extend({
  model: SeaStack.Models.Tag,
  url: "/api/tags",

  getOrFetch: function (id) {
    var tag = this.get(id)
    var tags = this;

    if (!tag) {
      tag = new SeaStack.Models.Tag({id: id});
      tag.fetch({
        success: function () {
          tags.add(tag);
        }
      })
    } else {
      tag.fetch();
    }
    return tag
  }
})
