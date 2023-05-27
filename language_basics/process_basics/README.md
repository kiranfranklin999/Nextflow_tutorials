### What is process?

A process is the way Nextflow executes commands you would run on the command line or custom scripts.

A process can be thought of as a particular step in a workflow, e.g. an alignment step in RNA-seq analysis. Processes are independent of each other (don’t require any another process to execute) and can not communicate/write to each other. Data is passed between processes via input and output Channels.

syntax:

process < name >{

    // derivates

    // input

    // output

    // condtion

    // script

}
