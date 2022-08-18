import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["div", "input", "permanent", "candidaturesdate"];

  connect() {
    console.log("ici");
    console.log(this.inputTarget)
    console.log(this.permanentTarget);
    console.log(this.candidaturesdateTarget)
  }

  selected(event) {
    console.log(event);
  }
}
