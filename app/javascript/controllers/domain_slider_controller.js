import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["range", "handle"]

  connect() {
    this.update()
  }

  slide() {
    this.update()
  }

  update() {
    const value = this.rangeTarget.value
    this.element.style.setProperty("--pos", `${value}%`)
    this.handleTarget.style.left = `${value}%`
  }
}
