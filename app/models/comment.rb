class Comment < ActiveRecord::Base
  validates :body, :user_id, presence: true

  belongs_to :question
  belongs_to :answer
end
