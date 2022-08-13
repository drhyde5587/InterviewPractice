def posDiv(num):
  divlist=[]
  i=1
  while i<=num:
    r=num%i
    if r==0:
        divlist.append(i)
    i+=1

  return divlist
  

print(posDiv(37))

  




