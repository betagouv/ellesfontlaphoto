import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form", "permanent", "candidaturesdates", "email", "emailerror", "button"];

  selected() {
    if (this.permanentTarget.checked) {
      this.candidaturesdatesTarget.classList.add("d-none")
    } else {
      this.candidaturesdatesTarget.classList.remove("d-none")
    }
  }
}
