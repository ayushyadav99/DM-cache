#this python program will generate random values that will be 
# outputted into a text file to act as memory

f = open("memory.txt", "w")
for i in range(300000):
    f.write('{:032b}'.format(i))
    f.write('\n')