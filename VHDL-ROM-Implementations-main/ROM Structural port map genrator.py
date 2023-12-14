import random

def dataGen(seed, alphabet, count, length) -> list:
    ROM = []
    random.seed(seed)
    for i in range(count):
        RandomData = ''.join(random.choices(binary, k=length))
        ROM.append(RandomData)

    return ROM


seed = 13
binary = "01"
AddressLength = 5
WordLength = 8
WordCount = 2**AddressLength

# Esfandiar Kiani - VHDL Final Project - Phase 2

data = dataGen(seed, binary, WordCount, WordLength)

portMap = dict((f"Data{i}", set()) for i in range(WordLength))

# print(portMap)

for i, word in enumerate(data):
    for j, bit in enumerate(word):
        indx = abs(j - WordLength + 1)
        if bit == '1':
            portMap[f"Data{indx}"].add(i)

# print(portMap["Data0"])

with open("portMap.txt", 'w') as file:
    for i in range(WordLength):
        file.write(f"{portMap[f'Data{i}']}\n")


with open("portMap-AHDL.txt", 'w') as file:
    for i in range(WordLength):
        tmp = f"Data{i}"
        tmp = portMap[tmp]

        file.write('#')
        for port in tmp:
            file.write(f" conector({port}),")
        file.write("\n")
