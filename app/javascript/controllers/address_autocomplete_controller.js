import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }
  static targets = ["address"]

  connect() {
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "region,place,postcode,locality,neighborhood,address",
      countries: "SG"
    })
    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
  }

  // Creating the value based on API results
  #setInputValue(event) {
    this.addressTarget.value = event.result["place_name"]
    const regionContext = this.findRegionContext(event.result.context);
    if (regionContext) {
      const regionName = regionContext.text;
      const regionInput = document.getElementById("house_region");
      regionInput.value = regionName; // Set the region field value
      console.log("Region:", regionName);
    }
  }

  // to call from setInputValue to search the API output results
  findRegionContext(contextArray) {
    return contextArray.find(context => context.id.startsWith("region."));
  }

  #clearInputValue() {
    this.addressTarget.value = "" // reset the original form value to blank
  }
}
