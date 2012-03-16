module PaperclipDestroyHelper
  def self.included(base)
    clear_columns = ""
    columns_to_extend = base.column_names.select{|a| a.end_with?("_file_name")}
    columns_to_extend.each do |column|
      column = column.gsub("_file_name","")
      eval <<-extensions
        attr_accessor :#{column}_delete
        def #{column}_delete
          @#{column}_delete ||= "0"
        end
        
        def #{column}_delete=(value)
          @#{column}_delete = value
        end
        
        def destroy_#{column}?
          #{column}.clear if #{column}_delete.to_s == "1" && !self.send(:#{column}).dirty?
        end
        
        base.before_update :destroy_#{column}?
      extensions
    end
  end
end