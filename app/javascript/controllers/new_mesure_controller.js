import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-mesure"
export default class extends Controller {
  static targets = ["container", "input", "div"]
  connect() {
  }

  show() {
    if (this.inputTarget.value === "") {
      this.containerTarget.innerHTML = '<p class="fst-italic text-center mt-3"> Choisissez une catégorie pour afficher les mesures </p>'
    }
    fetch(`/category/?id=${this.inputTarget.value}`, {
      method: "GET",
      headers: { "Accept": "application/json" }
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        this.containerTarget.innerHTML = data.inserted_item
      })
  }
}
