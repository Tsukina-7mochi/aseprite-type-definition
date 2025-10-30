This project aims to provide a Lua type definition from aseprite scripting API document.
This directory contains following directories and files:

- definition: The type definition of API you're contributing.
- api: Reference to API document, the source of truth. You MUST NOT edit this.

Files in the `definitions` directory and those under the `api/api` directory correspond one-to-one except `init.lua`.
`init.lua` is the entry point to the definition and includes commit hash of the reference API document.

## Specification

- The definition must include all symbols in the document, and must not include ones not in the document.
- The symbol descriptions must match the API documentation exactly. No additional or missing information is allowed.
- Links within the document are converted to the `lua:` links: [my custom type](lua://MyCustomType).
  - When referencing subtypes, replace the document fragment to property, like `foo.md#bar` to `foo.bar`
