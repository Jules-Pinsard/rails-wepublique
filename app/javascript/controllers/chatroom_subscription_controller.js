import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number, userId: Number }
  static targets = ["messages", "icon", "view"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
  }

  #insertMessageAndScrollDown(data) {
    if (this.viewTarget.ariaHidden) {
      if (this.iconTarget.hidden) {
        this.iconTarget.children[0].innerText = 1
        this.iconTarget.classList.remove("d-none")
      } else {
        this.iconTarget.children[0].innerText = parseInt(this.iconTarget.children[0].innerText) + 1
      }
    }

    this.messagesTarget.insertAdjacentHTML("beforeend", data.html)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)

    if (data.user_id !== this.userIdValue) {
      fetch(`/users/${this.userIdValue}/notifications/`, {
        method: "POST"
      })
    }
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    this.channel.unsubscribe()
  }

  resetNotification() {
    this.iconTarget.children[0].innerText = ""
    this.iconTarget.classList.add("d-none")
    fetch(`/users/${this.userIdValue}/notifications/destroy`, {
      method: "DELETE"
    })
  }
}
