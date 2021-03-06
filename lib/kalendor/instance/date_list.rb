require 'kalendor/date_list'

module Kalendor
  module Instance
    class DateList < Kalendor::Instance::Base
      include Kalendor::DateList
      attr_accessor :dates
      def aduki_after_initialize ; self.dates = array_wrap(dates || []).map { |d| to_date d }.compact ; end
    end
  end
end
