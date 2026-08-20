# Public Beta Scope

This document distinguishes qualified behavior from known limits and future
work. A feature is public only when the matching GitHub Release says it is.

## PASS / qualified for the beta.6 public candidate

| Area | Public statement |
| --- | --- |
| MAME package | Complete Windows x64 Neo Geo MAME subtarget, not a patch-only launcher. Public candidate authority is `MAME/neogeo.exe` SHA256 `F05C1BAEA1BAD9826F55856F2D4DBB7D32D40C0501BC550CAB0FC0F178A8398A`. |
| Portable frontend | Compiled launcher; no installed Python or development tree required. |
| Roles and IDs | A/Host/0; B-C-D/Client/1-3; IDs must be unique. |
| MAME to MAME InputSync | Qualified for documented profiles with canonical preflight, F1/F5, F3, Coin/System input authority and fail-closed behavior. |
| MAME to MiSTer MCU | Qualified at original timing for the documented profiles and topology. |
| Riding Hero | Documented linked-cabinet reference path. |
| League Bowling | MVS/Arcade reference path with matching cold-start configuration. |
| Thrash Rally | M58 protocol, atomic commit and membership path. |
| MiSTer local clocks | Original, Fixed16 and Fixed24 are reset-latched and hardware-confirmed. |
| Local transport | NodeMCU USB plus local WLAN/LAN. |
| Recovery | Timeout, peer-loss, reconnect and MAME restart are logged and controlled. |
| MiSTer installer | Backup, atomic install, SHA256 verification and reversible restore for the matched four-file set. |

The package must keep all components from one manifest together. A newer local
`neogeo.exe`, launcher, ESP firmware, HPS binary or RBF is not part of the
public candidate until it has its own acceptance record and checksums.

## KNOWN BETA LIMIT / documented

- MAME and MiSTer must use matching ROM, BIOS, region, machine mode and
  relevant DIP/Soft-DIP settings.
- InputSync starts from a matching zero-credit attract state. Coin, Start,
  Service, Test and player inputs must follow the synchronized path.
- MiSTer InputSync v3 physical parity remains pending unless the matching
  release notes explicitly mark it PASS.
- MiSTer-host F6 is not release-qualified.
- MAME/MiSTer Fixed16 and Fixed24 are not qualified for InputSync/Lockstep.
- Thrash Rally arbitrary-initiator timing remains profile-dependent.
- NodeMCU continuous RS485 InputSync is not release-qualified.
- Windows x64 is the portable launcher reference platform.

## OUTSIDE THE CURRENT BETA

- ESP32/MAX485 release qualification.
- Public lobby, user accounts, NAT traversal or an always-on official relay.
- Original AES/MVS hardware certification.
- ROM, BIOS or CHD distribution.
- Unlisted profiles, adapters and experimental forks.

## Remaining beta.6 release gates

beta.6 may become the first public binary release only after the final package
itself, not the development tree, passes the remaining gates:

1. Final user archive is regenerated from the updated package directory.
2. SHA256 checksums match the exact shipped artifacts.
3. Corresponding source and third-party license assets are complete.
4. Clean-machine portable package smoke passes outside the development tree.
5. MiSTer InputSync v3 is either physically accepted or clearly marked
   experimental/limited in the release notes.

Fixed16 and Fixed24 qualification begins only after the original-timing gate.
