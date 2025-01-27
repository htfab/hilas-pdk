`ifndef {{ cell_name.upper() }}
`define {{ cell_name.upper() }}

/**
 * {{ shortname }}: {{ description }}
 *
 * Verilog wrapper for {{ shortname }}.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none


`ifdef USE_POWER_PINS
/*********************************************************/

`celldefine
module {{ cell_name }} (
{{ '    ' + ',\n    '.join(pins + pg_pins) }}
);
    {% for pin in pins+pg_pins %}
        {{'inout ' + pin + ';'}}
    {% endfor %}
endmodule
`endcelldefine

/*********************************************************/
`else // If not USE_POWER_PINS
/*********************************************************/

`celldefine
module {{ cell_name }} (
{{ '    ' +  ',\n    '.join(pins) }}
);
    {% for pin in pins %}
        {{'inout ' + pin + ';'}}
    {% endfor %}
endmodule
`endcelldefine

/*********************************************************/
`endif // USE_POWER_PINS

`default_nettype wire
`endif  // {{ cell_name.upper() }}


//--------EOF---------
