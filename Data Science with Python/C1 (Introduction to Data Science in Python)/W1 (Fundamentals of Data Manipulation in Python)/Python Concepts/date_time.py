import time as tm 
import datetime as dt 

print(tm.time())

print(dt.datetime.fromtimestamp(tm.time()))

delta = dt.timedelta(days = 100)
print(delta)
today = dt.date.today()
print(today - delta)
print(today > today - delta)

print("-------------------------")

x = dt.datetime.now()
print(x.year)
print(x.strftime("%A")) # %A for weekday (full version)
print(x.strftime("%B")) # %B for month name (full version)

print("-------------------------")

local_time = tm.ctime(tm.time())
print(local_time)

print("Print now")
tm.sleep(2.1) # Everything stops for 2.1 seconds
print("Printed after 3.5 seconds") 

t = (2022, 12, 28, 8, 44, 4, 4, 362, 0) #(year, month, day, hour, minute, second, weekday, day of the year, daylight saving)
result = tm.asctime(t)
print(result)
