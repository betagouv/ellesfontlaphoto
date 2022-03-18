import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = [];

  selectCriteria(event) {
    event.currentTarget.classList.toggle("selected")
  }
}
