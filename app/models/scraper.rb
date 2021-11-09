class Scraper

  def scrape_plants_index

    plant_index_url= "http://www.tropicopia.com/house-plant/list/gallery-01.html"
    doc= Nokogiri::HTML(URI.open(plant_index_url))   
    plants_container = doc.css("table[id~='Results 2']")
    plant_records = plants_container.css('#record')
    plants = plant_records.css('a')

    plants_urls= []

    plants.each do |plant|
      url = plant.attribute('href').value
      plants_urls << url
    end

    scrape_plant_pages(plants_urls)

  end

  def scrape_plant_pages(plants_urls)
    plants_list = []

    plants_urls.each do |plant_url|
      url = "http://www.tropicopia.com/house-plant#{plant_url.gsub("..", "")}"
      doc = Nokogiri::HTML(URI.open(url))

      plants_list << doc.css('.title16')
    #   .match(/.*?\A[^-]*\b/) this grabs the latin name of the plant

    end
    
   byebug

  end

  

end


scrape= Scraper.new
scrape.scrape_plants_index