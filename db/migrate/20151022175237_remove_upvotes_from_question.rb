class RemoveUpvotesFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :upvotes, :integer
  end
end
