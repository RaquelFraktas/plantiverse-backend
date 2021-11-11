class Scraper

  def scrape_plants_index
    url_index = 0
    plants_urls= []

    9.times do 
      new_index= url_index +=1
      plant_index_url= "http://www.tropicopia.com/house-plant/list/gallery-0#{new_index.to_s}.html"
     
    # plant_index_url= "http://www.tropicopia.com/house-plant/list/gallery-01.html"
      doc= Nokogiri::HTML(URI.open(plant_index_url))   
      plants_container = doc.css("table[id~='Results 2']")
      plant_records = plants_container.css('#record')
      plants = plant_records.css('a')
  
      plants.each do |plant|
        url = plant.attribute('href').value
        plants_urls << url
      end
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
    #   .match(/.*?\A[^-]*\b/) this grabs the latin name of the plant too
    end
    create_plants(plant_names, plant_details)
  end


  def create_plants(plant_names, plant_details)
    plants = []
   
    plant_names.each do |plant|
      plant_array = plant.text.split(" ")
      if plant_array[1] == "plant"
        latin_name = plant_array.slice(2,3).join(" ").gsub("- ", "")
        #don't need the gsub? try to take out the - out of the last name of the last plant
      else
        latin_name = plant_array.slice(1,2).join(" ")
      end

      common_names= plant_array.slice(4...).join(" ").gsub("- ", "")

      plant_details.each do |plant|
        plant_info_ary= plant.css(".ar12D").text.split(" ")
        origin= []
        origin << plant_info_ary[plant_info_ary.find_index("Origin") + 2]
            
        if plant_info_ary[plant_info_ary.find_index("Origin") + 3] != "Climat"
          plant_info_slice = plant_info_ary.slice(plant_info_ary.find_index("Origin") + 3, 5).join(" ").match(/.+?(?= Climat)/)
          origin << plant_info_slice
          #if the origin is longer than 1 word, make sure the next word is not "Climat" to include the whole origin
        end 
        
        origin.join(" ")

        plant_info ={
          name: latin_name,
          alt_name: common_names,
          origin: origin,
        }
        plants << plant_info
# it could be bc im iterating inside of one of the plant instances - why im getting same copies or origin.
# fix the scope
      end
    end
    plants
  end

  def description_scraper(plant_name)
    url = "https://www.gardenia.net/plant"
  end


end

