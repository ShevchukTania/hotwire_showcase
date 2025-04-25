import { Application } from "@hotwired/stimulus"

const application = Application.start()

import { Alert, Autosave, ColorPreview, Dropdown, Modal, Tabs, Popover, Toggle, Slideover } from "tailwindcss-stimulus-components"

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
application.register('modal', Modal)

export { application }
