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
    console.log(event.currentTarget);
    const formElement = this.acceptTarget.parentElement;
    fetch(formElement.action, {
      method: "POST",
      headers: {},
      body: new FormData(formElement)
    })
      .then(response => response.text())
      .then((data) => {
        document.querySelector("#content").innerHTML = data;
      })
  }

  decline(event) {
    event.preventDefault();
    const formElement = this.declineTarget.parentElement;
    fetch(formElement.action, {
      method: "POST",
      headers: {},
      body: new FormData(formElement)
    })
      .then(response => response.text())
      .then((data) => {
        document.querySelector("#content").innerHTML = data;
      })
  }
}
