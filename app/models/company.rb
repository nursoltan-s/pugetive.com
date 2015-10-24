class Company < Party
  has_many :projects, foreign_key: 'party_id'

end