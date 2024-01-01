import csv

%precision 2

with open("mpg.csv") as csvfile:
    mpg = list(csv.DictReader(csvfile))

print(mpg[:3])

print(sum(float(d["cty"]) for d in mpg) / len(mpg))

cylinders = set(d["cyl"] for d in mpg)
print(cylinders)

storing = []

for c in cylinders:
    sum_pg = 0
    cylinder_count = 0
    for d in mpg:
        if(d["cyl"] == c):
            sum_pg += float(d["cty"])
            cylinder_count += 1
    storing.append((c, sum_pg / cylinder_count))

storing.sort()
print(storing)

vehicle_type = set(d["class"] for d in mpg)
print(vehicle_type)
