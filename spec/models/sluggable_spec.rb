require 'rails_helper'
require 'active_support/core_ext/string'

describe Sluggable do

  before(:all) do
    setup_pugetive
  end

  it "uses a slug insteead of ID for a resource's path" do
    name = "New York Hustle"
    song = create(:song, name: name)
    expect(song.canonical_path).to include ActiveSupport::Inflector.parameterize(name)
  end

  it "removes apostrophes rather than turning them into dashes" do
    name = "Astrid's Eyes"
    song = create(:song, name: name)
    expect(song.canonical_path).to include "astrids"
  end

  def resource_name
    "Astrid's Eyes"
  end
end
