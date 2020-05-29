# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    @chef1 = Chef.create!(name: "Chef Boyardee")
    @dish1 = @chef1.dishes.create!(name: "Ravioli", description: "Not as good as you remember")

    @ingrdient1 = Ingredient.create!(name: "Beef", calories: 100)
    @ingrdient2 = Ingredient.create!(name: "Cheese", calories: 50)
    @ingrdient3 = Ingredient.create!(name: "Ravioli shells", calories: 150)

    DishIngredient.create!(dish: @dish1, ingredient: @ingrdient1)
    DishIngredient.create!(dish: @dish1, ingredient: @ingrdient2)
    DishIngredient.create!(dish: @dish1, ingredient: @ingrdient3)