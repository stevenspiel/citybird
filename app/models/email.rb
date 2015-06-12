class Email
  API_KEY = ENV['MAILGUN_API_KEY']
  API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/sandbox57336.mailgun.org"

  def self.send_message(message)
    RestClient.post API_URL+"/messages", message
  end


  def self.new_request(sender, recipient, html, subject, reply_to)
    # text = strip_tags(html)

    message = {
      to: recipient.email,
      html: html,
      from: 'citybird@sandbox57336.mailgun.org',
      subject: subject,
      "h:ReplyTo" => reply_to
    }
    self.send_message(message)
  end

  def self.send_reminder
    root = DOMAIN
    html = ActionController::Base.new().render_to_string(template: '/emails/reminder', layout: false, locals: {:root=>root})
    recipients = Meetup.pending_meetups
    message = { to: recipients.keys, html: html, from: 'citybird@sandbox57336.mailgun.org',
      subject: 'Message from City Bird: Upcoming Meetup', recipientvariables: recipients.to_json }
    self.send_message(message)
  end

  def self.request_review
    root = DOMAIN
    html = ActionController::Base.new().render_to_string(template: '/emails/review', layout: false, locals: {:root=>root})
    recipients = Meetup.completed_meetups
    message = { to: recipients.keys, html: html, from: 'citybird@sandbox57336.mailgun.org',
      subject: 'Message from City Bird: Rate Your Experience', recipientvariables: recipients.to_json }
    self.send_message(message)
  end
end


