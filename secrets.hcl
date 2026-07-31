resource "secret" "ssh_key" {
  reference = "IGGYS_SSH_PRIVATE_KEY_BASE64"
}
