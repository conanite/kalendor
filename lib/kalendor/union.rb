module Kalendor
  module Union
    include DateHelper, Instance
    def get_dates from, upto ; schedules.map { |s| date_set(s, from, upto) }.reduce(&:+).sort ; end
  end
end
