Installation
------------

Need more than a single file attachment for a model?

```ruby
class Blog < ActiveRecord::Base
  has_attached_files test: "200x200"
end
```
