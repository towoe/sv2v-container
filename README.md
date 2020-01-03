# sv2v container

Container image for *sv2v* and *yosys*.
*sv2v* is built from source when creating the image.
*yosys* is imported from [towoe/yosys-container](https://github.com/towoe/yosys-container).

## Create image

The default tool for building the image is *podman*.
This can be changed to *docker* by setting the environment variable
`CONTAINER_TOOL`.

```console
$ make image
```
