class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.upcoming
    Event.where("starts_at > ?", Time.now)
  end

  def self.search(query)
    where("name ilike ?", "%#{query}%").where("starts_at > ?", Time.now)
  end

  delegate :name, to: :venue, allow_nil: true, prefix: true

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def self.published
    where.not(published_at: nil)
  end

end
