import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["loader", "button", "label"]

  upload(event) {
    console.log("upload")
    console.log(event.currentTarget.files[0])
    this.labelTarget.innerHTML = event.currentTarget.files[0].name
    this.disableButton()
  }

  submit() {
    this.loaderTarget.style.display = "block"
    this.buttonTarget.style.display = "none"
  }
}
