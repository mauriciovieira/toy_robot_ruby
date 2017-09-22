# frozen_string_literal: true

module MauxRobot

  # The CLI is a class responsible of handling command line interface
  class CLI
    ALLOWED_ORDERS = %i[left right move place report].freeze

    attr_reader :robot
    def initialize
      @robot = Robot.new
    end

    # Receives everything from standard input and executes
    def run
      run_script(STDIN.read)
    end

    def run_script(all_input)
      all_input.split("\n").each do |line_input|
        command = parse(line_input)
        execute(command) if command
      end
    end

    def parse(line_input)
      clean_input = line_input.strip.squeeze(' ').split(' ')
      order = sanitize_order(clean_input.shift)
      return unless order

      command = { order: order }

      if clean_input.any?
        arguments = sanitize_arguments(clean_input.join(''))
        command[:arguments] = arguments
      end

      command
    end

    def execute(command)
      if command.has_key?(:arguments)
        @robot.send(command[:order], command[:arguments])
      else
        @robot.send(command[:order])
      end
    end

    private

    def sanitize_order(input_string)
      order = input_string.downcase.to_sym
      order if ALLOWED_ORDERS.include?(order)
    end

    def sanitize_arguments(arguments)
      arguments = arguments.delete(' ').split(',')
      { x: arguments[0], y: arguments[1], face: arguments[2] }
    end
  end
end