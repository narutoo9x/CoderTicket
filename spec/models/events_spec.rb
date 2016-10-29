require 'rails_helper'

RSpec.describe Event, type: :model do
	describe "#upcoming" do
		it "return [] when there are no events" do
			expect(Event.upcoming.size).to eq 0
		end
		it "return [] when all the events are in the past" do
			Event.create!(starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: "past events", venue: Venue.new, category: Category.new)
			expect(Event.upcoming).to eq []
		end
		it "return [devfest] when there is an events will be hold" do
			devfest = Event.create!(name: "devfest",starts_at: 2.days.from_now, ends_at: 3.days.from_now, extended_html_description: "events upcoming", venue: Venue.new, category: Category.new)
			googledayX = Event.create!(name: "googledayX", starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: "past events", venue: Venue.new, category: Category.new)
			expect(Event.upcoming).to eq [devfest]
		end
	end
end
