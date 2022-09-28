import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form", "loader", "count", "label"]

  submit() {
    this.formTarget.style.display = "none"
    this.loaderTarget.style.display = "block"
  }

  upload(event) {
    this.labelTarget.innerHTML = event.currentTarget.files[0].name
  }
}
