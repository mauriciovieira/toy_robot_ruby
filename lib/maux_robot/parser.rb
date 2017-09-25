# frozen_string_literal: true

module MauxRobot

  class Parser
    ALLOWED_ORDERS = %i[left right move place report verbose].freeze

    def parse(line_input)
      clean_input = line_input.strip.squeeze(' ').split(' ')
      order = sanitize_order(clean_input.shift)
      return unless order

      command = { order: order }

      if clean_input.any?
        arguments = sanitize_arguments(order, clean_input.join(''))
        command[:arguments] = arguments
      end

      command
    end


    private

    def sanitize_order(input_string)
      order = input_string.downcase.to_sym
      order if ALLOWED_ORDERS.include?(order)
    end

    def sanitize_arguments(order, arguments)
      case order
      when :place
        arguments = arguments.delete(' ').split(',')
        { x: arguments[0], y: arguments[1], face: arguments[2] }
      when :report
        { format: arguments.downcase.to_sym }
      end
    end
  end
end



