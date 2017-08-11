# frozen_string_literal: true

module TooDoo
  module Commands
    # list available commands
    # usage: td help
    class Help < Base
      def description
        <<~END
          list available commands
          usage: td help
        END
      end

      def run!
        perform!
      end

      def perform!
        puts build_message
      end

      private

      def build_message
        <<~END
          usage:

          help              - list available commands
          add <body>      - add a new task
          done <body>     - mark task as done
          remove <body>   - remove a task
          list              - list tasks
          history           - list done tasks
          clear             - clear task lists
        END
      end
    end
  end
end
