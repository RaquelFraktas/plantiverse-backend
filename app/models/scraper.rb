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
    plant_content = []
    # plant_details = []

    plants_urls.each do |plant_url|
      url = "http://www.tropicopia.com/house-plant#{plant_url.gsub("..", "")}"
      doc = Nokogiri::HTML(URI.open(url))

      plant_content << doc.css("#content")

    end
    create_plants(plant_content)
  end


  def create_plants(plant_content)
    plants = []
   
    plant_content.each do |plant|
      plant_names= plant.css('.title16')
      plant_array = plant_names.inner_html.split(" ")

      if plant_array[13] != "-"
        latin_name = plant_array.slice(11,3).join(" ")
      elsif plant_array[12] != "-"
        latin_name = plant_array.slice(11,2).join(" ")
      else
        latin_name= plant_array[11]
      end

      find_common= plant_array.find_index("-")
      common_names_idx = find_common + 1

      common_names = plant_array.slice(common_names_idx...).join(" ").gsub("<!-- Common name : -->", "")
      origin= plant.css('.ar12D')[14].inner_text.split(" ").join(" ")


        plant_info ={
          name: latin_name,
          alt_name: common_names,
          origin: origin,
        }
        plants << plant_info
    end
    plants
  end

  def description_scraper(plant_name)
    url = "https://www.gardenia.net/plant"
  end


end

