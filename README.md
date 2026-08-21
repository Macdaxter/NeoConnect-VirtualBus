# NeoConnect VirtualBus

![NeoConnect VirtualBus banner](banner.png)

NeoConnect VirtualBus asks a different question:

not "How do we make this ROM playable online?",
but "How do we give this Neo Geo system a communication partner again?"

NeoConnect VirtualBus restores and extends communication between Neo Geo
systems. The project focuses on the link behavior itself: original MCU/link
communication where the games already had it, and InputSync for documented
modern multi-cabinet experiments where no original link hardware existed.

## Public Beta Available

The first public beta release authority is:

`NeoConnect VirtualBus 0.9.0-beta.6`

GitHub Releases are marked as **Pre-release**. This is a beta build, not a
final compatibility claim for every Neo Geo title.

The public package is the accepted RC3 user ZIP plus its matching
corresponding-source ZIP. These archives are immutable for this release:

```text
NeoConnect-VirtualBus-0.9.0-beta.6-User_USB_Portable-RC3.zip
SHA256 634681137D47B8ACCCEEF1DC0FC95F45FCCBC759A245A1D00661737B1629FA5D

NeoConnect-VirtualBus-0.9.0-beta.6-Corresponding_Source-RC3.zip
SHA256 96FB6326EF0D12E348AF52FA5B72512C0AEFB2CD439F7772B95AC7E1CBC88320
```

Any changed release artifact requires a new release candidate, new checksums
and a matching acceptance entry.

## What Is Included

- Windows portable launcher
- focused Neo Geo MAME endpoint: `MAME/neogeo.exe`
- ESP8266 NodeMCU USB/WLAN firmware and flasher
- MiSTer beta files for the documented integration path
- neutral placeholder artwork
- user documentation, known limits and checksums
- third-party license notices

No game ROMs, BIOS images, CHDs, screenshots, covers, flyers or publisher game
assets are included.

## Synchronization Models

NeoConnect VirtualBus distinguishes three different cases:

- **Original link / MCU communication**: communication coherence for games such
  as League Bowling, Riding Hero and Thrash Rally.
- **MCU timeline sync**: F8 aligns the VirtualBus/MCU communication generation;
  it is not emulator frame lockstep.
- **InputSync lockstep**: F1/F5/F3, preflight, epoch and same-frame hash checks
  provide deterministic machine-state synchronization for documented titles.

Optically identical screens are not a determinism proof. InputSync determinism
is verified through the documented commit/hash path.

## Accepted Beta Evidence

RC3 release authority:

```text
MAME/neogeo.exe
3EFCF21BBA749AFCC5EA71947442961EE957223B0ADD8993505AA5E208BB0412
```

Portable RC3 stick acceptance, 2026-08-21:

- Game: Metal Slug 2
- Profile: Fixed24
- Topology: two PCs, two ESP8266 adapters
- Host: main PC MAME endpoint
- Client: unpacked RC3 stick package
- ESP firmware flashed from the RC3 stick package
- CONFIG preflight: PASS
- STATE preflight: PASS
- InputSync epoch: generation 1, logical start frame 143
- Run: Level 1 into Level 2
- `0 DESYNC`
- fatal/error/overflow/verify/communication/invalid: 0
- controlled client sync loss / fail-closed at frame 14164

Short synchronized stalls may occur, but no state divergence was observed
during the RC3 acceptance run.

## Known Beta Limits

- InputSync may currently show short synchronized stalls/hitches.
- Sync loss intentionally fails closed instead of silently continuing as an
  autonomous game.
- Not every Neo Geo title, BIOS, DIP or profile combination is validated.
- MiSTer InputSync v3 is included only to the extent documented in the beta
  acceptance notes; do not claim full MAME parity without a matching hardware
  acceptance run.
- ESP8266 NodeMCU RS485 is protocol-validated but not release-qualified for
  continuous real-time InputSync.
- ESP32 RS485 qualification is a later hardware development block.
- Public Internet lobby, accounts, NAT traversal and an official relay service
  are outside this beta.

See:

- `docs/BETA_ACCEPTANCE_MATRIX.md`
- `docs/BETA_COMPATIBILITY_MATRIX.md`
- `docs/BETA_KNOWN_LIMITATIONS.md`
- `docs/BETA_MANIFEST.md`

## Legal And Distribution Notes

The packaged Neo Geo endpoint is a modified MAME build. MAME as a project is
distributed under GPL-2.0-or-later, and MAME name/logo usage is subject to the
MAME trademark notice. NeoConnect VirtualBus does not use the MAME logo and is
not affiliated with or endorsed by MAMEDev.

Users must provide their own legally obtained ROM/BIOS/media images. MAME's
legal information notes that users need the rights to the ROMs they use, and
MAME's ROM documentation explains that BIOS, device sets and CHD media may be
required separately from a game set.

Corresponding source for redistributed GPL components is provided as the
matching RC3 source release asset listed above. See
`docs/RC3_MAME_SOURCE_TRACEABILITY_AUDIT_2026-08-20.md` and
`docs/RC3_STICK_ACCEPTANCE_2026-08-21.md` for the source-to-build-to-package
and acceptance records.

## Support And Follow The Project

NeoConnect VirtualBus is an independent development project. The base software
is not intended to be locked behind a paid membership.

Voluntary support helps fund further development, test hardware, adapters and
future hardware prototypes:

[Support NeoConnect VirtualBus on Ko-fi](https://ko-fi.com/macdaxter)

Feedback, testing and documentation are just as valuable as financial support.
