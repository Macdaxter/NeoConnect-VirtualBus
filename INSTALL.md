# Installation

These steps apply only to a versioned GitHub Release. Do not assemble a beta
from repository files or mix assets from different releases.

## Requirements

- Windows x64 PC.
- One supported NodeMCU adapter per endpoint, flashed with the same release
  firmware.
- Optional MiSTer with network/SSH access.
- Legally obtained Neo Geo ROM and BIOS files.

ROMs, BIOS files and CHDs are not distributed by this project.

## Portable setup

1. Download `VirtualBus-<version>-User_USB_Portable.zip` and
   `SHA256SUMS.txt` from the same GitHub Release.
2. Verify the ZIP SHA256 before extraction.
3. Extract to a new directory or USB stick.
4. Flash every configured ESP with the firmware included in that package.
5. Start `VirtualBusLauncher.exe` and configure COM port, ROM directory,
   role, cabinet ID and optional MiSTer connection.
6. Use A/Host/0 and unique B-C-D/Client/1-3 identities.
7. Start all endpoints with matching ROM, BIOS, DIP/Soft-DIP and clock profile.

The launcher rejects unreadable adapters and firmware identities that do not
match its release contract.

## MiSTer installation

The frontend installs one matched set and must report all four components as
verified:

```text
/media/fat/MiSTer
/media/fat/_Console/NeoGeo_virtualbus_beta.rbf
/media/fat/virtualbusctl
<NeoGeo game directory>/romsets.xml
```

Existing files are backed up before replacement. Installation uses temporary
uploads and remote SHA256 verification. `REMOVE / REVERT` restores managed
backups and does not delete unmanaged files.

Restart MiSTer after replacing the HPS executable. Use the frontend STATUS
action to confirm the installed component set and active CPU profile.

## Reference session

- Cabinet A: Host, ID 0.
- Cabinets B-D: Clients, IDs 1-3.
- Original timing is the guaranteed MAME/MiSTer cross-system profile.
- InputSync begins from matching attract mode with zero credits.

When a run fails, preserve the package version, component identities and local
logs. Do not replace individual binaries while diagnosing the session.
