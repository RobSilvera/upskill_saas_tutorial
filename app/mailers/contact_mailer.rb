class ContactMailer< ActionMailer::Base
    default to: 'chundo@dogvox.com'
    def contact_email (name, email, body)
      @name = name
      @email = email
      @body = body
      mail(from: email, subject: "Dog Match Contact")
    end
end