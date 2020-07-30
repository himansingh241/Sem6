
def sutherlandHodgemanAlgo(poly, poly_size, clip, clip_size):
    for i in range(clip_size):
        clipHelper()


poly_size = int(input("Enter no. of sides of polygon: "))
poly = []
x1, y1 = map(int, input("Initial Point: ").split())

for i in range(poly_size):
    x1, y1 = map(int, input(
        "Enter coordinates of polygon (space separated): ").split())
    poly.append([x1, y1])

clip_size = int(input("Enter clipping window size: "))
clip = []

for i in range(clip_size):
    x1, y1 = map(int, input(
        "Enter coordinates of clipping window (space separated): ").split())
    clip.append([x1, y1])

    sutherlandHodgemanAlgo(poly, poly_size, clip, clip_size)
