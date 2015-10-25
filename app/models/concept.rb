class Concept < Tool
  def self.model_name
    Tool.model_name
  end

  def to_partial_path
    'tools/tool'
  end
end