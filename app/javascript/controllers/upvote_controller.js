import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="upvote"
export default class extends Controller {
  connect() {
  }
  upvote(event) {
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
