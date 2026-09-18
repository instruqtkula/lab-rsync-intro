# Test for completion of page.intro-to-rsync
resource "task" "intro-to-rsync" {
  description     = "Complete the intro to rsync"
  success_message = "Complete!"

  config {
    target             = resource.vm.workstation
    user               = "iggy"
    group              = "iggy"
    working_directory  = "/home/iggy"
    timeout            = "30s"
    success_exit_codes = [0]
    failure_exit_codes = [1]
  }
  
  condition "ran_rsync" {
    description = "Rsync was successfully ran"
    
    check {
      script          = "scripts/intro-to-rsync/check-ran"
      failure_message = "The 'vosp_1000' directory doesn't exist, Did you run the 'rsync' command?"
    }

    check {
      script          = "scripts/intro-to-rsync/check-correct-options"
      failure_message = "That doesn't quite look right, did you run the rsync command with the correct options?"
    }

    solve {
      script = "scripts/intro-to-rsync/solve"
    }

    cleanup {
      script = "scripts/intro-to-rsync/cleanup"
    }
  }
}
