Channels are asynchronous, which means that outputs from a set of processes will not necessarily be produced in the same order as the corresponding inputs went in. 
However, the first element into a channel queue is the first out of the queue (First in - First out). This allows processes to run as soon as they receive input from a channel. 
Channels only send data in one direction, from a producer (a process/operator), to a consumer (another process/operator).


Different types of channel and applications are explained in `channel.nf` file.