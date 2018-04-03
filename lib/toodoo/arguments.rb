# frozen_string_literal: true

module TooDoo
  # Arguments class is intended to handle passed args
  # and transform it into command name and its arguments
  # I dont want to use OptionParser
  class Arguments
    attr_reader :command, :argument

    def initialize(args_array = ARGV)
      @args_array = Array(args_array)
      @command    = recognize_command
      @argument   = recognize_arguments
    end

    private

    def recognize_command
      @args_array.shift || :command_missing
    end

    def recognize_arguments
      @args_array
    end
  end
end
