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
  "engagementinput"
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

  upload(event) {
    console.log("upload")
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
    if (this.engagementinputTarget.checked && this.labelTarget.innerHTML != "" && this.emailinputTarget.value != "" ) {
      this.submitTarget.disabled = false;
    }
  }
}
