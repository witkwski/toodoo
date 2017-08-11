# frozen_string_literal: true

module TooDoo
  module Commands
    # remove a task
    # usage: td remove <body>
    class Remove < Base
      def description
        <<~END
          remove a task
          usage: td remove <body>
        END
      end

      def perform!
        return puts(description) if args.empty?

        result = store.remove(args.join(' '))
        puts build_message(result)
      end

      private

      def build_message(task)
        return 'there is no such task' if task.nil?
        "deleted - #{task.body}"
      end
    end
  end
end
