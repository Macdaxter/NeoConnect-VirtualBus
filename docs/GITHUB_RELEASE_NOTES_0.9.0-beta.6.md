# NeoConnect VirtualBus 0.9.0-beta.6

Public Beta / GitHub Pre-release Draft

This is the draft release note for the first public beta package for
NeoConnect VirtualBus. The RC3 user package and matching corresponding-source
asset have both been produced from the documented RC3 source-to-build chain and
accepted by the 2026-08-21 stick/InputSync run.

NeoConnect VirtualBus restores and extends communication between Neo Geo
systems. It focuses on the communication partner itself: original MCU/link
communication for titles that had it, and InputSync for documented modern
multi-cabinet experiments.

## Download

Release asset:

`NeoConnect-VirtualBus-0.9.0-beta.6-User_USB_Portable-RC3.zip`

SHA-256:

```text
634681137D47B8ACCCEEF1DC0FC95F45FCCBC759A245A1D00661737B1629FA5D
```

Publish the ZIP together with:

- the matching `.zip.sha256`
- `NeoConnect-VirtualBus-0.9.0-beta.6-Corresponding_Source-RC3.zip`
  (`96FB6326EF0D12E348AF52FA5B72512C0AEFB2CD439F7772B95AC7E1CBC88320`)

Both archives are built, hashed and accepted.

## Accepted Beta Scope

- Portable Windows launcher
- focused Neo Geo MAME endpoint
- MAME-to-MAME InputSync v3 for documented LKG paths
- canonical InputSync preflight and fail-closed behavior
- Coin/System input authority for InputSync
- ESP8266 NodeMCU USB/WLAN beta adapter firmware
- MCU communication profiles documented in the compatibility matrix
- MiSTer beta integration files within the documented limitations
- Original, Fixed16 and Fixed24 performance profiles as game-dependent options

## Release Acceptance Evidence

Historical RC2/F05C acceptance evidence:

```text
MAME/neogeo.exe
F05C1BAEA1BAD9826F55856F2D4DBB7D32D40C0501BC550CAB0FC0F178A8398A
```

Portable ZIP acceptance, 2026-08-20:

- Game: Metal Slug 2
- Profile: Fixed24
- Host: Observer / F05C LKG path
- Client: unpacked beta ZIP from USB stick
- 177 HASH-OK samples
- 0 DESYNC
- 0 R-FRAME-JUMP
- 0 R-FRAME-STALE
- one recovered F1 retransmit
- fail-closed behavior after client close

The portable ZIP MAME endpoint is compatible with the current F05C MAME
InputSync LKG path. Short synchronized stalls may occur, but no state
divergence was observed during the acceptance run.

RC2 is not the public upload target because its exact corresponding source was
not proven. The current RC3 MAME candidate was built from the audited source:

```text
RC3 MAME candidate:
3EFCF21BBA749AFCC5EA71947442961EE957223B0ADD8993505AA5E208BB0412
```

RC3 stick acceptance, 2026-08-21:

- Game: Metal Slug 2
- Profile: Fixed24
- Topology: two PCs, two ESP8266 adapters
- Client: unpacked RC3 stick package
- Host: main PC MAME endpoint
- ESP firmware flashed from the RC3 stick package
- CONFIG preflight: PASS
- STATE preflight: PASS
- InputSync epoch: generation 1, logical start frame 143
- Run: Level 1 into Level 2
- DESYNC: 0
- Fatal/error/overflow/verify/communication/invalid: 0
- End: controlled client sync loss / fail-closed at frame 14164

The exact RC3 user ZIP is accepted for the documented MAME<->MAME InputSync v3
public-beta path. The final sync-loss event confirms fail-closed behavior and
is not a state divergence.

## Known Beta Limitations

- This is beta software, not a final compatibility claim.
- InputSync may show short synchronized stalls/hitches.
- Sync loss intentionally fails closed instead of silently continuing as an
  autonomous game.
- Not every Neo Geo title, BIOS, DIP or profile combination is validated.
- MiSTer InputSync v3 is included only to the extent documented in the beta
  acceptance notes.
- ESP8266 NodeMCU RS485 is protocol-validated but not release-qualified for
  continuous real-time InputSync.
- On the current ESP8266 OLED/display firmware, `Link: ONLINE` can mean that
  the local WLAN/AP interface is active; it is not proof that another adapter
  is reachable. Use the launcher/serial peer status as the authoritative peer
  indication.
- ESP32 RS485 qualification is a later hardware development block.
- Public Internet lobby, accounts, NAT traversal and an official relay service
  are outside this beta.

## Important Distribution Notes

No game ROMs, BIOS images, CHDs, screenshots, covers, flyers or publisher game
assets are included. Users must provide their own legally obtained software
images and any required BIOS/device/media sets.

The packaged Neo Geo endpoint is a modified MAME build. MAME is distributed as
GPL-2.0-or-later, and the corresponding source for redistributed GPL
components must be published with this release or offered in GPL-compliant
form. MAME name/logo usage is subject to the MAME trademark notice.

NeoConnect VirtualBus is not affiliated with or endorsed by MAMEDev, the
MiSTer project, SNK or any game publisher.

## References Inside The Repository

- `docs/BETA_ACCEPTANCE_MATRIX.md`
- `docs/BETA_COMPATIBILITY_MATRIX.md`
- `docs/BETA_KNOWN_LIMITATIONS.md`
- `docs/BETA_MANIFEST.md`
- `docs/BETA_PROJECT_CHARTER.md`
