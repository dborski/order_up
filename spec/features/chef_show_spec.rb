require 'rails_helper'

RSpec.describe 'When a user visits a chef show page', type: :feature do
  before(:each) do
    @chef1 = Chef.create!(name: "Chef Boyardee")
    @dish1 = @chef1.dishes.create!(name: "Ravioli", description: "Not as good as you remember")
    @dish2 = @chef1.dishes.create!(name: "Spaghetti-Os", description: "The classic")

    @ingredient1 = Ingredient.create!(name: "Beef", calories: 100)
    @ingredient2 = Ingredient.create!(name: "Cheese", calories: 50)
    @ingredient3 = Ingredient.create!(name: "Ravioli shells", calories: 150)
    @ingredient4 = Ingredient.create!(name: "O-shaped pasta", calories: 100)
    @ingredient5 = Ingredient.create!(name: "Pasta Sauce", calories: 300)

    DishIngredient.create!(dish: @dish1, ingredient: @ingredient1)
    DishIngredient.create!(dish: @dish1, ingredient: @ingredient2)
    DishIngredient.create!(dish: @dish1, ingredient: @ingredient3)
    DishIngredient.create!(dish: @dish2, ingredient: @ingredient2)
    DishIngredient.create!(dish: @dish2, ingredient: @ingredient4)
    DishIngredient.create!(dish: @dish2, ingredient: @ingredient5)

    visit chef_path(@chef1)
  end
  it "shows the name of the chef and a link to all ingredients that the chef uses" do
    
    expect(page).to have_content(@chef1.name) 
    expect(page).to have_link("View all Ingredients") 
  end
  it "After clicking link to visit ingredients, it shows unique list of all ingredients" do
    
    click_link "View all Ingredients"

    expect(current_path).to eq(chef_ingredients_path(@chef1))

    expect(page).to have_content(@ingredient1.name) 
    expect(page).to have_content(@ingredient2.name) 
    expect(page).to have_content(@ingredient3.name) 
    expect(page).to have_content(@ingredient4.name) 
    expect(page).to have_content(@ingredient5.name) 
  end
  it "shows the three most popular ingredients the chef uses" do

    @dish3 = @chef1.dishes.create!(name: "Spaghetti", description: "The classic")

    DishIngredient.create!(dish: @dish3, ingredient: @ingredient2)
    DishIngredient.create!(dish: @dish3, ingredient: @ingredient5)

    
    within("#popular-ingredients") do
      expect(@ingredient1.name).to appear_before(@ingredient4.name)
      expect(@ingredient4.name).to appear_before(@ingredient5.name)
    end
  end
end 

# When I visit a chef's show page
# I see the three most popular ingredients that the chef uses in their dishes
# (Popularity is based off of how many dishes use that ingredient)