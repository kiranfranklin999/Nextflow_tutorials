nextflow.enable.dsl=2

process TUPLEINPUT{
  input:
  tuple val(sample_id), path(reads) //the input channel would contain a tuple with the grouping key value as the Nextflow variable `sample_id`
  
  script:
  // sample_id = ref1
  // reads = [ref1_1.fq.gz,ref1_2.fq.gz]
  """
  echo $sample_id 
  echo $reads  
  echo ${reads[0]} 
  echo ${reads[1]} 
  """
}

reads_ch = Channel.fromFilePairs('data/yeast/reads/ref1_{1,2}.fq.gz')

workflow {
  TUPLEINPUT(reads_ch)
}