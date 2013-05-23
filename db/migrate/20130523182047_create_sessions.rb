class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :session_cookie

      t.timestamps
    end
  end
end
