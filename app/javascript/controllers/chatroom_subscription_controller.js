import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
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
        this.iconTarget.hidden = false
      } else {
        this.iconTarget.children[0].innerText = parseInt(this.iconTarget.children[0].innerText) + 1
      }
    }
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    this.channel.unsubscribe()
  }

  resetNotification() {
    this.iconTarget.children[0].innerText = ""
    this.iconTarget.hidden = "true"
  }
}
