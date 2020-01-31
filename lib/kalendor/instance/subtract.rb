require 'kalendor/subtract'

module Kalendor
  module Instance
    class Subtract < Kalendor::Instance::Base
      include Kalendor::Subtract
      attr_accessor :include_dates, :exclude_dates
    end
  end
end
