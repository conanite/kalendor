module Kalendor
  module Subtract
    include DateHelper, Instance
    def get_dates from, upto ; in_dates(include_dates, from, upto) - ex_dates(exclude_dates, from, upto) ; end

    private

    def in_dates cal, from, upto ; Set.new(cal ? cal.get_dates(from, upto) : (from..upto)) ; end
    def ex_dates cal, from, upto ; Set.new(cal ? cal.get_dates(from, upto) : [])           ; end
  end
end
