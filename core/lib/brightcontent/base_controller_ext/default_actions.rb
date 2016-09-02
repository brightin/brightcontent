require 'active_support/concern'

module Brightcontent
  module BaseControllerExt
    module DefaultActions
      extend ActiveSupport::Concern

      included do
        before_action :set_collection
        before_action :set_resource
        helper_method :resource, :resource_class, :resource_index_path, :resource_path, :collection, :resource_edit_path
      end

      def base_collection
        instance_variable_get :"@#{resource_collection_name}"
      end

      def collection
        base_collection
      end

      def collection=(val)
        instance_variable_set :"@#{resource_collection_name}", val
      end

      def resource
        instance_variable_get :"@#{resource_instance_name}"
      end

      def resource=(val)
        instance_variable_set :"@#{resource_instance_name}", val
      end

      def resource_class
        controller_name.classify.constantize
      end

      def resource_instance_name
        resource_class.model_name.param_key
      end

      def resource_collection_name
        resource_instance_name.pluralize
      end

      def resource_human_name(options = {})
        resource_class.model_name.human(options)
      end

      def index
      end

      def show
        redirect_to action: :edit
      end

      def new
        self.resource = base_collection.new
      end

      def edit
      end

      def create
        self.resource = base_collection.new(resource_params)
        if resource.save
          redirect_to resource_redirect_path, notice: t("flash.actions.create.notice", resource_name: resource_human_name)
        else
          render :new
        end
      end

      def update
        if resource.update(resource_params)
          redirect_to resource_redirect_path, notice: t("flash.actions.update.notice", resource_name: resource_human_name)
        else
          render :edit
        end
      end

      def destroy
        if resource.destroy
          redirect_to resource_index_path, notice: t("flash.actions.destroy.notice", resource_name: resource_human_name)
        else
          redirect_to resource_index_path, alert: t("flash.actions.destroy.alert", resource_name: resource_human_name)
        end
      end

      private

      def set_collection
        self.collection = resource_class.all
      end

      def set_resource
        self.resource = base_collection.find(params[:id]) if params[:id].present?
      end

      def resource_params
        params.require(resource_instance_name).permit!
      end

      def resource_index_path
        [brightcontent, resource_class]
      end

      def resource_edit_path(res = resource)
        [brightcontent, :edit, res]
      end

      def resource_redirect_path
        if params[:commit_and_continue].present?
          resource_edit_path
        else
          resource_index_path
        end
      end

      def resource_path(res = resource)
        [brightcontent, res]
      end
    end
  end
end
