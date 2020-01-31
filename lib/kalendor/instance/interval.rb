require 'kalendor/interval'

module Kalendor
  module Instance
    class Interval < Kalendor::Instance::Base
      include Kalendor::Interval
      attr_accessor :interval_from, :interval_upto
    end
  end
end
