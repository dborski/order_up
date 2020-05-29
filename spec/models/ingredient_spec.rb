require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "relationships" do
    it {should have_many :dish_ingredients }
    it {should have_many(:dishes).through(:dish_ingredients) }
  end
  describe "methods" do
    it "total_calories" do
      
    @ingredient1 = Ingredient.create!(name: "Beef", calories: 100)
    @ingredient2 = Ingredient.create!(name: "Cheese", calories: 50)
    @ingredient3 = Ingredient.create!(name: "Ravioli shells", calories: 150)
    @ingredient4 = Ingredient.create!(name: "Ravioli shells", calories: 200)

    ingredients = Ingredient.all

    expect(ingredients.total_calories).to eq(500)
    end
    it "unique_ingredients" do
      
    @ingredient1 = Ingredient.create!(name: "Beef", calories: 100)
    @ingredient2 = Ingredient.create!(name: "Cheese", calories: 50)
    @ingredient3 = Ingredient.create!(name: "Cheese", calories: 50)
    @ingredient4 = Ingredient.create!(name: "Ravioli shells", calories: 150)
    @ingredient5 = Ingredient.create!(name: "Ravioli shells", calories: 200)

    ingredients = Ingredient.all

    expect(ingredients.unique_ingredients).to eq([@ingredient1.name, @ingredient2.name, @ingredient4.name])
    end
  end
end