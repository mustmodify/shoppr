require File.dirname(__FILE__) + '/../test_helper'

class ProductTest < Test::Unit::TestCase
  include Shoppr

  context 'when requesting a specific product by id' do
    should 'issue a shoppr request' do
      Shoppr.expects(:search_for).with(:productId => 'invalid').returns(stub(:categories => []))
      Shoppr::Product.find_by_id('invalid')
    end

    should 'handle getting an empty result' do
      result = stub(:categories => [])
      Shoppr.stubs(:search_for).returns(result)
      assert_equal nil, Shoppr::Product.find_by_id('invalid')
    end

    should 'return the product it has found' do
      product = Shoppr::Product.new
      category = stub(:products => [product])
      result = stub(:categories => [category])
      Shoppr.stubs(:search_for).returns(result)
      assert_equal product, Shoppr::Product.find_by_id('tardis')      
    end
  end
end
