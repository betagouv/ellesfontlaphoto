import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["frontCard", "backCard"]

  flip() {
    this.frontCardTarget.classList.toggle("is-flipped")
    this.backCardTarget.classList.toggle("is-flipped")
  }

  close() {
    this.frontCardTarget.classList.toggle("is-flipped")
    this.backCardTarget.classList.remove("is-flipped")
  }
}
