require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'

class VendorTest < Minitest::Test

  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_instance_of Vendor, vendor
  end

  def test_it_has_attributes
    assert_equal "Rocky Mountain Fresh", @vendor.name
    assert_equal ({}), @vendor.inventory
  end

  def test_is_start_with_no_stock
    assert_equal 0, @vendor.check_stock(@item1)
  end

  def test_can_stock_items
    assert_equal 0, @vendor.check_stock(@item1)
    @vendor.stock(@item1, 30)
    assert_equal 30, @vendor.check_stock(@item1)
    @vendor.stock(@item1, 25)
    assert_equal 55, @vendor.check_stock(@item1)
  end

end










# #=> #<Item:0x007f9c565c0ce8...>
# item2.name
# #=> "Tomato"
# item2.price
# #=> 0.5
# #=> #<Vendor:0x00007f85683152f0...>
# vendor.name
# #=> "Rocky Mountain Fresh"
# vendor.inventory
# #=> {}
# vendor.check_stock(item1)
# #=> 0
# vendor.stock(item1, 30)
# vendor.inventory
# #=> {#<Item:0x007f9c56740d48...> => 30}
# vendor.check_stock(item1)
# #=> 30
# vendor.stock(item1, 25)
# vendor.check_stock(item1)
# #=> 55
# vendor.stock(item2, 12)
# vendor.inventory
#=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}
