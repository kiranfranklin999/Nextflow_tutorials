//process_python.nf
nextflow.enable.dsl=2

process PY_TEST_SCRIPT {
    /* 
    By default the process command is interpreted as a Bash script. 
    However any other scripting language can be used just simply starting the script 
    with the corresponding Shebang declaration.
    In below function, We are running python script, hence provided python shebang declaration.
    And added the python that need to be executed.
    */
  script:
  """
  #!/usr/bin/env python
  import math

  print("pi", math.pi)
  print("Eluer number", math.e)
  """
}

process PY_FILE_TEST {
    /*
    when the code which needed to be executed is huge, we can try executing the file same as in command line.

    */

  script:
  """
  python myscript.py
  """
}


workflow {
  PY_TEST_SCRIPT()
  PY_FILE_TEST()
}

