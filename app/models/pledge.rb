class Pledge < ActiveRecord::Base
  include AASM

  belongs_to :user
  belongs_to :idea

  validates :amount, presence: true, numericality: {greater_than: 0}


  aasm do 
    state :pending, initial: true
    state :paid
    state :cancelled
    state :refunded

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :cancel do
      transitions from: :pending, to: :cancelled
    end

    event :refund do
      transitions from: :paid, to: :refunded
    end


  end
end
