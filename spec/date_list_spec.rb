require 'kalendor'
require 'kalendor/instance/date_list'

RSpec.describe Kalendor::DateList do
  it "returns a single date" do
    a = Kalendor.build { list "1984-09-01" }
    dates = a.get_dates(date("1900-01-01"), date("2100-12-31"))
    expect(dates).to eq [date("1984-09-01") ]
  end

  it "returns a list of dates" do
    a = Kalendor.build { list "1984-06-21", "1949-10-03", "1982-06-08" }
    dates = a.get_dates(date("1900-01-01"), date("2100-12-31"))
    expect(dates).to eq [date("1984-06-21"), date("1949-10-03"), date("1982-06-08"), ]
  end

  it "returns only the dates within the given parameterrs " do
    a = Kalendor.build { list "1984-06-21", "1999-02-11", "1949-10-03", "1882-06-08", "2012-06-08" }
    dates = a.get_dates(date("1950-01-01"), date("1999-12-31"))
    expect(dates).to eq [date("1984-06-21"), date("1999-02-11") ]
  end
end
