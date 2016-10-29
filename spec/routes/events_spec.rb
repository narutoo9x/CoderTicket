require 'rails_helper'

RSpec.describe "events", type: :routing do
	describe "#upcoming" do
		it "should routes /upcoming to events#index" do
			expect(get: "/upcoming").to route_to(controller: "events", action: "index")
		end
	end
end
