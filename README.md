# BlueBuild Template &nbsp; [![bluebuild build badge](https://github.com/johnlevandowski/levyos/actions/workflows/build.yml/badge.svg)](https://github.com/johnlevandowski/levyos/actions/workflows/build.yml) [![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/johnlevandowski/levyos)

See the [BlueBuild docs](https://blue-build.org/how-to/setup/) for quick setup instructions for setting up your own repository based on this template.

After setup, it is recommended you update this README to describe your custom image.

## Installation

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree status
  sudo ostree admin pin 0
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/johnlevandowski/levyos:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/johnlevandowski/levyos:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```
- Unset pin after testing
  ```
  sudo ostree admin pin 1 -u
  ```
  
The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## Enable Virtualization

To setup the needed linux users and groups for virtualization, run the following command:
```
ujust levyos-setup-virtualization
```

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/how-to/generate-iso/#_top). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```
cosign verify --key cosign.pub ghcr.io/johnlevandowski/levyos
```

Base Image Ancestry  
https://quay.io/repository/fedora-ostree-desktops/kinoite > https://ghcr.io/ublue-os/kinoite-main:latest > https://ghcr.io/ublue-os/bazzite:latest  
