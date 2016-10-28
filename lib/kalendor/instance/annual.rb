require 'kalendor/annual'

module Kalendor
  module Instance
    class Annual
      include Aduki::Initializer, Kalendor::Annual
      attr_accessor :annual_date, :annual_month
    end
  end
end
