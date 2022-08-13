import math

class InvalidTraiangleException(Exception):
    
    def __init__(self,text,sides):
        super().__init__(text)
        self._sides=sides

    @property
    def sides(sides):
        return self._sides

    def __str__(self):
        return "'{}' for sides {}".format(self.args[0], self._sides)

    def __repr__(self):
         return "InvalidTraiangleException({!r},{!r})".format(self.args[0], self._sides)

def area_tri(a,b,c):
    sides=sorted((a,b,c))

    if a <=0 or b<=0 or c<=0:
        raise InvalidTraiangleException("Invalid Length", sides)

    if not (a+b>c or b+c>a or c+a>b):
        raise InvalidTraiangleException("Invalid Traingle", sides)

    p=(a+b+c)/2

    area = math.sqrt(p*(p-a)*(p-b)*(p-c))

    return float(round(area,2))


print(area_tri(3, 4, 5))


