import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="downvote"
export default class extends Controller {
  connect() {
  }
  downvote(event) {
    event.preventDefault();
    console.log(event.currentTarget.href)
    fetch(event.currentTarget.href, {
      method: 'PATCH',
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content
      }
    })
    .then(response => response.json())
    .then(data => {
      this.element.outerHTML = data.html;
    })
  }
}
