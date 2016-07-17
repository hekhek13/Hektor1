require 'rails_helper'

describe Product do
  context "when the product has comments" do
end

before do
  @product = Product.create!(name: "race bike")
end

before do
  @user = User.create!(email: "pancho100@test.com", password: "pancho")
end

before do
  @product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
  @product.comments.create!(rating: 3, user: @user, body: "Cool Bike")
  @product.comments.create!(rating: 5, user: @user, body: "Love this Bike")
end

it "returns the average rating of all comments" do
  expect(@product.comments.average(:rating)).to eq 3
end

context "Is not Valid" do
end

before do
  Product.new(description: "Nice bike")
end

it "product is invalid" do
  expect(Product.new(description: "Nice bike")).not_to be_valid
end

end
