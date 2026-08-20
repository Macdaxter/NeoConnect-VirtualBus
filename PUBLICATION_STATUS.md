# Publication Status

Status date: `2026-08-20`

## Ready

- Public/private repository boundary is defined.
- Public README, beta scope, installation, protocol overview, project charter,
  contribution and security guidance are prepared.
- GitHub issue template is prepared.
- Immutable release asset naming and SHA256 process are defined.
- Repository-boundary and release-asset validation scripts are prepared.
- beta.6 candidate changes and physical acceptance gates are documented.
- The previous beta.5.1 UI revision remains historical controlled-test
  evidence; the current public candidate is beta.6 with its own manifest and
  checksums.
- Public beta reporting is prepared around real-world use and optional
  diagnostics; controlled test packages remain privately distributed until
  the first public binary release.
- beta.6 MAME-to-MAME InputSync candidate authority is the focused
  `MAME/neogeo.exe` SHA256
  `F05C1BAEA1BAD9826F55856F2D4DBB7D32D40C0501BC550CAB0FC0F178A8398A`.
- Public artwork has been reduced to neutral project-owned assets; screenshots
  and game artwork are not required for the repository front page.

## Blocking the first public binary release

- The final beta.6 user archive must be regenerated from the updated package
  directory and checked against new SHA256 release sums.
- Complete public third-party license and corresponding-source assets are still
  required for every redistributed binary.
- Final clean-system smoke and upload-byte verification remain pending.
- MiSTer InputSync v3 physical parity is pending unless the final release notes
  explicitly downgrade it to experimental/limited.

## Public repository

The curated documentation repository is public at:

`https://github.com/Macdaxter/NeoConnect-VirtualBus`

Its `main` history begins with the reviewed public export only. The internal
CLEAN tree, Developer Reference, logs, LKG history, source snapshots and RC
binaries were not imported into the public Git history. GitHub Releases remain
empty until the binary, licensing, corresponding-source and hardware gates
above are complete.
