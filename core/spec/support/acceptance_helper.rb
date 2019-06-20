def sign_in(url = "/admin")
  user = create(:admin_user)
  visit url
  fill_in "Email", with: user.email
  fill_in "Password", with: "password"
  click_button "Login"
  user
end
