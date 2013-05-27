class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def sendmail(email_to, subject, message)
    @message = message
    @subject = subject
    mail(:subject => subject, :from => "admin@0830pk.com", :to => email_to) do |format|
      format.html
    end
  end
end
