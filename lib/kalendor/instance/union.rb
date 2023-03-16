require "kalendor/union"
require "kalendor/instance/composite"

class Kalendor::Instance::Union < Kalendor::Instance::Composite
  include Kalendor::Union
  def append other
    self.class.new name: name, label: label, schedules: [other, *schedules]
  end
end
