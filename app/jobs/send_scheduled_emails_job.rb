class SendScheduledEmailsJob < ApplicationJob
    def perform
        puts "Starting SendScheduledEmailsJob at #{Time.now}"
        EmailGroup.find_each do |group|
            if (group.day_of_week == "Daily" || group.day_of_week == Date.today.strftime("%A") + "s") && group.time_of_day[0, 2] == Time.now.strftime("%H")
                puts "Sending email for group: #{group.name}"
                EmailGroupMailer.group_email(group).deliver_later
            end
        end
    end
end