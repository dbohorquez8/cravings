print "Deleting existing Tags and Choices..."
Tag.delete_all
Choice.delete_all
Tagging.delete_all
puts "Done."

print "Creating Tags..."
common_tag_names = %w(
  fish
  fruits
  vegetables
  legumes
  salads
  eggs
  meats
  poultry
  seafoods
  grains
  flour
  rice
  pasta
  breads
  bagels
  rolls
  crackers
  cookies
  cheese
  cream
  ice
  cream
  yogurts
  condiments
  sauces
  dressings
  soup
  snacks
  candy
  cakes
  muffins
  baked
  fried
  roasted
  grilled
  smoked
  steamed
  sausages
  toppings
  desserts
  pastries
  fast-foods
  honey
  light
  italian
  american
  mexican
  asian
  breakfast
)
common_tag_names.each {|tag_name| Tag.create(:name => tag_name)}
puts "Done."

print "Creating Choices..."
common_choices = {
  # Chicken
  "fried chicken" => %w[poultry fast-foods fried honey],
  "chicken parmesan" => %w[poultry fried italian cheese],
  "chicken wings" => %w[fast-foods poultry fried snacks toppings],
  "buffalo wings" => %w[fast-foods poultry fried snacks toppings],
  "roasted chicken" => %w[poultry roasted snacks grilled toppings],
  "chicken fried steak" => %w[poultry fast-foods snacks fried],

  # Meats
  "meatloaf" => %w[meats baked dressings pork smoked],
  "roast beef" => %w[meats roasted breads],
  "ny strip steak" => %w[meats grilled bbq american],
  "bbq ribs" => %w[meats pork grilled baked toppings],
  "jerky" => %w[fast-foods meats snacks roasted smoked],

  #Fast Food / Mexican
  "hot dog" => %w[american fast-foods breads snacks grilled steamed sausage],
  "hamburger" => %w[fast-foods meats grilled snacks breads toppings cheese],
  "tacos" => %w[mexican fast-foods meats poultry pork salad],
  "quesadillas" => %w[mexican fast-foods cheese grilled],
  "burrito" => %w[mexican fast-foods cheese rice grains],
  "pizza" => %w[italian fast-foods cheese baked dressings],
  "fajitas" => %w[mexican poultry meats vegetables salads fast-foods],
  "philly cheese steak" => %w[cheese meats american breads],
  "cheeseburger" => %w[cheese meats american breads],
  "sandwich" => %w[fast-foods breads meats poultry smoked snacks grilled roasted],

  #Pasta
  "lasagna" => %w[italian cheese meats poultry baked pasta],
  "spaghetti and meatballs" => %w[italian pasta meats cheese dressings],
  "mac and cheese" => %w[italian american pasta dressings cheese],
  "ravioli" => %w[italian pasta cheese dressings meat poultry],
  "fetuccine" => %w[italian pasta cheese dressings],

  # Fish and Seafood
  "seafood" => %w[seafood snacks],
  "salmon" => %w[seafood snacks grilled fish smoked],
  "tuna" => %w[seafood snacks grilled fish smoked],

  # Desserts
  "lime pie" => %w[pastries candy snacks desserts],
  "ice cream" => %w[candy pastries snacks desserts ice],
  "twinkies" => %w[desserts candy snacks],
  "milkshake" => %w[desserts candy ice],
  "banana split" => %w[desserts candy snacks ice],
  "cheesecake" => %w[desserts candy snacks baked flour cheese],

  # Asian
  "sushi" => %w[asian seafood snacks fast-foods vegetables],
  "chow mein" => %w[asian meat poultry pasta dressings vegetables],
  "pad thai" => %w[asian meat poultry pasta dressings vegetables],
  "ramen" => %w[asian meat poultry pasta soup vegetables],
  "fried rice" => %w[asian meat poultry rice vegetables],

  # Quick Snacks
  "raisins and peanuts" => %w[snacks candy],
  "nachos" => %w[snacks cheese mexican],
  "chocolate-chip cookies" => %w[candy desserts snacks],

  # Fruit, Salads and Vegetables
  "cobb salad" => %w[vegetables salads toppings],
  "caesar salad" => %w[salads vegetables breads light],
  "greek salad" => %w[salads vegetables breads light],
  "potato salad" => %w[salads vegetables breads light],
  "fruit salad" => %w[salads vegetables breads light fruits],
  "tuna salad" => %w[salads vegetables breads light seafood],
  "garden salad" => %w[grains vegetables salads light],
  "cobb salad" => %w[grains vegetables salads light],

  # Breakfast
  "pancakes" => %w[breakfast flour honey toppings dressings],
  "french toast" => %w[breakfast breads flour honey toppings dressings],
  "croissant" => %w[breakfast breads flour honey toppings dressings cheese],
  "omelette" => %w[breakfast eggs french toppings],
  "eggs benedict" => %w[breakfast eggs american toppings],
  "breakfast cereal" => %w[breakfast american],
  "oatmeal" => %w[breakfast american],
}


common_choices.each do |name, tag_names|
  choice = Choice.create!(name: name)

  tags = Tag.where(name: tag_names)

  choice.tags << tags

end
puts "Done."

print "Resetting default settings..."
Setting.delete_all
Setting.create name: "max_selections", value: 3, data_type: "to_i"
puts "Done."

