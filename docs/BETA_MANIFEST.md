# NeoConnect VirtualBus - Beta Manifest

Date: 2026-08-21

Version: `0.9.0-beta.6`

Build ID: `20260820-beta6-rc3`

Status: RC3 accepted for public GitHub pre-release upload. No public release
asset has been uploaded by this manifest itself.

## Source State

Repository branch:

`codex/remove-fake-mcu-romloads`

Repository HEAD:

`23d3d2a016edee6745603872520042cbae54970f`

Important release-process note:

The working tree is dirty. The public release must freeze the exact source state
that produces the shipped binaries. The commit above alone is not sufficient for
reproducing a public artifact.

## Candidate Package

Current RC2 package directory:

`NeoConnect-VirtualBus-CLEAN/packages/User_USB_Portable_beta6`

Current RC2 zip:

`NeoConnect-VirtualBus-CLEAN/packages/NeoConnect-VirtualBus-0.9.0-beta.6-User_USB_Portable-RC2.zip`

Status: technically accepted but not public-uploadable because the exact
corresponding source for the F05C MAME binary was not proven.

RC3 package:

`NeoConnect-VirtualBus-CLEAN/packages/NeoConnect-VirtualBus-0.9.0-beta.6-User_USB_Portable-RC3.zip`

Status: built, internally verified and accepted by the 2026-08-21 two-PC
stick/InputSync run. Approved for public pre-release upload with the documented
known limitations.

Package identity:

- Product version: `0.9.0-beta.6`
- Package ID: `User_USB_Portable_beta6`
- Build ID: `20260820-beta6-rc3`
- Wire envelope: v1
- Control/status semantics: v4
- InputSync protocol: v3

## Component Versions

| Component | Candidate identity |
| --- | --- |
| MAME | `0.283`, focused NeoGeo endpoint `MAME/neogeo.exe` |
| InputSync | v3 |
| ESP8266 firmware | `20260801-rs485usb250k1` |
| Launcher / Frontend | `20260820-beta6-rc3`; CPython 3.10.11 / PyInstaller 6.21.0 build |
| MiSTer HPS | `beta6-inputsync-v3-nghmap1-20260814` candidate |
| MiSTer core | `NeoGeo_virtualbus_beta.rbf` candidate |

## Central Artifact Hashes

RC3 MAME candidate built from the current audited source:

| Artifact | SHA256 |
| --- | --- |
| `C:/Projects/mame/neogeo.exe` | `3EFCF21BBA749AFCC5EA71947442961EE957223B0ADD8993505AA5E208BB0412` |
| `User_USB_Portable_beta6_RC3/VirtualBusLauncher.exe` | `8FD147CBE3C59CAE34D339445FA76A4361E4AC1D1B3C3D8495887DE6A3E1181D` |
| `NeoConnect-VirtualBus-0.9.0-beta.6-User_USB_Portable-RC3.zip` | `634681137D47B8ACCCEEF1DC0FC95F45FCCBC759A245A1D00661737B1629FA5D` |
| `NeoConnect-VirtualBus-0.9.0-beta.6-Corresponding_Source-RC3.zip` | `96FB6326EF0D12E348AF52FA5B72512C0AEFB2CD439F7772B95AC7E1CBC88320` |

RC2 package artifacts retained as historical acceptance evidence:

| Artifact | SHA256 |
| --- | --- |
| `User_USB_Portable_beta6/VirtualBusLauncher.exe` | `7D185946EB339530FB6672FBC1D0E48885A6FE53DADCD6B9423EEA220F97E0E3` |
| `User_USB_Portable_beta6/MAME/neogeo.exe` | `F05C1BAEA1BAD9826F55856F2D4DBB7D32D40C0501BC550CAB0FC0F178A8398A` |
| `User_USB_Portable_beta6/firmware/esp_buffer4.ino.bin` | `F40558DF09E66ED2F167869D8BE11E2849190304F0B61959C83929D66C1E101D` |
| `User_USB_Portable_beta6/firmware/esp_buffer4ND.ino.bin` | `C4D803209D436D02D15C5BE8834BC513E184DABC2F8EB02AA49AAE0AE3576672` |
| `User_USB_Portable_beta6/firmware/tools/esptool.exe` | `43D67D627F3634A716E646E68E94E989E799960E48E4D69F78FBB1087F09C356` |
| `User_USB_Portable_beta6/MiSTer/NeoGeo_virtualbus_beta.rbf` | `CF6EEE32D951AC93074151023F012CAEB16B9FE2175F0EAB40BDBDF218FB5AD8` |
| `User_USB_Portable_beta6/MiSTer/MiSTer` | `D0BBCE46A3655D55BBE3BB9CCBCABE5E5B6F3E839115D5FFAE1AAE8FA25008A3` |
| `User_USB_Portable_beta6/MiSTer/virtualbusctl` | `434B9C60BF704F84B93123644F566833117EA7377FC320FD18DBE3BC4B23ECE5` |
| `User_USB_Portable_beta6/MiSTer/romsets.xml` | `BEAA13014A9D5D9EBAC6908088A85674012D9A0B2932BEEF089620DB6A7FB828` |

## Release Scope Candidate

Conservative public beta scope based on audited evidence:

- Focused MAME NeoGeo endpoint.
- MAME<->MAME InputSync v3 for documented tested paths.
- Canonical preflight and fail-closed behavior.
- Coin/System input authority for InputSync.
- MCU communication profiles with documented PASS evidence.
- ESP8266 USB/WLAN beta adapter path.
- Original/Fixed16/Fixed24 as optional game-dependent profiles.
- MiSTer components only to the extent physically accepted for the exact
  package; otherwise mark as experimental.

## Remaining Public-Beta Limitations

1. MiSTer InputSync v3 physical parity is not promoted by this release; it
   remains limited to the documented state.
2. Short synchronized InputSync hitches may occur.
3. ESP8266 NodeMCU RS485 continuous real-time InputSync is not
   release-qualified.

## Final RC3 Runtime Acceptance

The final RC3 two-PC stick run was recorded on 2026-08-21:

```text
Game:       mslug2
Profile:    Fixed24
Topology:   MAME host on main PC, MAME client directly from RC3 stick package
ESP:        firmware flashed from the RC3 stick package
Preflight:  CONFIG PASS, STATE PASS
Epoch:      generation=1, logical_start=143
Runtime:    Level 1 into Level 2
DESYNC:     0
Fatal/error/overflow/verify/communication/invalid: 0
End state:  controlled client sync-loss / fail-closed at frame 14164
```

Reference:

`docs/RC3_STICK_ACCEPTANCE_2026-08-21.md`

## Build Environment Note

The RC3 launcher was rebuilt with the documented release-equivalent toolchain:

- CPython 3.10.11 (native Windows x64),
- Tk 8.6,
- PyInstaller 6.21.0,
- 31/31 frontend unit tests passed before the build.

The RC3 package uses the newly built executable and does not reuse the RC2
launcher.

## Cross-References

- `docs/BETA_CURRENT_STATE_AUDIT.md`
- `docs/BETA_ACCEPTANCE_MATRIX.md`
- `docs/BETA_COMPATIBILITY_MATRIX.md`
- `docs/BETA_KNOWN_LIMITATIONS.md`
- `docs/BETA_PROJECT_CHARTER.md`
- `docs/BETA_VERSION`
- `docs/BETA_SHA256SUMS.txt`
- `docs/MAME_INPUTSYNC_LKG_BINARY_DECISION_2026-08-20.md`
