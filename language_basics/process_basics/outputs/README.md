### How to output files and values from a process?

The output declaration block allows us to define the channels used by the process to send out the files and values produced.

An output block is not required, but if it is present it can contain one or more output declarations.

The output block follows the syntax shown below:

output:

  <output qualifier> <output name>

  <output qualifier> <output name>
  

#### Output values
 Like the input, the type of output data is defined using type qualifiers.


`val` : allows us to output a value defined in the script.

example: 
    - refer: `process_output_val.nf`

`path`: allows capture one or more files produced by the process, over the specified channel.

example: 
    - refer: `process_output_files.nf` for single file
    - refer: `process_output_multi_file.nf` for multiple output

    Quick thought: code that is executed for multi file, can also ran using python using subprocess
    but to execute it for 3 different kmers, we have to loop and execute it via multiprocess. Here, 
    same tasks i.e prallel execution etc will be taken care by nextflow and it's channel. 
    Beauty of Nextflow
