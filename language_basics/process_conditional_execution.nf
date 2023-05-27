nextflow.enable.dsl=2

params.aligner = 'salmon'
params.transcriptome = "data/yeast/transcriptome/Saccharomyces_cerevisiae.R64-1-1.cdna.all.fa.gz"
params.kmer = 31

transcriptome = channel.fromPath(params.transcriptome)

process INDEX {

    publishDir "data/yeast/", mode: 'copy' // mentioning the local directory path where to copy the files from work dir

    input:
    path transcriptome                    // Metioning input channel param[transciptome] and it's nature[path] 

    output:
    path 'salmon_index' 

    script:
    if( params.aligner == 'kallisto' ) {
        """
        echo indexed using kallisto
        kallisto index -i salmon_index -k $params.kmer $transcriptome
        """
    }  
    else if( params.aligner == 'salmon' ) {
        """
        echo indexed using salmon
        salmon index -t $transcriptome -i salmon_index --kmer $params.kmer
        """
    }  
    else {
        """
        echo Unknown aligner $params.aligner
        """
    }  
}

workflow {
  INDEX(transcriptome)
}