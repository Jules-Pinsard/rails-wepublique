import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="upvote"
export default class extends Controller {
  static targets = ['upvoteArea', 'downvoteArea']

  connect() {}

  vote(event) {
    event.preventDefault();
    fetch(event.currentTarget.href, {
      method: 'PATCH',
      headers: {
        "Accept": 'application/json',
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content
      }
    })
    .then(response => response.json())
    .then(data => {
      this.upvoteAreaTarget.outerHTML = data.upvote_html;
      this.downvoteAreaTarget.outerHTML = data.downvote_html;
    })
  }
}
