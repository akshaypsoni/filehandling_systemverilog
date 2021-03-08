module file_read;

integer fd;		//file handler
int pos;      //position in the file
int r;        //Return status
int l;        //length of line
int i,j;
string line;  //String to store read data
  bit [7:0][3:0]data_hex; //final data stream each of 8 bits

initial
begin
  fd = $fopen("file_name.txt", "r");      //opens the file in read mode
  $display("value of fd %0d" , fd);       //Displaying file handler value
  r = $fseek(fd, 0, 1);				            //Change the position in the file
  pos = $ftell(fd);                       //Return current position in the file
  $display("Current Position: %0d",pos);  //Displaying current position value
  
  for(i = pos; i < pos + 1; i++) 
	begin	
    r = $fgets(line, fd);                 //Read complete line from current position
    $display("Line read: %s", line);      //Displaying line read from file
    l = line.len();                       //Return length of the line read
    $display("length of line: %0d\n", l); //Displaying length of the line
    
    //Checking for newline character at last of the line if present, remove it
		if(line[l-1] == "\n")
		begin
			$display("newline character present at last of the string");
      line = line.substr(0,l-2);    //return new string from postion 0 to length-2 => removing newline character
      //Displaying length of the line after removing newline character
		  l = line.len();
		  $display("length of line: %0d\n", l);
		end
    
    //Extracting 8 bytes data stream from the line
		foreach(line[j])
		begin
      s = {line[j],line[j+1],line[j+2],line[j+3],line[j+4],line[j+5],line[j+6],line[j+7]};  //Concatenate the 8 characters into 8 Bytes data
			data_hex = s.atohex();		                                                            //convert string data to hex value
      $display("data[%d]: %h",j,data_hex);                                                  //Displaying data stream
			j = j+7;
		end
	end
end
endmodule
