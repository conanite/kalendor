module Kalendor
  module Instance
    class Base < Aduki::Initializable
      attr_accessor :name, :label

      def append other
        Factory.new.union self, other
      end
    end
  end
end
