class Company < Party
  has_many :projects, foreign_key: 'party_id'
  has_many :titles, through: :projects

  def notes
    projects.map{|p| p.notes}.flatten
  end

end