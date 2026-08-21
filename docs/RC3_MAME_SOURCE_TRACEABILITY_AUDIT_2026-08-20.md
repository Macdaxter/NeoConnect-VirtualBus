# NeoConnect VirtualBus 0.9.0-beta.6 RC3 - MAME Source Traceability Audit

Date: 2026-08-20

Scope: define the source-traceable replacement path for the unreleased RC2
package. RC2 remains technically accepted but must not be published as a public
binary release unless its exact corresponding MAME source is found.

## Current Repository State

Branch:

```text
codex/remove-fake-mcu-romloads
```

HEAD:

```text
23d3d2a016edee6745603872520042cbae54970f
```

The working tree is dirty. The current RC3 candidate source is therefore not the
HEAD commit alone. It is HEAD plus the local MAME modifications listed below.

Modified MAME source files relative to HEAD:

```text
src/devices/bus/neogeo/neogeo_vbus_ui.cpp
src/devices/bus/neogeo/ridinghero.lua
src/devices/bus/neogeo/virtualbus.cpp
src/devices/bus/neogeo/virtualbus.h
src/emu/emuopts.cpp
src/emu/emuopts.h
src/mame/neogeo/neogeo.cpp
src/mame/neogeo/neogeo.h
```

Diffstat against HEAD:

```text
src/devices/bus/neogeo/neogeo_vbus_ui.cpp |   52 +-
src/devices/bus/neogeo/ridinghero.lua     |    5 +
src/devices/bus/neogeo/virtualbus.cpp     | 1741 +++++++++++++++++++++++++----
src/devices/bus/neogeo/virtualbus.h       |  135 ++-
src/emu/emuopts.cpp                       |    1 +
src/emu/emuopts.h                         |    7 +
src/mame/neogeo/neogeo.cpp                |  864 ++++++++++++--
src/mame/neogeo/neogeo.h                  |   93 +-
8 files changed, 2578 insertions(+), 320 deletions(-)
```

## Existing Binary Inventory

```text
C:\Projects\mame\neogeo.exe
bytes 127850501
SHA256 E6B3FE14C479C81DA8496905F49401A9F866AC59373FBE7A47BC176A7745F256

C:\Projects\mame\NeoConnect-VirtualBus-CLEAN\mister\research\beta6-frame-authority-20260809\artifacts\neogeo_beta6_frame_authority.exe
bytes 127838136
SHA256 2B15E7BBE84FE8B4FB692AC8DA4B3A3D8AAD2F7B59EC51C9E4AF103648C6EACB

C:\Projects\mame\NeoConnect-VirtualBus-CLEAN\packages\Developer_Reference\mame\release-binaries\neogeo_virtualbus_beta.exe
bytes 127827501
SHA256 D6F675BBAF04D40D545D9E5F4115EB4B36C4B6883372E059A429539B2FC0ADD7

C:\Projects\mame\NeoConnect-VirtualBus-CLEAN\packages\User_USB_Portable\MAME\neogeo.exe
bytes 127827501
SHA256 D6F675BBAF04D40D545D9E5F4115EB4B36C4B6883372E059A429539B2FC0ADD7

C:\Projects\mame\NeoConnect-VirtualBus-CLEAN\packages\User_USB_Portable_beta53\MAME\neogeo.exe
bytes 127838136
SHA256 4DF1302B5796C9C54D00D3DE3D64A10CC326EF5D09643BC1F2CB3DFBCB86F62C

C:\Projects\mame\NeoConnect-VirtualBus-CLEAN\packages\User_USB_Portable_beta6\MAME\neogeo.exe
bytes 127850501
SHA256 F05C1BAEA1BAD9826F55856F2D4DBB7D32D40C0501BC550CAB0FC0F178A8398A
```

## Source Snapshot Comparison

Three available MAME source states were compared:

- `Root`: current repository working source.
- `Beta53Source`: `NeoConnect-VirtualBus-CLEAN/packages/Corresponding_Source_beta53/MAME`.
- `DevRefModifiedSrc`: `NeoConnect-VirtualBus-CLEAN/packages/Developer_Reference/mame/modified-src`.

File identity table:

