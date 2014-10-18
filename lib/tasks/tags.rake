namespace :tags do
  desc 'Pupulate dummy tags'
  task :populate => :environment do
    tags = %w(Fruits Vegetables Legumes Salads Eggs Meats Poultry Seafoods Grains Flour Rice Pasta Breads Bagels Rolls Crackers Cookies Cheese Cream Ice Cream Yogurts Fats Condiments Sauces Dressings Soup Tofu Snacks Candy Chocolate Cakes Muffins Baking Sugar Honey Syrups Toppings Desserts Pastries Fast-Foods)
    tags.each {|t| Tag.create(:name => t)}
  end
end
