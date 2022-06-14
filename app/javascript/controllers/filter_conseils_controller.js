import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form", "inputCategory", "inputDocumentType"];

  selectCategory(event) {
    event.currentTarget.classList.toggle("selected")
    event.currentTarget.querySelector(".cross-criteria").classList.toggle("display-inline")
    if (this.inputCategoryTarget.value.includes(event.currentTarget.dataset.text)) {
      this.inputCategoryTarget.value = this.inputCategoryTarget.value.replace(`${event.currentTarget.dataset.text},`, "")
    } else {
      this.inputCategoryTarget.value += event.currentTarget.dataset.text + ","
    }
    this.refreshConseils();
  }

  selectDocument(event) {
    event.currentTarget.classList.toggle("selected")
    event.currentTarget.querySelector(".cross-criteria").classList.toggle("display-inline")
    if (this.inputDocumentTypeTarget.value.includes(event.currentTarget.dataset.text)) {
      this.inputDocumentTypeTarget.value = this.inputDocumentTypeTarget.value.replace(`${event.currentTarget.dataset.text},`, "")
    } else {
      this.inputDocumentTypeTarget.value += event.currentTarget.dataset.text + ","
    }
    this.refreshConseils();
  }

  refreshConseils() {
    fetch(`${this.formTarget.action}?category_list=${this.inputCategoryTarget.value}&document_type=${this.inputDocumentTypeTarget.value}`, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        document.querySelector("#main-index-conseils").outerHTML = data;
      })
    window.scrollTo(0, 0);
  }
}
