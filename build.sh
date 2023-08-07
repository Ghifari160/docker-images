#!/bin/bash

function abort {
    printf "%s\n" "$@" >&2
    exit 1
}

function log {
    printf "%s\n" "$@"
}

function usage {
    cat << EOF
build.sh
Usage: [ACT=true] build.sh <--from-image IMG> <--from-tag TAG> <--tag TAG> [--push]
Options:
    -h, --help              display this help and exit
    -p, --push              push to registry
    -i, --from-image IMG    from image
    -f, --from-tag TAG      from tag
    -t, --tag TAG           tag
EOF

exit 1
}

if ! command -v docker > /dev/null; then
    abort "Docker not found!"
fi

TAGS=()

while [[ $# -gt 0 ]]
do
    case "$1" in
        -h | --help)
            usage
            shift
            ;;

        -p | --push)
            PUSH=1
            shift
            ;;

        -i | --from-image)
            FROM_IMAGE="$2"
            shift
            shift
            ;;

        -f | --from-tag)
            FROM_TAG="$2"
            shift
            shift
            ;;

        -t | --tag)
            TAGS+=("$2")
            shift
            shift
            ;;

        *)
            usage
            ;;
    esac
done

if [[ -z "$FROM_IMAGE" || -z "$FROM_TAG" ]]; then
    usage
fi

if [[ "$PUSH" -eq 1 && ${#TAGS[@]} -lt 1 ]]; then
    abort "Push flag is set but no tags are specified!"
elif [[ "$PUSH" -eq 1 && "$ACT" == "true" ]]; then
    log "Running in act. Cannot push!"
    PUSH=0
fi

docker_args=()

docker_args+=("--progress plain")

if [[ "$PUSH" -eq 1 ]]; then
    docker_args+=("--push")
fi

docker_args+=("--build-arg FROM_IMAGE=${FROM_IMAGE}")
docker_args+=("--build-arg FROM_TAG=${FROM_TAG}")

for tag in "${TAGS[@]}"
do
    docker_args+=("--tag ${tag}")
done

docker_args+=("--file ./linux/ubuntu/Dockerfile")

docker buildx build ${docker_args[@]} .
