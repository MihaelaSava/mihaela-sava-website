import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message"]

  showMessage(event) {
    event.preventDefault()
    event.stopPropagation()
    // Toggle the message
    if (this.messageTarget.classList.contains("hidden")) {
      this.messageTarget.classList.remove("hidden")
      this.messageTarget.classList.add("flex")
    } else {
      this.messageTarget.classList.add("hidden")
      this.messageTarget.classList.remove("flex")
    }
  }
}
