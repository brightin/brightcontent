module Brightcontent
  module ModelExtensions
    extend ActiveSupport::Concern

    module ClassMethods
      def brightcontent_columns
        @brightcontent_columns ||= column_names.dup
      end

      def add_brightcontent_column(column_name)
        brightcontent_columns.append(column_name)
      end
    end
  end
end
