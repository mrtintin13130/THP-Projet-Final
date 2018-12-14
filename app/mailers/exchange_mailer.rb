class ExchangeMailer < ApplicationMailer

    def exchange_applicant_email(applicant_article_title, owner_article_title, applicant_first_name, owner_first_name, applicant_email, owner_email)
      @applicant_article_title = applicant_article_title
      @owner_article_title = owner_article_title
      @applicant_first_name = applicant_first_name
      @owner_first_name = owner_first_name
      @applicant_email = applicant_email
      @owner_email = owner_email
      mail(to: 'lejub@zdfpost.net', subject: 'échange réussi')
    end

    def exchange_owner_email(applicant_article_title, owner_article_title, applicant_first_name, owner_first_name, applicant_email, owner_email)
      mail(to: owner_email, subject: 'échange réussi')
    end
end
