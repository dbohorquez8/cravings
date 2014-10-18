tags = %w(
  Fruits
  Vegetables
  Legumes
  Salads
  Eggs
  Meats
  Poultry
  Seafoods
  Grains
  Flour
  Rice
  Pasta
  Breads
  Bagels
  Rolls
  Crackers
  Cookies
  Cheese
  Cream
  Ice
  Cream
  Yogurts
  Fats
  Condiments
  Sauces
  Dressings
  Soup
  Tofu
  Snacks
  Candy
  Chocolate
  Cakes
  Muffins
  Baking
  Sugar
  Honey
  Syrups
  Toppings
  Desserts
  Pastries
  Fast-Foods
)
tags.each {|tag_name| Tag.create(:name => tag_name)}


