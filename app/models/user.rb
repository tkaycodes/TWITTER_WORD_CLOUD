class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas, dependent: :destroy

  has_many :pledges, dependent: :nullify

  has_many :tweets
  
  serialize :omniauth_raw_data, Hash

  def email_required?
    false
  end

  def password_required?
    !email.nil?
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

  def tweets
     @client ||= Twitter::REST::CLIENT.new do |config| 
      config.consumer_key = ENV["TWITTER_API_KEY"]
      config.consumer_secret = ENV["TWITTER_API_SECRET"]

      config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]  
    end
  end




end
