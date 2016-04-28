clear all

%data rate
datarate = 0.05;
count = 0;

%make CSV object for processing data
csv = CSVParser();

%make empty plot
graph = XYZPlot(500);

%get port value
port = input('Serial port? :','s');

%make serial object
s = serial(port);
s.Baudrate = 115200;

%open port
try
    fopen(s);
    
    while true
        count = count + 1;
        %get data
        csv.string = fgetl(s);
        %parse CSV
        csv.parse();
        %check data
        if length(csv.data) == 3
            %add time value
            csv.data = [ csv.data (count*datarate)];
            
            %plot
            graph.addpoint(csv.data);
        end
    end
    
catch
    %something goes wrong close serial port
    fclose(s);
    delete(s);
end