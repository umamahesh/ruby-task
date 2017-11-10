class Apple < ApplicationRecord
  include Blending

  VARIETY = ["GALA", "FUJI", "CORTLAND"]

  belongs_to :basket

  def fill_rate_calculation
  	  #Todo - fill_rate should be re-calculated as a percentage of the count of the associated records
  	  #       divided by the capacity of the basket.
	end
end
