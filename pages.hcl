resource "page" "intro-to-rsync" {
  title = "Introduction to Rsync"
  file  = "instructions/intro-to-rsync.md"

  activities = {
    intro-to-rsync = resource.task.intro-to-rsync
  }
}
