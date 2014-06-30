module Brightcontent
  module PageCore
    extend ActiveSupport::Concern

    included do
      include TheSortableTree::Scopes

      has_attached_files Brightcontent.page_attachment_styles
      acts_as_nested_set

      validates_presence_of :name

      after_save :update_slug, :expire_path_cache
      after_move :update_slug, :expire_path_cache

      scope :visible, -> { where(arel_table[:hidden].eq false) }
      scope :hidden, -> { where(arel_table[:hidden].eq true) }

      default_scope { order(:lft) }
    end

    module ClassMethods
      def find_by_path(path)
        find_by(slug: sanitize_path(path))
      end

      def find_by_path!(path)
        find_by!(slug: sanitize_path(path))
      end

      def sanitize_path(path)
        path[1..-1]
      end
    end

    def homepage?
      lft == 1
    end

    def path
      "/" + slug
    end

    def to_s
      name
    end

    private

    def update_slug
      update_column(:slug, slug_name.to_s)
    end

    def slug_name
      unless homepage?
        self_and_ancestors.map { |p| p.name.parameterize }.join("/")
      end
    end

    def expire_path_cache
      Pages::PathConstraint.expire
    end
  end
end
