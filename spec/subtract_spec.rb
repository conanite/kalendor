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
end
