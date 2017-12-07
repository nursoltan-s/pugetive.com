module SoftwareHelpers

  def setup_software
    developer = create(:title, name: 'Developer', category: 'Software')
    founder =   create(:title, name: 'Founder',   category: 'Software')


    amazon = create(:app,
                    name: 'amazon.com',
                    favorite: true,
                    start_year: 1998,
                    stop_year: 2004)

    fair_app   = create(:app,
                        name: 'fair.org',
                        favorite: true,
                        start_year: 2015,
                        stop_year: nil)

    things = create(:app,
                    name: '43 Things',
                    favorite: true,
                    start_year: 2004,
                    stop_year: 2009)

    mw     = create(:app,
                    name: "Major White",
                    favorite: false,
                    start_year: 2006,
                    stop_year: 2010)
    hopville = create(:app, name: 'Hopville', favorite: true)

    amazon.titles   << developer
    fair_app.titles     << developer
    things.titles   << developer
    mw.titles       << developer
    hopville.titles << developer
    hopville.titles << founder

    c         = create(:tool, name: 'C',         type: 'Language', category: 'Software', resume: true)
    perl      = create(:tool, name: 'Perl',      type: 'Language', category: 'Software', resume: true)
    php       = create(:tool, name: 'PHP',       type: 'Language', category: 'Software', resume: true)
    catsubst  = create(:tool, name: 'Catsubst',  type: 'Language', category: 'Software', resume: false)

    emacs     = create(:tool, name: 'Emacs',     type: 'Program',  category: 'Software', resume: false)
    sublime   = create(:tool, name: 'Sublime',   type: 'Program',  category: 'Software', resume: false)

    wordpress = create(:tool, name: 'Wordpress', type: 'System',   category: 'Software', resume: true)

    amazon.tools << c
    amazon.tools << perl
    amazon.tools << emacs
    amazon.tools << catsubst

    fair_app.tools << php
    fair_app.tools << wordpress
    fair_app.tools << sublime

    fair_org = create(:party, name: 'FAIR', type: 'NonProfit')
  end

end

RSpec.configure do |c|
  c.include SoftwareHelpers
end
