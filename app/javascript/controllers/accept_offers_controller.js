import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accept-offers"
export default class extends Controller {
  static targets = ["accept", "decline", "status"]
  connect() {
    console.log('Hi we are connected to stimulus');
    console.log(this.acceptTarget);
    console.log(this.declineTarget);
    console.log(this.statusTarget.innerHTML);
  }

  accept(event) {
    event.preventDefault();
    console.log("THIS TRIGGERS")
    console.log(this.acceptTarget.action)
    const formElement = this.acceptTarget.parentElement;
    fetch(formElement.action, {
      method: "POST",
      headers: { "Accept": "application/json",
      "X-CSRF-Token": document.head.querySelector(`meta[name="csrf-token"]`).getAttribute("content"),
     },
      body: {}
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        if (data.status === "success") {
          this.statusTarget.innerHTML = "accepted"
        }
        this.acceptTarget.innerHTML = "OK"
      })
  }

  decline(event) {
    event.preventDefault();
    const formElement = this.declineTarget.parentElement;
    fetch(formElement.action, {
      method: "POST",
      headers: { "Accept": "application/json",
      "X-CSRF-Token": document.head.querySelector(`meta[name="csrf-token"]`).getAttribute("content"),
     },
      body: {}
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        if (data.status === "success") {
          this.statusTarget.innerHTML = "declined"
        }
        this.declineTarget.innerHTML = "OK"
      })
  }
}
