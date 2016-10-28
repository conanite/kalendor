module Kalendor
  module DateHelper
    MONTH_SIZES = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    def array_wrap thing                ; thing.is_a?(Array) ? thing : [thing]    ; end
    def date_set   schedule, from, upto ; Set.new(schedule.get_dates(from, upto)) ; end

    def to_date d
      if    d.is_a?(Date)           ; d
      elsif d.respond_to?(:to_date) ; d.to_date
      elsif d.is_a?(Array)          ; Date.new(*(d.map(&:to_i)))
      elsif d                       ; Date.parse(d.to_s)
      end
    end

    def build y, m, d
      if m < 1
        build( y - 1, m + 12, d )
      elsif m > 12
        build( y + 1, m - 12, d )
      else
        s = MONTH_SIZES[m]
        if d < 1
          build(y, m - 1, d + s)
        elsif d > s
          build(y, m + 1, d - s)
        else
          ::Date.new(y, m, d)
        end
      end
    end

    def last_day_of_month  m ; MONTH_SIZES[m]                                     ; end
    def year               d ; d.year                                             ; end
    def month              d ; d.month                                            ; end
    def day                d ; d.day                                              ; end
    def week_day           d ; d.wday                                             ; end

    def last_year          d ; build(d.year - 1, d.month, d.day)                  ; end
    def next_year          d ; d.next_year                                        ; end
    def beginning_of_year  d ; build(d.year, 1, 1)                                ; end
    def end_of_year        d ; build(d.year, 12, 31)                              ; end

    def last_month         d ; build(d.year, m - 1, d.day)                        ; end
    def next_month         d ; d.next_month                                       ; end
    def beginning_of_month d ; build(d.year, d.month, 1)                          ; end
    def end_of_month       d ; build(d.year, d.month, last_day_of_month(d.month)) ; end

    def last_week          d ; d - 7                                              ; end
    def next_week          d ; d + 7                                              ; end
    def beginning_of_week  d ; d - ((d.wday - 1) % 7)                             ; end
    def end_of_week        d ; d + ((7 - d.wday) % 7)                             ; end

    def yesterday          d ; d - 1                                              ; end
    def tomorrow           d ; d + 1                                              ; end

    def nth_day_of_month d
      1 + ( (d.mday - 1) / 7 )
    end

    def nth_last_day_of_month d
      last_day = end_of_month(d).mday
      - 1 - (last_day - d.mday) / 7
    end

    #
    # return true if this is the nth of this day within the month,
    # for example, if n is 2, and this is the second wednesday of the month,
    # return true. If n is -1, and this is the last saturday of the month,
    # return true. It doesn't matter which *day* it is, it matters whether
    # it's the first, second, third, etc, or if it's the last, second last,
    # third last, etc
    #
    def nth_day_of_month? d, n
      case n <=> 0
      when -1
        nth_last_day_of_month(d) == n
      when 0
        raise ArgumentError.new("must be non-zero integer")
      when 1
        nth_day_of_month(d) == n
      end
    end
  end
end
