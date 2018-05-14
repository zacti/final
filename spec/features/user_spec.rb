require 'rails_helper'

RSpec.feature "Users", type: :feature do

feature "Sign up" do 
	describe 'User create' do
		it 'should raise user count by 1' do
		    visit new_user_path
		    fill_in "user[email]", with: "aaa@gmail.com"
		    fill_in "user[password]", with: "aaa"
		    fill_in "user[password_confirmation]", with: "aaa"
		    click_button "sign up"
		    expect(page).to have_content "Kos Tlitch"
	    end
	end
  end
end