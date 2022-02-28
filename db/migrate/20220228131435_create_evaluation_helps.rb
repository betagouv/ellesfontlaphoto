class CreateEvaluationHelps < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluation_helps do |t|
      t.references :help, null: false, foreign_key: true
      t.integer :eval_dossier
      t.integer :eval_dispositif

      t.timestamps
    end
  end
end
