write_to_file = open("twolf.txt", "w")

with open("twolf.trace", "r") as file:
    data = file.readlines()
    for line in data:
        address = ""
        address = int(line.split(" ")[1],16)
        formatted_address = ('{:032b}').format(address) + "\n"
        write_to_file.write(formatted_address)
    file.close()
write_to_file.close()