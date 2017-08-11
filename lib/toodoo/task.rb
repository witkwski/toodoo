# frozen_string_literal: true

module TooDoo
  # Task is the base model of the app
  # it's a presenter of stored data
  class Task
    attr_reader :body, :status

    CREATED_STATUS = :created
    DONE_STATUS = :done

    def initialize(body, status = CREATED_STATUS)
      @body = body
      @status = status
    end

    def done?
      @status == DONE_STATUS
    end

    def done!
      @status = DONE_STATUS
    end

    def ==(other)
      body == other.body && status == other.status
    end
  end
end
