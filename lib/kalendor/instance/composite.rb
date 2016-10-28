require 'aduki'
require 'kalendor'

class Kalendor::Instance::Composite
  include Aduki::Initializer
  attr_accessor :schedules
end
