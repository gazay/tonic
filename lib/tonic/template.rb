module Tonic
  module Template
    class << self

      def activate
      end

      private

      def sh(*command)
        Tonic::Shell.run(*command)
      end

    end
  end
end
