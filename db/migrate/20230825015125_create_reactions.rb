class CreateReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :reactions do |t|
      t.references :article, null: false, foreign_key: true
      t.references :catuser, null: false, foreign_key: true
      t.string :kind
      t.string :reaction_type
      t.references :catcomment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
