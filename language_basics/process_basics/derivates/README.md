### What if you want set the tag for the process? or allocat cpus? etc? 

It can be done using `Derivates`

Directive declarations allow the definition of optional settings, like the number of cpus and amount of memory, that affect the execution of the current process without affecting the task itself.

syntax:

process < name >{

    // derivates

    // input

    // output

    // condtion

    // script

}

The `tag` directive to allow you to give a custom tag to each process execution. This tag makes it easier to identify a particular task (executed instance of a process) in a log file or in the execution report.

The second directive `cpus` allows you to define the number of CPUs required for each task.

The third directive `echo` true prints the stdout to the terminal.

We use the Nextflow `task.cpus` variable to capture the number of cpus assigned to a task. This is frequently used to specify the number of threads in a multi-threaded command in the script block.

Another commonly used directive is memory specification: `memory`.