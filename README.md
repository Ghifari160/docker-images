# Docker Images

Docker images.

## Images

Images are built on GitHub Actions on:

- Changes to the Dockerfile
- Changes to the Actions workflow
- Every Sunday at 12 AM UTC
- Manual trigger

### ghifari160/ubuntu

| Tags                       | Image Version | Platform                    | Notes                                      |
|----------------------------|---------------|-----------------------------|--------------------------------------------|
| `22.04` `jammy` `latest`   | 22.04         | `linux/amd64` `linux/arm64` | Base Ubuntu image with additional packages |
| `20.04` `focal`            | 20.04         | `linux/amd64` `linux/arm64` | Base Ubuntu image with additional packages |
| `full-22.04` `full-latest` | 22.04         | `linux/amd64`               | GitHub Actions runner                      |
| ~~`18.04` `bionic`~~       | 18.04         | `linux/amd64`               | Deprecated. Legacy image                   |

**Notes:**

- Legacy images are not built from this repository.
- GitHub Actions runner images are _manually_ built from
  [`ghifari160/runner-images`](https://github.com/ghifari160/runner-images).

## Build

Images on container registries are built on GitHub Actions.

You can run the build script locally.

``` shell
./build.sh --from-image IMG --from-tag TAG --tag TAG [--push] [--platform PLATFORM]
```

Run `./build.sh --help` for more information.
