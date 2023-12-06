import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="upvote"
export default class extends Controller {
  static targets = ['subupvoteArea', 'subdownvoteArea']
  static values = {user: Number}

  connect() {}

  vote(event) {
    if (this.userValue === 0 ) {
      return
    } else {
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
        this.subupvoteAreaTarget.outerHTML = data.sub_upvote_html;
        this.subdownvoteAreaTarget.outerHTML = data.sub_downvote_html;
      })
    }
  }
}
