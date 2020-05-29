require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "relationships" do
    it {should have_many :dish_ingredients }
    it {should have_many(:dishes).through(:dish_ingredients) }
  end
  describe "methods" do
    it "total_calories" do
      
    @ingrdient1 = Ingredient.create!(name: "Beef", calories: 100)
    @ingrdient2 = Ingredient.create!(name: "Cheese", calories: 50)
    @ingrdient3 = Ingredient.create!(name: "Ravioli shells", calories: 150)
    @ingrdient3 = Ingredient.create!(name: "Ravioli shells", calories: 200)

    ingredients = Ingredient.all

    expect(ingredients.total_calories).to eq(500)
    end
  end
end