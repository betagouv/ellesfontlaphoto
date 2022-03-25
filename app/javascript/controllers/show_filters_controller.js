import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["btnFilter", "divFilters"]

  show() {
    this.divFiltersTarget.classList.toggle("show");
  }

  close() {
    this.divFiltersTarget.classList.toggle("show");
  }
}
