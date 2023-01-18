namespace :candidature_dates do
  desc "Traduire les dates de candidatures en objet"
  # task create: :environment do
  #   puts "creating candidature_dates"
  #   Help.all.each do |help|
  #     new_candidature_date = CandidatureDate.new(start_date: help.start_date, end_date: help.end_date, help: help)
  #     new_candidature_date.save
  #   end
  # end
  task update: :environment do
    puts "updating start_date end_date in helps"
    Help.all.each do |help|
      next_date = help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first
      if help.permanent?
        help.update(start_date: Date.today + 31.days, end_date: Date.today + 31.days)
      elsif next_date.nil? || next_date.end_date < Date.today || help.end_date < Date.today
        help.update(start_date: nil, end_date: nil)
      else
        help.update(start_date: next_date.start_date, end_date: next_date.end_date)
      end
      if help.permanent
        help.update(open: true)
      elsif next_date.nil? || next_date.start_date > Date.today
        help.update(open: false)
      elsif next_date.start_date <= Date.today && Date.today <= next_date.end_date
        help.update(open: true)
        NotificationHelp.where(help: help, sent: false).each do |notification|
          HelpMailer.send_notification(notification).deliver_later
          notification.update(sent: true)
        end
      else
        help.update(open: false)
      end
    end
  end
end
