class CreateCandidatureDates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidature_dates do |t|
      t.references :help
      t.start_date :date
      t.end_date :date
      t.timestamps
    end
  end
end
