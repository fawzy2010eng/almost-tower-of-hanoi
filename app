from graphics import*
win =GraphWin('tower of haoi',1000,600)
win.setCoords(0,0,1000,600)
pt1A=Point(250,100)
pt3A=Point(258,500)
PEGA=Rectangle(pt1A,pt3A)
PEGA.setFill(color_rgb(255, 51, 0))
PEGA.draw(win)
def clonepeg(Polygon,x):
    peg=Polygon.clone()
    peg.move(x,0)
    peg.draw(win)
PEGB=clonepeg(PEGA,252)
PEGC=clonepeg(PEGA,504)

disc1=Polygon(Point(240,-30),Point(268,-30),Point(268,0),Point(240,0))
disc1.setFill(color_rgb(153, 255, 153))
disc1.draw(win)

disc2=Polygon(Point(230,-30),Point(278,-30),Point(278,0),Point(230,0))
disc2.setFill(color_rgb(0, 255, 153))
disc2.draw(win)

disc3=Polygon(Point(220,-30),Point(288,-30),Point(288,0),Point(220,0))
disc3.setFill(color_rgb(255, 255, 102))
disc3.draw(win)

disc4=Polygon(Point(210,-30),Point(298,-30),Point(298,0),Point(210,0))
disc4.setFill(color_rgb(255, 209, 26))
disc4.draw(win)

disc5=Polygon(Point(200,-30),Point(308,-30),Point(308,0),Point(200,0))
disc5.setFill(color_rgb(230, 204, 255))
disc5.draw(win)

disc6=Polygon(Point(190,-30),Point(318,-30),Point(318,0),Point(190,0))
disc6.setFill(color_rgb(255, 204, 204))
disc6.draw(win)

disc7=Polygon(Point(180,-30),Point(328,-30),Point(328,0),Point(180,0))
disc7.setFill(color_rgb(255, 153, 102))
disc7.draw(win)

disc8=Polygon(Point(170,-30),Point(338,-30),Point(338,0),Point(170,0))
disc8.setFill(color_rgb(102, 255, 51))
disc8.draw(win)

array=[Rectangle]
array.append(disc1)
array.append(disc2)
array.append(disc3)
array.append(disc4)
array.append(disc5)
array.append(disc6)
array.append(disc7)
array.append(disc8)

n=2
arrayA=[]
for i in range(1,n+1,1):
    arrayA.append(array[i])
for i in range(arrayA.__len__()):
    arrayA[i].move(0,30*(n-i)+100)
arrayA.reverse()
arrayB=[]
arrayC=[]
class peg:
    def __init__(self,space):
        self.space=space
pegA=peg(0)
pegB=peg(252)
pegC=peg(504)
def movedisc(disc,src,dist):

    if src ==pegA:
        index = arrayA.__len__()
        arrayA.remove(disc)
    elif src==pegB:
        index = arrayB.__len__()
        arrayB.remove(disc)
    else:
        index = arrayC.__len__()
        arrayC.remove(disc)

    if dist==pegA:
        arrayA.append(disc)
        dest=arrayA
    elif dist==pegB:
        arrayB.append(disc)
        dest=arrayB
    else:
        arrayC.append(disc)
        dest=arrayC

    x=dist.space-src.space
    y=(index-1)*30-(dest.__len__()-1)*30
    disc.move(x,-y)
#
# win.getMouse()
# movedisc(disc1,pegA,pegC)
# # win.getMouse()
# movedisc(disc2,pegA,pegB)
# # win.getMouse()
# movedisc(disc1,pegC,pegB)
# # win.getMouse()
# movedisc(disc3,pegA,pegC)
# # win.getMouse()
# movedisc(disc1,pegB,pegA)
# # win.getMouse()
# movedisc(disc2,pegB,pegC)
# # win.getMouse()
# movedisc(disc1,pegA,pegC)
def hanoi(n,A,B,C):

    if n==1:
        movedisc(arrayA[n] ,pegA  , pegC)
    else:
        hanoi(n-1,A,C,B)
        movedisc(arrayA[n],pegA,pegC)
        hanoi(n-1,C,B,A)
win.getMouse()
hanoi(n,pegA,pegB,pegC)


win.getMouse()
win.close()
