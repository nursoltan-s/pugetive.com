class Work < ApplicationRecord

  STATUSES = ['pre', 'production', 'post', 'released', 'scrapped', 'retired']

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  validates :status, inclusion: {in: STATUSES}

  belongs_to :interest
  belongs_to :party

  has_many :roles, dependent: :destroy
  has_many :titles, through: :roles

  has_many :wields
  has_many :tools, through: :wields


  scope :sorted, -> {order("stop_year IS NULL DESC, stop_year DESC")}

  def date_range
    DateRange.new(start_year, stop_year).years
  end

  def wields?(tool_to_check)
    tools.each do |tool_wielded|
      if tool_wielded == tool_to_check
        return true
      end
    end
    false
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end


end
