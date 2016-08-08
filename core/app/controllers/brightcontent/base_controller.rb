require 'csv'
require_dependency "brightcontent/application_controller"

module Brightcontent
  class BaseController < ApplicationController
    include BaseControllerExt::DefaultActions
    include BaseControllerExt::Filtering
    include BaseControllerExt::Pagination
    include BaseControllerExt::Fields

    # deprecated; included for compatibility with inherited_resources
    def end_of_association_chain
      base_collection
    end
  end
end
