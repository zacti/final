require 'rails_helper'
	
RSpec.describe User, :type => :model do
	let(:foods) { Food.new(item: "Mcdonald", location: "Kuala Lumpur")}

	describe "associations" do
   		it "check belongs_to user" do
   			expect(foods).to belong_to(:user)
   		end
   	end
end