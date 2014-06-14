module DeviseCustomHelpers
  def sign_in(user)
    visit '/users/sign_in'

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Sign in'
  end
end
