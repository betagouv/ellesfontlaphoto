// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import { searchIndex } from '../plugins/search-index';
import { updateInput } from '../plugins/search-index';
import { changeResidence } from '../plugins/search-index';
// import { changeTypes } from '../plugins/search-index';

// Internal imports, e.g:
document.addEventListener('turbolinks:load', () => {
  if (document.querySelector("#select-search-residence")) {
    // if (document.getElementById("text-to-change-type")) {
    //   changeTypes();
    // }
    searchIndex();
    updateInput();
    // if (document.getElementById("text-to-change-residence")) {
    //   changeResidence();
    // }
  }
})
