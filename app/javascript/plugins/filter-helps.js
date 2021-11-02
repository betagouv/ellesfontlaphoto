const unSelectFilterHelp = (buttonsUnSelected) => {
  buttonsUnSelected.forEach((element) => {
    element.addEventListener("click", () =>{
      if(element.classList.contains('residence')) {
        document.querySelector("#residence").value = ""
      } else {
        document.querySelector("#type_list").value = ""
      }
      document.querySelector('#search-form').submit();
    })
  })
}

export { unSelectFilterHelp }
