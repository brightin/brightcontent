## 2.1.0 (unreleased)

### Core

* Upgrade from bootstrap 2 to 3. Including restyle.
* I18n support. Local defaults to same language as main app, but can be overwritten by initializer specifically for Brightcontent.
* Registration of extensions in core. When registered the javascript and css are included from the specific extension. Register extension by calling `Brightcontent.register_extension('extension_name')`.
* Configurable how many resource items are shown in the main menu. Defaults to 6. The remaining gets aggregated in dropdown menu. Configurable by overwriting `config.main_menu_count`.
* Improve partial lookup. First look for specific partial (`_list_field_name.html`), then search for type partial (`_list_field_sting.html`) and else fallback to default view.
* New macros to defining `list_fields` and `form_fields`. Old way of overwriting is still supported. Instead of overwriting methods:

        class Brightcontent::PagesController < Brightcontent::BaseController
          private

          def list_fields
            %w{name author created_at}
          end

          def form_fields
            %w{name body author}
          end
        end

    Use macros:

        class Brightcontent::PagesController < Brightcontent::BaseController
          list_fields :name, :author, :created_at
          form_fields :name, :body, :author
        end

* Use gravatar for current logged in admin.
* Remove `has_scope` functionallity. (WIP: Should be replaced by Ransack gem)


### Pages

* Remove `root_parent_children` method which was unused.
* Use ERB templates for rendering of tree. This is less performant but increases maintainability.

### Attachments

* Refactoring: move attachments classes to correct namespace.
