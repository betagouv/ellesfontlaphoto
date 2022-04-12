import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["btnFilter", "divFilters", "divSubIndex"]

  show() {
    this.divFiltersTarget.classList.toggle("show");
    this.divSubIndexTarget.classList.toggle("fixed");
    document.querySelector(".footer").style.display = "none"
  }

  close() {
    this.divFiltersTarget.classList.toggle("show");
    this.divSubIndexTarget.classList.toggle("fixed");
    document.querySelector(".footer").style.display = "block"
  }
}
