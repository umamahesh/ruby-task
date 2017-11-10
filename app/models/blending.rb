
module Blending
	extend ActiveSupport::Concern

	included do
		after_save do | record | 
      if self.class == Apple
      	make_juice
      	fill_rate_calculation
      end
		end

		def make_juice
	      puts "Preparing Juice....."
		end

   end
end
