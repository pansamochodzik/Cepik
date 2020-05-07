Car.destroy_all

# Car.create!([
#   {name:"bmw",color: "red"},
#   {name:"mercedes",color: "purple"},
#   {name:"opel",color: "yellow"},
#   {name:"fiat",color: "white"},
#   {name:"mazda",color: "blue"},
#   ])
#
# p "Created #{Car.count} cars"


# 30.times do |index|
#   Car.create!(name: "name_#{index}",color: "color_#{index}")
# end
#
# p "Created #{Car.count} cars"


30.times do
  Car.create!(
    name: Faker::Vehicle.manufacture ,
    color: Faker::Vehicle.color
  )
end

p "Created #{Car.count} cars"
