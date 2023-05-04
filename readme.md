# Aseprite Type Definition

![Demo of suggest in VSCode](https://gyazo.com/2a91bc263590356d218dbeae3209cfb8.gif)

A lua type definition for [Aseprite API](https://www.aseprite.org/api/) based on [lua-language-server](https://github.com/sumneko/lua-language-server).
The supported API version is `18` (since Aseprite `v1.2.35`)

## How to use in your project

- Just put `/definitions` directory into your project root.
- Add the repository as a git submodule in `(project root)/library`, and link library directory using  `.luarc.json`
  - [Example](https://github.com/Tsukina-7mochi/aseprite-scripts)
- You can link the file in other ways too.
  - See: https://github.com/sumneko/lua-language-server/wiki