| File | Root SHA256 | Beta53Source SHA256 | DevRefModifiedSrc SHA256 |
| --- | --- | --- | --- |
| `src/devices/bus/neogeo/virtualbus.cpp` | `157690C9F324CFA715915A84CAB3F4A3BDA2F7D902915518E36D8243E990C773` | `2664B943D102A6F8A94AE6F42C77E1B7300104931CAF0B11815C5F9E925A7360` | `B013BCDECFE3D2A1B0D7ABA837B38058AF66015BDD4568B1863E269728CC5F59` |
| `src/devices/bus/neogeo/virtualbus.h` | `D12DFB3723D528F28556FE36E5098E781354ABE78B9BC6197AD74423F08F95FF` | `4797C1508A3D0135C01A86DC86DD53D5F344C7F430FF3259C4C7145F0AF122EF` | `C7C84B0AAC9B657C290FAEA91C109CBEA50ABD6ABD2D6BFE1A38C61FF2AC09F8` |
| `src/devices/bus/neogeo/neogeo_vbus_ui.cpp` | `754C592837946A57D1BD4BD499A5546B8ADC551E22B4901EE0BAF214AAF75B02` | `754C592837946A57D1BD4BD499A5546B8ADC551E22B4901EE0BAF214AAF75B02` | `754C592837946A57D1BD4BD499A5546B8ADC551E22B4901EE0BAF214AAF75B02` |
| `src/devices/bus/neogeo/ridinghero.lua` | `87F53A550CBC762957AC22FFC20E96B28E1DED0B88431BBE4A3C0045B60F8A1C` | `87F53A550CBC762957AC22FFC20E96B28E1DED0B88431BBE4A3C0045B60F8A1C` | `87F53A550CBC762957AC22FFC20E96B28E1DED0B88431BBE4A3C0045B60F8A1C` |
| `src/emu/emuopts.cpp` | `28B69001AC0A57F03BD2E7EF30F7345A720D054FD4D750D69AF6019DCBDE7611` | `28B69001AC0A57F03BD2E7EF30F7345A720D054FD4D750D69AF6019DCBDE7611` | `28B69001AC0A57F03BD2E7EF30F7345A720D054FD4D750D69AF6019DCBDE7611` |
| `src/emu/emuopts.h` | `A1DB00C3A65E377542FFA021D4A273E341AED44E097220D0D2BDA204A1A9EA4D` | `A1DB00C3A65E377542FFA021D4A273E341AED44E097220D0D2BDA204A1A9EA4D` | `A1DB00C3A65E377542FFA021D4A273E341AED44E097220D0D2BDA204A1A9EA4D` |
| `src/mame/neogeo/neogeo.cpp` | `3DF93AB52D59D5EE75A5B42CB15BF79AEE625E968346F1D562920A159CD3272C` | `799543B06D292C340087C8CF339F82016E7D905A102CB7BD2EF877EFD4EB1EAF` | `0F41FAB665F0543CC4D62A5CDEA5F14B28CFD3F1965A213497469385B40F7528` |
| `src/mame/neogeo/neogeo.h` | `3EA9BB6B2795BBE66D8F1C0DF15D1B49B1F91C0256B865EBDF9415769F0E8415` | `A461268C912417FAB56A0312404FA74564D95EC177831E13ED093D9CBF427B3B` | `A461268C912417FAB56A0312404FA74564D95EC177831E13ED093D9CBF427B3B` |
| `src/mame/neogeo/neogeo_overclock.cpp` | `13937C5E7C9551C1FD64AE771CE6DC0D6772E6D0C9F7EF8D5D257C6A8A79D945` | `13937C5E7C9551C1FD64AE771CE6DC0D6772E6D0C9F7EF8D5D257C6A8A79D945` | `13937C5E7C9551C1FD64AE771CE6DC0D6772E6D0C9F7EF8D5D257C6A8A79D945` |
| `src/mame/neogeo/neogeo_overclock.h` | `14F062BF159DABE4EE11FF447ECC815B85DB49926EAA853272A9184558BE063D` | `14F062BF159DABE4EE11FF447ECC815B85DB49926EAA853272A9184558BE063D` | `14F062BF159DABE4EE11FF447ECC815B85DB49926EAA853272A9184558BE063D` |

Only four files materially differ between the current source states:

```text
src/devices/bus/neogeo/virtualbus.cpp
src/devices/bus/neogeo/virtualbus.h
src/mame/neogeo/neogeo.cpp
src/mame/neogeo/neogeo.h
```

Pairwise focused diff sizes:

```text
Root_vs_Beta53
virtualbus.cpp 54 insertions / 202 deletions
virtualbus.h   3 insertions  / 35 deletions
neogeo.cpp     17 insertions / 208 deletions
neogeo.h       1 insertion   / 6 deletions

Root_vs_DevRef
virtualbus.cpp 93 insertions / 528 deletions
virtualbus.h   3 insertions  / 79 deletions
neogeo.cpp     25 insertions / 216 deletions
neogeo.h       1 insertion   / 6 deletions

Beta53_vs_DevRef
virtualbus.cpp 59 insertions / 346 deletions
virtualbus.h   1 insertion  / 45 deletions
neogeo.cpp     8 insertions  / 8 deletions
neogeo.h       0 / 0
```

