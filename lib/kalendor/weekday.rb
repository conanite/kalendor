require 'kalendor'

module Kalendor
  module Weekday
    include DateHelper, Instance

    def get_dates from, upto
      first = beginning_of_week(from) + weekday - 1
      first = first + 7 if first < from
      result = []
      while first && (first <= upto)
        while nth_of_month && !nth_day_of_month?(first, nth_of_month)
          first = first + 7
        end
        result << first if first <= upto
        first = first + 7
      end
      result
    end
  end
end
