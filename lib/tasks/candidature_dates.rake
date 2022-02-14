namespace :candidature_dates do
  desc "Traduire les dates de candidatures en objet"
  task create: :environment do
    puts "creating candidature_dates"
    Help.all.each do |help|
      new_candidature_date = CandidatureDate.new(start_date: help.start_date, end_date: help.end_date, help: help)
      new_candidature_date.save
    end
  end
end
