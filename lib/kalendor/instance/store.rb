module Kalendor
  module Instance
    class Store
      def initialize hsh={ } ; @store = hsh           ; end
      def add            kal ; @store[kal.name] = kal ; end
      def find          name ; @store[name]           ; end
      def delete        name ; @store.delete[name]    ; end
      def names              ; @store.keys            ; end
      def list               ; @store.values          ; end
    end
  end
end
