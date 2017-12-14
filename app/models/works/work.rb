class Work < ApplicationRecord

  STATUSES = ['pre', 'production', 'post', 'released', 'scrapped', 'retired']
  STATUS_TEXT = {pre: "Pre-Production",
                 production: "In Production",
                 post: "Post-Production",
                 scrapped: "Unfinished",
                 retired: "Retired",
                 released: "Released"}


  include Interesting
  include Rangeable
  include Sluggable
  include Randomable

  validates :party_id,    numericality: true
  validates :start_year,  presence:     true
  validates :live,        inclusion:    {in: BOOLEAN_OPTIONS}
  validates :status,      inclusion:    {in: STATUSES}
  validates :demo,        inclusion:    {in: BOOLEAN_OPTIONS}
  validates :favorite,    inclusion:    {in: BOOLEAN_OPTIONS}
  validates :author_id,   numericality: true, allow_nil: true

  has_attached_file(:image, Pugetive::Application.config.paperclip_image_opts)
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :party
  belongs_to :genre

  has_many :roles, dependent: :destroy
  has_many :titles, through: :roles

  has_many :wields, dependent: :destroy
  has_many :tools, through: :wields

  has_many :series_works, dependent: :destroy
  has_many :series, through: :series_works

  belongs_to :author, class_name: 'Artist'

  # default_scope      -> {includes(:interest, wields: :tool)}
  scope :sorted,      -> {order("works.stop_year IS NULL DESC, works.stop_year DESC, start_year ASC, name ASC")}
  scope :alpha,       -> {order(:name)}

  scope :favorite,    -> {where(favorite: true)}
  scope :unfavorite,  -> {where(favorite: false)}

  scope :lyrical,     -> {where("interest_id IN (#{MUSIC_INTEREST_ID},#{WRITING_INTEREST_ID})")}


  def self.cached
    key = "Work#cached:#{self.all.cache_key}"
    Cache.new(key, -> {self.sorted}).value
  end

  # def titles
  #   @titles ||= Title.joins(roles: {work: {series_works: :series}}).where(['series.id = ?', self.id]).group('titles.id')
  # end

  # def tools
  #   @tools ||= Tool.joins(wields: {work: {series_works: :series}}).where(['series.id = ?', self.id]).group('tools.id')
  # end

  def solo?
    party_id == TODD_PARTY_ID
  end

  def canonical_path
    "/#{interest.work_name.downcase.pluralize}/#{slug}"
  end

  def image_token
    'work'
  end

  def thumbnail(*args)
    if has_image?
      return hosted_image.thumbnail(*args)
    end
    nil
  end

  def mine?
    author_id == 1
  end

  def has_image?
    image.url.present? and not image.url(:thumb).match(/missing/)
  end

  # def has_thumbnail?
  #   instagram_id.present? or flickr_id.present?
  # end

  def active_tools
    cached_wields.where(legacy: false).map{|w| w.tool}
  end

  def legacy_tools
    cached_wields.where(legacy: true).map{|w| w.tool}
  end

  def has_tool?(tool)
    cached_tools.map(&:id).include?(tool.id)
  end

  def has_title?(title)
    cached_titles.map(&:id).include?(title.id)
  end

  def wield_for(tool)
    cached_wields.find{|wield| wield.tool_id == tool.id}
  end

  def role_for(title)
    cached_roles.find{|role| role.title_id == title.id}
  end

  private

    def hosted_image
      @hosted_image ||= HostedImage.new(self)
    end

    def cached_tools
      @cached_tools ||= tools
    end

    def cached_wields
      @cached_wields ||= wields
    end

    def cached_titles
      @cached_titles ||= titles
    end

    def cached_roles
      @cached_roles ||= roles
    end

end
