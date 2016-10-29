class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.upcoming
  	Event.where("ends_at > ?", Time.now)
  end

  def self.search(search)
  	Event.where("name ILIKE ?", "%#{search}%")
  end

  scope :published, -> { where.not(publish_at: nil)}

  # detect publish event
  def mark_as_published!
    self.publish_at = Time.now
    self.save!
  end

  def un_published?
    publish_at.nil?
  end

  def published?
    publish_at
  end

  def self.un_published
    where(publish_at: nil)
  end
end
