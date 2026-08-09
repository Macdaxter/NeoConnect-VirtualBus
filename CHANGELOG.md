# Changelog

## Unreleased - public repository preparation

- Added a public documentation surface separated from the internal CLEAN and
  Developer Reference archives.
- Added explicit beta.6 physical qualification gates.
- Added an immutable GitHub Release asset model and automated release checks.
- Added licensing and corresponding-source gates for redistributed components.
- Classified the corrected `START MISTER`/`DUALMODE` presentation as a beta.5
  UI-only revision. The rebuilt executable remains a distinct checksummed
  artifact and does not overwrite the frozen beta.5 binary.

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
