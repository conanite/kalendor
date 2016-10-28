require "kalendor/intersect"
require "kalendor/instance/composite"

class Kalendor::Instance::Intersect < Kalendor::Instance::Composite
  include Kalendor::Intersect
end
