class EmailGroupMailer < ApplicationMailer
    default from: "TODO@gmail.com"
    def email_group
        bootstrap_mail()
    end

end