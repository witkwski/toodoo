# frozen_string_literal: true

module TooDoo
  module Commands
    # list done tasks
    # usage: td history
    class History < Simple
      def description
        <<~END
          list done tasks
          usage: td history
        END
      end

      private

      def find_tasks
        store.done
      end

      def empty_list_message
        'you have no done tasks yet'
      end
    end
  end
end
