module FeatureLogin
  def login(email, password)
    visit '/users/sign_in'
    fill_in 'メールアドレス', :with => email
    fill_in 'パスワード', :with => password
    click_button 'ログイン'
  end
end

RSpec.configure do |config|
  config.include FeatureLogin, type: :feature
end