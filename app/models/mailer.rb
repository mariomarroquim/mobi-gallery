class Mailer < ActionMailer::Base

  def file(sender_name, receiver_email, type, file)
    from "#{sender_name} <noreply@XXX.com>"
    recipients receiver_email
    subject "#{sender_name} sent you a picture"
    body :sender_name => sender_name, :type => type, :file => file
  end

  def email(sender_name, sender_email, message)
    from "#{sender_name} <#{sender_email}>"
    recipients "XXX@.com"
    subject "[MobiGallery] #{sender_name} sent you a message"
    body :sender_name => sender_name, :sender_email => sender_email, :message => message
  end

end
