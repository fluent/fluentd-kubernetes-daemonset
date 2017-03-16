How to use and maintain this project
====================================

All operations are automated as much as possible.

- Images and description [on Docker Hub][1] will be automatically rebuilt on
  [pushes to `master` branch][2] and on updates of parent Docker images.
- Generation of each `Dockerfile` and its context is automated via `Makefile`.



## Updating

To update versions of images following steps are required:

1.  Update all required versions in `Makefile`.
2.  Update all required versions in `README.md`.
3.  If you need to modify some `Dockerfile`s then do it via editing
    [`templates/Dockerfile.erb` template](templates/Dockerfile.erb).
4.  Regenerate all `Dockerfile`s and their context (it's okay to remove previous
    ones completely):
    ```bash
    make src-all
    ```
6.  Push changes to `master` branch.



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





[1]: https://hub.docker.com/r/fluent/fluentd-kubernetes/tags
[2]: https://hub.docker.com/r/fluent/fluentd-kubernetes/~/settings/automated-builds
[3]: README.md#supported-tags-and-respective-dockerfile-links
