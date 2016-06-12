class StaticPagesController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
  end

  def landing_page
    @featured_product = Product.first
  end

end

