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

  openModal(el) {
    if ( ! el.currentTarget.dataset.modal ) {
      console.error( 'No data-modal attribute defined!' );
      return;
    }

    let modalID = el.currentTarget.dataset.modal;
    let modal = document.getElementById( modalID );

    document.body.classList.add( 'modal-body' );
    modal.classList.add( 'modal-visible' );
  }
}

