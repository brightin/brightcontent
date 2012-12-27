require_dependency "brightcontent/application_controller"

module Brightcontent
  class AssetsController < ApplicationController

    def create
      @asset = Asset.new(params.slice(:attachable_id, :attachable_type, :asset))
      if @asset.save
        render json: @asset.to_json, status: :created
      else
        render json: @asset.errors, status: :unprocessable_entity
      end
    end
  end
end
