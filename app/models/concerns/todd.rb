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

    def languages(fluency_cutoff = 0, years_of_recency = 20)
      recency_cutoff = Time.now.year - years_of_recency
      Tool.languages.sort_by{|l| l.name}.delete_if{|l| (l.fluency < fluency_cutoff) or
                                                       (l.last_used_year < recency_cutoff)}
    end

    def primary_languages
      @primary_languages ||= languages(2, 5).delete_if{|l| l.name.match(/Perl/)}
    end

    def secondary_languages
      @seconary_languages ||= (languages - primary_languages)
    end

    def systems(fluency_cutoff = 0, years_of_recency = 20)
      recency_cutoff = Time.now.year - years_of_recency
      Tool.systems.sort_by{|s| s.name}.delete_if{|s| (s.fluency < fluency_cutoff) or
                                                      (s.last_used_year < recency_cutoff)}
    end

    def primary_systems
      @primary_systems ||= systems(2, 5).delete_if{|s| s.name.match(/^Rails/) or
                                                       s.name.match(/Hosting/)}
    end

    def secondary_systems
      @secondary_systems ||= (systems - primary_systems)
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
