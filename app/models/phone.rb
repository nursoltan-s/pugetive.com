class Phone < ActiveRecord::Base
  CATEGORIES = ['mobile', 'home', 'work']

  validates :area_code, presence: true
  validates :central_office_number, presence: true
  validates :subscriber_number, presence: true

  validates :category, inclusion: {in: CATEGORIES}

  def number(format = :dotted)
    case format
    when :dotted
      "#{area_code}.#{central_office_number}.#{subscriber_number}"
    else
      "(#{area_code}) #{central_office_number}-#{subscriber_number}"
    end
  end
end
