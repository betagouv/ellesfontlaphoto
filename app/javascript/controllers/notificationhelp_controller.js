import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ["modal", "form", "content", "checkbox", "button"]

  buttonEnable() {
    if (this.checkboxTarget.checked) {
      this.buttonTarget.disabled = false
    } else {
      this.buttonTarget.disabled = true
    }
  }

  create() {
    event.preventDefault();

    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { 'Accept': 'text/plain', 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)
    })
    .then(response => response.text())
    .then((data) => {
      this.contentTarget.outerHTML = data
    })
  }
}
