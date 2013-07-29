# encoding: utf-8

module Axiom
  class Attribute

    # Represents a Relation value in a relation tuple
    class Relation < Object

      # The attribute type
      #
      # @example
      #   type = Axiom::Attribute::Relation.type  # => Axiom::Types::Relation
      #
      # @return [Class<Types::Relation>]
      #
      # @api public
      def self.type
        Types::Relation
      end

    end # class Relation
  end # class Attribute
end # module Axiom
