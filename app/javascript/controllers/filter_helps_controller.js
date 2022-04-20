import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form", "inputType", "inputTypePhoto", "switchButton", "switchParite", "inputLieu"];

  selectCriteria(event) {
    event.currentTarget.classList.toggle("selected")
    event.currentTarget.querySelector(".cross-criteria").classList.toggle("display-inline")
    if(this.inputTypeTarget.value.includes(event.currentTarget.dataset.text)) {
      this.inputTypeTarget.value = this.inputTypeTarget.value.replace(event.currentTarget.dataset.text, "")
    } else {
      this.inputTypeTarget.value += event.currentTarget.dataset.text + ","
    }
    this.refreshHelps();
  }

  refreshHelps() {
    fetch(`${this.formTarget.action}?type_photo_list=${this.inputTypePhotoTarget.value}&type_list=${this.inputTypeTarget.value}&open=${this.switchButtonTarget.checked}&parite=${this.switchPariteTarget.checked}&residence=${this.inputLieuTarget.value}`, { headers: { 'Accept': 'text/plain' } })
    .then(response => response.text())
    .then((data) => {
      document.querySelector("#main-index-helps").outerHTML = data;
    })
  }
}
