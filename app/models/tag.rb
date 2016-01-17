class Tag < ActiveRecord::Base
  validates :question_id, :category, presence: true
  belongs_to :question
end
