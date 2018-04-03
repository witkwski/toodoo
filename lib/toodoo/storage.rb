# frozen_string_literal: true

module TooDoo
  # Storage is intended to build connection with the db
  # and provide api for the application
  # it saves the database file into user's home directory
  class Storage
    DATABASE_PATH = File.expand_path('~/.toodoo')

    attr_reader :path, :adapter

    def initialize(db_file_path = DATABASE_PATH, adapter = DBM)
      @path = db_file_path
      @adapter = adapter
    end

    def all
      connection do |db|
        db.values.each_with_object([]) do |marsh_task, tasks|
          tasks << restore(marsh_task)
        end
      end
    end

    def undone
      all.reject(&:done?)
    end

    def done
      all.select(&:done?)
    end

    def find(body)
      connection do |db|
        result = db[body]
        restore(db[body]) unless result.nil?
      end
    end

    def save(task)
      raise ArgumentError unless task.is_a?(Task)

      connection do |db|
        db[task.body] = dump(task)
      end

      task
    end

    def remove(body)
      connection do |db|
        result = db.delete(body)
        restore(result) unless result.nil?
      end
    end

    def remove_all
      connection(&:clear)
    end

    private

    def dump(task)
      Marshal.dump(task)
    end

    def restore(string)
      Marshal.restore(string)
    end

    def connection
      connection = adapter.new(path)
      result = yield(connection)
      connection.close

      result
    end
  end
end
