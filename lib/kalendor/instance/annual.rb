require 'kalendor/annual'

module Kalendor
  module Instance
    class Annual < Kalendor::Instance::Base
      include Kalendor::Annual
      attr_accessor :annual_date, :annual_month
    end
  end
end
