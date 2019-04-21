module Kalendor
  module Interval
    include Instance
    def get_dates from, upto
      Set.new([from, interval_from || from].max..[upto, interval_upto || upto].min)
    end
  end
end
