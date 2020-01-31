require 'kalendor'
require 'kalendor/weekday'

module Kalendor::Instance
  class Weekday < Kalendor::Instance::Base
    include Kalendor::Weekday
    attr_accessor :weekday, :nth_of_month
  end
end
