require File.dirname(__FILE__) + '/../test_helper'

class RequestTest < Test::Unit::TestCase
  include Shoppr

  context 'when issuing a search' do
    should 'use the sandbox if there is no api key' do
      Shoppr.api_key = nil
      assert_equal true, Shoppr.use_sandbox
    end

    should 'use the regular URL if there is an api key' do
      Shoppr.api_key = :some_key
      assert_equal false, Shoppr.use_sandbox
    end

    should 'fake the api key when hitting the sandbox' do
      Shoppr.api_key = nil
      assert_equal 'authorized-key', Shoppr.api_key
    end

    should 'include options as parameters in the request' do
      assert /\?key=value$/ =~  Shoppr.request_uri(:key=>:value).query
    end
  end
end
