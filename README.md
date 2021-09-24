# Admnistrative APP for a Driving School

Administrative program based on Rails + Postgresql to keep track of 

## Features in this app
 - Driving instructors with the car

 - Postgresql
 - Tailwindcss 2.0
 - Rails 6.1.4.1
 - Ruby 3.0.2
 - Puppeteer 10.2.0
 - bcrypt 3.1.7
 - will_paginate 3.1

gem 'grover', '~> 1.0', '>= 1.0.3'

 Tailwind requires PostCSS 8, and Rails 6 has not updated yet. Thanks to their documentation, we can easily fix this issue by installing Tailwind's compatibility build. Just run the following to fix it:
```
 npm uninstall tailwindcss postcss autoprefixer
 npm install -D tailwindcss@npm:@tailwindcss/postcss7-compat @tailwindcss/postcss7-compat postcss@^7 autoprefixer@^9
```

How to run this project:
 - Clone project
 - Run bundle install
 - Run 'yarn add tailwindcss'
 - Create 'tailwindbase' role in postgresql
 - Run 'rails assets:precompile'
 - Run 'rails s -e production'
 