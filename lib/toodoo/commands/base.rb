# frozen_string_literal: true

module TooDoo
  module Commands
    # Base class represents template for command entity
    # it provides common logic for all commands
    class Base
      attr_reader :args, :store

      def initialize(args, store = Store)
        @args = args
        @store = store.new
      end

      def description
        ''
      end

      def run!
        return puts description if args.empty?
        perform!
      end

      def perform!
        raise NotImplementedError
      end
    end
  end
end
