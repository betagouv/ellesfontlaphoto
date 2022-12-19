import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["loader", "button"]

  submit() {
    this.loaderTarget.style.display = "block"
    this.buttonTarget.style.display = "none"
  }
}
