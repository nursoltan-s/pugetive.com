class CreateAdmin < ActiveRecord::Migration
  def change
    User.create!(email: 'toddgehman@gmail.com',
                 password: 'v1ct0r97')
  end
end
