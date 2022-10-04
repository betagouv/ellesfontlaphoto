import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["card"]

  flip() {
    this.cardTarget.classList.toggle("is-flipped")
  }
}
