How to use and maintain this project
====================================

All operations are automated as much as possible.

- Generation of each `Dockerfile` and its context is automated via `Makefile`.



## Updating

To update versions of images following steps are required:

1.  Update all required versions in `Makefile`. See also: [Image versioning convensions](#image-versioning-convensions)
2.  Update all required versions in `README.md`. See also: [Image versioning convensions](#image-versioning-convensions)
3.  Edit templates
    1.  If you need to modify some `Dockerfile`s then do it via editing
        [`templates/Dockerfile.erb` template](templates/Dockerfile.erb).
    2.  If you need to modify some `Gemfile`s then do it via editing
        [`templates/Gemfile.erb` template](templates/Gemfile.erb).
    3.  If you need to modify some `conf`s then do it via editing
        [`templates/conf` templates](templates/conf/)
4.  Regenerate all `Dockerfile`s and their context (it's okay to remove previous
    ones completely):
    ```bash
    make src-all
    ```
5.  Push changes to `master` branch.

### Image versioning convensions

1. We use the following image versioning convension:
    1. `v<Fluentd version>-debian-<destination name>-<image major version>.<image minor version>`
    2. Reset image version to `1.0` when bump up Fluentd version
    3. Bump up image major version when including breaking changes on a destination
    4. Bump up image minor version when updating gems on a destination

**Note:** This procedure requests that the specified Fluentd debian tag image is already published in [Fluentd DockeHub's tags page](https://hub.docker.com/r/fluent/fluentd/tags).

## Publish Images

**Note:** This procedure requires `fluent/fluentd-kubernetes-daemonset` repository's DockerHub `Admin` privileges.

Go to [Build settings page](https://hub.docker.com/repository/docker/fluent/fluentd-kubernetes-daemonset/builds) and then, push `[Trigger ▷]` buttons.

When Fluentd is bump up every minor version (e.g. v1.12 to v1.13), we need to reconfigure `Dockerfile location` via `[Configure Automated Builds]` button.

Built tags will be published at [TAGS page](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset/tags).

## Testing

Tests are outstanding

## Manual release

It's still possible to build, tag and push images manually.
Just use:
```bash
make release-all
```

It will build all existing `Dockerfile`s, tag them with proper tags
([as `README.md` requires][3]) and push them to Docker Hub.





[1]: https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset/tags
[2]: https://github.com/fluent/fluentd-kubernetes-daemonset/tree/master
[3]: README.md#supported-tags-and-respective-dockerfile-links
