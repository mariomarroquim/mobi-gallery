class PagesController < ApplicationController

  def send_email
    if params[:sender_name].blank? or params[:sender_email].blank? or params[:message].blank?
      flash.now[:alert] = "Please, fill in all the fields!"
      render :action => :contact_us
      return
    end

    spawn do
      Mailer.deliver_email(params[:sender_name], params[:sender_email], params[:message])
    end

    flash[:success] = "Your email was sent!"
    redirect_to :action => :contact_us
  end

end
