import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["permanent", "candidaturesdates"];

  connect() {
    console.log(this.permanentTarget);
    console.log(this.candidaturesdatesTarget)
  }

  selected() {
    console.log(this.permanentTarget.checked);
    if (this.permanentTarget.checked) {
      this.candidaturesdatesTarget.classList.add("d-none")
    } else {
      this.candidaturesdatesTarget.classList.remove("d-none")
    }
  }
}
