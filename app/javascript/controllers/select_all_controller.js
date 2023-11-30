import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-all"
export default class extends Controller {
  static targets = ["input"]
  connect() {

  }


  selection(event) {
    console.log(document.querySelectorAll(".form-check-input"))
    if (this.inputTarget.innerText === "Select All") {
    document.querySelectorAll(".form-check-input").forEach(element => {
      element.checked = true;
      });
      this.inputTarget.innerText = "Unselect All"
    } else {
    document.querySelectorAll(".form-check-input").forEach(element => {
      element.checked = false;
      });
      this.inputTarget.innerText = "Select All"
    }
  }
}
