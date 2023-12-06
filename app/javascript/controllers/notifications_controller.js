import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // static targets = ["hideNotification"]

  // connect() {
  //   console.log("notifications");
  //   // const hideNotificationTarget = this.hideNotificationTarget
  // //   if (hideNotificationTarget?.classList) {
  // //     // Get the stored state from local storage
  // //     const notificationHidden = localStorage.getItem("notificationHidden");

  // //     // Apply the stored state
  // //     if (notificationHidden === "true") {
  // //       hideNotificationTarget.classList.add("d-none");
  // //     }
  // // }
  // }

  // hide() { console.log("clicked");
  //   // console.log(this.hideNotificationTarget)
  //   // this.hideNotificationTarget.style.display = "none";
  //   const elements = document.querySelectorAll(".delete-notification")
  //   console.log(elements)
  //   for (const element of elements) {
  //     element.addEventListener("click", (event) => {
  //       element.remove();
  //       event.target.parentElement.remove();
  //       event.preventDefault();
  //       console.log(event);
  //     })
  //   }
  //   // localStorage.setItem("notificationHidden", "true")
  // }

}
