class Instrument < Tool
  def self.model_name
    Tool.model_name
  end

  def to_partial_path
    "tool/tool"
  end

end