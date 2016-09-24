namespace :resume do

  task :fresh do
    # input_url = "http://www.whatismyscreenresolution.com/"
    input_url = "'http://pugetive.com/todd-gehman-resume'"
    output_file = 'public/todd-gehman-resume.pdf'
    # kit = PDFKit.new('http://pugetive.com/resume')

    # PDFKit.configure do |config|
    #   config.default_options = {
    #     page_size: 'Letter',  
    #     custom_header: {'User-Agent' => "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; de-de) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4" }
    #     disable_smart_shrinking: false,
    #     # margin_top: "#{@margin_top}in",
    #     # margin_right: "#{@margin_right}in",
    #     # margin_bottom: "#{@margin_bottom}in",
    #     # margin_left: "#{@margin_left}in"
    #   }
    # end

    # pdf = kit.to_pdf
    # file = kit.to_file("public/todd-gehman-resume.pdf")

    system("wkhtmltopdf --page-size Letter --viewport-size 1280x1024 #{input_url} #{output_file}")
  end

end