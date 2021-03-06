class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  scope :visible_to, -> (user) { user ? all : where(public: true) }

end
