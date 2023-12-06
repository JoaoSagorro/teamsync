import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bar"
export default class extends Controller {
  static targets = ["searchBar"]

  connect() {
    console.log("search")
  }

}


// const inputElement = document.getElementById("search-bar-input")
// console.log(inputElement)

// const submitElement = document.getElementById("search-bar-submit")
// console.log(submitElement)

// const searchBar = document.getElementById("search-bar")
// console.log(searchBar)

// const searchButton = document.getElementById("search-button")
// console.log(searchButton)

// searchButton.addEventListener("click", (event) => {
//   event.preventDefault()
//   console.log("Search")
//   inputElement.classList.toggle("d-none")
//   searchButton.classList.toggle("d-none")
//   submitElement.classList.toggle("d-none")
// })
