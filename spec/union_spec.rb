require 'kalendor'
require 'kalendor/instance/annual'
require 'kalendor/instance/union'
require 'kalendor/instance/weekday'

RSpec.describe Kalendor::Union do
  it "produces every weekend in oct - dec 2016" do
    weekends = Kalendor.build { union weekday(6), weekday(7) }

    weekends_in_oct_2016 = [1,2,8,9,15,16,22,23,29,30].map { |d| date("2016-10-#{d}") }
    weekends_in_nov_2016 = [5,6,12,13,19,20,26,27    ].map { |d| date("2016-11-#{d}") }
    weekends_in_dec_2016 = [3,4,10,11,17,18,24,25,31 ].map { |d| date("2016-12-#{d}") }
    weekends_in_end_2016 = weekends_in_oct_2016 + weekends_in_nov_2016 + weekends_in_dec_2016

    expect(weekends.get_dates date("2016-10-01"), date("2016-12-31")).to eq weekends_in_end_2016
  end

  it "produces birthdays and 5th wednesdays" do
    mix = Kalendor.build { union weekday(3, 5), annual(12,3), annual(21,6), annual(8,6) }

    w5 = %w{ 2015-04-29 2015-07-29 2015-09-30 2015-12-30 2016-03-30 2016-06-29 2016-08-31 2016-11-30  }
    bd = %w{ 2015-03-12 2015-06-08 2015-06-21 2016-03-12 2016-06-08 2016-06-21 }
    expected = (w5 + bd).map { |d| date d }.sort

    expect(mix.get_dates date("2015-01-01"), date("2016-12-31")).to eq expected
  end
end
