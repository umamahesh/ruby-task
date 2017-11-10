class Basket < ApplicationRecord
	has_many :apples

	#baskets each having a capacity between 2 and 27
	#Considering few baskets have max capacity of 2 and few have max capacity of 27
end
