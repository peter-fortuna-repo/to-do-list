class EmailGroupMailer < ApplicationMailer
    default from: Rails.application.credentials.gmail[:user]

    def group_email(email_group)
        @email_group = email_group
        to = @email_group.users.pluck(:email)
        bootstrap_mail(
            to: to,
            subject: @email_group.name,
            from: Rails.application.credentials.gmail[:user]
        )
    end

end