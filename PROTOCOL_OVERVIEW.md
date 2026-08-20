# Protocol Overview

VirtualBus is a transport-neutral session and state-management layer. USB,
local WLAN/LAN and experimental RS485 adapters carry the same framed protocol;
game and session semantics do not depend on the physical transport.

This overview documents public behavior, not the complete implementation.

## Identity and session rules

- Cabinet A is Host with ID 0.
- Cabinets B, C and D are Clients with IDs 1, 2 and 3.
- Cabinet IDs are unique inside a session.
- Duplicate IDs, two Hosts or a session without a Host are invalid.
- ROM/profile identity is exchanged before RUNNING.
- Timeout and peer loss terminate or rejoin through a controlled state path.

## Session sequence

```text
DISCOVERY
  -> ROLE / CABINET ID
  -> ROMINFO / PROFILE
  -> STATE / READY
  -> START_FRAME
  -> RUNNING
  -> TIMEOUT, PEER_LOSS or controlled REJOIN
```

MCU profiles preserve each game's original communication semantics. InputSync
profiles exchange synchronized player and system inputs and use state hashes as
diagnostics. A real hash mismatch is never hidden or normalized away.

## InputSync contract

For the beta.6 MAME-to-MAME candidate:

- F1 carries the authoritative input frame.
- F5 acknowledges/progresses the frame barrier.
- F3 reports deterministic state diagnostics on the qualified MAME path.
- The preflight contract checks configuration and initial state before RUNNING.
- Coin, Start, Service, Test and player inputs are part of the synchronized
  input authority.

The MiSTer v3 candidate uses the same intended authority model:

```text
INPUT_COMMIT(epoch, N, inputs)
  -> Core processes exactly one authoritative machine frame
  -> FRAME_COMMIT(epoch, N, local_frame, hash)
  -> F3(epoch, N, hash)
  -> next frame
```

`N` is VirtualBus authority, `local_frame` is a diagnostic core counter and
`epoch` invalidates stale work across reset/rejoin. MAME-to-MAME InputSync uses
the retained `F05C...` LKG binary for the first public candidate. Mixed
MAME-to-MiSTer InputSync is not a public PASS claim until the exact release
artifacts pass physical acceptance.

## Validity rule

```text
valid setup       -> session may run
invalid setup     -> session formation is blocked and logged
runtime failure   -> failure is detected and handled in a controlled path
```

An invalid setup that appears to run and later fails without a useful reason
is not accepted beta behavior.
