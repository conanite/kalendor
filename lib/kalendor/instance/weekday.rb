require 'kalendor'
require 'kalendor/weekday'

module Kalendor::Instance
  class Weekday
    include Aduki::Initializer, Kalendor::Weekday
    attr_accessor :weekday, :nth_of_month
  end
end
