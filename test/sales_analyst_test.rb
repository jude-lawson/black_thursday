require_relative 'test_helper'
require_relative '../lib/sales_analyst'
require_relative '../lib/sales_engine'

# Test for the SalesAnalyst class
class SalesAnalystTest < Minitest::Test
  def setup
    sales_engine = SalesEngine.from_csv(
      items: './test/fixtures/test_items1.csv',
      merchants: './test/fixtures/test_merchants1.csv'
    )
    @sales_analyst = SalesAnalyst.new(sales_engine)
  end

  def test_sales_analyst_exists
    assert_instance_of SalesAnalyst, @sales_analyst
  end

  def test_average_items_per_merchant
    assert_equal 2.00, @sales_analyst.average_items_per_merchant
    assert_instance_of Float, @sales_analyst.average_items_per_merchant
  end

  def test_average_items_per_merchant_std_dev
    @sales_analyst.average_items_per_merchant_standard_deviation
    assert_equal 1.00, @sales_analyst.average_items_per_merchant_standard_deviation
    assert_instance_of Float, @sales_analyst.average_items_per_merchant_standard_deviation
  end

  def tests_items_per_merchant
    expected = {12334185 => 3, 12334213 => 2, 12334315 => 1}
    assert_equal expected, @sales_analyst.items_per_merchant
  end
end
