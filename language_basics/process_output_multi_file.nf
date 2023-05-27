//process_exercise_output.nf
nextflow.enable.dsl=2

process INDEX {
  input:
  path transcriptome
  each kmer

  //add output block here to capture index folders "index_$kmer"
  output:
  path "index_${kmer}"

  script:
  """
  salmon index -t $transcriptome -i index_$kmer -k $kmer
  """
}

transcriptome_ch = channel.fromPath('data/yeast/transcriptome/Saccharomyces_cerevisiae.R64-1-1.cdna.all.fa.gz')
kmer_ch = channel.of(21, 27, 31)

workflow {
  INDEX(transcriptome_ch, kmer_ch)
  INDEX.out.view() 
  // Prints the output folder path of all 3 folder created for 3 different kmers 
}