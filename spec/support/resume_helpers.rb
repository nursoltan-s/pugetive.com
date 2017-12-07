module ResumeHelpers
  def setup_resume
    setup_pugetive
    setup_software
    setup_contact_info
  end
end

def setup_contact_info
  create(:email)
  create(:phone)
end

RSpec.configure do |c|
  c.include ResumeHelpers
end
