#users
users = [
  {:first_name => "Henrique", :last_name => "Boaventura", :email => "hboaventura@gmail.com", :password => "123456"},
  {:first_name => "Carolina", :last_name => "Martins", :email => "carol.almartins@gmail.com", :password => "123456"}
]

users.each do |u|
  User.find_or_create_by_email(u)
end

categories = [
  {:name => "Carne"},
  {:name => "Frango"},
  {:name => "Peixe"},
  {:name => "Carneiro"},
  {:name => "Porco"},
  {:name => "Massa"},
  {:name => "Vegetariano"},
  {:name => "Lanche"},
  {:name => "Sobremesa"},
  {:name => "Pão"},
  {:name => "Bolo"},
]

categories.each do |c|
  Category.find_or_create_by_name(c)
end
