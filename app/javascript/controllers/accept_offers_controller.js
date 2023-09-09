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
}
