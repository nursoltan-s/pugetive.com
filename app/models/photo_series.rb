class PhotoSeries < Project
  def self.model_name
    Project.model_name
  end

  def to_partial_path
    'projects/project'
  end
end