module Kalendor
  class Named
    include Aduki::Initializer
    attr_accessor :name, :label, :kalendor
    def get_dates from, upto ; kalendor.get_dates from, upto ; end
  end
end
