module Brightcontent
  Resource = Struct.new(:path) do
    def klass
      path.classify.constantize
    rescue
      "Brightcontent::#{path.classify}".constantize
    end

    def to_partial_path
      "application/resource"
    end
  end
end
