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

  include PgSearch
  pg_search_scope :search, against: [:title, :body],
    using: {tsearch: {dictionary: "english"}},
    associated_against: {user: :name, comments: :body, tags: :category, answers: :body}

  def self.text_search(query)
      search(query)
  end

end
