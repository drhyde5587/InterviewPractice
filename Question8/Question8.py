from bs4 import BeautifulSoup
import requests
import concurrent.futures
import time
import pandas as pd

start_time=time.time()
urls=[]
titles=[]

##This functions extracts the url from the html page
def readUrl(data):
    for url in data.find_all('a'):
        urls.append(url.get('href'))

##This functions checks url status code and saves title for later use
def testRequest(url):
    r=requests.get(str(url))
    data=BeautifulSoup(r.content,'html.parser')
    title=data.find('title').text
    if r.status_code==200:
        titles.append(title+"-OK")
        ##print(title+"-OK") Please uncomment it if needed but this will increase the executable time
    else:
        titles.append(title+"-Not Working")
        ##print(title+"-Not working") Please uncomment it if needed but this will increase the executable time
    return 

##Replace the name of the html file for testing 
HtmlFile=open("test.html",'r')
index=BeautifulSoup(HtmlFile.read(),'html.parser')

with concurrent.futures.ThreadPoolExecutor() as reader:
    reader.map(readUrl,index)

with concurrent.futures.ThreadPoolExecutor() as check:
    check.map(testRequest,urls)

df=pd.DataFrame(titles)
##Saves all the info in a file for easier access.Change the name of the file if needed
df.to_csv('test.csv',index=False)
print("Complete!!!-Time:"+str(round(time.time()-start_time,3)))




