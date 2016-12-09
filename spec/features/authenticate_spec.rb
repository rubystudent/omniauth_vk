# frozen_string_literal: true
require 'rails_helper'

feature 'Authentication' do
  context 'with valid hash' do
    before(:each) do
      OmniAuth.config.mock_auth[:vkontakte] = OmniAuth::AuthHash.new(
        provider: 'vkontakte',
        uid: '12345',
        info: { email: 'cfgcl16@ukr.net' }
      )
      visit login_path
      click_link 'Login with VK'
    end

    scenario 'user login' do
      expect(page).to have_content('Log out')
    end

    scenario 'user logout' do
      click_link 'Log out'
      expect(page).to_not have_content('Log out')
    end
  end

  context 'with invalid hash' do
    scenario 'user login' do
      OmniAuth.config.mock_auth[:vkontakte] = :invalid_credentials
      visit login_path
      click_link 'Login with VK'
      expect(page).to_not have_content('Log out')
    end
  end
end
