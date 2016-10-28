require 'kalendor/subtract'

module Kalendor
  module Instance
    class Subtract
      include Aduki::Initializer, Kalendor::Subtract
      attr_accessor :include_dates, :exclude_dates
    end
  end
end
