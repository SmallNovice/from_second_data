class AddColumnToVaccinationForms < ActiveRecord::Migration[6.1]
  def change
    add_column :vaccination_forms, :response_id, :integer
  end
end
