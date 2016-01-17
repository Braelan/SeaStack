class Question < ActiveRecord::Base
  validates :title, :body, presence: true, uniqueness: true
  validates :user_id, presence: true
  has_many :comments
  has_many :answers
  has_many(
   :upvotes,
   :class_name => "Upvote",
   :foreign_key => :question_id,
   :primary_key => :id
  )

  has_many :tags
  belongs_to :user


end
