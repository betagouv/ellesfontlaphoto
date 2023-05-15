import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["bouton", "input", "form", "list", "inputType"]

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
    this.submitform();
    // this.formTarget.submit()
  }

  submitform() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}&type=${this.inputTypeTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.innerHTML = data
      })
  }

  selectCriteria(event) {
    event.currentTarget.classList.toggle("selected")
    event.currentTarget.querySelector(".cross-criteria").classList.toggle("display-inline")
    if(this.inputTypeTarget.value.includes(event.currentTarget.dataset.text)) {
      this.inputTypeTarget.value = this.inputTypeTarget.value.replace(`${event.currentTarget.dataset.text},`, "")
    } else {
      this.inputTypeTarget.value += event.currentTarget.dataset.text + ","
    }
    this.submitform();
    // this.formTarget.submit()
  }

  check() {
    if (this.inputTarget.value == "") {
      this.boutonTarget.classList.remove("croix")
      this.boutonTarget.classList.add("loupe")
    }
  }
}
