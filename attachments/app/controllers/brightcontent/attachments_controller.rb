require_dependency "brightcontent/application_controller"

module Brightcontent
  class AttachmentsController < ApplicationController
    def show
      @attachments = Attachment.where(attachable_type: params[:type].classify, attachable_id: params[:id])
      render layout: false
    end

    def create
      @attachment = Attachment.new(attachment_params)
      if @attachment.save
        render json: @attachment.to_json, status: :created
      else
        render json: @attachment.errors, status: :unprocessable_entity
      end
    end

    def destroy
      attachment = Attachment.destroy(params[:id])
      redirect_to attachment.attachable
    end

    private

    def attachment_params
      params.permit!.slice(:attachable_id, :attachable_type, :asset)
    end
  end
end
