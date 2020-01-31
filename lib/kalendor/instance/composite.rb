require 'aduki'
require 'kalendor'

class Kalendor::Instance::Composite < Kalendor::Instance::Base
  attr_accessor :schedules
end
