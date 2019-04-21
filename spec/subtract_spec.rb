require 'kalendor'
require 'kalendor/instance/intersect'
require 'kalendor/instance/interval'
require 'kalendor/instance/annual'
require 'kalendor/instance/subtract'
require 'kalendor/instance/union'
require 'kalendor/instance/weekday'

RSpec.describe Kalendor::Subtract do
  it "produces every weekend in summer 2016" do
    summer_workdays = Kalendor.build {
      subtract(interval("2016-06-01", "2016-08-31"),
               union(union(weekday(6),
                           weekday(0)),
                     annual(14, 7),
                     interval("2016-08-12", "2016-08-28")))
    }

    workdays_in_jun_2016    = [1,2,3,6,7,8,9,10,13,14,15,16,17,20,21,22,23,24,27,28,29,30].map { |d| date("2016-06-#{d}") }
    workdays_in_jul_2016    = [1,4,5,6,7,8,11,12,13,15,18,19,20,21,22,25,26,27,28,29     ].map { |d| date("2016-07-#{d}") } # skip 14th
    workdays_in_aug_2016    = [1,2,3,4,5,8,9,10,11,29,30,31                              ].map { |d| date("2016-08-#{d}") } # skip 12-28
    workdays_in_summer_2016 = workdays_in_jun_2016 + workdays_in_jul_2016 + workdays_in_aug_2016

    expect(summer_workdays.get_dates(date("1999-01-01"), date("2020-12-31")).to_a).to eq workdays_in_summer_2016
  end

  it "ignores nil exclude_dates" do
    all_summer_long = Kalendor.build { subtract(interval("2016-06-01", "2016-08-31"), nil) }

    days_in_jun_2016    = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30   ].map { |d| date("2016-06-#{d}") }
    days_in_jul_2016    = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31].map { |d| date("2016-07-#{d}") }
    days_in_aug_2016    = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31].map { |d| date("2016-08-#{d}") }
    days_in_summer_2016 = days_in_jun_2016 + days_in_jul_2016 + days_in_aug_2016

    expect(all_summer_long.get_dates(date("1999-01-01"), date("2020-12-31")).to_a).to eq days_in_summer_2016
  end

  it "ignores nil include_dates" do
    no_weekends = Kalendor.build { subtract(nil, union(weekday(6), weekday(0))) }

    weekdays_in_jun_2016    = [1,2,3,    6,7,8,9,10,      13,14,15,16,17,      20,21,22,23,24,      27,28,29,30   ].map { |d| date("2016-06-#{d}") }
    weekdays_in_jul_2016    = [1,    4,5,6,7,8,     11,12,13,14,15,      18,19,20,21,22,      25,26,27,28,29      ].map { |d| date("2016-07-#{d}") }
    weekdays_in_aug_2016    = [1,2,3,4,5,    8,9,10,11,12,      15,16,17,18,19,      22,23,24,25,26,      29,30,31].map { |d| date("2016-08-#{d}") }
    weekdays_in_summer_2016 = weekdays_in_jun_2016 + weekdays_in_jul_2016 + weekdays_in_aug_2016

    expect(no_weekends.get_dates(date("2016-06-01"), date("2016-08-31")).to_a).to eq weekdays_in_summer_2016
  end
end
