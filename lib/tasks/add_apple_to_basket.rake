namespace :db do
  desc "Adding Apples to Basket"
  task :add_apple_to_basket, [:variety, :count] => :environment do |t, args|
    puts "===== args[:variety] : #{args[:variety]}  args[:count] : #{args[:count]}======"

    baskets_with_varients = Basket.joins(:apples).where("apples.variety" => args[:variety]).group("apples.id")
    
    if !baskets_with_varients.blank?
      id_s = baskets_with_varients.pluck(:id).uniq
      baskets_without_varients = Basket.where.not(id: id_s)
    else
      baskets_without_varients = Basket.all
    end

    @number_of_apples_tobe_created = args[:count].to_i

    baskets_with_varients.each do | basket |
      if @number_of_apples_tobe_created > 0

        basket_variety_apples = basket.apples.where("apples.variety" => args[:variety])
        
        if !basket_variety_apples.blank?
          if basket_variety_apples.count < basket.capacity

            basket_remaining_capacity = basket.capacity - basket_variety_apples.count

            basket_remaining_capacity.times do ||
              apple = Apple.create(name: "apples", variety: args[:variety], basket_id: basket.id)
            end
    
            @number_of_apples_tobe_created = @number_of_apples_tobe_created - basket_remaining_capacity
            
          end

        else
          puts "No baskets with varient"
        end
      end
    end

    if @number_of_apples_tobe_created > 0

      baskets_without_varients.each do | basket |
          if @number_of_apples_tobe_created > 0
            basket.capacity.times do ||
              apple = Apple.create(name: "apples", variety: args[:variety], basket_id: basket.id)
            end
            @number_of_apples_tobe_created = @number_of_apples_tobe_created - basket.capacity
          end
        end
    end

    if @number_of_apples_tobe_created > 0
      puts "All baskets are full. We couldn't find the place for #{@number_of_apples_tobe_created} apples"
    end

    #baskets = Basket.left_outer_joins(:apples)
    #            .uniq
    #            .select("baskets.*, COUNT(apples.*) as apples_count")
    #            .group("baskets.id")

  end
end