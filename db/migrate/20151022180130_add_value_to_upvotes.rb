class AddValueToUpvotes < ActiveRecord::Migration
  def change
    add_column :upvotes, :value, :boolean
  end
end
