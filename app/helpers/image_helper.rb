module ImageHelper

  def thumbnail(work)
    if work.instagram_id.present?
      return instagram_thumbnail(work.instagram_id)
    elsif work.flickr_id.present?
      return flickr_thumbnail(work.flickr_id)
    end
  end

  def instagram_thumbnail(instagram_id)
    image_tag(instagram_url(instagram_id, 't'))
  end

  def flickr_thumbnail(flickr_id)
    # url_s : Square
    # url_q : Large Square
    # url_t : Thumbnail
    # url_m : Small
    # url_n : Small 320
    # url   : Medium
    # url_z : Medium 640
    # url_c : Medium 800
    # url_b : Large
    # url_o : Original
    # info = flickr.photos.getInfo(photo_id: flickr_id)
    info = {"id"=>"340284990", "secret"=>"0b12d7dea4", "server"=>"53", "farm"=>1, "dateuploaded"=>"1167617955", "isfavorite"=>0, "license"=>"2", "safety_level"=>"0", "rotation"=>0, "originalsecret"=>"0b12d7dea4", "originalformat"=>"jpg", "owner"=>{"nsid"=>"12422619@N00", "username"=>"pugetive", "realname"=>"Todd Gehman", "location"=>"Brooklyn, NY, USA", "iconserver"=>"1070", "iconfarm"=>2, "path_alias"=>"pugetive"}, "title"=>"Reflection in Flowers Bar, Seattle, 2006", "description"=>"", "visibility"=>{"ispublic"=>1, "isfriend"=>0, "isfamily"=>0}, "dates"=>{"posted"=>"1167617955", "taken"=>"2006-12-31 18:15:55", "takengranularity"=>"0", "takenunknown"=>0, "lastupdate"=>"1196105637"}, "views"=>"253", "editability"=>{"cancomment"=>0, "canaddmeta"=>0}, "publiceditability"=>{"cancomment"=>1, "canaddmeta"=>0}, "usage"=>{"candownload"=>1, "canblog"=>0, "canprint"=>0, "canshare"=>1}, "comments"=>"0", "notes"=>[], "people"=>{"haspeople"=>0}, "tags"=>[{"id"=>"64355-340284990-696793", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"flowers bar", "_content"=>"flowersbar", "machine_tag"=>0}, {"id"=>"64355-340284990-7619980", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"flowers restaurant", "_content"=>"flowersrestaurant", "machine_tag"=>0}, {"id"=>"64355-340284990-69", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"seattle", "_content"=>"seattle", "machine_tag"=>0}, {"id"=>"64355-340284990-55916", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"university district", "_content"=>"universitydistrict", "machine_tag"=>0}, {"id"=>"64355-340284990-27708", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"homework", "_content"=>"homework", "machine_tag"=>0}, {"id"=>"64355-340284990-1211", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"bar", "_content"=>"bar", "machine_tag"=>0}, {"id"=>"64355-340284990-329", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"favorite", "_content"=>"favorite", "machine_tag"=>0}, {"id"=>"64355-340284990-27075", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"portfolio", "_content"=>"portfolio", "machine_tag"=>0}, {"id"=>"64355-340284990-96", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"leica", "_content"=>"leica", "machine_tag"=>0}, {"id"=>"64355-340284990-2294333", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"fall 2006", "_content"=>"fall2006", "machine_tag"=>0}, {"id"=>"64355-340284990-147878", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"final project", "_content"=>"finalproject", "machine_tag"=>0}, {"id"=>"64355-340284990-1177276", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"leica m3", "_content"=>"leicam3", "machine_tag"=>0}, {"id"=>"64355-340284990-8394646", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"vertical project", "_content"=>"verticalproject", "machine_tag"=>0}], "urls"=>[{"type"=>"photopage", "_content"=>"https://www.flickr.com/photos/pugetive/340284990/"}], "media"=>"photo"}
    # info = JSON.parse(info_string)
    image_tag(FlickRaw.url_q(info))


  end

  private
    def instagram_url(instagram_id, size = 'l')
      "https://instagram.com/p/#{instagram_id}/media/?size=#{size}"
    end
end


