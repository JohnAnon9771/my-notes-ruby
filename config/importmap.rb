# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "feather-icons", to: "https://ga.jspm.io/npm:feather-icons@4.28.0/dist/feather.js"
pin "flowbite", to: "https://unpkg.com/flowbite@1.4.1/dist/flowbite.js"
