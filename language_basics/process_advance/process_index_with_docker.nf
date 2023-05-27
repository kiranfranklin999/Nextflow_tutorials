#! /usr/env/bin/nextflow
nextflow.enable.dsl=2 // Enabling DSL2 
params.transcriptome = "data/yeast/transcriptome/Saccharomyces_cerevisiae.R64-1-1.cdna.all.fa.gz"
/* 
We have our transcriptome file in our local folder, when we run the script our
local system, we can directly provide the file path, nextflow will be able to find and use it. See : process_index_without_docker.nf
But in this case, we are using the docker to run the same process.
Hence, we have to use channel, so that our file would be able to stage inside docker to be used. 
*/
transcriptome = channel.fromPath(params.transcriptome) // using fromPath() channel
process INDEX {

    publishDir "data/yeast/", mode: 'copy' // mentioning the local directory path where to copy the files from work dir

    input:
    path transcriptome                    // Metioning input channel param[transciptome] and it's nature[path] 

    output:
    path 'salmon_index'                     // Methioning the output files/folder that need to emitted

    script:
    """
    /usr/local/bin/salmon index -t $transcriptome -i salmon_index --kmerLen 31
    """
}

workflow {
    INDEX(transcriptome) // calling the process by passing the i/p parameter.

}

// nextflow -C nextflow.config run process_index_with_docker.nf 