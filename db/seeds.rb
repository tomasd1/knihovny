# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

case Rails.env
    when 'development'
        City.destroy_all
        District.destroy_all
        Region.destroy_all
        Orp.destroy_all
        Library.destroy_all
end


require 'json'
file = File.read(Rails.root.join('db/seeds/Knihovny.json'))
data = JSON.parse(file)
items = data["features"]

Region.create(nazev_vusc: "Královéhradecký kraj", kod_vusc: "CZ052")

district = []
orp = []
city = []

items.each do |item|
    district << {nazev_okresu: item["properties"]["nazev_okresu"], kod_okresu: item["properties"]["kod_okresu"]}
    city << {nazev_obce: item["properties"]["nazev_obce"], kod_obce: item["properties"]["kod_obce"]}
    orp << {nazev_orp: item["properties"]["nazev_orp"], kod_orp: item["properties"]["kod_orp"]}
end

districts = District.create(district.uniq)
cities = City.create(city.uniq {|c| c[:kod_obce]})
orps = Orp.create(orp.uniq {|c| c[:kod_orp]})

# TODO maybe refactor the double loop or seeding completely

items.each do |item|
    Library.create(
        nazev: item["properties"]["nazev"],
        ico: item["properties"]["ico"].to_i,
        ulice: item["properties"]["ulice"],
        cislo_domovni: item["properties"]["cislo_domovni"].to_i,
        psc: item["properties"]["psc"].to_i,
        x: item["properties"]["x"],
        y: item["properties"]["x"],
        region: Region.find(item["properties"]["kod_vusc"]),
        district: District.find(item["properties"]["kod_okresu"]),
        orp: Orp.find(item["properties"]["kod_orp"]),
        city: City.find(item["properties"]["kod_obce"])
    )
end


