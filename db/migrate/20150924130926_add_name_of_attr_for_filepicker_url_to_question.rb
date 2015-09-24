class AddNameOfAttrForFilepickerUrlToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :filepicker_url, :string
  end
end