## Contract Marker Check

Marker counts across the four differing files:

| Marker | Root | Beta53Source | DevRefModifiedSrc |
| --- | ---: | ---: | ---: |
| `VIRTUALBUS_INPUTSYNC_ROLE` | 2 | 0 | 0 |
| `INPUTSYNC_PROTOCOL_VERSION` | 2 | 2 | 0 |
| `PREFLIGHT-CONFIG` | 2 | 2 | 0 |
| `PREFLIGHT-STATE` | 4 | 3 | 0 |
| `BACKUP_RAM` | 9 | 0 | 0 |
| `INPUTSYNC-FAIL-CLOSED` | 2 | 0 | 0 |
| `ROMREGION_ERASEFF` | 13 | 13 | 11 |
| `prog_hero_mcu` | 6 | 6 | 6 |
| `NO_DUMP` | 1 | 1 | 5 |
| `BARRIER-F5-RETX` | 1 | 1 | 1 |
| `FRAME-COMMIT-CHECK` | 2 | 2 | 2 |

Interpretation:

- `DevRefModifiedSrc` is not a current RC3 basis. It predates InputSync v3
  preflight.
- `Beta53Source` is also not a current RC3 basis. It has partial preflight but
  lacks the later role contract, backup-RAM preflight diagnostics and
  fail-closed behavior.
- `Root` is the only currently available source state that contains the known
  beta.6 v3 contract elements observed in the accepted MAME InputSync tests.

## RC3 Source Decision

RC3 must use the current root MAME source as the source candidate, not
`Corresponding_Source_beta53` and not `Developer_Reference/mame/modified-src`.

This is not because Root is assumed to be smooth or final. It is because it is
the only inspected source state containing the required current contract:

- explicit InputSync transport role via `VIRTUALBUS_INPUTSYNC_ROLE`,
- InputSync protocol version 3,
- config preflight,
- state preflight,
- backup-RAM preflight digest/diagnostics,
- system input authority needed for Coin/Start behavior,
- fail-closed behavior,
- fake-MCU file dependency removal via erased MCU regions for `lbowling` and
  `trally`,
- existing F1/F5/F3 barrier/hash machinery.

The current root binary `E6B3...` is not a release authority. It is only an
existing binary built from an unverified local state. The RC3 rule is:

```text
current audited source
  -> clean documented neogeo build
  -> new neogeo.exe SHA256
  -> new User_USB_Portable RC3 package
  -> new corresponding-source RC3 package
  -> fresh acceptance
```

## Build Attempts And Correct RC3 Build Command

The initial build reference from the older source package was tested and is not
the correct RC3 build command for this workspace:

```text
mingw32-make.exe SUBTARGET=neogeo -j4
```

Observed result:

```text
Definition file for TARGET=mame SUBTARGET=neogeo does not exist
```

The broad `SUBTARGETS=neogeo` command was also rejected as a release-reference
command because it generated a much wider project set than the focused Neo Geo
endpoint.

The correct focused RC3 build command used for the new candidate was:

```powershell
C:\msys64\usr\bin\bash.exe -lc 'cd /c/Projects/mame && export MSYSTEM=MINGW64 && export MINGW_PREFIX=/mingw64 && export MINGW64=/mingw64 && export TMPDIR=/c/Projects/mame/build/tmp && export TMP=/c/Projects/mame/build/tmp && export TEMP=/c/Projects/mame/build/tmp && export PATH=/mingw64/bin:/usr/bin:$PATH && make SUBTARGET=neogeo SOURCES=src/mame/neogeo/neogeo.cpp BUILDDIR=build-rc3 -j4'
```

The explicit `TMPDIR`/`TMP`/`TEMP` override is required in this environment
because the linker could not create temporary files under `C:\msys64\tmp`.

## RC3 MAME Binary Candidate

The following binary was produced from the current audited root source:

```text
Path:        C:\Projects\mame\neogeo.exe
Built:       2026-08-20 21:43:35 Europe/Berlin
Bytes:       127850501
SHA256:      3EFCF21BBA749AFCC5EA71947442961EE957223B0ADD8993505AA5E208BB0412
```

Basic command-line checks:

```text
neogeo.exe -help             PASS
neogeo.exe -validate mslug   PASS
neogeo.exe -validate mslug2  PASS
neogeo.exe -validate lbowling PASS
neogeo.exe -validate trally  PASS
neogeo.exe -validate ridhero PASS
```

ROM-definition sanity:

```text
lbowling -listroms: no external fake-MCU file listed
trally   -listroms: no external fake-MCU file listed
```

