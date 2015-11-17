module Vnstat
  class Result
    ##
    # A class representing a tracking result for a specific minute.
    #
    # @attr_reader [DateTime] time The time the result was captured at.
    class Minute < Result
      include DateDelegation
      include TimeComparable

      attr_reader :time

      ##
      # Initializes the {Hour}.
      #
      # @param [DateTime] time The time the result was captured at.
      # @param [Integer] bytes_received The received bytes.
      # @param [Integer] bytes_sent The sent bytes.
      def initialize(time, bytes_received, bytes_sent)
        @time = time
        super(bytes_received, bytes_sent)
      end

      def self.extract_from_xml_element(element)
        new(
          Parser.extract_datetime_from_xml_element(element),
          *Parser.extract_transmitted_bytes_from_xml_element(element)
        )
      end

      ##
      # The date the result was captured.
      #
      # @return [Date]
      def date
        time.to_date
      end

      ##
      # The hour the result was captured.
      #
      # @return [Integer]
      def hour
        time.hour
      end

      ##
      # The minute the result was captured.
      #
      # @return [Integer]
      def minute
        time.minute
      end
    end
  end
end
