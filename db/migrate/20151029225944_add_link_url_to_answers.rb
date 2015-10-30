class AddLinkUrlToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :link_url, :string
  end
end
