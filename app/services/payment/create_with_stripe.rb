class Payment::CreateWithStripe

  include Virtus.model

  attribute :pledge, Pledge
  attribute :user, User
  attribute :stripe_token, String


  attribute :customer



  def call
    create_customer && save_user_data && charge_user
  end


  private

  def create_customer
      begin
         #creating customer with Stripe
        @customer = Stripe::Customer.create(
        :description => "Customer for #{user.email}",
        :source => stripe_token )
        rescue => e
        false  
      end
  end

  def save_user_data
    #saving Stripe into the user
    user.stripe_customer_token = customer.id
    user.stripe_last4          = customer.sources.data[0].last4
    user.stripe_card_type      = customer.sources.data[0].brand
    user.save
  end

  def charge_user
    begin
      #Charge the customer
      Stripe::Charge.create(
        amount:       pledge.amount * 100,
        currency:     "cad",
        customer:       user.stripe_customer_token,
         description: "Pledge for idea #{pledge.idea.title}" )
    rescue => e
      Rails.logger.info e.message
        false
    end
  end



end
