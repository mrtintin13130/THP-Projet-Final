class WelcomeMailer < ApplicationMailer
#default from: "streetwearandtrading@gmail.com"
    def welcome_send(user)
        @user = user
        mail to: user.email, subject: "Bienvenue", from: 'streetwearandtrading@gmail.com'
    end
    def comfirm_echange_email

    end
end
