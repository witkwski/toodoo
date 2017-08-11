# frozen_string_literal: true
require 'gdbm'

# TooDoo is a command line todo-list
module TooDoo
  VERSION = '0.1.0'

  require 'toodoo/commands/base'
  require 'toodoo/commands/simple'
  require 'toodoo/commands/list'
  require 'toodoo/commands/done'
  require 'toodoo/commands/add'
  require 'toodoo/commands/remove'
  require 'toodoo/commands/history'
  require 'toodoo/commands/help'
  require 'toodoo/commands/clear'

  require 'toodoo/commands'
  require 'toodoo/task'
  require 'toodoo/store'
  require 'toodoo/arguments'
  require 'toodoo/application'
end
