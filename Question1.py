def isNullorEmpty(test:str)->bool:
    if test and not test.isspace():
        return False
    else:
        return True


str=[None,"","a"," ","N"]


for i in str:

    print(isNullorEmpty(i))