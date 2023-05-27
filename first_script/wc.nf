#! /usr/bin/env nextflow

nextflow.enable.dsl=2
/* Comments are uninterpreted text included with the script.
they are useful for describing complex pats of the workflow or
providing useful information such as workflow usage*/

/* workflow paramters are written as params.<paramter>
and can be initialized using "="*/

params.input = "sample.fa"

// default workflow
workflow {

    // input data is recived through channels
    input_ch = channel.fromPath(params.input)

    /* the scripts to execute is called by its process name,
    and input is provided between brackets*/

    NUM_LINES(input_ch)

    /* Proess output is accessed using the 'out' Channel.
    the channel operator view() is used to print proces output to the terminal.*/

    NUM_LINES.out.view()
}

/*  A Nextflow process block:
    Process names are written, by convention, in uppercase.
    This convention is used to enhnace worflow readablity.
    */

process NUM_LINES
 {
  input:
  path read

  output:
  stdout

  script:
  /* Triple qoute syntax """, The content of the string can cross line boundaries without
  the need to split the string in several pieces and without concatenation or newline escape characters.*/

  /* What am I doing? I'm printing the input file name and counting the number lines present in the
  file. wc -l <file> will provide the lines count. 
  what if if the file is zipped?
  the command will be : gunzip -c ${read} | wc -l*/
  """
  printf '${read} '
  wc -l ${read}
  """
}