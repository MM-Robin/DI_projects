cd /home/runner
export PATH=/usr/bin:/bin:/tool/pandora64/bin:/usr/share/Riviera-PRO/bin
export RIVIERA_HOME=/usr/share/Riviera-PRO
export CPLUS_INCLUDE_PATH=/usr/share/Riviera-PRO/interfaces/include
export OVL_DIR=/playground_lib/std_ovl_v2p8.1
export ALDEC_LICENSE_FILE=27009@10.116.0.5
export HOME=/home/runner
vlib work && vlib accellera_ovl_vhdl && sed 's#${OVL_DIR}#'$OVL_DIR'#g' -i $OVL_DIR/all_ovl_vhdl_comps.f && vcom -work accellera_ovl_vhdl -f $OVL_DIR/all_ovl_vhdl_comps.f && vcom '-2019' '-o' design.vhd testbench.vhd  && vsim -c -do "vsim CNT16_TB; run 799ns; exit"  ; echo 'Creating result.zip...' && zip -r /tmp/tmp_zip_file_123play.zip . && mv /tmp/tmp_zip_file_123play.zip result.zip