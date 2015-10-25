class Program < Tool
  def self.model_name
    Tool.model_name
  end

  def to_partial_path
    'programs/program'
  end
end