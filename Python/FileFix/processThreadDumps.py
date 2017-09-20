#!/usr/bin/python

index = 0
file = open("tdump0.txt","w")  

for line in open('jstack_threaddump.out_mwcan-cmlla01p.txt').xreadlines():
	if (line.find("2017-09-20") != -1):
		file.close()
		index+=1
		new_file_name = "tdump" + str(index)
		file = open(new_file_name,"w")
                print "writing line" + line
		file.write(line)
	else:
		print "writing to file line" + line
		file.write(line)
file.close()

