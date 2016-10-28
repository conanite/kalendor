require 'kalendor/interval'

module Kalendor
  module Instance
    class Interval
      include Aduki::Initializer, Kalendor::Interval
      attr_accessor :interval_from, :interval_upto
    end
  end
end
