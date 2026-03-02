<!--
SPDX-FileCopyrightText: 2025 Serokell <https://serokell.io/>

SPDX-License-Identifier: MPL-2.0
-->

# Example group-based deployment

This example shows how to assign `groups` at deploy, node, and profile levels, then filter
deployments with `--groups`.

Example usage:
- Deploy only profiles matching the `web` group:
  - `nix run github:serokell/deploy-rs -- --groups web`
- Deploy only profiles matching `blue` or `db`:
  - `nix run github:serokell/deploy-rs -- --groups blue db`
