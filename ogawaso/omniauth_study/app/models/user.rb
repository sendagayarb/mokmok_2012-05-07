class User < ActiveRecord::Base
  attr_accessible :image, :name, :provider, :screen_name, :uid

  def self.create_with_omniauth(auth)
    user = User.create do |u|
      u.provider = auth["provider"]
      u.uid = auth["uid"]
      if auth["info"].present?
        u.name = auth["info"]["name"]
        u.screen_name = auth["info"]["nickname"]
        u.image = auth["info"]["image"]
      end
    end
  end
end
