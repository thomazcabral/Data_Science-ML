import csv

with open('names.csv', 'r') as csv_file: # r for reading
    csv_reader = csv.DictReader(csv_file)

    with open('new_names.csv', 'w') as new_file: # w for writing
        field_names = ["first_name", "last_name", "email"]
        csv_writer = csv.DictWriter(new_file, fieldnames=field_names, delimiter="\t")
        csv_writer.writeheader()

        for line in csv_reader:
            del line["email"] # only first_name and last_name
            csv_writer.writerow(line)
    
    
    
    
    #for line in csv_reader:
        #print(line) # prints each line of the csv archive
        #print(line[2]) # prints all the emails