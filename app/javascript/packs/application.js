// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).on('turbolinks:load', function(event){
  var show = 3; //最初に表示する件数
  var num = 3;  //clickごとに表示したい件数
  var contents = '.list li'; //対象のlist
  $(contents + ':nth-child(n + ' + (show + 1) + ')').addClass('is-hidden');
  $('.more').on('click', function () {
    $(contents + '.is-hidden').slice(0, num).removeClass('is-hidden');
    if ($(contents + '.is-hidden').length == 0) {
      $('.more').fadeOut();
    }
  });
});