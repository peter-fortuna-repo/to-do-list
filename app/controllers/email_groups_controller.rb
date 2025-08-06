class EmailGroupsController < ApplicationController
    def index
        @new_email_group = EmailGroup.new
        @all_email_groups = EmailGroup.all
    end

    def show
        @email_group = EmailGroup.find(params[:id])
    end

    def create
        @email_group = EmailGroup.new(email_group_params)
        if @email_group.save
            redirect_to email_groups_path #TO DO: redirect to show(@email_group)
        else
            Rails.logger.debug @email_group.errors.full_messages
            flash.now[:alert] = "Unable to create email_group"
            redirect_to email_groups_path
        end
    end

    def update
        @email_group = EmailGroup.find(params[:id])
        if !@email_group.update(email_group_params)
            flash.now[:alert] = "Error updating email_group"
        end
    end

    def subscribe
        subscription = UsersEmailGroup.new(email_group_id: params[:id], user_id: params[:user_id])
        if !subscription.save
            flash[:alert] = "Unable to subscribe"
        end
        redirect_back(fallback_location: email_groups_path)
    end

    def unsubscribe
        subscription = UsersEmailGroup.find_by(email_group_id: params[:id], user_id: params[:user_id])
        if !subscription.delete
            flash[:alert] = "Error encountered unsubscribing"
        end
        redirect_back(fallback_location: email_groups_path)
    end


    def destroy
        email_group = EmailGroup.find(params[:id])
        email_group.destroy
        redirect_to email_groups_path
    end

    def send_gmail
        old_settings = ActionMailer::Base.smtp_settings
        ActionMailer::Base.smtp_settings = Rails.application.config.action_mailer.smtp_settings
        email_group = EmailGroup.find(params[:id])
        EmailGroupMailer.group_email(email_group).deliver_later
        flash[:notice] = "Email sent to group"
        ActionMailer::Base.smtp_settings = old_settings
        redirect_to email_groups_path
    end

    def send_test_email
        original_delivery_method = ActionMailer::Base.delivery_method
        original_settings = ActionMailer::Base.smtp_settings
        ActionMailer::Base.delivery_method = :letter_opener
        email_group = EmailGroup.find(params[:id])
        EmailGroupMailer.group_email(email_group).deliver_now
        flash[:notice] = "Email opened in browser"
        ActionMailer::Base.smtp_settings = original_settings
        ActionMailer::Base.delivery_method = original_delivery_method
    end

    private
    def email_group_params
        permitted = params.expect(email_group: %i[name creator_id body day_of_week time_of_day private])
        permitted[:private] = ActiveModel::Type::Boolean.new.cast(permitted[:private])
        permitted

    end
end