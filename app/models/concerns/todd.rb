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

    def address
      Address.first
    end

    def jobs
      Company.all.sort_by{|c| c.start_year}.reverse
    end

    def side_projects
      Project.amateur
    end

    def linkedin
      Account.find_by_company('LinkedIn')
    end

    def one_liner
      user.one_liner
    end

    def summary
      user.summary
    end

    def objective
      user.objective
    end

    def update(attribute, value)
      user.update_attribute(attribute, value)
    end

    private

      def user
        User.find(1)
      end

end
