### How to run my first nextflow script?
`nextflow run wc.nf`

### Workflow parameterization

`nextflow run wc.nf --input 'sample1.fa'`

    syntax: `nextflow run <nextflow script> --<parameter_name> <i/p>`

We can also use wild cards to specify multiple input files. 
- e.g: `nextflow run wc.nf --input 'sample*.fa'`

### Parameter File

If we have many parameters to pass to a script it is best to create a parameters file. Parameters are stored in JSON or YAML format. JSON and YAML are data serialization languages, that are a way of storing data objects and structures, such as the params object in a file.

The `-params-file` option is used to pass the parameters file to the script.

#<wc-params.json>
`{
    input: 'sample.fa'
}`

`nextflow run wc-params.nf -params-file wc-params.json`