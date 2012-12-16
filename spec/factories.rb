FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
 
  factory :admin_user, class: Brightcontent::AdminUser do
    email
    password "password"
    password_confirmation "password"
  end

  factory :page, class: Brightcontent::Page do
    name "Pagina"
    body "Body"
  end

  factory :blog do
    name "Blogname"
    body "Inhoud"
  end
end
