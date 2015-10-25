class Concept < Tool
  def self.model_name
    Tool.model_name
  end

  def to_partial_path
    'concepts/concept'
  end
end