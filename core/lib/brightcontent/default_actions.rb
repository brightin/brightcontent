module Brightcontent
  module DefaultActions
    def show
      redirect_to action: :edit
    end

    def create
      create! { resource_redirect_path }
    end

    def update
      update! { resource_redirect_path }
    end

    def destroy
      destroy! { resource_index_path }
    end

    private

    def resource_redirect_path
      if params["commit_and_continue"].present?
        resource_item_path
      else
        resource_index_path
      end
    end
  end
end
