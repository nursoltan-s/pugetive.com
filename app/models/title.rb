class Title < ActiveRecord::Base

  include Sluggable

  validates :name, presence: true
  validates :category, inclusion: {in: Interest::CATEGORIES}

  has_many :roles, dependent: :destroy
  has_many :works, through: :roles

  default_scope {order(:sort)}

  scope :alpha,       -> {order(:name)}
  scope :sorted,      -> {order(:sort)}

  scope :music,       -> {where(category: 'Music')}
  scope :photography, -> {where(category: 'Photography')}
  scope :software,    -> {where(category: 'Software')} 
  scope :film,        -> {where(category: 'Film')}
  scope :writing,     -> {where(category: 'Writing')}

  def self.categories
    #FIXME make direct SQL call
    all.each.map{|t| t.category}.uniq
  end

  # Refactor: extract into shared module
  def self.random(num = 10)
    find(self.random_id(num))
  end

  def self.random_id(num)
    if @random_ids.nil?
      sql = <<-SQL
        SELECT id
        FROM titles
      SQL
      @random_ids = ActiveRecord::Base.connection.select_values(sql)
    end
    return @random_ids.sample(num)
  end

end
