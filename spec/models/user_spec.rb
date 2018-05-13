require 'rails_helper'
	
RSpec.describe User, :type => :model do
	let(:user) { User.new(email: "zac@gmail.com", password: "zac123")}

	it "should check for email validation" do
		# save user
		# expect save to be true
		expect(user.save).to eq(true)
		expect(user.email).to eq("zac@gmail.com")
  	end

	describe "associations" do
   		it "check has_many food" do
   			expect(user).to have_many(:foods)
   		end
   	end
end