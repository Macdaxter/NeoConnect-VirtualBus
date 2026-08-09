# Public Beta Scope

This document distinguishes qualified behavior from known limits and future
work. A feature is public only when the matching GitHub Release says it is.

## PASS / qualified in the beta.5 reference

| Area | Public statement |
| --- | --- |
| MAME package | Complete Windows x64 Neo Geo MAME subtarget, not a patch-only launcher. |
| Portable frontend | Compiled launcher; no installed Python or development tree required. |
| Roles and IDs | A/Host/0; B-C-D/Client/1-3; IDs must be unique. |
| MAME to MAME | Qualified for documented profiles. |
| MAME to MiSTer MCU | Qualified at original timing for the documented profiles and topology. |
| Riding Hero | Documented linked-cabinet reference path. |
| League Bowling | MVS/Arcade reference path with matching cold-start configuration. |
| Thrash Rally | M58 protocol, atomic commit and membership path. |
| MAME InputSync | F1/F5 transport and MAME authoritative-frame F3 diagnostics. |
| MiSTer local clocks | Original, Fixed16 and Fixed24 are reset-latched and hardware-confirmed. |
| Local transport | NodeMCU USB plus local WLAN/LAN. |
| Recovery | Timeout, peer-loss, reconnect and MAME restart are logged and controlled. |
| MiSTer installer | Backup, atomic install, SHA256 verification and reversible restore for the matched four-file set. |

The current frontend UI correction remains part of the beta.5 functional
scope. A newly compiled launcher is nevertheless a distinct release artifact
and requires a new manifest/checksum instead of replacing the frozen beta.5
EXE in place.

## KNOWN BETA LIMIT / documented

- MAME and MiSTer must use matching ROM, BIOS, region, machine mode and
  relevant DIP/Soft-DIP settings.
- InputSync starts from a matching zero-credit attract state. Coin, Start,
  Service, Test and player inputs must follow the synchronized path.
- beta.5 does not qualify MiSTer same-frame F3 authority or MiSTer-host F6.
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

## beta.6 RC gate

beta.6 is a separate, unpublished candidate. It may become the first public
release only after all of these pass on physical MAME/MiSTer hardware:

1. WAIT_COMMIT keeps deterministic machine state constant while video output
   continues normally.
2. 1,000 accepted INPUT_COMMIT messages produce exactly 1,000 matching
   FRAME_COMMIT messages.
3. Duplicate, stale sequence and wrong-epoch commits do not advance state.
4. Reset/rejoin discards pending old-epoch work.
5. Configuration and initial-state mismatch prevent session start.
6. Same-frame F3 remains stable at original timing over a sustained run.

Fixed16 and Fixed24 qualification begins only after the original-timing gate.
