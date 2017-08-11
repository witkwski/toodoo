# frozen_string_literal: true

require 'pry'

module TooDoo
  module Commands
    # add a new task
    # usage: td add <body>
    class Add < Base
      def description
        <<~END
          add a new task
          usage: td add <task>
        END
      end

      def perform!
        return puts(description) if args.empty?

        task = Task.new(args.join(' '))
        store.save(task)
        puts build_message(task)
      end

      private

      def build_message(task)
        "created - #{task.body}"
      end
    end
  end
end
