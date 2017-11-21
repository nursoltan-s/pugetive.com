namespace :s3 do

  task sync: [:sync_staging, :sync_development]

  task :sync_staging do
    sync_to(:staging)
  end

  task :sync_development do
    sync_to(:development)
  end

  private
    def sync_to(environment_token)
      unless system("aws s3 sync s3://#{CONFIG[:production][:s3_images_bucket]} s3://#{CONFIG[environment_token][:s3_images_bucket]} --delete")
        puts "Error occured while attempting to sync S3 images."
        puts "Make sure you have AWS CLI installed (http://docs.aws.amazon.com/cli/latest/userguide/installing.html)"
      end
    end

end