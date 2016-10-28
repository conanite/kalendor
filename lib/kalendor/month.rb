module Kalendor
  module Month
    include DateHelper, Instance
    def get_dates from, upto
      first = Date.new(from.year, month, 1)
      last  = end_of_month first
      first = from if first < from && from < last
      first = Date.new(from.year + 1, month, 1) if last < from
      result = []
      while first && (first <= upto)
        result << first
        first += 1
        first = Date.new(first.year + 1, month, 1) if first.month != month
      end
      result
    end
  end
end
