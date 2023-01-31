
auxreg = ["$zero", "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7", "$t8", "$t9", "$t10", "$t11", "$t12", "$t13", 
"$t14", "$t15", "$t16", "$a0", "$a1", "$a2", "$a3", "$a4", "$a5", "$a6", "$a7", "$a8", "$ad", "$v0", "$sp", "$md", "$ra"]

auxInst = ["ADD","ADDI","SUB","SUBI","MUL","DIV","AND","XOR","OR","NOT","SLT","SLET","SGT","SGET","SET","SR","SL","JR","J",
"JAL","BEQ","BNEQ","LOAD","STORE","IN","OUT","NOP","HLT", "PROGREG", "SOREG", "STOREPC", "JRSO" ]

# $zero: possui sempre o valor 0
# $t: registradores temporarios
# $a: registradores de argumentos
# $ad: registrador de endereco para variaveis vetores como argumentos
# $v0: regsitrador de retorno de funcao int
# $sp: registrador de topo de pilha
# $md: resto de divisao
# $ra: endereco de retorno de chamada de funcao

class aux:
    def __init__(self, name, bin):
        self.Name = name
        self.Bin = bin

def binbits(x):
    bits = bin(x).split('b')[1]

    if len(bits) < 5:
        return '0' * (5 - len(bits)) + bits
    elif len(bits) == 5:
        return bits

def binbits17(x):
    bits = bin(x).split('b')[1]

    if len(bits) < 17:
        return '0' * (17 - len(bits)) + bits
    elif len(bits) == 17:
        return bits

def binbits27(x):
    bits = bin(x).split('b')[1]

    if len(bits) < 27:
        return '0' * (27 - len(bits)) + bits
    elif len(bits) == 27:
        return bits

regList = []
instruList = []

for i in range(0,len(auxreg)):
    a = aux(auxreg[i],binbits(i))
    regList.append(a)

for i in range(0,len(auxInst)):
    a = aux(auxInst[i],binbits(i))
    instruList.append(a)

# for i in instruList:
#     print(i.Name , i.Bin)

def binary(filename, pc):

    # Ordem assembly, labelMap, table  
    global regList
    global instruList
    binList = []
    assembly = []
    a = ""

    tabelasNomes = []

    arquivo = open(fileName)
    aux = arquivo.readlines()

    for i in range(0,len(aux)):
        aux[i] = aux[i].replace(",", "")

    for i in range(0,len(aux)):
        num = aux[i].split(" ",1)
        if num[0].isnumeric():
            num[0] = f"{int(num[0]) + int(pc)}"
        
        aux[i] = f"{num[0]} {num[1]}"

    aux = [x.rstrip('\n') for x in aux]
        
    for i in range(0,len(aux)):
        num = aux[i].split(" ",1)
        if num[0] == ".":
            nameaux = num[1] 
            
            if((i + 1) < len(aux)):
                b = aux[i + 1].split(" ")[0]
            if((i + 2) < len(aux)):
                c = aux[i + 2].split(" ")[0]
            if((i + 3) < len(aux)):
                d = aux[i + 3].split(" ")[0]

            if b.isnumeric():
                a = f"{nameaux} {b}" 
            
            elif c.isnumeric():
                a = f"{nameaux} {c}"

            elif d.isnumeric():
                a = f"{nameaux} {d}"
            
            tabelasNomes.append(a)

    
    
    for i in range(0,len(aux)):
        print(aux[i])
    
    for i in tabelasNomes:
        print(i)


    for inst in aux:
        if (inst.split(" ")[0].isnumeric()):
            nameinst = inst.split(" ")[1]
            # Formato 1
            if(nameinst == "ADD" or nameinst == "SUB" or nameinst == "MUL" or nameinst == "DIV" or nameinst == "AND" 
                or nameinst == "OR" or nameinst == "XOR" or nameinst == "SLT" or nameinst == "SLET" or nameinst == "SGT" 
                    or nameinst == "SGET" or nameinst == "SET"):
                
                RD = inst.split(" ")[2]
                R1 = inst.split(" ")[3]
                R2 = inst.split(" ")[4]

                for var in instruList:
                    if nameinst == var.Name:
                        a = var.Bin
                for var in regList:
                    if RD == var.Name:
                        a = a + var.Bin
                for var in regList:
                    if R1 == var.Name:
                        a = a + var.Bin
                for var in regList:
                    if R2 == var.Name:
                        a = a + var.Bin + '000000000000'
                        binList.append(a)
                
                a = ""

            # Formato 2
            elif(nameinst == "ADDI" or nameinst == "SUBI" or nameinst == "LOAD" or nameinst == "STORE" or 
                nameinst == "BEQ" or nameinst == "BNEQ" or nameinst == "STOREPC"):
                
                RD = inst.split(" ")[2]
                R1 = inst.split(" ")[3]
                IM = inst.split(" ")[4]

                for var in instruList:
                    if nameinst == var.Name:
                        a = var.Bin
                for var in regList:
                    if RD == var.Name:
                        a = a + var.Bin
                for var in regList:
                    if R1 == var.Name:
                        a = a + var.Bin
                
                if(nameinst == "BEQ" or nameinst == "BNEQ"):

                    for b in tabelasNomes: 
                        if (IM == b.split()[0]):
                            Im =  int(b.split()[1])
                            Im = binbits17(Im)
                            a = a + Im
                            binList.append(a)
                            a = ""
                else:
                    Im =  int(IM)
                    Im = binbits17(Im)
                    a = a + Im
                    binList.append(a)
                    a = ""
                
            
            # Formato 3
            elif(nameinst == "NOT" or nameinst == "SR" or nameinst == "SL"):
                RD = inst.split(" ")[2]
                R1 = inst.split(" ")[3]
                
                for var in instruList:
                    if nameinst == var.Name:
                        a = var.Bin
                for var in regList:
                    if RD == var.Name:
                        a = a + var.Bin
                for var in regList:
                    if R1 == var.Name:
                        a = a + var.Bin + "00000000000000000"
                        binList.append(a)
                
                a = ""

            # Formato 4
            elif(nameinst == "JR" or nameinst == "IN" or nameinst == "OUT" or nameinst == "JRSO"):
                RD = inst.split(" ")[2]

                for var in instruList:
                    if nameinst == var.Name:
                        a = var.Bin
                for var in regList:
                    if RD == var.Name:
                        a = a + var.Bin + "0000000000000000000000"
                        binList.append(a)

                a = ""

            
            # Formato 5
            elif(nameinst == "J" or nameinst == "JAL"):
                for var in instruList:
                    if nameinst == var.Name:
                        a = var.Bin
                        
                nameLine = inst.split(" ")[2]
                
                for b in tabelasNomes:
                    if (nameLine == b.split()[0]):
                        Im =  int(b.split()[1])
                        Im = binbits27(Im)
                        a = a + Im
                        binList.append(a)
                        a = ""

                a = ""

            # Formato 6
            elif(nameinst == "NOP" or nameinst == "HLT" or nameinst == "PROGREG" or nameinst == "SOREG") :
                for var in instruList:
                    if nameinst == var.Name:
                        a = var.Bin + "000000000000000000000000000"
                        binList.append(a)

                a = ""
    
    arquivo = open("binary1.txt", "a")
    for var in binList:
        arquivo.write(f"{var}\n")
    
    

    return binList


if __name__ == '__main__':
    PcInicio = input('Digite o valor inicial de pc: ')
    fileName = "fat.txt" 
    binInstr = binary(fileName, PcInicio)
    print()
    print("Binario gerado!")

