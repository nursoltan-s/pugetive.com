class Instrument < Title
  def self.model_name
    Title.model_name
  end

  def to_partial_path
    "titles/title"
  end

end