require 'kalendor/month'

module Kalendor
  module Instance
    class Month < Kalendor::Instance::Base
      include Kalendor::Month
      attr_accessor :month
    end
  end
end
