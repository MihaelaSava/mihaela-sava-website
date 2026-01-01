import { Controller } from "@hotwired/stimulus"

// data-controller="domain-slider"
export default class extends Controller {
  static targets = ["overlay", "range", "handle"]

  connect() {
    this.update()
  }

  slide() {
    this.update()
  }

  update() {
    const value = this.rangeTarget.value
    this.overlayTarget.style.width = `${value}%`
    this.handleTarget.style.left = `${value}%`
  }
}
