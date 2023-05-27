### How to save the file generated in our desired location?

Nextflow manages intermediate results from the pipeline’s expected outputs independently.

Files created by a process are stored in a task specific working directory which is considered as temporary. Normally this is under the work directory, which can be deleted upon completion.

The files you want the workflow to return as results need to be defined in the process output block and then the output directory specified using the directive publishDir. More information here.

`Note`: A common mistake is to specify an output directory in the publishDir directive while forgetting to specify the files you want to include in the output block.

syntax:

`publishDir <directory>, parameter: value, parameter2: value ...`