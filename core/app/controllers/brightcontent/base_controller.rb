require 'csv'
require_dependency "brightcontent/application_controller"

module Brightcontent
  class BaseController < ApplicationController
    include BaseControllerExt::DefaultActions
    include BaseControllerExt::Filtering
    include BaseControllerExt::Pagination
    include BaseControllerExt::Fields
  end
end
