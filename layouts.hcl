resource "layout" "default" {
  column {
    width = "70%"

    tab {
      slug      = "workstation-terminal"
      title     = "Workstation"
      target    = resource.terminal.workstation
      closeable = false
    }

    tab {
      slug      = "rsync-man-page"
      title     = "rsync docs"
      target    = resource.virtual_browser.rsync-docs
      closeable = false
    }
  }

  column {
    width = "30%"

    instructions {
      title = "Assignment"
    }
  }
}
