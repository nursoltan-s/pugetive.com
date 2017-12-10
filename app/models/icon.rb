class Icon < ApplicationRecord

  def self.from_category(category_name)
    cached_icons.select{|icon| icon.category == category_name.to_s}
  end

  def self.for(name)
    icon = cached_icons.find{|i| i.name == name.to_s}
    if icon.nil?
      begin
        icon = cached_icons.find{|i| i.name == 'question'}
      rescue
        raise PugetiveError, "IconHelper#icon can find niether '#{name}' nor the default icon 'question'"
      end
    end
    icon
  end

  def self.categories
    cached_icons.map(&:category).uniq
  end

  private

    def self.cached_icons
      @cached_icons ||= Icon.all.order(:name)
    end
end
