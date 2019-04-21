require 'kalendor'
require 'kalendor/instance/interval'

RSpec.describe Kalendor::Interval do
  describe "with nil start and finish dates" do
    let(:interval) {
      Kalendor.build { interval nil, nil }
    }

    it "generates all of the given dates" do
      f = date("2000-12-01")
      u = date("2000-12-31")
      expected = (1..31).map { |d| date("2000-12-#{d}") }
      expect(interval.get_dates(f, u).to_a).to eq expected
    end
  end

  describe "with a start and a finish date" do
    let(:interval) {
      Kalendor.build { interval "2016-06-01", "2016-06-30" }
    }

    it "generates nothing when entirely before" do
      f = date("2000-01-01")
      u = date("2000-12-31")
      expect(interval.get_dates(f, u).to_a).to eq []
    end

    it "generates some dates when overlapping before" do
      f = date("2000-01-01")
      u = date("2016-06-08")
      expected = (1..8).map { |d| date("2016-06-0#{d}") }
      expect(interval.get_dates(f, u).to_a).to eq expected
    end

    it "generates some dates when overlapping inside" do
      f = date("2016-06-11")
      u = date("2016-06-21")
      expected = (11..21).map { |d| date("2016-06-#{d}") }
      expect(interval.get_dates(f, u).to_a).to eq expected
    end

    it "generates all dates when overlapping outside" do
      f = date("2016-01-01")
      u = date("2016-12-31")
      expected = (1..30).map { |d| date("2016-06-#{d}") }
      expect(interval.get_dates(f, u).to_a).to eq expected
    end

    it "generates some dates when overlapping after" do
      f = date("2016-06-21")
      u = date("2016-12-31")
      expected = (21..30).map { |d| date("2016-06-#{d}") }
      expect(interval.get_dates(f, u).to_a).to eq expected
    end

    it "generates no dates when entirely after" do
      f = date("2016-07-01")
      u = date("2016-12-31")
      expect(interval.get_dates(f, u).to_a).to eq []
    end
  end
end
