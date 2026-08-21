# NeoConnect VirtualBus - Known Beta Limitations

Date: 2026-08-20

This file is the public-beta boundary. It is not a roadmap and does not list
every planned feature.

## General

- This is a beta, not final compatibility certification.
- Only documented tested paths may be called PASS.
- ROM, BIOS, CHD, official artwork, screenshots, publisher logos, the MAME logo
  and the MiSTer logo are not distributed.
- Users must provide their own legally obtained ROM/BIOS material.
- Public Internet relay, lobby, accounts and NAT traversal are outside the
  first beta package.

## MAME

- The public user package should use the focused NeoGeo endpoint
  `MAME/neogeo.exe`, not a full MAME distribution.
- MAME<->MAME InputSync v3 is the primary public-beta InputSync path for the
  accepted RC3 package.
- InputSync requires matching ROM, BIOS, DIP/Soft-DIP, CPU profile and canonical
  zero-credit startup state.
- Coin and Start are synchronized inputs. The original game still decides what
  those inputs do.
- F3 determinism checking is not optional release noise; it is the state-safety
  check.

## MiSTer

- MiSTer integration is included only to the extent proven by physical
  acceptance for the exact package.
- MiSTer InputSync v3 must not be called MAME-parity until E5 preflight,
  system-input authority, F3 and fail-closed behavior are physically accepted.
- Mixed-clock MAME<->MiSTer InputSync is not a public guarantee until the
  physical matrix passes.
- The MiSTer Test switch authority has no normal core input mapping in the
  current documented package.

## ESP / Transport

- ESP8266 NodeMCU USB/WLAN is the beta adapter path.
- The current ESP8266 OLED/display firmware can show `Link: ONLINE` when only
  its local WLAN interface or fallback access point is active. This does not
  prove that a router or peer adapter is reachable. Launcher status and the
  serial `online=`/peer diagnostics remain authoritative for peer presence.
- ESP8266 NodeMCU RS485 is protocol-validated but not release-qualified for
  continuous real-time InputSync.
- ESP32 HardwareSerial/MAX485 qualification is a separate development block.
- InputSync must not start in an ambiguous local ESP peer domain. More than one
  visible online peer or duplicate Cabinet IDs are invalid for the public
  InputSync start path.

## MCU Profiles

- MCU profiles provide communication coherence, not emulator-frame lockstep.
- `F8 MCU_FRAME_SYNC` means MCU timeline/generation sync, not full MAME/MiSTer
  machine-state sync.
- League Bowling requires the documented MVS/Arcade reference setup and a
  homogeneous cold start.
- Thrash Rally M58 remains profile-dependent for arbitrary initiator/presence
  timing. This must not be hidden as a generic transport PASS.
- Riding Hero remains an MCU-profile LKG path, separate from InputSync.

## Overclock

- Available profiles remain Original/12 MHz, Fixed16 and Fixed24.
- Overclocking is title-dependent.
- Do not claim that 24 MHz fixes all slowdown.
- Audio, video, input, boot and sync status must be recorded separately.
- Captain Tomaday remains the documented counterexample: OC takes effect, but
  the reproducible hit/animation slowdown persists at 12/16/24 MHz, indicating
  a likely frame/game-logic bound condition rather than a 68k throughput limit.

## Start Timing

- Extreme late join is outside the first beta.
- The beta may require endpoints to be started within a practical time window.
- This audit has not yet verified a final empirical recommended/maximum start
  window for the public package.

## Logging

- Public beta error logs should be disabled by default and require explicit user
  opt-in.
- Development traces are Laboratory-only and must not be the default user
  behavior.
- Logs remain local unless the user chooses to share them.
