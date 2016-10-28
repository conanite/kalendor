require 'kalendor'

RSpec.describe Kalendor::DateHelper do
  describe :nth_day_of_month do
    include Kalendor::DateHelper

    it "should return the index of this week-day in the month" do
      expect(nth_day_of_month Date.new(2014, 1,  1)).to eq 1 # this is the first wednesday of the month
      expect(nth_day_of_month Date.new(2014, 1,  2)).to eq 1
      expect(nth_day_of_month Date.new(2014, 1,  3)).to eq 1
      expect(nth_day_of_month Date.new(2014, 1,  4)).to eq 1
      expect(nth_day_of_month Date.new(2014, 1,  5)).to eq 1
      expect(nth_day_of_month Date.new(2014, 1,  6)).to eq 1
      expect(nth_day_of_month Date.new(2014, 1,  7)).to eq 1
      expect(nth_day_of_month Date.new(2014, 1,  8)).to eq 2 # this is the second wednesday of the month
      expect(nth_day_of_month Date.new(2014, 1,  9)).to eq 2
      expect(nth_day_of_month Date.new(2014, 1, 10)).to eq 2
      expect(nth_day_of_month Date.new(2014, 1, 11)).to eq 2
      expect(nth_day_of_month Date.new(2014, 1, 12)).to eq 2
      expect(nth_day_of_month Date.new(2014, 1, 13)).to eq 2
      expect(nth_day_of_month Date.new(2014, 1, 14)).to eq 2
      expect(nth_day_of_month Date.new(2014, 1, 15)).to eq 3
      expect(nth_day_of_month Date.new(2014, 1, 16)).to eq 3
      expect(nth_day_of_month Date.new(2014, 1, 17)).to eq 3
      expect(nth_day_of_month Date.new(2014, 1, 18)).to eq 3
      expect(nth_day_of_month Date.new(2014, 1, 19)).to eq 3
      expect(nth_day_of_month Date.new(2014, 1, 20)).to eq 3
      expect(nth_day_of_month Date.new(2014, 1, 21)).to eq 3
      expect(nth_day_of_month Date.new(2014, 1, 22)).to eq 4
      expect(nth_day_of_month Date.new(2014, 1, 23)).to eq 4
      expect(nth_day_of_month Date.new(2014, 1, 24)).to eq 4
      expect(nth_day_of_month Date.new(2014, 1, 25)).to eq 4
      expect(nth_day_of_month Date.new(2014, 1, 26)).to eq 4
      expect(nth_day_of_month Date.new(2014, 1, 27)).to eq 4
      expect(nth_day_of_month Date.new(2014, 1, 28)).to eq 4
      expect(nth_day_of_month Date.new(2014, 1, 29)).to eq 5 # this is the 5th wednesday of the month
      expect(nth_day_of_month Date.new(2014, 1, 30)).to eq 5
      expect(nth_day_of_month Date.new(2014, 1, 31)).to eq 5

      expect(nth_day_of_month Date.new(2014, 2,  1)).to eq 1 # this is the first saturday of the month
      expect(nth_day_of_month Date.new(2014, 2,  2)).to eq 1
      expect(nth_day_of_month Date.new(2014, 2,  3)).to eq 1
      expect(nth_day_of_month Date.new(2014, 2,  4)).to eq 1
      expect(nth_day_of_month Date.new(2014, 2,  5)).to eq 1
      expect(nth_day_of_month Date.new(2014, 2,  6)).to eq 1
      expect(nth_day_of_month Date.new(2014, 2,  7)).to eq 1
      expect(nth_day_of_month Date.new(2014, 2,  8)).to eq 2 # this is the second saturday of the month
      expect(nth_day_of_month Date.new(2014, 2,  9)).to eq 2
      expect(nth_day_of_month Date.new(2014, 2, 10)).to eq 2
      expect(nth_day_of_month Date.new(2014, 2, 11)).to eq 2
      expect(nth_day_of_month Date.new(2014, 2, 12)).to eq 2
      expect(nth_day_of_month Date.new(2014, 2, 13)).to eq 2
      expect(nth_day_of_month Date.new(2014, 2, 14)).to eq 2
      expect(nth_day_of_month Date.new(2014, 2, 15)).to eq 3
      expect(nth_day_of_month Date.new(2014, 2, 16)).to eq 3
      expect(nth_day_of_month Date.new(2014, 2, 17)).to eq 3
      expect(nth_day_of_month Date.new(2014, 2, 18)).to eq 3
      expect(nth_day_of_month Date.new(2014, 2, 19)).to eq 3
      expect(nth_day_of_month Date.new(2014, 2, 20)).to eq 3
      expect(nth_day_of_month Date.new(2014, 2, 21)).to eq 3
      expect(nth_day_of_month Date.new(2014, 2, 22)).to eq 4
      expect(nth_day_of_month Date.new(2014, 2, 23)).to eq 4
      expect(nth_day_of_month Date.new(2014, 2, 24)).to eq 4
      expect(nth_day_of_month Date.new(2014, 2, 25)).to eq 4
      expect(nth_day_of_month Date.new(2014, 2, 26)).to eq 4
      expect(nth_day_of_month Date.new(2014, 2, 27)).to eq 4
      expect(nth_day_of_month Date.new(2014, 2, 28)).to eq 4 # this is the fourth friday of the month

      expect(nth_day_of_month Date.new(2014, 3,  1)).to eq 1
      expect(nth_day_of_month Date.new(2014, 3,  2)).to eq 1
      expect(nth_day_of_month Date.new(2014, 3,  3)).to eq 1
      expect(nth_day_of_month Date.new(2014, 3,  4)).to eq 1
      expect(nth_day_of_month Date.new(2014, 3,  5)).to eq 1
      expect(nth_day_of_month Date.new(2014, 3,  6)).to eq 1
      expect(nth_day_of_month Date.new(2014, 3,  7)).to eq 1
      expect(nth_day_of_month Date.new(2014, 3,  8)).to eq 2
      expect(nth_day_of_month Date.new(2014, 3,  9)).to eq 2
      expect(nth_day_of_month Date.new(2014, 3, 10)).to eq 2
      expect(nth_day_of_month Date.new(2014, 3, 11)).to eq 2
      expect(nth_day_of_month Date.new(2014, 3, 12)).to eq 2
      expect(nth_day_of_month Date.new(2014, 3, 13)).to eq 2
      expect(nth_day_of_month Date.new(2014, 3, 14)).to eq 2
      expect(nth_day_of_month Date.new(2014, 3, 15)).to eq 3
      expect(nth_day_of_month Date.new(2014, 3, 16)).to eq 3
      expect(nth_day_of_month Date.new(2014, 3, 17)).to eq 3
      expect(nth_day_of_month Date.new(2014, 3, 18)).to eq 3
      expect(nth_day_of_month Date.new(2014, 3, 19)).to eq 3
      expect(nth_day_of_month Date.new(2014, 3, 20)).to eq 3
      expect(nth_day_of_month Date.new(2014, 3, 21)).to eq 3
      expect(nth_day_of_month Date.new(2014, 3, 22)).to eq 4
      expect(nth_day_of_month Date.new(2014, 3, 23)).to eq 4
      expect(nth_day_of_month Date.new(2014, 3, 24)).to eq 4
      expect(nth_day_of_month Date.new(2014, 3, 25)).to eq 4
      expect(nth_day_of_month Date.new(2014, 3, 26)).to eq 4
      expect(nth_day_of_month Date.new(2014, 3, 27)).to eq 4
      expect(nth_day_of_month Date.new(2014, 3, 28)).to eq 4
      expect(nth_day_of_month Date.new(2014, 3, 29)).to eq 5
      expect(nth_day_of_month Date.new(2014, 3, 30)).to eq 5
      expect(nth_day_of_month Date.new(2014, 3, 31)).to eq 5
    end
  end

  describe :nth_last_day_of_month do
    include Kalendor::DateHelper

    it "should return the index of this week-day in the month" do
      expect(nth_last_day_of_month Date.new(2014, 1,  1)).to eq(-5) # this is the fifth last wednesday of the month
      expect(nth_last_day_of_month Date.new(2014, 1,  2)).to eq(-5)
      expect(nth_last_day_of_month Date.new(2014, 1,  3)).to eq(-5)
      expect(nth_last_day_of_month Date.new(2014, 1,  4)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 1,  5)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 1,  6)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 1,  7)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 1,  8)).to eq(-4) # this is the fourth last wednesday of the month
      expect(nth_last_day_of_month Date.new(2014, 1,  9)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 1, 10)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 1, 11)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 1, 12)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 1, 13)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 1, 14)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 1, 15)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 1, 16)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 1, 17)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 1, 18)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 1, 19)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 1, 20)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 1, 21)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 1, 22)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 1, 23)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 1, 24)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 1, 25)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 1, 26)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 1, 27)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 1, 28)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 1, 29)).to eq(-1) # this is the last wednesday of the month
      expect(nth_last_day_of_month Date.new(2014, 1, 30)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 1, 31)).to eq(-1)

      expect(nth_last_day_of_month Date.new(2014, 2,  1)).to eq(-4) # this is the fourth last saturday of the month
      expect(nth_last_day_of_month Date.new(2014, 2,  2)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 2,  3)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 2,  4)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 2,  5)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 2,  6)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 2,  7)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 2,  8)).to eq(-3) # this is the third last saturday of the month
      expect(nth_last_day_of_month Date.new(2014, 2,  9)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 2, 10)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 2, 11)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 2, 12)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 2, 13)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 2, 14)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 2, 15)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 2, 16)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 2, 17)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 2, 18)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 2, 19)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 2, 20)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 2, 21)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 2, 22)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 2, 23)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 2, 24)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 2, 25)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 2, 26)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 2, 27)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 2, 28)).to eq(-1) # this is the last friday of the month

      expect(nth_last_day_of_month Date.new(2014, 3,  1)).to eq(-5)
      expect(nth_last_day_of_month Date.new(2014, 3,  2)).to eq(-5)
      expect(nth_last_day_of_month Date.new(2014, 3,  3)).to eq(-5)
      expect(nth_last_day_of_month Date.new(2014, 3,  4)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 3,  5)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 3,  6)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 3,  7)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 3,  8)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 3,  9)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 3, 10)).to eq(-4)
      expect(nth_last_day_of_month Date.new(2014, 3, 11)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 3, 12)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 3, 13)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 3, 14)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 3, 15)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 3, 16)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 3, 17)).to eq(-3)
      expect(nth_last_day_of_month Date.new(2014, 3, 18)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 3, 19)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 3, 20)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 3, 21)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 3, 22)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 3, 23)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 3, 24)).to eq(-2)
      expect(nth_last_day_of_month Date.new(2014, 3, 25)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 3, 26)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 3, 27)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 3, 28)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 3, 29)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 3, 30)).to eq(-1)
      expect(nth_last_day_of_month Date.new(2014, 3, 31)).to eq(-1)
    end
  end

  describe :nth_day_of_month? do
    include Kalendor::DateHelper

    it "returns true when the date is the given nth weekday of the month" do
      d = Date.new(2014, 3,  1)
      expect(nth_day_of_month?(d,  1)).to eq true
      expect(nth_day_of_month?(d,  2)).to eq false
      expect(nth_day_of_month?(d,  3)).to eq false
      expect(nth_day_of_month?(d,  4)).to eq false
      expect(nth_day_of_month?(d,  5)).to eq false
      expect(nth_day_of_month?(d, -5)).to eq true
      expect(nth_day_of_month?(d, -4)).to eq false
      expect(nth_day_of_month?(d, -3)).to eq false
      expect(nth_day_of_month?(d, -2)).to eq false
      expect(nth_day_of_month?(d, -1)).to eq false

      d = Date.new(2014, 3,  15)
      expect(nth_day_of_month?(d,  1)).to eq false
      expect(nth_day_of_month?(d,  2)).to eq false
      expect(nth_day_of_month?(d,  3)).to eq true
      expect(nth_day_of_month?(d,  4)).to eq false
      expect(nth_day_of_month?(d,  5)).to eq false
      expect(nth_day_of_month?(d, -5)).to eq false
      expect(nth_day_of_month?(d, -4)).to eq false
      expect(nth_day_of_month?(d, -3)).to eq true
      expect(nth_day_of_month?(d, -2)).to eq false
      expect(nth_day_of_month?(d, -1)).to eq false

      d = Date.new(2014, 3,  31)
      expect(nth_day_of_month?(d,  1)).to eq false
      expect(nth_day_of_month?(d,  2)).to eq false
      expect(nth_day_of_month?(d,  3)).to eq false
      expect(nth_day_of_month?(d,  4)).to eq false
      expect(nth_day_of_month?(d,  5)).to eq true
      expect(nth_day_of_month?(d, -5)).to eq false
      expect(nth_day_of_month?(d, -4)).to eq false
      expect(nth_day_of_month?(d, -3)).to eq false
      expect(nth_day_of_month?(d, -2)).to eq false
      expect(nth_day_of_month?(d, -1)).to eq true

      expect { nth_day_of_month?(d, 0) }.to raise_error(ArgumentError)
    end
  end
end
