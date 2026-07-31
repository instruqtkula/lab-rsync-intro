resource "lab" "rsync-intro" {
  title       = "Rsync Intro"
  description = "An introduction to the basic use of the rsync file-copying tool"

  settings {
    timelimit {
      duration = "15m"
    }

    idle {
      enabled = true
      timeout = "5m"
    }
  }

  layout = resource.layout.default
}
