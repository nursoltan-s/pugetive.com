require 'csv'

class AfricaReminderMail

  attr_reader :log_csv, :num_days, :headers

  def initialize
    @log_csv = CSV.read("#{File.dirname(__FILE__)}/africa-log.csv")
    @headers = @log_csv.shift
    @num_days = @log_csv.size

    mail_todays_reminder
  end

  def mail_todays_reminder
    puts contents_for_index(days_index)
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
    (days_since_epoch(date) % num_days)
  end

  def days_since_epoch(date)
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
