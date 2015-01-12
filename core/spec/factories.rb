FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :admin_user, class: Brightcontent::AdminUser do
    email
    password "password"
    password_confirmation "password"
  end

  factory :blog do
    name "Blogname"
    body "Inhoud"
    featured false

    factory :featured_blog do
      featured true
    end
  end

  factory :author do
    factory :author_with_blogs do
      transient do
        blogs_count 5
      end
      after(:create) do |author, evaluator|
        create_list(:blog, evaluator.blogs_count, author: author)
      end
    end
  end

  factory :comment do
    text "Comment text"
    blog
  end
end
