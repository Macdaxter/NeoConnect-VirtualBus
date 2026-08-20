# Changelog

## Unreleased - public repository preparation

- Added a public documentation surface separated from the internal CLEAN and
  Developer Reference archives.
- Updated the public beta scope to the beta.6 F05C MAME-to-MAME InputSync
  candidate while keeping MiSTer InputSync v3 physical parity as pending.
- Added an immutable GitHub Release asset model and automated release checks.
- Added licensing and corresponding-source gates for redistributed components.
- Recorded the `MAME/neogeo.exe` SHA256
  `F05C1BAEA1BAD9826F55856F2D4DBB7D32D40C0501BC550CAB0FC0F178A8398A` as the
  MAME InputSync candidate authority.
- Replaced public front-page screenshot artwork with neutral project-owned
  artwork.
- Reworked the README introduction around the actual project distinction:
  original communication profiles, InputSync extensions and transport as a
  separate layer.
- Added an initial observation-based compatibility matrix, including Magician
  Lord as an InputSync candidate with unverified Fix Layer / 24 MHz causality.
- Replaced the public tester-access request with a low-threshold beta test
  report focused on real setups, play results and optional diagnostics.

## 0.9.0-beta.5 - qualified internal reference

- Added MiSTer Original/Fixed16/Fixed24 profile selection with FPGA-latched
  status confirmation.
- Added combined MAME plus MiSTer frontend orchestration and coordinated stop.
- Kept original timing as the guaranteed cross-system profile.
- Qualified the reversible four-component MiSTer installer and portable
  NodeMCU firmware/version gate.
- Preserved NodeMCU RS485, MiSTer same-frame F3 and mixed-clock InputSync as
  documented limits rather than release claims.

Earlier internal candidates are retained for provenance but are not public
installation targets.
