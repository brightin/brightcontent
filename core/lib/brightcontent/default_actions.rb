module Brightcontent
  module DefaultActions
    def show
      redirect_to action: :edit
    end

    def create
      if params["commit_and_continue"].present?
        create! { [parent, resource] }
      else
        create! { [parent, resource_class] }
      end
    end

    def update
      if params["commit_and_continue"].present?
        update! { [parent, resource] }
      else
        update! { [parent, resource_class] }
      end
    end

    def destroy
      destroy! { [parent, resource_class] }
    end
  end
end
