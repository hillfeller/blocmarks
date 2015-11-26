class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_many :likes, dependent: :destroy
  scope :visible_to, -> (user) { user ? all : where(public: true) }

end
