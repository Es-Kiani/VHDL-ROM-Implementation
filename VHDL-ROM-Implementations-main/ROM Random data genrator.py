import random

seed = 13
binary = "01"
AddressLength = 5
WordLength = 8
WordCount = 2**AddressLength

ROM = []

# Esfandiar Kiani - VHDL Final Project (ROM) Subscript

random.seed(seed)
with open("randomData.txt", 'w') as file:
    for i in range(WordCount):
        RandomData = ' '.join(random.choices(binary, k=WordLength))
        # print(f"Word\t{i}:\t{RandomData}")
        
        ROM.append(RandomData)
        file.write(f'"{RandomData}",\n')


# print(ROM)
