class StaticPagesController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
  end

  def landing_page
    @products = Product.limit(3)
  end

end

