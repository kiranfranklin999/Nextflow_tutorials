//process_index.nf
nextflow.enable.dsl=2
/*
process < NAME > {
  [ directives ]   -> allow the definition of optional settings that affect the execution of the current process 
                        e.g. the number of cpus a task uses and the amount of memory allocated. 
  input:                
  < process inputs >  ->  Define the input dependencies, usually channels, which determines 
                        the number of times a process is executed.
  output:               
  < process outputs >   ->  Defines the output channels used by the process to send 
                        results/data produced by the process.

  when:                 -> Optional. Allows you to define a condition that must be verified in order to execute the process.
  < condition >         

  [script|shell|exec]:     -> Required. At minimum a process block must contain a script block.
                                A statement within quotes that defines the commands that are executed by the process to carry out its task.
  < user script to be executed >
}

*/
process INDEX {
  script:
  "salmon index -t /data/yeast/transcriptome/Saccharomyces_cerevisiae.R64-1-1.cdna.all.fa.gz -i data/yeast/salmon_index --kmerLen 31"
}

workflow {
  //process is called like a function in the workflow block
  INDEX()
}

/* Please, Refer to file: process_index_with_docker.nf to uderstand how to paramterize the i/ps and o/ps. 
And also, use config file to run nextflow using docker
*/

// nextflow run process_index_without_docker.nf 