class Company < Party
  has_many :projects, foreign_key: 'party_id'

  def notes
    projects.map{|p| p.notes}.flatten
  end

end