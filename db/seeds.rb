print "Deleting existing Tags and Choices..."
Tag.delete_all
Choice.delete_all
Tagging.delete_all
puts "Done."

print "Creating Tags..."
common_tag_names = %w(
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
  fats
  condiments
  sauces
  dressings
  soup
  tofu
  snacks
  candy
  chocolate
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
)
common_tag_names.each {|tag_name| Tag.create(:name => tag_name)}
puts "Done."

print "Creating Choices..."
common_choices = { "fried chicken" => %w[poultry fast-foods fried honey],
                   "chicken parmesan" => %w[poultry fried italian cheese],
                   "chicken marsala" => %w[poultry grilled flour italian],
                   "meatloaf" => %w[meats baked dressings pork smoked],
                   "spaghetti and meatballs" => %w[italian pasta meats cheese],
                   "hot dog" => %w[american fast-foods breads snacks grilled steamed sausage],
                   "hamburger" => %w[fast-foods meats grilled snacks breads toppings cheese],
                   "bbq ribs" => %w[meats pork grilled baked toppings],
                   "roast beef" => %w[meats roasted breads],
                   "roasted chicken" => %w[poultry roasted snacks grilled toppings],
                   "chicken wings" => %w[fast-foods poultry fried snacks toppings],
                   "buffalo wings" => %w[fast-foods poultry fried snacks toppings],
                   "tacos" => %w[mexican fast-foods meats poultry pork salad],
                   "quesadillas" => %w[mexican fast-foods cheese grilled],
                   "burrito" => %w[mexican fast-foods cheese rice grains],
                   "pizza" => %w[italian fast-foods cheese baked dressings],
                   "lasagna" => %w[italian cheese meats poultry baked],
                   "seafood" => %w[seafood condiments snacks crackers],
                   "lime pie" => %w[pastries candy snacks desserts],
                   "ice cream" => %w[candy pastries snacks desserts ice],
                   "cobb salad" => %w[vegetables salads toppings],
                   "twinkies" => %w[desserts candy snacks],
                   "jerky" => %w[fast-foods meats snacks roasted smoked],
                   "fajitas" => %w[mexican poultry meats vegetables salads fast-foods],
                   "banana split" => %w[desserts candy snacks ice],
                   "raisins and peanuts" => %w[snacks candy],
                   "chicken fried steak" => %w[poultry fast-foods snacks fried],
                   "sushi" => %w[asian seafood snacks fast-foods],
                   "mac and cheese" => %w[italian american pasta cheese],
                   "sandwich" => %w[fast-foods breads meats poultry smoked snacks grilled roasted],
                   "chocolate-chip cookies" => %w[candy desserts snacks],
                   "nachos" => %w[snacks cheese mexican],
                   "philly cheese steak" => %w[cheese meats american breads],
                   "cheeseburger" => %w[cheese meats american breads],
                   "caesar salad" => %w[salads vegetables breads light],
                   "greek salad" => %w[salads vegetables breads light],
                   "potato salad" => %w[salads vegetables breads light],
                   "fruit salad" => %w[salads vegetables breads light fruits],
                   "tuna salad" => %w[salads vegetables breads light seafood],
                   "garden salad" => %w[grains vegetables salads light],
                   "cobb salad" => %w[grains vegetables salads light],
                   "milkshake" => %w[desserts candy ice] }


common_choices.each do |name, tag_names|
  choice = Choice.create!(name: name)

  tags = Tag.where(name: tag_names)

  choice.tags << tags

end
puts "Done."
