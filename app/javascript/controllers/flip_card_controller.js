import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["card", "flipCard"]

  flip() {
    this.cardTarget.style.opacity = "1"
    this.flipCardTarget.classList.toggle("is-flipped")
    this.cardTarget.classList.toggle("is-flipped")
  }

  close() {
    this.cardTarget.style.opacity = "1"
    this.flipCardTarget.classList.remove("is-flipped")
    this.cardTarget.classList.remove("is-flipped")
  }
}