This binary is a new RC3 candidate. It is not byte-identical with the accepted
RC2/F05C binary and must not be released under the RC2 acceptance result.

## RC3 Launcher Gate

The launcher source was minimally updated to identify RC3 and to expect the new
MAME candidate hash:

```text
File:        observer/USER_Frontend/core/version.py
Build ID:    20260820-beta6-rc3
MAME SHA256: 3EFCF21BBA749AFCC5EA71947442961EE957223B0ADD8993505AA5E208BB0412
```

User-frontend regression tests passed:

```text
python observer/USER_Frontend/test_mame_readiness.py
  10/10 PASS

python observer/USER_Frontend/test_esp_serial.py
  3/3 PASS

python -m unittest discover -s observer/USER_Frontend -p "test_*.py"
  31/31 PASS
```

The historical launcher environment was restored from the locally retained
CPython 3.10.11 installer. Tk 8.6 and the already installed PyInstaller 6.21.0
were verified before the release build. The resulting Onefile executable is:

```text
RC3 launcher source:      UPDATED / 31 TESTS PASS
RC3 launcher executable:  BUILT
Bytes:                    11772677
SHA256:                   8FD147CBE3C59CAE34D339445FA76A4361E4AC1D1B3C3D8495887DE6A3E1181D
```

Do not combine the RC3 MAME candidate with the RC2 launcher executable. The RC2
launcher is expected to reject the RC3 `neogeo.exe` because its embedded MAME
hash gate still points to F05C.

## RC3 Packaged Artifacts

The clean MAME build and matching launcher were assembled into a new package
tree. RC2 was not modified.

```text
User ZIP:
NeoConnect-VirtualBus-0.9.0-beta.6-User_USB_Portable-RC3.zip
Bytes: 61139685
SHA256: 634681137D47B8ACCCEEF1DC0FC95F45FCCBC759A245A1D00661737B1629FA5D

Corresponding Source ZIP:
NeoConnect-VirtualBus-0.9.0-beta.6-Corresponding_Source-RC3.zip
Bytes: 753364007
SHA256: 96FB6326EF0D12E348AF52FA5B72512C0AEFB2CD439F7772B95AC7E1CBC88320
```

Archive verification:

```text
User ZIP extracted files: 42
Internal central SHA256 entries: PASS
Forbidden ROM/BIOS/CHD/log archive scan: PASS
Corresponding Source required entries: PASS
Launcher package smoke start: PASS (process remained alive after 5 seconds)
```

These checks establish package integrity and source correspondence. The later
2026-08-21 stick/InputSync run provides the required independent runtime
acceptance.

## RC3 Acceptance Gate

RC3 was not public-release-ready until this chain was complete:

```text
source snapshot commit/tag
documented build command/environment
new neogeo.exe SHA256
new user ZIP SHA256
new corresponding-source ZIP SHA256
portable ZIP integrity check
clean/stick MAME acceptance run
```

Minimum MAME InputSync acceptance for RC3:

- `mslug2`,
- Fixed24,
- MAME host and MAME client,
- canonical session state,
- CONFIG preflight PASS,
- STATE preflight PASS,
- no DESYNC,
- no frame jumps/stales,
- fail-closed on peer loss,
- visible hitches documented if present.

Acceptance result recorded after this audit:

```text
Date:       2026-08-21
Game:       mslug2
Profile:    Fixed24
Topology:   two PCs, two ESP8266 adapters, client directly from RC3 stick package
Preflight:  CONFIG PASS, STATE PASS
Epoch:      generation=1, logical_start=143
Runtime:    Level 1 into Level 2
DESYNC:     0
End state:  controlled client sync-loss / fail-closed at frame 14164
```

Reference:

`docs/RC3_STICK_ACCEPTANCE_2026-08-21.md`

## Status

RC2 user ZIP: TECHNICALLY ACCEPTED / UNPUBLISHED

RC2 corresponding source for F05C: NOT VERIFIED / PUBLIC UPLOAD BLOCKED

RC3 source candidate: PACKAGED AS BASE TAR + EXACT BUILD OVERLAY

RC3 MAME binary: CLEAN BUILT / SHA256 3EFCF21BBA749AFCC5EA71947442961EE957223B0ADD8993505AA5E208BB0412

RC3 launcher executable: BUILT / SHA256 8FD147CBE3C59CAE34D339445FA76A4361E4AC1D1B3C3D8495887DE6A3E1181D

RC3 user/source archives: BUILT, HASHED, INTERNALLY VERIFIED / ACCEPTED

RC3 acceptance: PASS for the documented MAME<->MAME InputSync v3 public-beta path
