import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favouritesbtn"
export default class extends Controller {
  static targets = ['favourites'];

  connect() {
  }

  toggle() {
    this.favouritesTarget.classList.toggle('is-favourites');
    this.favouritesTarget.innerText === 'Add to Favourites' ? this.favouritesTarget.innerText = 'Remove from Favourites' : this.favouritesTarget.innerText = 'Add to Favourites';
  }
}
