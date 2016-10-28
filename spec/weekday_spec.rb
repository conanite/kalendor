require 'kalendor'
require 'kalendor/instance/weekday'

RSpec.describe Kalendor::Weekday do
  it "produces every tuesday in september 2016" do
    weekly = Kalendor.build { weekday(2) }
    tuesdays_in_sep_2016 = [6,13,20,27].map { |d| date("2016-09-#{d}") }
    expect(weekly.get_dates date("2016-09-01"), date("2016-09-30")).to eq tuesdays_in_sep_2016
  end
  it "produces every monday in october 2016" do
    weekly = Kalendor.build { weekday(1) }
    mondays_in_oct_2016 = [3,10,17,24,31].map { |d| date("2016-10-#{d}") }
    expect(weekly.get_dates date("2016-10-01"), date("2016-10-31")).to eq mondays_in_oct_2016
  end
  it "produces the second wednesday in every month of 2016" do
    weekly = Kalendor.build { weekday(3, 2) }
    second_weds_in_2016 = %w{ 01-13 02-10 03-09 04-13 05-11 06-08 07-13 08-10 09-14 10-12 11-09 12-14 }
    second_weds_in_2016 = second_weds_in_2016.map { |d| date("2016-#{d}") }
    expect(weekly.get_dates date("2016-01-01"), date("2016-12-31")).to eq second_weds_in_2016
  end
  it "produces the 3rd-last thursday in every month of 2015" do
    weekly = Kalendor.build { weekday(4, -3) }
    l3_thu_2015 = %w{ 01-15 02-12 03-12 04-16 05-14 06-11 07-16 08-13 09-10 10-15 11-12 12-17 }
    l3_thu_2015 = l3_thu_2015.map { |d| date("2015-#{d}") }
    expect(weekly.get_dates date("2015-01-01"), date("2015-12-31")).to eq l3_thu_2015
  end
end
