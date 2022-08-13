def findDuplicates(arr):
 
 dict={x:arr.count(x) for x in arr}
 maxvalue=max(dict.values(),default=None)
 duplist=[k for k,v in dict.items() if v==maxvalue]

 return duplist


    

  

arr=[]

print(findDuplicates(arr))