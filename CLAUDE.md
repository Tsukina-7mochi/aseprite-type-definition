This project aims to provide a Lua type definition from aseprite scripting API document.
This directory contains following directories and files:

- definition: The type definition of API you're contributing.
- api: Clone of https://github.com/aseprite/api.git. Not tracked in this repository.

Files in the `definitions` directory and those under the `api/api` directory correspond one-to-one except `init.lua`.
`init.lua` is the entry point to the definition and includes commit hash of the reference API document.

## Specification

The objective is to create type definitions covering the entire scope of the API and to add doc comments to each of them that look almost identical to the API documentation.
Doc comments must be formatted to look as identical as possible to the HTML rendering of the API documentation (for example, removing line breaks and creating paragraphs).

- We must cover all of the API and must not include extra information.
- Doc comments must be word-for-word identical to the API documentation. Do not include translator's notes or add extra information out of consideration.
- Doc comments should be formatted so that
- Links within the document are converted to the `lua:{Identifier}` links: [my custom type](lua://MyCustomType).
  - When referencing subtypes, replace the document fragment to property, like `foo.md#bar` to `foo.bar`
