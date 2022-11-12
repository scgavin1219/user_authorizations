class CreateAddSessionTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :add_session_token_to_users do |t|
      
      t.timestamps
    end
  end
end
