# filehandling_systemverilog
Reading data from text file as a test vector inputs for verification.

Using File Handling, you can perform your file I/O directly from Verilog/SystemVerilog. 

You can write Verilog/SystemVerilog code to read stimulus files to apply patterns to the inputs of a model.

interger file_handler;  //File pointer to access the file

int r;                  //Return status of function

int position;           //Position of cursor in the file

string line_str;        //String for read line

1. File Opening function:

    file_handler = $fopen( relative_path/filename.txt, "r"/"w");

2. File Closing function

    $fclose( file_handler);

3. Find Cursor Position in the file

    position = $ftell(file_handler)

4. Change Position in the file

    r = $fseek( file_handler, Position in bytes, Offset position);

    offset position => { "0" : start_from_beginning, "1" : current_position, "2" : end_of_file}

    r => If there is an error, it returns a "-1" otherwise, it returns a "0"

5. Read a line from file

    r = $fgets(line_str, file_handler);





