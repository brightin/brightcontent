require_dependency "brightcontent/application_controller"

module Brightcontent
  class AttachmentsController < ApplicationController

    def show
      @attachments = Attachment.where(attachable_type: params[:type].classify, attachable_id: params[:id])
      render layout: false
    end

    def create
      @attachment = Attachment.new(params.slice(:attachable_id, :attachable_type, :asset))
      if @attachment.save
        render json: @attachments.to_json, status: :created
      else
        render json: @attachments.errors, status: :unprocessable_entity
      end
    end

  end
end
