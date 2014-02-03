require_dependency "brightcontent/application_controller"

module Brightcontent
  class AttachmentsController < ApplicationController

    def show
      @attachments = Attachment.for_attachable(params[:type], params[:id])
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
      Attachment.destroy params[:id]
      head :no_content
    end

    def reposition
      Attachment.for_attachable(params[:type], params[:id]).reposition! params[:positions]
      head :no_content
    end

    private

    def attachment_params
      params.require(:attachment).permit(:attachable_id, :attachable_type, :asset)
    end

  end
end
