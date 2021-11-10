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
    plant_names = []
    plant_details = []

    plants_urls.each do |plant_url|
      url = "http://www.tropicopia.com/house-plant#{plant_url.gsub("..", "")}"
      doc = Nokogiri::HTML(URI.open(url))

      plant_names << doc.css('.title16')
      plant_details << doc.css("table[id~='Field list']")
    #   .match(/.*?\A[^-]*\b/) this grabs the latin name of the plant
    end
    create_plants(plant_names, plant_details)
  end


  def create_plants(plant_names, plant_details)
   
    plant_names.each do |plant|
      plant_array = plant.text.split(" ")
      latin_name = plant_array.slice(1,2).join(" ")
      common_names= plant_array.slice(4...).join(" ")
    end

    plant_details.each do |plant|

      plant_info_array= plant.css(".ar12D").text.split(" ")
      origin = [plant_info_array[plant_info_array.find_index("Origin") + 2]] 
          
      if plant_info_array[plant_info_array.find_index("Origin") + 3] != "Climat"
        origin << plant_info_array.slice(plant_info_array.find_index("Origin") + 3, 5).join(" ").match(/.+?(?=Climat)/)
      end 
      origin.join(" ")
    end

  end


end


scrape= Scraper.new
scrape.scrape_plants_index