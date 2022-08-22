import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form", "permanent", "candidaturesdates", "email", "emailerror", "button"];

  // submit(event) {
  //   if (this.emailTarget.value == "") {
  //     event.preventDefault();
  //     this.emailerrorTarget.classList.remove("undisplay-error")
  //     this.emailerrorTarget.classList.add("display-error")
  //     this.buttonTarget.removeAttribute('disabled');
  //     console.log(this.buttonTarget)
  //   } else {
  //     this.formTarget.submit()
  //   }
  // }

  selected() {
    if (this.permanentTarget.checked) {
      this.candidaturesdatesTarget.classList.add("d-none")
    } else {
      this.candidaturesdatesTarget.classList.remove("d-none")
    }
  }
}
