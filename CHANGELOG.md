## 2.5.0

* Add details about currently logged in admin user to the logs

* Inline gem `will_paginate-bootstrap` to fix deprecation warnings about Fixnum.
  NB. replace `BootstrapPagination::Rails` with `Brightcontent::PaginationRenderer` if your admin views use `will_paginate`.

* Update tests and dependencies, test on Rails 4.2 and 5.2

## 2.4.0

* Drop dependency on `inherited_resource` to prepare support for Rails 5

* Adjustable pagination sizes

* Use bootstrap-datetimepicker for date & datetime fields

* Allow locale to be passed in from params

* Per-user resource tabs

* Don't call distinct on ransack results

## 2.3.0

* Enable CSRF protection for Brightcontent::ApplicationController

* Simplify `AdminUser` API to make it easier to replace.

## 2.2.0

* Support Rails 4.2

* Drop support for Rails < 4.2

## 2.1.0

### Core

* Drop Rails 3 support.

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

* Add `PathConstraint`. Limit the amount of urls the catch-all route responds to by constraining. The `PathConstraint` class caches all paths in the database. Example:

        get "*path" => "pages#show", constraints: Brightcontent::Pages::PathConstraint.new

### Attachments

* Refactoring: move attachments classes to correct namespace.
