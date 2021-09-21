class CreateHelps < ActiveRecord::Migration[6.1]
  def change
    create_table :helps do |t|
      t.string :title
      t.string :description
      t.string :sector
      t.string :structure_name
      t.string :start_date
      t.string :end_date
      t.string :help_amount
      t.string :residence_condition
      t.string :general_condition
      t.text :specific_condition
      t.string :candidate_url
      t.string :institution_url
      t.text :selection
      t.string :compo_commission
      t.string :url_commission
      t.string :old_laureat
      t.string :old_laureat_url
      t.string :help_type
      t.text :admin_attachment
      t.text :artistic_attachment
      t.text :other_attachment
      t.text :contact_institution
      t.string :contact_institution_url
      t.timestamps
    end
  end
end
