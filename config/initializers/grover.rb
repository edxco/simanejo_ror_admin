# frozen_string_literal: true

Grover.configure do |config|
  config.use_pdf_middleware = true
  config.options = {
    format: 'A4',
    margin: {
      top: '5px',
      bottom: '5px'
    },
    viewport: {
      width: 612,
      height: 1500
    },
    prefer_css_page_size: true,
    emulate_media: 'screen',
    cache: false,
    print_background: true,
    timeout: 0, # Timeout in ms. A value of `0` means 'no timeout'
    launch_args: ['--font-render-hinting=medium', '--lang=add es-MX'], #For Japanese display--lang=add ja
    wait_until: 'domcontentloaded'
  }
end