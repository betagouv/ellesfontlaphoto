const searchIndex = () => {
  document.getElementById("select-search").addEventListener("click", () => {
    document.getElementById("dropdown-elements").classList.toggle("show");
  });

  // Close the dropdown if the user clicks outside of it
  window.onclick = function(event) {
    if (!event.target.matches('select-search')) {
      var dropdowns = document.querySelectorAll(".dropdown-elements");
      dropdowns.forEach((element) => {
        if (element.classList.contains('show')) {
          element.classList.remove('show');
        }
      })
    }
  }
}

export { searchIndex }
