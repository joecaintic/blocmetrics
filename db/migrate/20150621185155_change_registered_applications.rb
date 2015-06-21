class ChangeRegisteredApplications < ActiveRecord::Migration
  def change
    change_table :registered_applications do |t|
      t.references :user, index: true, foreign_key: true
    end
  end
end
