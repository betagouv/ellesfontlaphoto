import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["card", "flipCard"]

  flip() {
    console.log("ici")
    this.cardTarget.style.opacity = "1"
    console.log(this.cardTarget)
    console.log(this.flipCardTarget)
    this.flipCardTarget.classList.toggle("is-flipped")
    this.cardTarget.classList.toggle("is-flipped")
  }

  close() {
    this.cardTarget.style.opacity = "1"
    this.flipCardTarget.classList.remove("is-flipped")
    this.cardTarget.classList.remove("is-flipped")
  }
}
