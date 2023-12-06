import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ['mesureupvoteArea']
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
        this.mesureupvoteAreaTarget.outerHTML = data.mesure_upvote_html;
      })
    }
  }
}
