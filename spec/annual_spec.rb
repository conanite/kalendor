require 'kalendor'
require 'kalendor/annual'
require 'kalendor/instance/annual'

RSpec.describe Kalendor::Annual do
  it "generates birthdays over a number of years" do
    a = Kalendor.build { annual 18, 11 }
    birthdays = a.get_dates(date("1960-01-01"), date("1963-12-31"))
    expect(birthdays).to eq [date("1960-11-18"), date("1961-11-18"), date("1962-11-18"), date("1963-11-18"), ]
  end

  it "skips #from year if too late" do
    a = Kalendor.build { annual 18, 11 }
    birthdays = a.get_dates(date("1960-12-01"), date("1963-12-31"))
    expect(birthdays).to eq [date("1961-11-18"), date("1962-11-18"), date("1963-11-18"), ]
  end

  it "skips #upto year if too early" do
    a = Kalendor.build { annual 18, 11 }
    birthdays = a.get_dates(date("1960-12-01"), date("1963-01-01"))
    expect(birthdays).to eq [date("1961-11-18"), date("1962-11-18"), ]
  end

  it "returns nothing if period too small and before date" do
    a = Kalendor.build { annual 18, 11 }
    birthdays = a.get_dates(date("1960-10-01"), date("1960-11-01"))
    expect(birthdays).to eq []
  end

  it "returns nothing if period too small and after date" do
    a = Kalendor.build { annual 18, 11 }
    birthdays = a.get_dates(date("1960-12-01"), date("1960-12-31"))
    expect(birthdays).to eq []
  end
end
