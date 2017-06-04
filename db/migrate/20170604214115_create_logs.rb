class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.datetime :created_at
      t.decimal :temperature
      t.decimal :moisture
      t.decimal :pressure
      t.decimal :brightness
      t.decimal :noise
    end
  end
end
