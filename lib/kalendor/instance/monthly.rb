require 'kalendor/monthly'

module Kalendor
  module Instance
    class Monthly < Kalendor::Instance::Base
      include Kalendor::Monthly
      attr_accessor :monthly_date
    end
  end
end
