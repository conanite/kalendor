require "kalendor/union"
require "kalendor/instance/composite"

class Kalendor::Instance::Union < Kalendor::Instance::Composite
  include Kalendor::Union
end
