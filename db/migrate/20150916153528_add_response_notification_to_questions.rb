class AddResponseNotificationToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :response_notification, :boolean
  end
end
