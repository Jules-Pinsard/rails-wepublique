import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["categorie", "statut", "maire", "sort-by", "order"]
  connect() {
  }
}
