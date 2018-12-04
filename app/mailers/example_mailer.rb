Class ExampleMailer < ApplicationMailer
default from: "streetwearandtrading@gmail.com"   
    def send_email(user)
        @user = user
        mail(to: user.email, subject: 'Bienvenue')
    end    
    def notify_email(message)

    end
end
