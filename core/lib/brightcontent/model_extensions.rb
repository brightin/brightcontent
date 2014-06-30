module Brightcontent
  module ModelExtensions
    extend ActiveSupport::Concern

    module ClassMethods
      def brightcontent_columns
        (column_names + added_brightcontent_columns).uniq
      end

      def add_brightcontent_column(column_name)
        added_brightcontent_columns << column_name.to_s
      end

      def added_brightcontent_columns
        @_added_brightcontent_columns ||= []
      end
    end
  end
end
