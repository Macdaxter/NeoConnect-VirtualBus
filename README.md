# NeoConnect VirtualBus

NeoConnect VirtualBus connects multiple Neo Geo instances across MAME,
MiSTer and dedicated ESP adapters. It provides cabinet identity, session
roles, transport-independent framing, game-specific MCU profiles,
InputSync diagnostics and controlled reconnect behavior.

![VirtualBus diagnostic console](assets/virtualbus-diagnostic-console.png)

## Public beta status

The latest qualified internal reference is `0.9.0-beta.5`. The current frontend
remains on that functional contract; its corrected `START MISTER` and visible
`DUALMODE` presentation are a UI-only revision, not a beta.6 protocol feature.
Because the rebuilt EXE has a new checksum, it does not silently replace the
frozen beta.5 artifact.

The next public candidate, beta.6, adds MiSTer InputSync frame authority and
deterministic preflight contracts, but it is **not published or
release-qualified yet**.
Its physical WAIT/commit/rejoin/preflight/F3 acceptance gates must pass first.

No download is intentionally attached to this repository yet. The first
public GitHub Release will contain one immutable user package, its SHA256
checksum, release notes and the corresponding source/license material required
for every redistributed GPL component.

See [Beta Scope](BETA_SCOPE.md) for the exact supported boundary and
[Release Process](docs/RELEASE_PROCESS.md) for the publication gates.

## Proven reference paths

- MAME to MAME for the documented LKG profiles.
- MAME to MiSTer for documented MCU profiles at original timing.
- Riding Hero and League Bowling reference topologies.
- Thrash Rally M58 protocol and membership path, with a documented initiator
  timing limit.
- MAME InputSync F1/F5 transport and authoritative F3 diagnostics.
- NodeMCU USB and local WLAN/LAN transports.
- Timeout, peer-loss, reconnect and portable launcher diagnostics.
- MiSTer Original/Fixed16/Fixed24 local clock profiles.

## Package model

Git tracks public documentation and release metadata. Compiled packages are
published only as immutable GitHub Release assets:

```text
VirtualBus-<version>-User_USB_Portable.zip
VirtualBus-<version>-Corresponding_Source.zip
SHA256SUMS.txt
```

The internal Developer Reference, complete logs, historical LKGs and research
snapshots are archived separately and are not public release assets.

## Important limits

- No ROM, BIOS or CHD data is included or provided.
- NodeMCU RS485 is protocol-validated but not release-qualified for continuous
  real-time InputSync.
- ESP32 HardwareSerial/MAX485 remains a separate hardware qualification block.
- Public relay, lobby, accounts and NAT traversal are outside the current beta.
- Mixed-clock MAME/MiSTer InputSync is not qualified until original-timing
  same-frame authority passes on hardware.

## Start here

1. Read [Beta Scope](BETA_SCOPE.md).
2. Read [Installation](INSTALL.md).
3. Verify every downloaded release with the published SHA256 file.
4. Keep MAME, MiSTer, frontend and ESP components from one release together.

VirtualBus follows the principles in the [Project Charter](PROJECT_CHARTER.md):
local operation, self-hosting, transparent diagnostics, voluntary telemetry
and preservation are part of the system contract.
