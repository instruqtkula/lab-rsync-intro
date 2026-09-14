# Packer images for the rsync intro track

This [Packer](https://developer.hashicorp.com/packer) configuration
builds two GCP VM images which are used as custom images for this
track. It builds to images, one for the `fileserver` and one for the
`workstation`.

To build run the command:

```
packer build -var project_id=<your GCP project name> hosts.pkr.hcl
```

Replace `<your GCP project name>` with the name of the GCP project
you are building the images in, and change the track `config.yml` to
point at the images created in your GCP project. **Remember** that
you must also give Instruqt [permission to use that image](https://docs.instruqt.com/sandboxes/hosts/create-a-custom-vm-image#step-4-grant-permissions-to-instruqt).
