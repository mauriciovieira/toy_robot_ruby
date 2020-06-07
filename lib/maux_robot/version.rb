# frozen_string_literal: true

module MauxRobot
  # This module holds the MauxRobot version information.
  module Version
    STRING = "0.2.0"

    MSG = "%s (using Parser %s, running on %s %s %s)"

    def self.version(debug = false)
      if debug
        format(MSG, STRING, Parser::VERSION,
          RUBY_ENGINE, RUBY_VERSION, RUBY_PLATFORM)
      else
        STRING
      end
    end
  end
end
