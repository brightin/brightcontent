module Brightcontent
  module DefaultActions
    def show
      redirect_to action: :edit
    end

    def create
      create! { polymorphic_url(resource_class) }
    end

    def update
      update! { polymorphic_url(resource_class) }
    end

    def destroy
      destroy! { polymorphic_url(resource_class) }
    end
  end
end
