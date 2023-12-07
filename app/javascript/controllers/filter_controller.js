import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["button"]
  connect() {
    console.log("yo");
  }
  click() {
    this.buttonTarget.click()
  }
}
