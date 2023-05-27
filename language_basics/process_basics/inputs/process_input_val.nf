nextflow.enable.dsl=2

process PRINTCHR {

  input:
  val chr

  script:
  """
  echo processing chromosome $chr
  """
}

chr_ch = Channel.of( 1..22, 'X', 'Y' ) // Here we are creating multiple value channel i.e values from 1 to 22 and x, y

workflow {

  PRINTCHR(chr_ch)
}