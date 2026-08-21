# NeoConnect VirtualBus - Beta Acceptance Matrix

Date: 2026-08-21

Purpose: first public beta acceptance matrix. This file records only verified
or explicitly limited observations. It does not claim full Neo Geo coverage.

Status values:

- PASS: supported by current artifact, LKG log or current documentation.
- LIMITATION: known boundary, acceptable when documented.
- EXPERIMENTAL: present but not public-beta guaranteed.
- NOT VERIFIED: no current proof in this audit.
- FAIL: observed defect.
- OUT OF SCOPE: not part of first public beta.

## Build and Package Gates

| Case | Expected | Observed | Status | Evidence |
| --- | --- | --- | --- | --- |
| Package identity visible | Launcher and package identify `0.9.0-beta.6` / `User_USB_Portable_beta6` | Version constants and package files contain this identity | PASS | `observer/USER_Frontend/core/version.py`, package `PACKAGE_VERSION.txt` |
| Package MAME binary gate | Launcher rejects a different `neogeo.exe` in portable package | Hash gate exists and unit test covers mismatch | PASS | `observer/USER_Frontend/core/system_launcher.py`, `test_mame_readiness.py` |
| ESP firmware gate | Wrong ESP build is rejected | Firmware build gate exists for `20260801-rs485usb250k1` | PASS | `observer/USER_Frontend/core/esp_serial.py`, package docs |
| User package public readiness | Public package must have matching source, launcher, manifest and acceptance | RC3 user/source archives are built, hashed, internally verified and accepted by the 2026-08-21 two-PC stick/InputSync run | PASS | `docs/CORRESPONDING_SOURCE_RC2_AUDIT_2026-08-20.md`, `docs/RC3_MAME_SOURCE_TRACEABILITY_AUDIT_2026-08-20.md`, `docs/RC3_STICK_ACCEPTANCE_2026-08-21.md` |
| Corresponding source freeze | Exact source for all shipped GPL binaries is frozen | RC3 source archive contains the full MAME base TAR, exact build overlay, launcher source and retained component sources; archive integrity is verified | PASS for source packaging | RC3 source archive SHA256 `96FB6326...` |
| SHA256 manifest | Central hashes recorded | Package `SHA256SUMS.txt` exists and matches central artifacts observed | PASS | package `SHA256SUMS.txt` |
| MAME binary authority | Public beta must use a source-traceable MAME binary | RC3 candidate `3EFCF21B...` was clean-built in isolated `build-rc3` from the packaged source state and passed the 2026-08-21 stick/InputSync acceptance | PASS | `docs/RC3_MAME_SOURCE_TRACEABILITY_AUDIT_2026-08-20.md`, `docs/RC3_STICK_ACCEPTANCE_2026-08-21.md` |
| RC2 ZIP integrity | Release archive extracts and internal central hashes match | RC2 ZIP extracts to 42 files; package `SHA256SUMS.txt` verifies; no filtered ROM/BIOS/CHD/log/artwork archive artifacts found, but public upload blocked by corresponding-source gap | LIMITATION | `NeoConnect-VirtualBus-0.9.0-beta.6-User_USB_Portable-RC2.zip`, SHA256 `00D3FCE1...` |
| Launcher COM hotplug refresh | Reconnected ESP COM ports can be reloaded without restarting launcher | Setup has COM refresh action and refreshes the MAME/DUALMODE COM list while setup remains open; registry discovery unit-tested | PASS | `observer/USER_Frontend/ui/app.py`, `test_mame_readiness.py`, RC3 launcher hash `8FD147CB...` |

## MAME InputSync v3

| Case | Expected | Observed | Status | Evidence |
| --- | --- | --- | --- | --- |
| Protocol version | MAME uses InputSync v3 | `INPUTSYNC_PROTOCOL_VERSION = 3` | PASS | `src/devices/bus/neogeo/virtualbus.h` |
| Explicit transport role | Launcher passes HOST/CLIENT role separately from game cabinet identity | `VIRTUALBUS_INPUTSYNC_ROLE` passed by launcher and Laboratory | PASS | `observer/launcher.py`, `observer/launcher_laboratory.py`, user frontend runtime |
| Canonical NVRAM | InputSync uses isolated canonical session NVRAM | Runtime prepares canonical session and adds `-nonvram_save` | PASS | `observer/USER_Frontend/core/system_launcher.py`, `docs/INPUTSYNC_RELEASE_ACCEPTANCE_2026-08-13.md` |
| Initial-state preflight | CONFIG and STATE must match before F4 | Documented and tested on MAME<->MAME | PASS | `docs/INPUTSYNC_RELEASE_ACCEPTANCE_2026-08-13.md` |
| Coin/System authority | Coin1, Coin2, Start, Service/Test are authoritative frame inputs | Documented MS2 coin fix and state equality through frame 1200 | PASS | `docs/INPUTSYNC_RELEASE_ACCEPTANCE_2026-08-13.md` |
| F3 determinism | State mismatch must be detected, not hidden | F3 remains active in contract and release notes | PASS | `virtualbus.h`, acceptance doc |
| Fail-closed | Sync loss must stop instead of autonomous continuation | Documented fail-closed behavior | PASS | acceptance doc |
| MAME<->MAME MS2 Fixed24 focused binary | Sustained same-frame hash equality | 112 retained common HASH-OK samples through frame 6840; no desync/timeout/sync loss/abort | PASS | `docs/INPUTSYNC_RELEASE_ACCEPTANCE_2026-08-13.md` |
| MAME portable ZIP MS2 Fixed24 acceptance | Portable ZIP client remains state-synchronous with the shipped MAME endpoint | RC3 two-PC stick run reached Level 2 at Fixed24; CONFIG and STATE preflight matched; InputSync epoch started at frame 143; DESYNC=0, fatal/error/overflow/verify/communication/invalid=0; final client sync loss failed closed at frame 14164 | PASS | `docs/RC3_STICK_ACCEPTANCE_2026-08-21.md` |
| InputSync STA selected-pair isolation | Ambiguous ESP peer domain must not enter RUNNING | User frontend now rejects duplicate IDs and multiple online peers when ESP HTTP status is available | PASS for implemented guard; runtime hardware retest pending | `docs/BETA_CURRENT_STATE_AUDIT.md`, `test_mame_readiness.py` |
| Long mixed ESP domains | Multiple active ESPs in same STA domain | Previously identified as stall risk | LIMITATION | `docs/INPUTSYNC_STALL_ANALYSIS_2026-08-15.md` |

