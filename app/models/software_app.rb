class SoftwareApp < Project

  def self.model_name
    Project.model_name
  end

  def to_partial_path
    'projects/project'
  end

  def notes
    Note.where(noteable_type: 'SoftwareApp', noteable_id: self.id)
  end
end