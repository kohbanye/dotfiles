#!/bin/bash

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install llvm
brew install deno

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Rye
curl -sSf https://rye.astral.sh/get | RYE_INSTALL_OPTION="--yes" bash
