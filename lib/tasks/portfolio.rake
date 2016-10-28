namespace :portfolio do

  task :refresh do 
    Work.flickr.each do |work|
      work.refresh_flickr_urls
    end
  end
  
end