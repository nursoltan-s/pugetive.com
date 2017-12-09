class Icon < ApplicationRecord

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
end
