class PlantsController < ApplicationController

  def index
    plants = Plant.all
    render json: plants
  end
  
  # def scrape
  #   url= 'https://www.houseplant411.com/houseplant'
  #   response= PlantsSpider.process(url)
  #   if response[:status] == :completed && response[:error].nil?
  #       #mb dont need if statements?
  #     flash.now[:notice] = "Successfully scraped url"
  #   else
  #     flash.now[:alert] = response[:error]
  #   end
  #   rescue StandardError => e
  #     flash.now[:alert] = "Error: #{e}"
  # end


end
