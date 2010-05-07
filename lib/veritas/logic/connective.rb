module Veritas
  module Logic
    class Connective
      include AbstractClass, Expression

      module BinaryConnective
        include Operation::Binary

        def call(tuple)
          self.class.eval(left.call(tuple), right.call(tuple))
        end

        def project(attributes)
          left  = self.left.project(attributes)
          right = self.right.project(attributes)

          if left.nil?
            right
          elsif right.nil?
            left
          else
            super
          end
        end

        def rename(aliases)
          left          = self.left
          right         = self.right
          renamed_left  = left.rename(aliases)
          renamed_right = right.rename(aliases)

          if left.equal?(renamed_left) && right.equal?(renamed_right)
            self
          else
            self.class.new(renamed_left, renamed_right)
          end
        end

        def optimize
          if duplicate_operands?
            optimize_left
          elsif redundant?
            optimize_right
          elsif optimized?
            new_optimized_connective
          else
            super
          end
        end

        def eql?(other)
          instance_of?(other.class) &&
          left.eql?(other.left)     &&
          right.eql?(other.right)
        end

        def hash
          @hash ||= left.hash ^ right.hash
        end

      private

        def duplicate_operands?
          optimize_left.eql?(optimize_right)
        end

        def redundant?
          right = optimize_right
          kind_of?(right.class) && optimize_left.eql?(right.left)
        end

        def optimize_left
          @optimize_left ||= left.optimize
        end

        def optimize_right
          @optimize_right ||= right.optimize
        end

        def new_optimized_connective
          self.class.new(optimize_left, optimize_right)
        end

        def optimized?
          !(optimize_left.equal?(left) && optimize_right.equal?(right))
        end

      end # module BinaryConnective
    end # class Connective
  end # module Logic
end # module Veritas

require 'veritas/logic/connective/conjunction'
require 'veritas/logic/connective/disjunction'
require 'veritas/logic/connective/negation'