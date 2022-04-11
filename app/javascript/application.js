// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import feather from "feather-icons";
import "flowbite";

document.addEventListener("turbo:load", () => {
  feather.replace();
});
