require 'kalendor'
require 'kalendor/instance/intersect'
require 'kalendor/instance/interval'
require 'kalendor/instance/union'
require 'kalendor/instance/weekday'

RSpec.describe Kalendor::Intersect do
  it "produces every weekend in summer 2016" do
    summer_weekends = Kalendor.build do
      intersect(union(weekday(6), weekday(7)), interval(date("2016-06-01"), date("2016-08-31")))
    end

    weekends_in_jun_2016    = [4,5,11,12,18,19,25,26     ].map { |d| date("2016-06-#{d}") }
    weekends_in_jul_2016    = [2,3,9,10,16,17,23,24,30,31].map { |d| date("2016-07-#{d}") }
    weekends_in_aug_2016    = [6,7,13,14,20,21,27,28     ].map { |d| date("2016-08-#{d}") }
    weekends_in_summer_2016 = weekends_in_jun_2016 + weekends_in_jul_2016 + weekends_in_aug_2016

    expect(summer_weekends.get_dates(date("1999-01-01"), date("2020-12-31")).to_a).to eq weekends_in_summer_2016
  end

  it "ignores nil arguments" do
    summer_weekends = Kalendor.build do
      intersect(nil, union(weekday(6), weekday(7)), nil, nil)
    end

    weekends_in_jul_2016    = [30,31          ].map { |d| date("2016-07-#{d}") }
    weekends_in_aug_2016    = [6,7,13,14,20,21].map { |d| date("2016-08-#{d}") }
    weekends_in_summer_2016 = weekends_in_jul_2016 + weekends_in_aug_2016

    expect(summer_weekends.get_dates(date("2016-07-29"), date("2016-08-26")).to_a).to eq weekends_in_summer_2016
  end
end
