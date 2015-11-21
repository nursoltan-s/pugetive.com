class Todd

    # @emails = Email.all
    # @phones = Phone.all
    # @addresses = Address.all

    # @jobs = Company.all.sort_by{|c| c.start_year}.reverse
    # @side_projects = Project.amateur

    def email
      Email.first
    end

    def phone
      Phone.first
    end
end