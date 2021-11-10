Plant.destroy_all

scrape= Scraper.new
plants = scrape.scrape_plants_index
Plant.create_from_collection(plants)

puts "successfully seeded"