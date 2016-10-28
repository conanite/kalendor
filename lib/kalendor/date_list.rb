require 'aduki'
require 'kalendor'

module Kalendor
  module DateList
    include DateHelper, Instance
    def get_dates from, upto ; self.dates.select { |d| d >= from && d <= upto } ; end
  end
end