## MiSTer

| Case | Expected | Observed | Status | Evidence |
| --- | --- | --- | --- | --- |
| MiSTer package identity | HPS reports InputSync v3 package patch tag | Package and docs expect `beta6-inputsync-v3-nghmap1-20260814` | PASS for static package identity | package manifest |
| MiSTer core build | NeoGeo beta RBF built | Quartus build documented with hash | PASS for build artifact | package manifest |
| MiSTer Original/Fixed16/Fixed24 local profiles | Profiles selectable and latched | Package docs report hardware local profile PASS | PASS | package manifest |
| MAME<->MiSTer InputSync v3 physical parity | E5 Work/backup hash, system input, F3 and fail-closed match MAME | Still marked physical acceptance pending | NOT VERIFIED | `docs/MISTER_INPUTSYNC_V3_CONTRACT_2026-08-13.md`, package manifest |
| MiSTer-host F6 late start | MiSTer can host full late-start path | Not physically accepted | LIMITATION | package manifest |
| MiSTer Test switch authority | Normal core input mapping exists | No normal mapping yet | LIMITATION | package manifest |

## MCU Profiles

| Case | Expected | Observed | Status | Evidence |
| --- | --- | --- | --- | --- |
| League Bowling K78 | Four cabinets / eight players with communication coherence | Complete four-cabinet round documented | PASS | League Bowling logs and sync-model documentation |
| F8 semantics | MCU timeline sync, not emulator frame lockstep | Documented and distinguished from InputSync | PASS | `docs/VIRTUALBUS_SYNCHRONIZATION_MODELS_2026-08-10.md` |
| Fake MCU removal for League Bowling / Thrash Rally | No fake Riding Hero MCU file needed for these titles | Driver dependency removal documented and package accepted | PASS | package manifest, fake-MCU audit |
| Riding Hero MCU path | Existing LKG remains valid | Existing package docs mark LKG path | PASS for documented LKG | Developer Reference docs |
| Thrash Rally M58 | Protocol boundary exists | Arbitrary initiator / presence behavior remains profile-dependent | LIMITATION | package manifest and user logs |

## Transport / Adapter

| Case | Expected | Observed | Status | Evidence |
| --- | --- | --- | --- | --- |
| ESP8266 USB/WLAN | Supported beta adapter transport | Build gate and package firmware present | PASS | package manifest, firmware files |
| ESP8266 OLED `Link: ONLINE` | Display must distinguish local interface readiness from confirmed peer reachability | Display firmware uses `network_connected` for non-direct modes; AP start and STA-to-AP fallback set it true without requiring a peer | LIMITATION | `docs/ESP_DISPLAY_LINK_STATUS_AUDIT_2026-08-20.md`, RC3 `ESP8266-Firmware/esp_buffer4.ino` |
| ESP8266 RS485 real-time | Continuous real-time InputSync over NodeMCU RS485 | Not release-qualified | LIMITATION | package `KNOWN_BETA_LIMITS.md` |
| ESP32 RS485 | HardwareSerial/MAX485 full path | Development block only | EXPERIMENTAL | audit scope |
| Internet relay/lobby | Public relay service | Not part of package | OUT OF SCOPE | package docs |

## Recovery / Error Cases

| Case | Expected | Observed | Status | Evidence |
| --- | --- | --- | --- | --- |
| Wrong MAME binary | Start rejected with clear message | Unit tested | PASS | `test_mame_readiness.py` |
| Wrong ESP firmware | Start rejected with expected and actual build | Unit tested previously; package docs include gate | PASS | `test_esp_serial.py`, package docs |
| Duplicate ESP cabinet ID | Start rejected before InputSync RUNNING | Source guard and unit test pass; launcher rebuilt for RC2 | PASS | `test_mame_readiness.py`, RC2 launcher hash `7D185946...` |
| More than one ESP peer online | Start rejected before InputSync RUNNING | Source guard and unit test pass; launcher rebuilt for RC2 | PASS | `test_mame_readiness.py`, RC2 launcher hash `7D185946...` |
| ESP removal/reset during RUNNING | Visible fail-closed or reconnect according to mode | Not fully verified against final package | NOT VERIFIED | audit requirement |
| WLAN interruption | Controlled timeout/reconnect/fail-closed | Not fully verified against final package | NOT VERIFIED | audit requirement |
| Unknown ROM | No false PASS profile claim | Not fully verified against final package | NOT VERIFIED | audit requirement |

## Current Release Blocking Items

1. MiSTer InputSync v3 physical acceptance remains pending; do not claim MAME
   parity unless a separate hardware acceptance run is recorded.
