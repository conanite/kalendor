require 'kalendor/month'

module Kalendor
  module Instance
    class Month
      include Aduki::Initializer, Kalendor::Month
      attr_accessor :month
    end
  end
end
