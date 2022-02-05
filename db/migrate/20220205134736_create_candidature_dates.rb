class CreateCandidatureDates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidature_dates do |t|
      t.references :help
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
