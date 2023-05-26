Nextflow is a Domain Specific Language (DSL) implemented on top of the Groovy programming language, which in turn is a super-set of the Java programming language.
So, as default, Nextflow can run Java and/or Groovy scripts without and shebang.

### Language Bascis:
#### Printing values ->
* To print something is as easy as using the println method (println is a compression of “print line”) and passing the text to print in quotes. 
* The text is referred to as a string as in a string of characters.
* Various methods of printing the statment and prameterization are explained in `language_basics.nf`

#### Variables ->
* Similar to any other programmming language we need a varibale to store different information.
* A variable is a pointer to a space in the computer’s memory that stores the value associated with it.
* Variables are assigned using = and can have any value. Groovy is dynamically-typed which means the variable’s data type is based on its value.

*Types of Data types*:
- *String*
- *int*
- *boolen*
- *float*
- *List*
- *map*
More detail explaination can be found in `language_basics.nf`

#### Conditional Execution ->
- If statement:

    syntax:
    
    if( < boolean expression > ) {
    
    // true branch
    
    }
    
    else {
    
    // false branch
    
    }
- For statemnet:
    syntax:
    
    for (variable initializtaion; condition; increament/decreament) {
    
   *code to be executed*
   
    }   
    
 #### Functions -->
 - int method:
 
    int <func name>(){
  
      *code to be executed*
  
      return 
  
      }
 - def method:
  
    def <func name>(){
  
  
    }
    
 More detail explaination and practical implementation you can refer `language_basics.nf`   
    
    
    
    
