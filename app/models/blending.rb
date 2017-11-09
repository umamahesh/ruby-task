
module Blending
	extend ActiveSupport::Concern

	included do
		after_save do | record | 
      if self.class == Apple
      	make_juice
      end
		end

		def make_juice
	    puts "Preparing Juice....."
		end

   end
end
