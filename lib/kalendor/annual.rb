module Kalendor
  module Annual
    include Instance
    def get_dates from, upto
      first = Date.new(from.year, annual_month, annual_date)
      first = Date.new(from.year + 1, annual_month, annual_date) if first < from
      result = []
      while first && (first <= upto)
        result << first
        first = Date.new(first.year + 1, annual_month, annual_date)
      end
      result
    end
  end
end
