#! /usr/env/bin/nextflow

nextflow.enable.dsl=2

// value Channel

/* The value factory method is used to create a value channel. Values are put inside parenthess() 
to assign them to a channel. */
// For Example:

ch1 = Channel.value('GRCh38')
ch2 = Channel.value( ['chr1','chr2','chr3'])
ch3 = Channel.value(['chr1': 12345,'chr2':45678,'chr3':67890])

println "Ch1= ${ch1.view()}"
println "ch2 = ${ch2.view()}"
println "ch3 = ${ch3.view()}"

// Queue channel

/*channel in which data is consumed (used up) to make input for a process/operator.
Queue (consumable) channels can be created using the following channel factory methods.

Channel.of -> create a channel containing multiple values.
Channel.fromList -> create a queue channel from a list object.
Channel.fromPath -> used when wanting to pass files.
Channel.fromFilePairs -> to process files in pairs or larger groups, such as read pairs in sequencing.
Channel.fromSRA -> method makes it possible to query the NCBI SRA archive and returns a queue channel emitting the 
                    FASTQ files matching the specified selection criteria.
*/


chromosome_ch = Channel.of( 'chr1', 'chr3', 'chr5', 'chr7' )
println chromosome_ch.view()
/* note: Arguments passed to the of method can be of varying types e.g., combinations of numbers, 
strings, or objects. In the above examples we have examples of both string and number data types.*/

aligner_list = ['salmon', 'kallisto']
aligner_ch = Channel.fromList(aligner_list)
println aligner_ch.view()
// what is the difference btw .of() and fromList()
/* In the above example, the channel has two elements. 
If you has used the Channel.of(aligner_list) 
it would have contained only 1 element [salmon, kallisto] and any operator or 
process using the channel would run once.*/

read_ch = Channel.fromPath( 'data/sample.fa' )
read_ch.view()

/* The file path (written as a quoted string) can be the location of a single file or 
a “glob pattern” that matches multiple files or directories.*/

read_ch_glob = Channel.fromPath( 'data/sample*.fa' )
read_ch_glob.view()

// check if file exists
read_ch = Channel.fromPath( 'data/sample.fa', checkIfExists: true )
read_ch.view()

read_pair_ch = Channel.fromFilePairs('data/*_{1,2}.fq')
read_pair_ch.view()

/* If you want to capture more than two files for a pattern you will need to change 
the default size argument (the default value is 2) to the number of expected matching files.*/

/* read_group_ch = Channel.fromFilePairs('data/sample{1,2,3}*',size:6)
read_group_ch.view()*/

sra_ch =Channel.fromSRA('SRP043510')
sra_ch.view()

ids = ['ERR908507', 'ERR908506', 'ERR908505']
sra_ch = Channel.fromSRA(ids)
sra_ch.view()