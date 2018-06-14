class UserMailer < ApplicationMailer


    def welcome_email(user)
        @user = user
       @url  = 'http://example.com/login'
        mail(to: @user, subject: 'Welcome to My Awesome Site') do |format|
            format.html
        end

    
    end

end
