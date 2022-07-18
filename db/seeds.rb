# AdminUser.create!(email: "admin@example.fr", password: "password")

require "csv"
filepath = File.join(Rails.root, 'db', 'organizations_data.csv')
Organization.destroy_all

CSV.foreach(filepath, headers: :first_row) do |row|
  p row["organization_type"]
  orga = Organization.new(
    organization_type: row["organization_type"],
    name: row["name"],
    city: row["city"],
    nb_women_dir: row["nb_women_dir"],
    total_nb_dir: row["total_nb_dir"],
    nb_women_expos: row["nb_women_expos"],
    total_nb_expos: row["total_nb_expos"]
  )

  if orga.nb_women_dir && orga.total_nb_dir
    orga.dir_parity = orga.nb_women_dir.fdiv(orga.total_nb_dir) >= 0.5
  end

  if orga.nb_women_expos && orga.total_nb_expos
    orga.expos_parity = orga.nb_women_expos.fdiv(orga.total_nb_expos) >= 0.5
  end


  if orga.dir_parity == nil
    orga.score_parity = orga.expos_parity ? 2 : 0
  elsif orga.expos_parity == nil
    orga.score_parity = orga.dir_parity ? 2 : 0
  elsif orga.dir_parity && orga.expos_parity
    orga.score_parity = 2
  elsif orga.dir_parity || orga.expos_parity
    orga.score_parity = 1
  else
    orga.score_parity = 0
  end
  orga.save
end
