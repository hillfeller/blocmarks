class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookmark
  scope :visible_to, -> (user) { user ? all : where(public: true) }

end
