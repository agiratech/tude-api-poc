class UserMailer < ActionMailer::Base
   default from: "agiratech.test1@gmail.com"

  def send_status_mail(response)
    @response = response["jobs"]
    mail(to: "bharani@agiratech.com", subject: 'Scraping hub status summary')
  end
end
