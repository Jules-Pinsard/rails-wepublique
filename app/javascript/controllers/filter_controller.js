import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["form"]
  connect() {
  }
  click() {
    this.formTarget.dispatchEvent(new CustomEvent('submit', { bubbles: true }))  }
}
