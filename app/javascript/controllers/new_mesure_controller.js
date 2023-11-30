import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-mesure"
export default class extends Controller {
  static targets = ["container", "input", "div"]
  connect() {
    console.log("yo du controller");

  }

  show() {
    fetch(`/category/?id=${this.inputTarget.value}`, {
      method: "GET",
      headers: { "Accept": "application/json" }
    })
      .then(response => response.json())
      .then((data) => {
        // this.divTarget.classList.add("animate__slideInRight")
        this.containerTarget.classList.remove("d-none")
        console.log(data.inserted_item);
        this.containerTarget.innerHTML = data.inserted_item
      })
  }
}
