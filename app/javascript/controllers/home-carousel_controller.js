import { Controller } from "stimulus";

let scrollX = 0;

export default class extends Controller {
  static targets = [
    "carousel",
    "buttonLeft"
    ];

  slideCarouselRight(event) {
    scrollX += 1000
    console.log(scrollX);
    this.carouselTarget.scroll({
      top: 0,
      left: scrollX,
      behavior: 'smooth'
    });
    if (scrollX >= 1000) {
      this.buttonLeftTarget.style.display = "block"
    }
  }

  slideCarouselLeft(event) {
    scrollX -= 1000
    console.log(scrollX);
    this.carouselTarget.scroll({
      top: 0,
      left: scrollX,
      behavior: 'smooth'
    });
  }
}
