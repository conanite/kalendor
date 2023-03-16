module Kalendor
  module Instance
    class Base < Aduki::Initializable
      attr_accessor :name, :label

      def append other
        me = self
        Kalendor.build { union me, other }
      end

      def union *others
        Kalendor::Instance::Union.new(schedules: [self, *others])
      end

      def intersect *others
        Kalendor::Instance::Intersect.new(schedules: [self, *others])
      end

      def subtract other
        Kalendor::Instance::Subtract.new include_dates: self, exclude_dates: other
      end
    end
  end
end
