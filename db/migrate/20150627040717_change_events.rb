class ChangeEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.references :registered_application, index: true, foreign_key: true
    end
  end
end
