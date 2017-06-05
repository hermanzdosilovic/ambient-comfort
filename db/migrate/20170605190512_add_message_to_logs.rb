class AddMessageToLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :logs, :message, :text
  end
end
