module Kalendor
  module Intersect
    include DateHelper, Instance
    def get_dates from, upto ; schedules.map { |s| date_set(s, from, upto) }.reduce(&:&) ; end
  end
end
