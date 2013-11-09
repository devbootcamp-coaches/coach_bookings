class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.integer :socrates_id
      t.string  :email
      t.integer :cohort_id
      t.boolean :coach


      t.timestamps
    end
  end
end
