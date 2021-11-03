import { searchProgressBar } from '../plugins/progress_bar';

const searchIndexConseils = () => {
  document.getElementById("select-search-category").addEventListener("click", () => {
    document.getElementById("dropdown-elements-category").classList.toggle("show");
  });

  // Close the dropdown if the user clicks outside of it
  window.onclick = function(event) {
    if ((event.target.matches('.search-div-category'))) {
      const dropdowns_category = document.querySelector("#dropdown-elements-category");
      if (dropdowns_category.classList.contains('show')) {
        dropdowns_category.classList.remove('show');
        // clearInterval(inst);
      }
    }
  }
}

const updateInputCategories = () => {
  const categories = {
    "<img src='assets/emojis/livre-rouge.png', class='emojis-eflc-filter'/> administratifs et financiers": "Administratif & Financier",
    "<img src='assets/emojis/stylo.png', class='emojis-eflc-filter'/> artistiques et techniques": "Artistique & Technique",
    "<img src='assets/emojis/etoile.png', class='emojis-eflc-filter'/> égalité et inclusion": "Egalite & inclusion",
  }
  const element = document.getElementById("text-to-change-category");
  if (element) {
    let counter = 0;
    const inst = setInterval(() => {
      element.innerHTML = Object.keys(categories)[counter];
      counter++;
      if (counter >= Object.keys(categories).length) {
        counter = 0;
      }
    }, 1500);
  }

  // Change the input value when a type/residence is selected
  const dropdownElementsCategories = document.querySelectorAll(".dropdown-content-category")

  dropdownElementsCategories.forEach((element) => {
    element.addEventListener("click", () => {
      document.querySelector("#category_list").value = categories[element.innerHTML];
      document.querySelector("#select-search-category").innerHTML = element.innerHTML;
      document.querySelector("#select-search-category").classList.add("choosen");
      document.getElementById("dropdown-elements-category").classList.toggle("show");
      // clearInterval(inst);
      // document.querySelector('#search-form').submit();
    })
  })

  // Submit the form when user click on the button
  document.querySelector(".button-search").addEventListener("click", () => {
     animSearch();
  })
}

const animSearch = async () => {
    searchProgressBar();
    document.querySelector(".index-direction").style.opacity = 0.2;
    document.querySelector(".cards").style.opacity = 0.2;
    await sleep(2500)
    document.querySelector('#search-form').submit()
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export { updateInputCategories }
export { searchIndexConseils }
