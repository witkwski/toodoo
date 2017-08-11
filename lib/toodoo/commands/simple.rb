# frozen_string_literal: true

module TooDoo
  module Commands
    # list your tasks
    # usage: td list
    class Simple < Base
      def run!
        perform!
      end

      def perform!
        tasks = find_tasks
        @message = build_message(tasks)
        puts @message
      end

      private

      def find_tasks
        raise NotImplementedError
      end

      def empty_list_message
        raise NotImplementedError
      end

      def build_message(tasks)
        return empty_list_message if tasks.empty?

        tasks.inject('') do |put, task|
          put + " - #{task.body}\n" unless task.nil?
        end
      end
    end
  end
end
