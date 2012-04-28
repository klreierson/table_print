module TablePrint
  class Column
    attr_reader :formatters
    attr_writer :width
    attr_accessor :name, :data

    def initialize(attr_hash={})
      attr_hash.each do |k, v|
        self.send("#{k}=", v)
      end
      @formatters ||= []
    end

    def name=(n)
      @name = n.to_s
    end

    def add_formatter(formatter)
      @formatters << formatter
    end

    def data_width
      [name.length].concat(data.compact.collect(&:to_s).collect(&:length)).max
    end

    def width
      @width ||= data_width
    end
  end
end
