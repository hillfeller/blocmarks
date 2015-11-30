class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_many :likes, dependent: :destroy
  scope :visible_to, -> (user) { user ? all : where(public: true) }

  #after_create :set_embedly_url


  def set_embedly_url
    # all the embedly code
    embedly_api = Embedly::API.new :key => ENV['EMBEDLY_KEY'],
        :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
    obj = embedly_api.extract :url => url
    Rails.logger.info JSON.pretty_generate(obj[0].marshal_dump)

    # embedly_url = obj['image_url'].first
    # self.save!
  end

end
