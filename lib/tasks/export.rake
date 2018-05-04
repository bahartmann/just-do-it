namespace :export do
  require 'csv'

  desc "export done tasks events to CSV"
  task export_done_tasks: :environment do

    dir = "#{Rails.root}/exports"
    FileUtils.mkdir(dir) unless Dir.exists?(dir)

    file_path = "#{dir}/#{Time.now.strftime("%Y%m%d%H%M%S")}.csv"

    CSV.open(file_path, "wb") do |csv|
      csv << ["user", "message_color", "message_text", "done_at"]

      Event.where(event_type: "task_done").find_each do |event|
        csv << [ event.user.name,
                event.payload["message_color"],
                event.payload["message_text"],
                event.created_at ]
      end
    end
    puts "Your CSV file is in #{file_path}"
  end
end
