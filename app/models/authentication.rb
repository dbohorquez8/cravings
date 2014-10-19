class Authentication < ActiveRecord::Base

  belongs_to :user

  def self.user_from_omniauth(auth)
    if authentication = where(provider: auth.provider, uid: auth.uid).first
      authentication.user
    else
      User.create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.authentications_attributes = [{ :provider => auth.provider, :uid => auth.uid }]
      end
    end
  end

end
