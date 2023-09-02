import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  static values = {
    house: Number,
  }
  connect() {
    const house = document.getElementById(`house-${this.houseValue}`);
    house.scrollIntoView({behavior: 'smooth'}, true);
    console.log(this.houseValue)
  }
}
