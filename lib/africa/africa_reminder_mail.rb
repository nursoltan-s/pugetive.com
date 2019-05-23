require 'csv'
require 'mail'

OFFSET_PAGES = 710

gpass = YAML.load_file("config/pugetive.yml")['production']['gmail_app_key']
options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :user_name            => 'toddgehman@gmail.com',
            :password             => gpass,
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

Mail.defaults do
  delivery_method :smtp, options
end


class AfricaReminderMail

  attr_reader :log_csv, :num_days, :headers

  def initialize
    @log_csv = CSV.read("#{File.dirname(__FILE__)}/africa-log.csv")
    @headers = @log_csv.shift
    @num_days = @log_csv.size

    mail_todays_reminder
  end

  def mail_todays_reminder
    contents = contents_for_index(days_index)

    contents += "Trailmix:\nhttps://www.trailmix.life/entries?page=#{trailmix_offset}"
    Mail.deliver do
           to 'toddgehman@gmail.com'
         from 'toddgehman@gmail.com'
      subject 'Daily Skeleton Coast Log'
         body contents
    end
  end

  def trailmix_offset
    OFFSET_PAGES
  end

  def contents_for_index(index)
    rv = "Date : #{log_csv[index][1]}\n"
    (0..headers.size - 1).each do |j|
        rv += "\t #{@headers[j]}\n"
        rv += "\t\t #{@log_csv[index][j]}\n"
    end
    rv
  end

  def days_index(date = Date.today)
    adjusted_index = days_since_epoch(date) + 61
    (adjusted_index % num_days)
  end

  def days_since_epoch(date = Date.today)
    date.to_time.to_i / (60 * 60 * 24)
  end

  private

  def dump_all_days
    (0..364).each do |i|
      date = Date.today + i
    end
  end

end

AfricaReminderMail.new
