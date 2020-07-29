class Market
  attr_reader :name,
              :vendors,
              :date

  def initialize(name)
    @name    = name
    @vendors = []
    @date    = DateTime.new
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.select do |vendor|
      vendor.check_stock(item) > 0
    end
  end

  def sorted_item_list
    sorted_items = []
    @vendors.each do |vendor|
      vendor.all_items_in_stock.each do |item|
        sorted_items << item.name
      end
    end
    sorted_items.uniq.sort
  end

  def total_inventory
    result = Hash.new
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        quantity_sum = vendors_that_sell(item).sum do |vendor|
          vendor.inventory[item]
        end
        result[item] = {quantity: quantity_sum, vendors: vendors_that_sell(item)}
      end
    end
    result
  end

  def overstocked_items
    found = total_inventory.select do |item, data|
       data[:quantity] > 50 &&  data[:vendors].count > 1
     end
     found.keys
  end

  def sell(item, quantity)
    found = total_inventory[item]
    # require "pry"; binding.pry
  end
end
