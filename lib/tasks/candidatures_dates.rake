namespace :candidature_dates do
  desc "Traduire les dates de candidatures en objet"
  task create: :environment do
    puts "creating candidature_dates"
    Help.all.each do |help|
      new_candidature_date = CandidatureDate.new(start_date: help.start_date, end_date: help.end_date, help: help)
      new_candidature_date.save
    end
  end
  task update: :environment do
    puts "updating start_date end_date in helps"
    Help.all.each do |help|
      next_date = help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first
      if help.permanent?
        help.update(start_date: Date.today + 31, end_date: Date.today + 31)
      elsif next_date.nil?
        help.update(start_date: nil, end_date: nil)
      else
        help.update(start_date: next_date.start_date, end_date: next_date.end_date)
      end
    end
  end
end
