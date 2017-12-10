class Icon < ApplicationRecord

  scope :sorted, -> {order(:name)}

  def self.from_category(category_name)
    where(["category = ?", category_name])
  end

  def self.for(name)
    icon = self.find_by(name: name) rescue nil
    if icon.nil?
      begin
        icon = self.find_by(name: 'question')
      rescue
        raise PugetiveError, "IconHelper#icon can find niether '#{name}' nor the default icon 'question'"
      end
    end
    icon
  end

  def self.categories
    sql = <<-SQL
      SELECT DISTINCT category
      FROM icons
    SQL
    ActiveRecord::Base.connection.select_values(sql)
  end
end
