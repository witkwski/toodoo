# frozen_string_literal: true

module TooDoo
  # Commands is a pack of availalble command logics
  # command entities reprsent their logic and an output
  module Commands
    COMMANDS = {
      list:    List,
      add:     Add,
      done:    Done,
      remove:  Remove,
      history: History,
      help:    Help,
      clear:   Clear,
      command_missing: List,

      l: List,
      a: Add,
      d: Done,
      r: Remove,
      h: History,

      :+ => Add,
      :- => Remove,
      :'!' => Done,
      :'.' => List
    }.freeze
  end
end
