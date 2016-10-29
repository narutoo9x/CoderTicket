require 'rails_helper'

RSpec.describe "#authenticate", type: :routing do
	describe "routing #register" do
		it "should routes /register to users#new" do
			expect(get: "/register").to route_to(
				controller: "users",
				action: "new"
			)
		end
	end

	describe "routing #login" do
		it "should routes /login to sessions#new" do
			expect(get: "/login").to route_to(
				controller: "sessions",
				action: "new"
			)
		end
	end

end