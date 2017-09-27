module MauxRobot

  module Format
    def self.from(format_type)
      case format_type
      when :json
        Format::Json.new
      else
        Format::Csv.new
      end
    end
  end
end