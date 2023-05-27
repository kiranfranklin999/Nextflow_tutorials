nextflow.enable.dsl=2

process INDEX {
  publishDir "results", mode: "copy"
  
  input:
  path transcriptome

  output:
  path "index"

  script:
  """
  salmon index -t $transcriptome -i index
  """
}

params.transcriptome = "data/yeast/transcriptome/Saccharomyces_cerevisiae.R64-1-1.cdna.all.fa.gz"
transcriptome_ch = channel.fromPath(params.transcriptome, checkIfExists: true)

workflow{
  INDEX(transcriptome_ch)
}