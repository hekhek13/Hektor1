class StaticPagesController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
  	@products=Product.all
  end

  def landing_page
    @products = Product.limit(3)
  end

def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  ActionMailer::Base.mail(:from => @email,
      :to => 'hekhek13@gmail.com',
      :subject => "A new contact form message from #{@name}",
      :body => @message).deliver_now
end

end
