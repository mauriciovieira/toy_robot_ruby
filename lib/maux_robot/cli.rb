# frozen_string_literal: true

module MauxRobot

  # The CLI is a class responsible of handling command line interface
  class CLI
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
        begin
          execute(command) if command
        rescue MauxRobot::RobotError => e
          puts e if @robot.talkative
        end
      end
    end

    def parse(line_input)
      Parser.new.parse(line_input)
    end

    def execute(command)
      if command.has_key?(:arguments)
        @robot.send(command[:order], command[:arguments])
      else
        @robot.send(command[:order])
      end
    end
  end
end