# {"id"=>"340284990", 
#  "secret"=>"0b12d7dea4", 
#  "server"=>"53", 
#  "farm"=>1, 
#  "dateuploaded"=>"1167617955", 
#  "isfavorite"=>0, 
#  "license"=>"2", 
#  "safety_level"=>"0", 
#  "rotation"=>0, 
#  "originalsecret"=>"0b12d7dea4", 
#  "originalformat"=>"jpg", 
#  "owner"=>{
#     "nsid"=>"12422619@N00", 
#     "username"=>"pugetive", 
#     "realname"=>"Todd Gehman", 
#     "location"=>"Brooklyn, NY, USA",
#     "iconserver"=>"1070", 
#     "iconfarm"=>2, 
#     "path_alias"=>"pugetive"}, 
#   "title"=>"Reflection in Flowers Bar, Seattle, 2006", 
#   "description"=>"", 
#   "visibility"=>{
#     "ispublic"=>1, 
#     "isfriend"=>0, 
#     "isfamily"=>0}, 
#   "dates"=>{
#     "posted"=>"1167617955", 
#     "taken"=>"2006-12-31 18:15:55", 
#     "takengranularity"=>"0", 
#     "takenunknown"=>0, 
#     "lastupdate"=>"1196105637"}, 
#   "views"=>"253", 
#   "editability"=>{
#     "cancomment"=>0, 
#     "canaddmeta"=>0}, 
#   "publiceditability"=>{
#     "cancomment"=>1, 
#     "canaddmeta"=>0}, 
#   "usage"=>{
#     "candownload"=>1, 
#     "canblog"=>0, 
#     "canprint"=>0, 
#     "canshare"=>1}, 
#   "comments"=>"0", 
#   "notes"=>[], 
#   "people"=>{
#     "haspeople"=>0}, 
#   "tags"=>[
#     {"id"=>"64355-340284990-696793", 
#      "author"=>"12422619@N00", 
#      "authorname"=>"pugetive", 
#      "raw"=>"flowers bar", 
#      "_content"=>"flowersbar", 
#      "machine_tag"=>0}, 
#     {"id"=>"64355-340284990-7619980", 
#      "author"=>"12422619@N00", 
#      "authorname"=>"pugetive", 
#      "raw"=>"flowers restaurant", 
#      "_content"=>"flowersrestaurant", 
#      "machine_tag"=>0}, 
#     {"id"=>"64355-340284990-69", 
#      "author"=>"12422619@N00", 
#      "authorname"=>"pugetive", 
#      "raw"=>"seattle", 
#      "_content"=>"seattle", 
#      "machine_tag"=>0}, 
#     {"id"=>"64355-340284990-55916", 
#      "author"=>"12422619@N00", 
#      "authorname"=>"pugetive", 
#      "raw"=>"university district", 
#      "_content"=>"universitydistrict", 
#      "machine_tag"=>0}, 
#     {"id"=>"64355-340284990-27708", 
#      "author"=>"12422619@N00", 
#      "authorname"=>"pugetive", 
#      "raw"=>"homework", 
#      "_content"=>"homework", 
#      "machine_tag"=>0}, 
#     {"id"=>"64355-340284990-1211", 
#      "author"=>"12422619@N00", 
#      "authorname"=>"pugetive", 
#      "raw"=>"bar", 
#      "_content"=>"bar", 
#      "machine_tag"=>0}, 
#     {"id"=>"64355-340284990-329", 
#      "author"=>"12422619@N00", 
#      "authorname"=>"pugetive", 
#      "raw"=>"favorite", 
#      "_content"=>"favorite", 
#      "machine_tag"=>0}, 
#     {"id"=>"64355-340284990-27075", 
#      "author"=>"12422619@N00",
#      "authorname"=>"pugetive", 
#      "raw"=>"portfolio", 
#      "_content"=>"portfolio", 
#      "machine_tag"=>0}, {"id"=>"64355-340284990-96", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"leica", "_content"=>"leica", "machine_tag"=>0}, {"id"=>"64355-340284990-2294333", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"fall 2006", "_content"=>"fall2006", "machine_tag"=>0}, {"id"=>"64355-340284990-147878", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"final project", "_content"=>"finalproject", "machine_tag"=>0}, {"id"=>"64355-340284990-1177276", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"leica m3", "_content"=>"leicam3", "machine_tag"=>0}, {"id"=>"64355-340284990-8394646", "author"=>"12422619@N00", "authorname"=>"pugetive", "raw"=>"vertical project", "_content"=>"verticalproject", "machine_tag"=>0}], "urls"=>[{"type"=>"photopage", "_content"=>"https://www.flickr.com/photos/pugetive/340284990/"}], "media"=>"photo"}