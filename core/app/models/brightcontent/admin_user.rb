module Brightcontent
  class AdminUser < ActiveRecord::Base
    has_secure_password
    validates_uniqueness_of :email
    attr_accessible *column_names if defined? ProtectedAttributes

    def self.authenticate(email, password)
      find_by_email(email).try :authenticate, password
    end
  end
end
