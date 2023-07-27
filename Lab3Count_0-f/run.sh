cd /home/runner
export PATH=/usr/bin:/bin:/tool/pandora64/bin:/usr/share/questa/questasim//linux_x86_64
export CPLUS_INCLUDE_PATH=/usr/share/questa/questasim//interfaces/include
export QUESTA_HOME=/usr/share/questa/questasim/
export LM_LICENSE_FILE=1717@10.116.0.5
export OVL_DIR=/playground_lib/std_ovl_v2p8.1
export HOME=/home/runner
vlib work && vlib accellera_ovl_vhdl && sed 's#${OVL_DIR}#'$OVL_DIR'#g' -i $OVL_DIR/all_ovl_vhdl_comps.f && vcom -work accellera_ovl_vhdl -f $OVL_DIR/all_ovl_vhdl_comps.f && vmap uvvm_util /playground_lib/UVVM_All-master/uvvm_util/sim/uvvm_util && vmap uvvm_vvc_framework /playground_lib/UVVM_All-master/uvvm_vvc_framework/sim/uvvm_vvc_framework && vmap uvvm_util && vmap uvvm_vvc_framework && vcom '-2008' design.vhd testbench.vhd  && vsim -batch -do run.do ; echo 'Creating result.zip...' && zip -r /tmp/tmp_zip_file_123play.zip . && mv /tmp/tmp_zip_file_123play.zip result.zip