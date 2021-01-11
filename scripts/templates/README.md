# -- Hilas Analog Standard Cells --


This repo contains a set of analog standard cells designed for the 
"Skywater 130nm" fabrication process available at the Google Skywater 
(formerly Cypress Semi.) foundry.

These cells can be used in the openLANE/openROAD toolchains in order
to create GDSII files for fabrication.

A custom version of the OpenLANE flow that we're calling "fastlane" is available on [gitlab.com](https://gitlab.com/um-ece/ftl-lab/hilas/fastlane)
<br>
[(git link)](https://gitlab.com/um-ece/ftl-lab/hilas/fastlane.git)

Fastlane uses git submodules to include this repository, so it's probably a better idea to start on the [Fastlane Page](https://gitlab.com/um-ece/ftl-lab/hilas/fastlane)

---

# PG (power/ground) and Interfacing
| Net Name  |     Description                    |
|-----------|------------------------------------|
| `VPWR`     | normal supply 1.8V (analog 1.8V)   |
| `VGND`     | reference 0                        |
| `VINJ`    | Supply for Injection for FG devices. (run time: 1.8V, programming: 1.8-6.0V) |
| `VTUN`    | Tunnelling input for FG devices. (run time: 0 or 1.8V, programming: 11-12V) |

---
---


# Cell Map:

![map](cell-map.png)

---
---
