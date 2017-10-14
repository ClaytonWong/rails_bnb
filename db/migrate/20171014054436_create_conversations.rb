class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :guest, foreign_key: { to_table: :users }
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
