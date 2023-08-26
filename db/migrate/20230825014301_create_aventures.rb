class CreateAventures < ActiveRecord::Migration[7.0]
  def change
    create_table :aventures do |t|
      t.string :name

      t.timestamps
    end
  end
end
