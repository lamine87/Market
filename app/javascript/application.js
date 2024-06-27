// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// app/javascript/packs/application.js
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
// Initialization for ES Users
import { Ripple, initMDB } from "mdb-ui-kit";


Rails.start()
Turbolinks.start()
ActiveStorage.start()
initMDB({ Ripple });