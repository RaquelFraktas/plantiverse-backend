class PlantsSpider < Kimurai::Base
  @name = 'plants_spider'
  @engine = :mechanize 
  #engine is optional bc default is already mechanize
#   @start_urls = ["https://www.houseplant411.com/houseplant"]

#   def self.process(url)
#     @start_urls = [url]
#     self.crawl!
#   end

  def parse(response, url:, data: {})
    browser.fill_in "field-keywords", with: "Web Scraping Plants"
    browser.click_on "Next"
    page_nums = response.css('div.pageNumbers a')
  
    # Walk through pagination and collect products urls:
    urls = []
    loop do
      response = browser.current_response
      if page_nums.include?("Next")
        response.each do |a|
          urls << a[:href]
        end
      end

    browser.find(:xpath, "//a[@class='pageNumbers'][contains(value, "Next")]", wait: 1).click rescue break
    # this probably is what clicks the next button
    end

    # Process all collected urls concurrently within 3 threads:
    in_parallel(:parse_plant_page, urls, threads: 3)

    response.xpath("//div[@class='resultsInd']").each do |plant|
      request_to :parse_plant_page, url: absolute_url(plant[:href], base: url)
    end
      #next_page =response.at_xpath("//a[@class='pageNumbers']"[contains(value, "Next")])

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

PlantsSpider.crawl!


#do i need to use sidekiq to perform requests aynschonously for pagination?