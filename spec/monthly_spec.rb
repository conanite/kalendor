require 'kalendor'
require 'kalendor/monthly'
require 'kalendor/instance/monthly'

RSpec.describe Kalendor::Monthly do
  it "generates birthdays over a number of years" do
    a = Kalendor.build { monthly 18 }
    birthdays = a.get_dates(date("1960-01-01"), date("1960-05-31"))
    expect(birthdays).to eq [date("1960-01-18"), date("1960-02-18"), date("1960-03-18"), date("1960-04-18"), date("1960-05-18"), ]
  end

  it "skips months that don't have the date" do
    a = Kalendor.build { monthly 31 }
    birthdays = a.get_dates(date("2020-01-01"), date("2020-08-31"))
    expect(birthdays).to eq [date("2020-01-31"), date("2020-03-31"), date("2020-05-31"), date("2020-07-31"), date("2020-08-31"), ]
  end

  it "jumps to next month if to late for first month" do
    a = Kalendor.build { monthly 18 }
    birthdays = a.get_dates(date("1960-01-20"), date("1960-03-31"))
    expect(birthdays).to eq [date("1960-02-18"), date("1960-03-18"), ]
  end

  it "returns nothing if period too small and before date" do
    a = Kalendor.build { monthly 18 }
    birthdays = a.get_dates(date("1960-10-20"), date("1960-11-10"))
    expect(birthdays).to eq []
  end
end
