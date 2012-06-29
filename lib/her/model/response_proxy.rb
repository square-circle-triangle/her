module Her
  module Model
    class ResponseProxy
      attr_reader :data, :meta

      def initialize(data, meta)
        @data, @meta = data, meta
      end

      def method_missing(method, *args, &block)
        puts "CALLING... ... .. ... ... .. #{method.inspect}"
        @meta[method] || @data.send(method, *args, &block)
      end

      def all
        @data
      end

    end

  end
end
