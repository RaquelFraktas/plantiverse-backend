Plant.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('plants')

scrape= Scraper.new
plants = scrape.scrape_plants_index
Plant.create_from_collection(plants)

puts "successfully seeded"