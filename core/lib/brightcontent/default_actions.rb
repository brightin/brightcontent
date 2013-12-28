module Brightcontent
  module DefaultActions
    def show
      redirect_to action: :edit
    end

    def create
      if params["commit_and_continue"].present?
        create! { resource_item_path }
      else
        create! { resource_index_path }
      end
    end

    def update
      if params["commit_and_continue"].present?
        update! { resource_item_path }
      else
        update! { resource_index_path }
      end
    end

    def destroy
      destroy! { resource_index_path }
    end
  end
end
