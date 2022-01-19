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
    "administratifs et financiers": "Administratif & Financier",
    "artistiques et techniques": "Artistique & Technique",
    "égalité et inclusion": "Egalite & inclusion",
  }
  const element = document.getElementById("text-to-change-category");
  if (element) {
    let counter = 0;
    const inst = setInterval(() => {
      element.innerHTML = `<img src="${document.querySelector(`#img-${Object.keys(categories)[counter].replace(/\s/g, '-')}`).innerHTML}" alt="émoji ${Object.keys(categories)[counter]}" class="emojis-eflc-large"> ${Object.keys(categories)[counter]}`;
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
      document.querySelector("#category_list").value = element.dataset.filtre;
      document.querySelector("#select-search-category").innerHTML = `${element.innerHTML} <img src="${document.querySelector("#img-arrow-down").innerHTML}" alt="icône flèche" class="arrow-search" style="width: 25px !important;">`;
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
