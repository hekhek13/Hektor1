class PaymentsController < ApplicationController

def create
  @product = params[:product_id]
  @user = current_user
  token = params[:stripeToken]
  # Create the charge on Stripe's servers - this will charge the user's card
  begin
    charge = Stripe::Charge.create(
      :amount => (@product.price), # amount in cents, again
      :currency => "usd",
      :source => token,
      :description => params[:stripeEmail]
    )

    if charge.paid
      Order.create(product_id: @product_id, user_id: current_user.id, total: @product.price)
    else
      redirect_to product_path(@product)
    end
  end

  rescue Stripe::CardError => e
    # The card has been declined
    body = e.json_body
    err = body[:error]
    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  end
end
