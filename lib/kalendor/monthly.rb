module Kalendor
  module Monthly
    include Instance
    def advance_to_next_month date, monthly_date
      m = date.month

      #  j  f  m  a  m  j  j  a  s  o  n  d
      # 31 28 31 30 31 30 31 31 30 31 30 31
      # safe months are months (except december) followed by a 31-day month, we just increment the month
      return Date.new(date.year, m + 1, date.day) if [2,4,6,7,9,11].include?(m)

      # december is safe, we increment the year and set month to january
      return Date.new(date.year + 1, 1, date.day) if m == 12


      # m must be in [1,3,5,8,10], ie must be a 31-day month preceding a non-31-day month
      # not sure if following month contains the required date

      begin
        Date.new(date.year, date.month + 1, monthly_date) # try advance one month
      rescue
        Date.new(date.year, date.month + 2, monthly_date) # otherwise advance two months
      end
    end

    def get_dates from, upto
      first = Date.new(from.year, from.month, monthly_date)
      first = advance_to_next_month(first, monthly_date) if first < from
      result = []
      while first && (first <= upto)
        result << first
        first = advance_to_next_month(first, monthly_date)
      end
      result
    end
  end
end
