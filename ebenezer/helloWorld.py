import math

def area(radius):
    return radius * radius * math.pi

# print("area of small circle: %f square units" % area(3))

def old_volumeOfSphere(radius):
    return (4 / 3) * radius * radius * radius * math.pi

def volumeOfSphere(radius):
    return (4 / 3) * (radius ** 3) * math.pi

print("volume: %d" % volumeOfSphere(2))




