import pymysql


class DBConn:
    
    
    
    def __init__(self):
        self.connString()
        print('Polaczenie ustanowione')
        #logowanie uzytkownika
        id = str(self.login())
        perm = self.checkPerm(id)
        pilotInstrID = self.welcome(perm, id)
        print(pilotInstrID)
        if(perm == 1):
            while(True):
                dec = input('1. Select all, 2. Delete, 3. Insert, 4. Quit')
                if(dec == '1'):
                    self.selectAll()
                elif(dec == '2'):
                    self.selectAll()
                    self.delete()
                elif(dec == '3'):
                    self.insert()
                elif(dec == '4'):
                    self.connClose()
                else:
                    print('Nieprawidłowy wybór')
        elif(perm == 0):
            while(True):
                dec = input('1. Select, 2. Quit')
                if(dec == '1'):
                    self.select(pilotInstrID)
                elif(dec == '2'):
                    self.connClose()
                else:
                    print('Nieprawidłowy wybór')
        else:
            print('Błąd logowania')
                 
    def login(self):
        mail = input('podaj maila: ')
        passwd = input('podaj haslo: ')
        self.c.execute('SELECT ID FROM loginInfo WHERE email=%s AND password=%s', (mail, passwd))
        id = (self.c.fetchall()[0][0])
        return id
    
    def checkPerm(self, id):
        logID = id
        self.c.execute('SELECT access FROM loginInfo WHERE ID=%s', (logID))
        try:
            perm = int(self.c.fetchall()[0][0])
        except:
            perm = -1
        return perm     
    
    def welcome(self, perm, id):
        logID = id
        if (perm == 1):
            self.c.execute('SELECT firstName, lastName FROM instructors WHERE loginID=%s', (logID))
            for row in self.c.fetchall():
                firstName = row[0]
                lastName = row[1]
            print("You are logged in as instructor %s %s. Welcome!" % (firstName, lastName))
            self.c.execute('SELECT ID FROM instructors WHERE loginID=%s', (logID))
            pilotInstrID = self.c.fetchall()[0][0]
        else:
            self.c.execute('SELECT firstName, lastName FROM pilots WHERE loginID=%s', (logID))
            for row in self.c.fetchall():
                firstName = row[0]
                lastName = row[1]
            print("You are logged in as pilot %s %s. Welcome!" % (firstName, lastName))
            self.c.execute('SELECT ID FROM pilots WHERE loginID=%s', (logID))
            pilotInstrID = self.c.fetchall()[0][0] 
        return pilotInstrID

    
    def connString(self):
        self.conn = pymysql.connect('localhost', 'testowy', 'password', 'airclub')
        self.c = self.conn.cursor()
        
    def selectAll(self):
        self.c.execute('SELECT * FROM vlogs;')
        #print(self.c.fetchall())
        for row in self.c.fetchall():
            """
            id = row[0]
            name = row[1]
            last = row[2]
            type = row[3]
            exp = row[4]
            lvl = row[5]
            """
            print('%3s %15s %15s %12s %12s %11s %5s %5s' % (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7]))
            
    def select(self, pilotInstrID):
        id = pilotInstrID
        self.c.execute('SELECT * FROM vlogs WHERE Pilot=(SELECT lastName from pilots WHERE ID=%s)', (id))
        for row in self.c.fetchall():
            print('%10s %6s %12s %12s %11s %5s %5s' % (row[1], row[2], row[3], row[4], row[5], row[6], row[7]))    
            
    def delete(self):
        try:
            id = int(input('ID do usunięcia'))
            self.c.execute('DELETE FROM characters WHERE id=%s;', id)
            #polecenia wprowadzajace zmiany trzeba commitowac
            self.conn.commit()
            self.select()
        except:
            print('Błędne ID')
            
    def insert(self):
        try:
            name = input('podaj imie: ')
            last = input('podaj nazwisko: ')
            type = input('podajkategorie: ')
            exp = int(input('podaj doswiadczenie: '))
            lvl = int(input('podaj poziom: '))
            self.c.execute('INSERT INTO characters (name, last, type, experience, lvl) VALUES (%s, %s, %s, %s, %s);' ,(name, last, type, exp, lvl))
            self.conn.commit()
            self.select()
        except:
            print('Podałeś niepoprawne dane')
            
    def connClose(self):
        self.conn.close()
        
db = DBConn()

