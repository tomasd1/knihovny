# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'bigdecimal'
require 'json'

case Rails.env
    when 'development'
        City.destroy_all
        District.destroy_all
        Region.destroy_all
        Orp.destroy_all
        Library.destroy_all
end

file = File.read(Rails.root.join('db/seeds/Knihovny.json'))
data = JSON.parse(file)
items = data["features"]

Region.create(name: "Královéhradecký kraj", code: "CZ052")

district = []
orp = []
city = []

items.each do |item|
    district << {name: item["properties"]["nazev_okresu"], code: item["properties"]["kod_okresu"]}
    city << {name: item["properties"]["nazev_obce"], code: item["properties"]["kod_obce"]}
    orp << {name: item["properties"]["nazev_orp"], code: item["properties"]["kod_orp"]}
end

districts = District.create(district.uniq)
cities = City.create(city.uniq {|c| c[:code]})
orps = Orp.create(orp.uniq {|o| o[:code]})

# TODO maybe refactor the double loop or seeding completely, check uniq performance

items.each do |item|
    Library.create(
        name: item["properties"]["nazev"],
        ico: item["properties"]["ico"].to_i,
        street: item["properties"]["nazev_ulice"],
        premise: item["properties"]["cislo_domovni"].to_i,
        postcode: item["properties"]["psc"].to_i,
        x: BigDecimal(item["properties"]["x"], 7),
        y: BigDecimal(item["properties"]["y"], 7),
        region: Region.find(item["properties"]["kod_vusc"]),
        district: District.find(item["properties"]["kod_okresu"]),
        orp: Orp.find(item["properties"]["kod_orp"].to_i), # int
        city: City.find(item["properties"]["kod_obce"].to_i) # int
    )
end
