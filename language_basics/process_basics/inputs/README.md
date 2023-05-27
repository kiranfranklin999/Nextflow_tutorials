### Input Block

The input block follows the syntax shown below:

input:
  <input qualifier> <input name>

#### Types of Input Qualifier:

* `val`: Lets you access the received input value by its name as a variable in the process script.
* `env`: Lets you use the input value to set an environment variable named as the specified input name.
* `path`: Lets you handle the received value as a file, staging the file properly in the execution context.
* `stdin`: Lets you forward the received value to the process stdin special file.
* `tuple`: Lets you handle a group of input values having one of the above qualifiers.
* `each`: Lets you execute the process for each entry in the input collection.

1. `val`:

    Lets you access the received input value by its name as a variable in the process script.

    example: 

            - refer process_input_val.nf
            - run `nextflow process_input_val.nf -process.echo` 

2. `path`:

    Lets you handle the received value as a file, staging the file properly in the execution context.

    example: 

            - refer process_input_path.nf
            - run `nextflow process_input_path.nf -process.echo` 

#### Now let's try combining the different inputs together

A key feature of processes is the ability to handle inputs from multiple channels. However it’s important to understand how the number of items within the multiple channels affect the execution of a process.

    example:

        - refer process_combine_inputs.nf

3. `each`: Lets you execute the process for each entry in the input collection.

    We saw previously that by default the number of times a process runs is defined by the queue channel with the fewest items. However, the each qualifier allows you to repeat the execution of a process for each item in a list or a queue channel, every time new data is received.

    example:

        - refer process_repeat.nf
    
    What is the application of `each` practically?

    when we want to generate index for our file with different kmers

    example:

        - refer process_each_use_case.nf