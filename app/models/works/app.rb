class App < Work
  belongs_to :author, class_name: 'Developer'

end