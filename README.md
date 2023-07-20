# Docker image for building scran.js

Pretty much as it says on the tin.
Provides an image that allows for easy building of the [**scran.js**](https://github.com/kanaverse/scran.js) package,
where we have already set up the CMake directories and performed initial compilation of all C++ files to Wasm.
This saves time during CI runs as we only have to recompile the files that changed.
