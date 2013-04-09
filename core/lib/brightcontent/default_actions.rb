module Brightcontent
  module DefaultActions
    def show
      redirect_to action: :edit
    end

    def create
      if params["commit_and_continue"].present?
        create! { polymorphic_url(resource) }
      else
        create! { polymorphic_url(resource_class) }
      end
    end

    def update
      if params["commit_and_continue"].present?
        update! { polymorphic_url(resource) }
      else
        update! { polymorphic_url(resource_class) }
      end
    end

    def destroy
      destroy! { polymorphic_url(resource_class) }
    end
  end
end
