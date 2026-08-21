# NeoConnect VirtualBus 0.9.0-beta.6 RC3 - Stick Acceptance

Date: 2026-08-21

Scope: final public-beta RC3 MAME<->MAME InputSync runtime acceptance with the
exact RC3 user package path and the release ESP firmware flashed from the stick.

This document records only the observed run. It does not promote MiSTer
InputSync parity and does not change the RC3 archives.

## Test Setup

Game:

`mslug2`

Profile:

`Fixed24`

Topology:

- two PCs,
- two ESP8266 adapters,
- ESP firmware flashed from the RC3 stick package,
- client launched directly from the unpacked RC3 stick package,
- host launched from the main PC folder.

Relevant logs:

```text
C:/Projects/mame/NeoConnect-VirtualBus-CLEAN/packages/User_USB_Portable_beta6_RC3/logs/mslug2_beta_error_20260821-082635.log
C:/Projects/mame/NeoConnect-VirtualBus-CLEAN/packages/User_USB_Portable_beta6_RC3/logs/mslug2_beta_error_20260821-082635_summary.json
D:/ProjektBackup/mslug2_beta_error_20260821-082638.log
D:/ProjektBackup/mslug2_beta_error_20260821-082638_summary.json
```

## Package Identity

The accepted package remains:

```text
NeoConnect-VirtualBus-0.9.0-beta.6-User_USB_Portable-RC3.zip
SHA256 634681137D47B8ACCCEEF1DC0FC95F45FCCBC759A245A1D00661737B1629FA5D
```

The matching corresponding source remains:

```text
NeoConnect-VirtualBus-0.9.0-beta.6-Corresponding_Source-RC3.zip
SHA256 96FB6326EF0D12E348AF52FA5B72512C0AEFB2CD439F7772B95AC7E1CBC88320
```

These archives were not modified by this acceptance documentation update.

## Preflight

Both endpoints used the same canonical InputSync NVRAM seed:

```text
FF35C42ADFB117D813B5D021625837A450BE11248013FDA1381BBBDBCA87D039
```

CONFIG preflight:

```text
epoch=1 local=2F127037 remote=2F127037
PASS
```

STATE preflight at sample frame 120:

```text
work_ram_local=005D9580
work_ram_remote=005D9580
backup_ram_local=404EAE5E
backup_ram_remote=404EAE5E
backup_ram=MATCH
mismatch=NONE
PASS
```

InputSync epoch:

```text
generation=1
logical_start=143
host role=HOST
client role=CLIENT
pipeline=3
PASS
```

## Runtime Result

The run continued through Level 1 into Level 2 at Fixed24 and was stopped by a
controlled peer/sync-loss path.

Observed endpoint summaries:

| Endpoint | Duration | Final relevant state | Fatal | Error | DESYNC | Overflow | Verify failure | Communication error | Invalid |
| --- | ---: | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Host / CAB_A | 0:04:11.448149 | stopped while `RUNNING` | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| Client / CAB_B | 0:04:22.398799 | `RESYNC` after fail-closed timeout | 0 | 0 | 0 | 0 | 0 | 0 | 0 |

The retained minimal logs do not store individual F3 `HASH-OK` samples, but
both summaries record `desync=0` over the accepted RUNNING interval.

The final host status before stop was still `RUNNING` near frame 14160. The
client then timed out at:

```text
BARRIER-TIMEOUT role=CLIENT emu_frame=14164 expected=14164 waited_ms=1009 polls=65 retries=9 action=REJOIN
INPUTSYNC-FAIL-CLOSED emu_frame=14164 reason=barrier_timeout action=PAUSE_RESET_REQUIRED
```

Interpretation:

- The synchronized MAME<->MAME InputSync state did not diverge.
- The final event is a controlled sync-loss / peer-loss path, not a state
  mismatch.
- Fail-closed behavior remains active: the client enters `RESYNC` and
  `PAUSE_RESET_REQUIRED` instead of continuing autonomously.

## Observed Limitations

The user observed approximately four small synchronized stops during the full
run. These are consistent with the documented beta limitation that InputSync can
show short synchronized hitches. No state divergence was observed in this run.

The summary profile reports timeout counters:

```text
Host timeout counter:   4
Client timeout counter: 7
```

Only the final client timeout escalated to the explicit `BARRIER-TIMEOUT` and
fail-closed path. These counters do not imply DESYNC.

## Acceptance Decision

RC3 MAME<->MAME InputSync stick acceptance:

`PASS`

Public-beta release implication:

The exact RC3 user ZIP and matching corresponding-source ZIP are accepted for
the documented MAME<->MAME InputSync v3 beta path, with the already documented
limitations:

- short synchronized hitches may occur,
- sync loss fails closed,
- MiSTer InputSync parity remains separate and is not promoted by this run,
- ESP8266 NodeMCU RS485 continuous real-time InputSync remains outside the
  public guarantee.
