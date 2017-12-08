module PhotographyHelpers

  def setup_photography
    return if Gallery.any?
    portraits = create(:gallery, name: 'Portaits Portfolio')
    animals   = create(:gallery, name: 'Animals Series')
    abstract  = create(:gallery, name: 'Abstract Portfolio')
    street    = create(:gallery, name: 'Street Phography Portfolio')
    empty     = create(:gallery, name: 'Empty Gallery')

    instagram = create(:account, name: 'Instagram', interest_id: PHOTOGRAPHY_INTEREST_ID, start_year: 2010, stop_year: nil)
    flickr    = create(:account, name: 'Flickr',    interest_id: PHOTOGRAPHY_INTEREST_ID, start_year: 2012, stop_year: 2014)

    ['Second Avenue', 'Trees in St Ignatius', 'Salk Exit'].each do |name|
      photo = create(:photo, name: name)
      abstract.photos << photo
    end

    ['Kaela', 'Nikki', 'Katherine', 'Kate'].each do |name|
      photo = create(:photo, name: name)
      portraits.photos << photo
    end

    ['Donkey at Grand Canyon', 'Utah Bull', 'Faroe Island Goat'].each do |name|
      photo = create(:photo, name: name)
      animals.photos << photo
    end

    photo = create(:photo, name: 'Tenderloin Pedestrian')
    street.photos << photo

  end

end

RSpec.configure do |c|
  c.include PhotographyHelpers
end
