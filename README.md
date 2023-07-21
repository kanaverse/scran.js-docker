# Docker image for building scran.js

Pretty much as it says on the tin.
Provides an image that allows for easy building of the [**scran.js**](https://github.com/kanaverse/scran.js) package,
where we have already set up the CMake directories and performed initial compilation of all C++ files to Wasm.
This saves time during CI runs as we only have to recompile the files that changed.

Note that Node.js is pre-installed in this image as part of the Emscripten SDK but has been removed from the `$PATH`.
This is deliberate as it allows CI jobs to define a different Node.js version without having to worry about conflicts.
Developers wishing to use the pre-installed Node.js commands should run the following before working with **scran.js** code: 

```sh
NODEBIN=$(echo /emsdk/node/*/bin)
export PATH="${NODEBIN}:${PATH}"
```
