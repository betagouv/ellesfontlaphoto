import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ["form",
  "loader",
  "count",
  "label",
  "div",
  "divform",
  "divtelechargement",
  "divdossier",
  "cross",
  "emailinput",
  "messageinput",
  "submit",
  "engagementinput",
  "conditionsinput",
  "errorEmail"
  ]

  submit() {
    this.divformTarget.style.display = "none"
    this.loaderTarget.style.display = "block"
    event.preventDefault();

    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { 'Accept': 'text/plain', 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)
    })
    .then(response => response.text())
    .then((data) => {
		  this.divformTarget.style.display = "block"
		  this.loaderTarget.style.display = "none"
	  	this.formTarget.outerHTML = data
    })
  }

  checkEmail() {
    if (new RegExp(/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/).test(this.emailinputTarget.value)) {
      this.errorEmailTarget.style.display = "none"
    } else {
      this.errorEmailTarget.style.display = "block"
    }
  }

  upload(event) {
    this.divtelechargementTarget.style.display = "none"
    this.divdossierTarget.style.display = "flex"
    this.labelTarget.innerHTML = event.currentTarget.files[0].name
    this.disableButton()
  }

  delete() {
    this.divtelechargementTarget.style.display = "flex"
    this.divdossierTarget.style.display = "none"
    this.labelTarget.innerHTML = ""
  }

  disableButton() {
    if (this.engagementinputTarget.checked && this.conditionsinputTarget.checked && this.labelTarget.innerHTML != "" && this.emailinputTarget.value != "" && new RegExp(/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/).test(this.emailinputTarget.value) ) {
      this.submitTarget.disabled = false;
    } else {
      this.submitTarget.disabled = true;
    }
  }
}
