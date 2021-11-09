class PlantsSpider < Kimurai::Base
  @name = 'plants_spider'
  @engine = :mechanize 
  #engine is optional bc default is already mechanize
  @start_urls ||=  ["https://www.houseplant411.com/houseplant"]

#   def self.process(url)
#     @start_urls = [url]
#     self.crawl!
#   end

  def parse(response, url:, data: {})
    byebug
    response.xpath("//div[@id='content-actual']").each do |a|
        request_to :parse_plant_page, url: absolute_url(a[:href], base: url)
      end
  
      if next_page = response.at_xpath("//a[@class='next_page']")
        request_to :parse, url: absolute_url(next_page[:href], base: url)
      end
  end
 
  def parse_plant_page(response, url:, data: {})
    # document = Nokogiri::HTML(response)
    item = {}
    
    item[:name] = response.xpath("//div/[class='resultName']/div/a")&.text&.squish
    item[:img_url] = response.xpath("//div/[class='resultImg']/div/a")&.text&.squish

    if response.xpath("//div/[class='resultAltName']/div/")
      item[:alt_name] = response.xpath("//div/[class='resultAltName']/div/").text&.squish
    end

    parse_description_to_page(response)
    save_to "plants.json", item, format: :pretty_json
  end

  def parse_description_to_page(response)
    new_response= response.xpath("//div/[class='resultAbstr']/div/a").click
    item[:description]= new_response.css('div.boxExcept')&.text&.squish
  end


end

# PlantsSpider.crawl!


#do i need to use sidekiq to perform requests aynschonously for pagination?