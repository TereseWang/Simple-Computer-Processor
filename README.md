# Simple-Computer-Processor
### Testing in Hardware
##### Implementing the Design with Vivado Synthesizer
Click on Generate Bitstream under the Program and Debug section in the Flow Nav-
igator pane to run the synthesis process. Vivado IDE will run the Synthesis and
Implementation processes automatically.
If the synthesis process runs correctly, continue by programming the FPGA board. Follow the same
steps you have for previous labs.
##### Programming the FPGA with Hardware Manager
Program your hardware the way you have in previous labs. Open the hardware man-
ager, open the target device, and program the Zynq.
Now you should see the hw_vio_1 window open. Click on the + sign and add all of the probes by
selecting and adding them. Now you are ready to test your design in hardware.
##### Testing Your Design
This experiment uses the same buttons as in experiment 6. There is one reset, named rst general
in Verilog, to reset the PC, register file, and instruction memory output port. On the board, it
is connected to the right push button (BTN0). The upper push button (BTN1) allows you to single
step your design. You need to press BTN1 whenever you want to store data or update the PC.
Use VIO and the SSD to test your design. Run the code you generated in prelab on
your computer. Keep screen shots to show that you have done this.
To change the inputs you will need to change the immediate values in your code, recompile and
reload the file into instruction memory. To load a new file follow these steps: Double click on the
instruction memory in the design hierarchy. This opens the configuration panel. Under the RST
& Initialization tab browse for the new .coe file. Press ok then regenerate the memory IP. You will
have to rerun synthesis and implementation and generate a new bitstream.
