require 'kalendor'
require 'kalendor/instance/annual'
require 'kalendor/instance/union'
require 'kalendor/instance/weekday'

RSpec.describe "#append" do
  it "produces every weekend in oct - dec 2016" do
    sats = Kalendor.build { weekday(6) }
    suns = Kalendor.build { weekday(7) }

    weekends = Kalendor.build { append sats, suns }

    weekends_in_oct_2016 = [1,2,8,9,15,16,22,23,29,30].map { |d| date("2016-10-#{d}") }
    weekends_in_nov_2016 = [5,6,12,13,19,20,26,27    ].map { |d| date("2016-11-#{d}") }
    weekends_in_dec_2016 = [3,4,10,11,17,18,24,25,31 ].map { |d| date("2016-12-#{d}") }
    weekends_in_end_2016 = weekends_in_oct_2016 + weekends_in_nov_2016 + weekends_in_dec_2016

    expect(weekends.get_dates date("2016-10-01"), date("2016-12-31")).to eq weekends_in_end_2016
  end

  it "appends to a union" do
    mix = Kalendor.build { union annual(12,3), annual(21,6), annual(8,6) }

    more = Kalendor.build { append mix, annual(18,11) }

    bd2015 = %w{ 2015-03-12 2015-06-08 2015-06-21 2015-11-18 }
    bd2016 = %w{ 2016-03-12 2016-06-08 2016-06-21 2016-11-18 }
    expected = (bd2015 + bd2016).map { |d| date d }.sort

    expect(more.get_dates date("2015-01-01"), date("2016-12-31")).to eq expected
  end
end
