import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["bouton", "input", "form", "list"]

  clear(event) {
    event.preventDefault()
    if (this.boutonTarget.classList.contains("croix")) {
      this.inputTarget.value = ""
      this.boutonTarget.classList.remove("croix")
      this.boutonTarget.classList.add("loupe")
    }
    else {
      this.boutonTarget.classList.remove("loupe")
      this.boutonTarget.classList.add("croix")
    }
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.innerHTML = data
      })
  }

  check() {
    if (this.inputTarget.value == "") {
      this.boutonTarget.classList.remove("croix")
      this.boutonTarget.classList.add("loupe")
    }
  }
}
