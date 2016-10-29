require 'rails_helper'

RSpec.describe EventsController, type: :controller do
	describe "only creator can #published_event" do
		demouser = User.create(name: "demouser", email: "demo@demo.com", password: "123456")
		event = Event.create!(name: "demo", starts_at: 2.days.ago, ends_at: 1.day.from_now, extended_html_description: "big event ever",
												user: User.new, publish_at: 5.days.ago, venue: Venue.new, category: Category.new)
	  def publish_event; end

		expect(event.publish_at).to eq(false)
	end
end
