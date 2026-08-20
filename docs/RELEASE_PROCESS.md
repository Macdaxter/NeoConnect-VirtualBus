# Public Release Process

GitHub Releases are the canonical public download channel. Mirrors may carry
the same immutable files, but must not replace or silently update them.

## Required assets

```text
VirtualBus-<version>-User_USB_Portable.zip
VirtualBus-<version>-Corresponding_Source.zip
SHA256SUMS.txt
```

Release notes must state the qualified matrix, known limits, package
prerequisites and exact protocol/component versions.

## Publication gates

1. The version has a signed-off hardware acceptance report.
2. The user ZIP starts outside the development tree on a clean Windows system.
3. ESP flash, firmware identity, role/ID setup, MAME start and log export pass.
4. MiSTer CHECK/INSTALL/STATUS/REMOVE/REVERT passes on physical hardware.
5. Every package file is covered by an internal SHA256 manifest.
6. The release ZIP is immutable and covered by the external SHA256 file.
7. All redistributed licenses and notices are included.
8. Complete corresponding source is available for GPL-covered modified
   binaries, including build/configuration material needed by the license.
9. The public repository contains no ROMs, BIOS files, CHDs, credentials,
   private logs or internal Developer Reference archive.
10. A second extraction verifies the final uploaded bytes, not a development
    directory that merely resembles the package.

## Immutability

After checksums are published, an asset is never replaced under the same tag.
Any byte change creates a new release candidate or version with new notes and
checksums.

## Current gate

`0.9.0-beta.6` is the current public-beta candidate. Its MAME-to-MAME
InputSync authority is the focused `MAME/neogeo.exe` artifact with SHA256
`F05C1BAEA1BAD9826F55856F2D4DBB7D32D40C0501BC550CAB0FC0F178A8398A`.

The candidate is not approved for public upload until the final user archive,
corresponding-source bundle, checksums and clean-system smoke pass. MiSTer
InputSync v3 must either pass physical acceptance or be explicitly downgraded
to experimental/limited in the release notes. No candidate is silently
repackaged under an existing tag.
