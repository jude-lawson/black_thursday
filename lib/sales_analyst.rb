require_relative '../lib/sales_engine'
# Sales Analyst class for analyzing data
class SalesAnalyst
  attr_reader :engine
  def initialize(engine)
    @engine = engine
  end
end
