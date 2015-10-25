class Upvote < ActiveRecord::Base
  validates :user_id, presence:true
  belongs_to(
    :question,
    :class_name => "Question",
    :foreign_key => :question_id,
    :primary_key => :id
  )

  belongs_to :user
end
