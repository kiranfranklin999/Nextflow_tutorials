nextflow.enable.dsl=2

process COMBINE_even {
  input:
  val x
  val y

  script:
  """
  echo $x and $y
  """
}

process COMBINE_uneven {
  input:
  val x
  val y

  script:
  """
  echo $x and $y
  """
}
process COMBINE_value_of {
  input:
  val x
  val y

  script:
  """
  echo $x and $y
  """
}

num_ch = Channel.of(1, 2, 3)
letters_ch = Channel.of('a', 'b', 'c')
letters_ch2 = Channel.of('a', 'b')
num = Channel.value(1)
workflow {
  COMBINE_even(num_ch, letters_ch) // executes all 3 sets i.e (1 and a), (2 and b) and (3 and c)
  COMBINE_uneven(num_ch, letters_ch2) // executes only 2 sets i.e (1 and a) and (2 and b) , process termination happens
  COMBINE_value_of(num,letters_ch) // executes only 3 sets i.e (1 and a), (1 and b) and (1 and c), here value channel will be passed thrice i.e lenth of other channel 
}