# Compatibility Matrix

This matrix records observed behavior only. Empty cells and `NOT VERIFIED`
entries are not PASS claims.

## Status Terms

- `PASS`: observed in the stated configuration.
- `CANDIDATE`: implemented or under test, but not a broad compatibility claim.
- `KNOWN LIMIT`: documented behavior that remains inside the beta boundary.
- `NOT VERIFIED`: not yet tested or not enough evidence.

## InputSync / General Neo Geo Candidates

| Title | Multiplayer behavior | Sync model | Clock / OC | Video | Audio | Status |
| --- | --- | --- | --- | --- | --- | --- |
| Metal Slug | Start1 -> P1, Start2 -> P2 | InputSync candidate | Fixed24 observed OK | PASS in documented tests | PASS in documented tests | CANDIDATE |
| Metal Slug 2 | Start1 -> P1, Start2 -> P2 | InputSync candidate | Fixed24 observed OK | PASS in documented tests | PASS in documented tests | CANDIDATE |
| Metal Slug 5 | Start1 / Start2 observed; Coin1 UniBIOS menu behavior observed in one configuration | InputSync candidate | Fixed24 observed OK | NOT VERIFIED broadly | NOT VERIFIED broadly | KNOWN LIMIT |
| 3 Count Bout | 1 Coin -> P1; with 2 Coins, Start1 -> P1 and Start2 -> P2 | InputSync candidate | Fixed24 observed OK | NOT VERIFIED broadly | NOT VERIFIED broadly | CANDIDATE |
| Blazing Star | Normal game start observed | InputSync candidate | Original OK; Fixed16 OK; Fixed24 no sound observed | NOT VERIFIED broadly | Fixed24 audio issue observed | KNOWN LIMIT |
| Pulstar | Normal game start observed | InputSync candidate | Original OK; Fixed16 partial sound observed; Fixed24 no sound observed | NOT VERIFIED broadly | OC audio issue observed | KNOWN LIMIT |
| Shock Troopers 2 | Normal game start observed | InputSync candidate | Fixed24 observed OK | NOT VERIFIED broadly | NOT VERIFIED broadly | CANDIDATE |
| Last Resort | Normal game start observed | InputSync candidate | Fixed24 observed OK | NOT VERIFIED broadly | NOT VERIFIED broadly | CANDIDATE |
| Magician Lord | 2 players, alternating | InputSync candidate | Original PASS; Fixed24 gameplay PASS / smoother observed | Occasional Fix Layer artifacts observed; similar artifacts also occur at original timing, so increased 24 MHz causality is NOT VERIFIED | NOT VERIFIED broadly | CANDIDATE |

## Original Communication / MCU Profiles

| Title | Multiplayer behavior | Sync model | Reference status | Notes |
| --- | --- | --- | --- | --- |
| Riding Hero | Linked-cabinet path | Original communication / MCU profile | PASS for documented LKG path | Separate from InputSync. |
| League Bowling | Four cabinets / eight players | Original communication / K78 profile | PASS for documented reference topology | Requires documented MVS/Arcade reference setup and homogeneous cold start. |
| Thrash Rally | Four-player M58 path | Original communication / M58 profile | Protocol path documented | Arbitrary-initiator timing and game-profile behavior remain limited. |

## Special Cases

| Title | Classification | Status | Notes |
| --- | --- | --- | --- |
| V-Liner | Special hardware/input behavior | NOT VERIFIED for InputSync | Not treated as a normal InputSync target. |
| Horse Racing / Riding variants without defined InputSync path | Non-InputSync scope | NOT VERIFIED | No broad InputSync claim. |
| Kizuna Encounter | Special 4P hardware/BIOs path | OUT OF CURRENT BETA SCOPE | Not treated as a normal InputSync title. |
| Last Hope | Homebrew special case | CANDIDATE | No normal Coin/Freeplay behavior claim; Fixed24 observed OK. |
