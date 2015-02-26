class Idea < ActiveRecord::Base

  belongs_to :user

  has_many :pledges, dependent: :nullify

# def user_firstname
#   @user.first_name if user
# end

end


