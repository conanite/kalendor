require "aduki"
require "kalendor/date_helper"
require "kalendor/named"
require "kalendor/instance/date_list"
require "kalendor/instance/weekday"
require "kalendor/instance/annual"
require "kalendor/instance/month"
require "kalendor/instance/union"
require "kalendor/instance/intersect"
require "kalendor/instance/subtract"
require "kalendor/instance/interval"

module Kalendor
  class Factory
    include DateHelper

    def named name, label, kal
      Kalendor::Named.new name: name, label: label, kalendor: kal
    end

    def annual date, month
      Kalendor::Instance::Annual.new annual_month: month, annual_date: date
    end

    def union *schedules
      Kalendor::Instance::Union.new schedules: schedules
    end

    def intersect *schedules
      Kalendor::Instance::Intersect.new schedules: schedules
    end

    def subtract x, y
      Kalendor::Instance::Subtract.new include_dates: x, exclude_dates: y
    end

    def list *dates
      Kalendor::Instance::DateList.new dates: dates.map { |d| date d }
    end

    def interval from, upto
      Kalendor::Instance::Interval.new interval_from: date(from), interval_upto: date(upto)
    end

    def weekday weekday, nth_of_month=nil
      Kalendor::Instance::Weekday.new weekday: weekday, nth_of_month: nth_of_month
    end

    def month n
      Kalendor::Instance::Month.new month: n
    end

    alias date to_date
  end

  def self.build &block ; Factory.new.instance_eval &block ; end
end
