import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form", "inputCategory"];

  selectCategory(event) {
    event.currentTarget.classList.toggle("selected")
    event.currentTarget.querySelector(".cross-criteria").classList.toggle("display-inline")
    if (this.inputCategoryTarget.value.includes(event.currentTarget.dataset.text)) {
      this.inputCategoryTarget.value = this.inputCategoryTarget.value.replace(`${event.currentTarget.dataset.text},`, "")
    } else {
      this.inputCategoryTarget.value += event.currentTarget.dataset.text + ","
    }
    this.refreshHelps();
  }

  refreshHelps() {
    fetch(`${this.formTarget.action}?category_list=${this.inputCategoryTarget.value}`, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        document.querySelector("#main-index-conseils").outerHTML = data;
      })
  }
}
