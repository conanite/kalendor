module Kalendor
  module Subtract
    include DateHelper, Instance
    def get_dates from, upto ;  _included_dates(from, upto) - _excluded_dates(from, upto) ; end

    private

    def _excluded_dates from, upto ; Set.new(exclude_dates.get_dates(from, upto)) ; end
    def _included_dates from, upto ; Set.new(include_dates.get_dates(from, upto)) ; end
  end
end
