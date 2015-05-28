module Prawn
  module Chart
    class Base
      TEXT_HEIGHT = 20

      include ActionView::Helpers::NumberHelper

      attr_reader :pdf, :data, :settings

      def initialize(document, data = {}, settings = {})
        @pdf = document
        @data = data
        @settings = settings
      end

      def draw
      end

      # Delegates all unhandled calls to object returned by +pdf+ method.
      def method_missing(method, *args, &block)
        return super unless pdf.respond_to?(method)
        pdf.send(method, *args, &block)
      end

    private

      def visible?
        data.any? && settings
      end

      def padding
        5
      end



      def text_options
        {height: TEXT_HEIGHT, size: TEXT_HEIGHT/2-2, valign: :center, overflow: :shrink_to_fit, disable_wrap_by_char: true}
      end

      def with(property, new_value)
        old_value = self.public_send(property)
        public_send "#{property}=", new_value
        yield
        public_send "#{property}=", old_value
      end


      def series_colors
        %w(0000ff 00ff00 ff0000 00ffff ff00ff ffff00 ff8800 ff88ff
           0088ff 8800ff ff0088 88ff00 00cccc 00cc88 cc8800 88ccff
           cc88cc ffcc00 004488 448800 880044 44ffff 440088 884400)
      end
    end
  end
end