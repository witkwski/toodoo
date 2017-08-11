# frozen_string_literal: true

module TooDoo
  module Commands
    # mark task as done
    # usage: td done <task>
    class Done < Base
      def description
        <<~END
          mark task as done
          usage: td done <task>
        END
      end

      def perform!
        return puts(description) if args.empty?

        result = store.find(args.join(' '))
        unless result.nil?
          result.done!
          store.save(result)
        end

        puts build_message(result)
      end

      private

      def build_message(task)
        return 'there is no such task' if task.nil?
        "done - #{task.body}"
      end
    end
  end
end
