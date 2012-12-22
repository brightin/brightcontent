def sign_in
  user = create(:admin_user)
  visit "/admin"
  fill_in "Email", with: user.email
  fill_in "Password", with: "password"
  click_button "Login"
  user
end
