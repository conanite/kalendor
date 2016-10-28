require 'kalendor'
require 'kalendor/instance/intersect'
require 'kalendor/instance/month'
require 'kalendor/instance/weekday'

RSpec.describe Kalendor::Month do
  let(:november) { Kalendor.build { month 11 } }

  it "generates nothing when entirely before" do
    f = date("2000-01-01")
    u = date("2000-10-31")
    expect(november.get_dates(f, u).to_a).to eq []
  end

  it "generates some dates when overlapping before" do
    f = date("2016-10-01")
    u = date("2016-11-10")
    expected = (1..10).map { |d| date("2016-11-#{d}") }
    expect(november.get_dates(f, u).to_a).to eq expected
  end

  it "generates some dates when overlapping inside" do
    f = date("2016-11-13")
    u = date("2016-11-18")
    expected = (13..18).map { |d| date("2016-11-#{d}") }
    expect(november.get_dates(f, u).to_a).to eq expected
  end

  it "generates all dates when overlapping outside" do
    f = date("2016-10-01")
    u = date("2016-12-31")
    expected = (1..30).map { |d| date("2016-11-#{d}") }
    expect(november.get_dates(f, u).to_a).to eq expected
  end

  it "generates some dates when overlapping after" do
    f = date("2016-11-21")
    u = date("2016-12-31")
    expected = (21..30).map { |d| date("2016-11-#{d}") }
    expect(november.get_dates(f, u).to_a).to eq expected
  end

  it "generates no dates when entirely after" do
    f = date("2016-12-01")
    u = date("2017-10-31")
    expect(november.get_dates(f, u).to_a).to eq []
  end

  it "finds the last monday of november each year" do
    last_mon_nov = Kalendor.build { intersect month(11), weekday(1, -1) }
    f  = date("2000-01-01")
    u  = date("2020-12-31")
    yd = (2000..2020).to_a.zip [27,26,25,24,29,28,27,26,24,30,29,28,26,25,24,30,28,27,26,25,30]
    expected = yd.map { |y,d| date("#{y}-11-#{d}") }
    expect(last_mon_nov.get_dates(f, u).to_a).to eq expected
  end
end
