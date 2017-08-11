# frozen_string_literal: true

module TooDoo
  module Commands
    # clear task lists
    # usage: td clear
    class Clear < Base
      def description
        <<~END
          clear task lists
          usage: td clear
        END
      end

      def message
        'lists are empty'
      end

      def run!
        store.remove_all
        puts message
      end
    end
  end
end
