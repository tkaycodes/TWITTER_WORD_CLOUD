class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas
  
  serialize :omniauth_data

  def email_required?
    false
  end

  def password_required?
    provide.nil?
  end


  def self.find_or_create_from_twitter(omniauth_data)
    user = User.where(provider: :twitter, uid: omniauth_data["uid"]).first
    unless user
      #create user
       name = omniauth_data["info"]["name"].split
       user = User.create(provider: :twitter,
                          uid: omniauth_data["uid"],
                          first_name: name[0],
                          last_name: name[1],
                          twitter_consumer_token: omniauth_data["credentials"]["token"],
                          twitter_consumer_secret: omniauth_data["credentials"]["secret"],
                          omniauth_raw_data: omniauth_data)

    end
    user
  end



end
