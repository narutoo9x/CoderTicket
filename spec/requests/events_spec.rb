require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /events" do
    it "accepts search on the homepage" do
    	devfest = Event.create!(name: "Big GDG events", starts_at: 1.day.ago, ends_at: 1.day.from_now, extended_html_description: "future event", venue: Venue.new, category: Category.new)
    	UET10years = Event.create!(name: "Celebrates 10 yaers", starts_at: 10.days.ago, ends_at: 5.days.from_now, extended_html_description: "past event", venue: Venue.new, category: Category.new)

      get root_path
      expect(response).to have_http_status(200)
      expect(response.body).to include "Big GDG events"
      expect(response.body).to_not include "Celebrates 10 years"
    end
  end
end
