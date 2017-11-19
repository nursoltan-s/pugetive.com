# WickedPDF Global Configuration
#
# Use this to set up shared configuration options for your entire application.
# Any of the configuration options shown here can also be applied to single
# models by passing arguments to the `render :pdf` call.
#
# To learn more, check out the README:
#
# https://github.com/mileszs/wicked_pdf/blob/master/README.md


PDF_MARGIN = 5

if Rails.env == 'development'
  binary_path = "#{ENV['HOME']}/.rbenv/shims/wkhtmltopdf"
else
  binary_path = Rails.root.join('bin', 'wkhtmltopdf').to_s
end
WickedPdf.config = {
  #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
  #:layout => "pdf.html",
  # :exe_path => '/usr/local/bin/wkhtmltopdf'
  exe_path:     binary_path,
  disposition:  "inline",
  layout:       "pdf.html",
  zoom:         1.5,
  page_width:   '8.5in',
  page_height:  '11in',
  margin:       {top:     PDF_MARGIN,
                 bottom:  PDF_MARGIN,
                 left:    PDF_MARGIN,
                 right:   PDF_MARGIN}
}


# WickedPdf.config = {
#   # Path to the wkhtmltopdf executable: This usually isn't needed if using
#   # one of the wkhtmltopdf-binary family of gems.
#   # exe_path: '/usr/local/bin/wkhtmltopdf',
#   #   or
#   # exe_path: Gem.bin_path('wkhtmltopdf-binary', 'wkhtmltopdf')

#   # Layout file to be used for all PDFs
#   # (but can be overridden in `render :pdf` calls)
#   # layout: 'pdf.html',

# }
