```
  ===================================
  |    _   _ _ _      ___  _____    |
  |   | | | (_| |    / _ \/  ___|   |
  |   | |_| |_| |   / /_\ \ `--.    |
  |   |  _  | | |   |  _  |`--. \   |
  |   | | | | | |___| | | /\__/ /   |
  |   \_| |_|_\_____\_| |_\____/    |
  |                                 |
  ===================================                         
```
# Hilas Standard Cells
This repo contains a set of analog standard cells designed for the 
"Skywater 130nm" fabrication process available at the Google Skywater 
(formerly Cypress Semi.) foundry.

These cells can be used in the openLANE/openROAD toolchains in order
to create GDSII files for fabrication.

# PG (power/ground) and Interfacing
| Net Name  |     Description                    |
|-----------|------------------------------------|
| `Vdd`     | normal supply 1.8V (analog 1.8V)   |
| `GND`     | reference 0                        |
| `Vinj`    | Supply for Injection for FG devices. (run time: 1.8V, programming: 1.8-6.0V) |
| `Vtun`    | Tunnelling input for FG devices. (run time: 0 or 1.8V, programming: 11-12V) |

# Standard Cell Blocks:
| Block Name            | Width     | Height | Description |
|-----------------------|-----------|--------|-------------|
| `swc4x2cell`          | 20.12um   | 6.05um | Core switch cell ,Varactor capacitor cell |
| `swc4x2cellOverlap`   | 17.97um   | 6.05um | Core switch cell,  Overlap capacitor based cell |
| `TA2Cell_NoFG`        | 17.92um   | 6.05um | Core transimpedance amplifier |
| `TA2Cell_1FG`         | 28.09um   | 6.05um | Core transimpedance amp; floating-gate inputs. (C4 block is a specific routing of this cell's terminals) |
| `TA2Cell_1FG_Strong`  | 28.10um   | 6.05um | Core transimpedance amp; strong FG inputs. |
| `WTA4Stage01`         | 14.07um   | 6.05um | Connects directly to array of swc4x2cell.  Can array vertically.  Needs one current source. |
| `DAC5bit01`           | 14um      | 6.05um | 5-bit digital-to-analog converter (under 6.05um at the moment; thinking through expansion to 6bit and 7bit, and they would use this cell). |
| `SWC4x1BiasCell`      | 11.05um   | 6.05um | 4-output programmable current sink?? |
| `FG transistors`      | ?         | 6.05um | 2x1 bare FG transistors |

# Cells In Progress:
| Block Name            |         Description           |
|-----------------------|-------------------------------|
| larger DAC block      | A DAC with >5-bit resolution  |
| Capacitor block       | Programmable Capacitor        |


# Cell Map:

![map](cell-map.png)
