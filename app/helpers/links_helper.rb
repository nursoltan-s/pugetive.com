module LinksHelper

  def touch_path(subject)
    "/touch/#{subject.class.name.downcase}/#{subject.id}"
  end
end