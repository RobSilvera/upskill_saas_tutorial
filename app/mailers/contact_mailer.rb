class ContactMailer < ActionMailer::Base
  default to: 'chundo@dogvox.com'
    
  def contact_email(name, email, comments)
    @name = name
    @email = email
    @comments = comments
    mail(from: email, subject: 'Dog Match Contact')
  end
end