module Veritas
  module Operation
    module Binary
      attr_reader :left, :right

      def initialize(left, right)
        @left, @right = left, right
      end

      def eql?(other)
        instance_of?(other.class) &&
        left.eql?(other.left)     &&
        right.eql?(other.right)
      end

      def hash
        left.hash ^ right.hash
      end

    end # module Binary
  end # module Operation
end # module Veritas