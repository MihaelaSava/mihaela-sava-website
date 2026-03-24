import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message"]

  showMessage(event) {
    // Prevent following any accidental links
    event.preventDefault()
    event.stopPropagation()
    // Show the message
    this.messageTarget.classList.remove("hidden")
    this.messageTarget.classList.add("flex")
    // Hide after 2 seconds
    setTimeout(() => {
      this.messageTarget.classList.add("hidden")
      this.messageTarget.classList.remove("flex")
    }, 2000)
  }
}
