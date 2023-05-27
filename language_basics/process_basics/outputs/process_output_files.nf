nextflow.enable.dsl=2

methods_ch = channel.of('salmon', 'kallisto')

process METHOD {
  input:
  val x

  output:
  path 'method.txt'

  """
  echo $x > method.txt
  """
}

workflow {
  METHOD(methods_ch)
  // use the view operator to display contents of the channel
  METHOD.out.view({ "Received: $it" }) // prints the path of method.txt file
}