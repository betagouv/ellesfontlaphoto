import { Controller } from "stimulus";

let scrollX = 0;

export default class extends Controller {
  static targets = [
    "carousel",
    "buttonLeft",
    "buttonRight"
    ];

  slideCarouselRight(event) {
    scrollX += 1000
    this.carouselTarget.scroll({
      top: 0,
      left: scrollX,
      behavior: 'smooth'
    });
    if (scrollX >= 1000) {
      this.buttonLeftTarget.style.display = "block"
    }
    if (scrollX >= 3000) {
      this.buttonRightTarget.style.display = "none"
    }
  }

  slideCarouselLeft(event) {
    scrollX -= 1000
    this.carouselTarget.scroll({
      top: 0,
      left: scrollX,
      behavior: 'smooth'
    });
    if (scrollX < 1000) {
      this.buttonLeftTarget.style.display = "none"
    }
  }
}
