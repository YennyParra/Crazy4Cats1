class CreateCatcomments < ActiveRecord::Migration[7.0]
  def change
    create_table :catcomments do |t|
      t.string :content
      t.references :article, null: false, foreign_key: true
      t.references :catuser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
