import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favouritesbtn"
export default class extends Controller {
  static targets = ['favourites', 'flashMessageContainer'];

  connect() {
  }

  toggle() {
    this.favouritesTarget.classList.toggle('is-favourites');
    const flashAddMessage = document.createElement('div');
    flashAddMessage.className = 'flash-add-message';
    flashAddMessage.textContent = 'Page added to favourites';
    const flashRemMessage = document.createElement('div');
    flashRemMessage.className = 'flash-rem-message';
    flashRemMessage.textContent = 'Page removed from favourites';
    if (this.favouritesTarget.innerText === '➕ Add to Favourites') {
      this.favouritesTarget.innerText = '➖ Remove from Favourites';
      this.flashMessageContainerTarget.appendChild(flashAddMessage);
      setTimeout(() => {
        this.flashMessageContainerTarget.removeChild(flashAddMessage);
      }, 1500);
    } else {
      this.favouritesTarget.innerText = '➕ Add to Favourites';
      this.flashMessageContainerTarget.appendChild(flashRemMessage);
      setTimeout(() => {
        this.flashMessageContainerTarget.removeChild(flashRemMessage);
      }, 1500);
    }


  }
}
