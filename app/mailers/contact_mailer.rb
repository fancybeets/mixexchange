class ContactMailer < ActionMailer::Base
    default to: "hobo1990@gmail.com"
    def contact_email(name,email,body)
        @name = name
        @email = email
        @body = body
        
        mail(from: email,subject: "Contact from #{@name}")
    end
end