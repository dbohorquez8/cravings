class Authentication < ActiveRecord::Base

  belongs_to :user

  def self.user_from_omniauth(auth, options = {})
    if authentication = where(provider: auth.provider, uid: auth.uid).first
      authentication.user.meals.create(choice_id: options[:last_choice_id]) if options[:last_choice_id]
      authentication.user
    else
      User.create do |user|
        user.email = auth.info.email
        user.name = auth.info.name
        user.password = Devise.friendly_token[0,20]
        user.authentications_attributes = [{ provider: auth.provider, uid: auth.uid }]
        user.meals_attributes = [{ choice_id: options[:last_choice_id] }]
      end
    end
  end

end
