# Licensing and Distribution Status

This public repository currently publishes documentation and release metadata.
It does not grant a blanket license for unpublished VirtualBus implementation
source, branding or internal archives.

Release packages contain independent third-party components under their own
licenses. At minimum, public distribution must account for:

- MAME: GNU GPL version 2 as a whole; full license and corresponding source
  obligations apply to the modified executable.
- NeoGeo MiSTer core: GNU GPL version 2 in the retained upstream core source.
- MiSTer HPS: its upstream license and corresponding modified source must be
  included or made available with the release.
- esptool: GNU GPL version 2; the release must retain its license and source
  reference/offer as required.
- PuTTY, Python, Tcl/Tk, PyInstaller and packaged Python modules: retain the
  licenses and notices shipped by those projects.

Before the first public binary release, `THIRD_PARTY_NOTICES.md` and the
corresponding-source archive must be reconciled against the exact final ZIP.
This document is a release-engineering gate, not legal advice.
