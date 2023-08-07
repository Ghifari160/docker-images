# Docker Images

Docker images.

## Images

### ghifari160/ubuntu

| Tags                     | Ubuntu Version | Notes                                      |
|--------------------------|----------------|--------------------------------------------|
| `22.04` `jammy` `latest` | 22.04          | Base Ubuntu image with additional packages |
| `20.04` `focal`          | 20.04          | Base Ubuntu image with additional packages |
| ~~`18.04` `bionic`~~     | 18.04          | Deprecated. Legacy image\*                 |

\*) Legacy images are not built from this repository.

## Build

Images on container registries are built on GitHub Actions.

You can run the build script locally

``` shell
./build.sh --from-image IMG --from-tag TAG --tag TAG [--push]
```
