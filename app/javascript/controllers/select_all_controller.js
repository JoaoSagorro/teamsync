import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-all"
export default class extends Controller {
  static targets = ["input", "employee"]
  connect() {
    console.log("you're good to go")
  }


  selection() {
    console.log(document.querySelectorAll(".form-check-input"))

    if (this.inputTarget.innerText === "Select All Players") {
    document.querySelectorAll(".player").forEach(element => {
      element.checked = true;
      });
      this.inputTarget.innerText = "Deselect"
    } else {
    document.querySelectorAll(".player").forEach(element => {
      element.checked = false;
      });
      this.inputTarget.innerText = "Select All Players"
    }
  }

  employee_selection() {
    console.log("good")
    if (this.employeeTarget.innerText === "Select All Employees") {
      document.querySelectorAll(".employee").forEach(element => {
        element.checked = true;
        });
        this.employeeTarget.innerText = "Deselect"
      } else {
      document.querySelectorAll(".employee").forEach(element => {
        element.checked = false;
        });
        this.employeeTarget.innerText = "Select All Employees"
      }
  }
}
