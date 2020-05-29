require 'rails_helper'

RSpec.describe 'When a user visits a dish show page', type: :feature do
  before(:each) do
    @chef1 = Chef.create!(name: "Chef Boyardee")
    @dish1 = @chef1.dishes.create!(name: "Ravioli", description: "Not as good as you remember")

    @ingrdient1 = Ingredient.create!(name: "Beef", calories: 100)
    @ingrdient2 = Ingredient.create!(name: "Cheese", calories: 50)
    @ingrdient3 = Ingredient.create!(name: "Ravioli shells", calories: 150)

    DishIngredient.create!(dish: @dish1, ingredient: @ingrdient1)
    DishIngredient.create!(dish: @dish1, ingredient: @ingrdient2)
    DishIngredient.create!(dish: @dish1, ingredient: @ingrdient3)

    visit dish_path(@dish1)
  end
  it 'shows list of ingredients for that dish and the chefs name' do

    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@ingrdient1.name)
    expect(page).to have_content(@ingrdient2.name)
    expect(page).to have_content(@ingrdient3.name)
    expect(page).to have_content(@chef1.name)
  end 
  it 'shows the total calorie count for that dish' do

    expect(page).to have_content(300)
  end
end 

# When I visit a dish's show page
# I see the total calorie count for that dish.