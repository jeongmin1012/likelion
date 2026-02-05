# 이 파일은 list를 이용해 stack, queue, linked list, double linked list를 구현한 파일입니다.
# 현업에서 위 4가지 방식으로 데이터를 관리하고자 한다면 이거 쓰세요...

class LikeLionStack :
    def __init__(self) :
        # 데이터를 관리할 리스트
        self.dataList = []

    # push
    def push(self, _value) :
        self.dataList.append(_value)

    # pop
    def pop(self) :
        a1 = self.dataList.pop()
        return a1
    
    # 관리하고 있는 값을 출력해보는 함수
    def showData(self) :
        print(self.dataList)

class LikeLionQueue :
    def __init__(self) :
        # 데이터를 관리할 리스트
        self.dataList = []

    # enqueue
    def enqueue(self, _value) :
        self.dataList.append(_value)

    # dequeue
    def dequeue(self) :
        a1 = self.dataList.pop(0)
        return a1
    
    # 관리하고 있는 값을 출력해보는 함수
    def showData(self) :
        print(self.dataList)

class LikeLionLinkedList :
    def __init__(self) :
        self.dataList = []

    def addData(self, _value) :
        self.dataList.append(_value)

    def setData(self, _value, _position) :
        self.dataList[_position] = _value

    def getData(self, _position) :
        return self.dataList[_position]
    
    def insertData(self, _value, _position) :
        self.dataList.insert(_position, _value)
    
    def deleteData(self, _position) :
        self.dataList.pop(_position)
        # del self.dataList[_position]

    # 관리하고 있는 값을 출력해보는 함수
    def showData(self) :
        print(self.dataList)

class LikeLionDoubleLinkedList :
    def __init__(self) :
        self.dataList = []

    def addData(self, _value, isAppend) :
        if isAppend == True :
            self.dataList.append(_value)
        else :
            self.dataList.insert(0, _value)

    def setData(self, _value, _position, fromHead) :
        if fromHead == True :
            self.dataList[_position] = _value
        else :
            self.dataList[(_position * -1) - 1] = _value


    def getData(self, _position, fromHead) :
        if fromHead == True :
            return self.dataList[_position]
        else :
            return self.dataList[(_position * -1) - 1]
    
    def insertData(self, _value, _position, fromHead) :
        if fromHead == True :
            self.dataList.insert(_position, _value)
        else :
            self.dataList.insert((_position * -1) - 1, _value)
    
    def deleteData(self, _position, fromHead) :
        if fromHead == True :
            self.dataList.pop(_position)
        else :
            self.dataList.pop((_position * -1) - 1)
        # del self.dataList[_position]

    # 관리하고 있는 값을 출력해보는 함수
    def showData(self) :
        print(self.dataList)