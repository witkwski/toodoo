# frozen_string_literal: true

module TooDoo
  module Commands
    # list tasks
    # usage: td list
    class List < Simple
      def description
        <<~END
          list tasks
          usage: td list
        END
      end

      private

      def find_tasks
        store.undone
      end

      def empty_list_message
        'you have no tasks yet'
      end
    end
  end
end
