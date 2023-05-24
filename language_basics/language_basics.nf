#! /usr/env/bin/nextflow

nextflow.enable.dsl=2

// Printing vaules

//Method 1
println("hell world!")
//Method 2
println "hello world!"

// Variables and data types

x = "hello" // string
y = 1 // int
z = 3.14 //float
a = true // boolean. Notes: here boolean follows SMALL CASE not the Captilize form
println "string : $x Int : $y float : $z boolean: $a"


//String Interpolation

chr = "1"
println " processing chromosone $chr" // sting  Interpolation is supported only in doule qoutes
println ' processing chromosone $chr' // this will consider $chr as part of string not as variable.

// LIST

kmers = [ 11,12,13,14,15]

println kmers[0] // accessing list element at 0th posn.
println kmers[-1] // accessng the last element of the list
println kmers[0..2] // accessing 1st 3 elements using a range. How to define a range? -> <num1>..<num2>

// String Interpolation of list elements

println " The 1st 3 elements in the list are ${kmers[0..2]}" // Why {}? coz we are performing action dynamically on kmers
println " The 1st 3 elements in the list are $kmers[0..2]" // here it is considering kmers as variable by [0..2] as string

// List methods

mylist = [0,1,3]
println(mylist.size()) // prints the len of list
println(mylist.get(1))  // prints element at index 1
println mylist + [1] // adds new element
println mylist - [1] // removes last element
println mylist * 2// doubles the list counts i.e [0,1,3,0,1,3]
println mylist.reverse() // reverses the list elemenst
println mylist.collect{ it+3} // adds 3 to each elemnt
println mylist.unique().size() // fileters the list for uniques elements and prints the size of it
println mylist.count(1) // prints the count of element "1" in the list
println mylist.min() // prints the min values
println mylist.max() // prints the max value
println mylist.sum() // prints the sum of the list
println mylist.sort() // sorts the list in ascending
println mylist.find{it%2 == 0} // finds the 1st even number in the list
println mylist.findAll{it%2 == 0} // finds all the even number in the list

// MAPS

roi = [ chromosome : "chr17", start: 7640755, end: 771909, genes: ['ATP1B2','TP53','WRAP53']]
// accessing the values via keys
println roi['chromosome']
println roi.start
println roi.get('genes')

// add or modify
roi['chromosome'] = '17'
roi.start = 123455
roi.put('genome','hg38')

println roi

// conditional Execution

// If statement

x= 12
if (x>10){
    println "$x is greater than 10"

}
list = [1,2,3]
if ( list !=null && list.size() >0){
    println list
}
else {
    println "th list is emty"
}

if (list){
    println list
}

println list ? list: "this list is empty"

//For Statement

for (int i =0; i<3;i++){
    println(i)
}

list = ['a','b','c']
for ( String ele : list){
    println ele
}

// Functions

int fib(int n){
    return n < 2 ? 1 : fib(n-1) + fib(n-2)
}



def fact(n){
    n > 1 ? n * fact(n-1) :1
}

println (fib(10))
println ( fact(5))
