Basically, The Universal Asynchronous Receiver and Transmitter (UART) protocol is a serial asynchronous communication channel that is used to enable communication between electronic devices. This design of UART protocol has mainly three modules i.e., Baud rate generator, UART Transmitter, UART Receiver. Both UART transmitter and UART receiver works with same baud rate that is generated by Baud rate generator module. UART transmitter is designed by integrating Transmitter finite state machine, parallel in serial out shift register, 4:1 multiplexer, parity generator submodules. UART receiver is designed by integrating Start bit detector, serial in parallel out shift register, parity checker, Receiver finite state machine, Stop bit checker submodules. The baud rate that is generated by this design is 9600bps using clock signal of 50MHz frequency. The data stream for transmission or reception has 1 IDLE bit, 1 Start bit, 32 Data bits, 1 parity bit, 1 stop bit. Xilinx ISE 14.7 Design Suite is the software used for implementation, synthesis, & simulation of UART protocol design in Verilog HDL.
![image](https://github.com/lakshmi-ummidi/UART_Protocol_Design/assets/86336157/1cecd37a-2ba2-4110-99f8-37dbd7ac8048)

(A)	Baud Rate Generator

In synchronous communications, Clock should be same for every module. It would be difficult to obtain clock synchronization between blocks. As UART is Asynchronous communication channel, clock need not to be same for every block. But transmission speed of transmitter should match with reception speed. For that Baud rate generator is used. Baud rate generator will take 50MHz clock frequency as input and produce 9600bps Baud Rate. Baud Rate is the speed of transferring data from transmitter to a receiver in the form of bits per second i.e., Number of signal units transferred per second. Each bit is 1/9600 bps wide.

![image](https://github.com/lakshmi-ummidi/UART_Protocol_Design/assets/86336157/34576713-e6f9-4b1f-97df-10f377c264d0)

![image](https://github.com/lakshmi-ummidi/UART_Protocol_Design/assets/86336157/b09d35b6-03db-4d91-a1bd-48b34df75f6c)

(B)UART Transmitter

UART Transmitter take the parallel data from memory, add start, parity, and stop to it and then send data frame to receiver serially. UART Transmitter module has four submodules. i.e., Transmitter FSM, Parity Generator, PISO, Mux4to1.

![image](https://github.com/lakshmi-ummidi/UART_Protocol_Design/assets/86336157/7fb8a43b-9746-4440-9cc0-65feaeb57c3e)

1.	Transmitter FSM: It is finite state machine which will change the state of transmitter. It accepts Baud_Clk, Active High Reset, Active high Tx_start inputs and produce Load, Shift, S0, S1 as outputs.

![image](https://github.com/lakshmi-ummidi/UART_Protocol_Design/assets/86336157/4248dae2-65dc-4b29-899a-4bea74d4a5f4)

2.	Parity Generator: Parity generator will generate a parity bit based on Even parity type when Load is low.

3.	PISO: When Active high Load is applied to PISO, the parallel data will load to every flipflop present in PISO register. When active high Shift signal is applied then it starts shifting the data bit by bit and produce serial output. It requires 32 clock cycles to transmit 32-bit of data. One clock cycle for loading the data and 31 clock cycles for shifting the data.

4.	Mux4to1: Outputs of transmitter FSM S0 and S1 are used as select lines for this mux. Mux will produce output based on the functionality table mentioned. The output of Mux4to1 can be given as input to UART Receiver.

![image](https://github.com/lakshmi-ummidi/UART_Protocol_Design/assets/86336157/2b4e82d8-110e-40bc-bc5d-ffd491989cb2)

(C)UART Receiver

UART Receiver will receive the data from transmitter and extract the data from data frame. The speed of receiver should be same as transmitter. UART receiver has five submodules. i.e., Start bit detector, Receiver FSM, SIPO, Parity Checker, Stop bit checker. 
![image](https://github.com/lakshmi-ummidi/UART_Protocol_Design/assets/86336157/7925161b-aca9-4bce-b42c-fb3f05816fd4)
1.	Start Bit Detector: Receiver will receive a steady high initially for every data stream, when there is a transition of active high to active low signal, it indicates the start bit.
2.	Receiver FSM: It is a finite state machine based on which the state of receiver will be changed. It accepts Baud_Clk, Active high Reset, DeStart_Bit, Parity_Error inputs and produce Shift1, Load1, Check_Stop outputs.
![image](https://github.com/lakshmi-ummidi/UART_Protocol_Design/assets/86336157/aa1ae85a-6e07-4d11-a68e-f1d057d12e20)
4.	SIPO: When active high Shift signal is applied then it starts shifting the data bit by bit and produce parallel output. It requires 32 clock cycles for shifting data serially.
5.	Parity Checker: It will check the whether the parity of received data matches with received Parity_Bit.
6.	Stop Bit Detector: It is used to detect error in stop bit.
![image](https://github.com/lakshmi-ummidi/UART_Protocol_Design/assets/86336157/616d2c49-1b8d-446a-a06c-12d960a20574)
Simulation Results of UART Top module
