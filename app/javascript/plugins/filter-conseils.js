const unSelectFilter = (buttonsUnSelected) => {
  buttonsUnSelected.forEach((element) => {
    element.addEventListener("click", () =>{
      if (document.querySelector("#category").value == element.dataset.category) {
        document.querySelector("#category").value = ""
        document.querySelector('#search-form').submit();
      }
    })
  })
}

const selectFilter = (buttonsSelected) => {
  buttonsSelected.forEach((element) => {
    element.addEventListener("click", () => {
      console.log(element.dataset.tag)
      document.querySelector("#tags").value += element.dataset.tag
      document.querySelector('#search-form').submit();

    })
  })
}

export { unSelectFilter }
export { selectFilter }
