# frozen_string_literal: true

module TooDoo
  # Application is the entry point for the app
  # it takes arguments and passes them to a command
  # to spin up the corresponding logic
  class Application
    attr_reader :args, :command

    def initialize(args = Arguments.new)
      @args = args
      @command = recognize_command
    end

    def run!
      command.new(@args.argument).run!
    end

    private

    def recognize_command
      Commands::COMMANDS.fetch \
        @args.command.to_sym, Commands::Help
    end
  end
end
