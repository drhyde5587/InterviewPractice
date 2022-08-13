def posDiv(num):
  divlist=[]
  i=1
  while i<=num:
    r=num%i
    if r==0:
        divlist.append(i)
    i+=1

  return divlist
  
arr=[47,58,17,12,6,25]

for num in arr:
  print(posDiv(num))

  




