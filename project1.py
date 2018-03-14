import pymysql
# -*- coding: utf-8 -*-


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
                dec = input('1. Pokaż wszystkie loty, 2. Usuń lot, 3. Dodaj lot, 4. Wyjdź')
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
                dec = input('1. Pokaż moje loty, 2. Wyjdź')
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
            print("Zalogowano jako instruktor %s %s. Witaj!" % (firstName, lastName))
            self.c.execute('SELECT ID FROM instructors WHERE loginID=%s', (logID))
            pilotInstrID = self.c.fetchall()[0][0]
        else:
            self.c.execute('SELECT firstName, lastName FROM pilots WHERE loginID=%s', (logID))
            for row in self.c.fetchall():
                firstName = row[0]
                lastName = row[1]
            print("Zalogowano jako pilot %s %s. Witaj!" % (firstName, lastName))
            self.c.execute('SELECT ID FROM pilots WHERE loginID=%s', (logID))
            pilotInstrID = self.c.fetchall()[0][0] 
        return pilotInstrID

    
    def connString(self):
        self.conn = pymysql.connect('localhost', 'testowy', 'password', 'airclub')
        self.c = self.conn.cursor()
        
    def selectAll(self):
        self.c.execute('SELECT * FROM vlogs ORDER BY `Flight ID`;')
        #print(self.c.fetchall())
        for row in self.c.fetchall():
            """
            Flight ID = row[0]
            Date = row[1]
            Flight time = row[2]
            Pilot = row[3]
            Instructor = row[4]
            Tail number = row[5]
            Take off = row[6]
            Landing = row[7]
            """
            print('%3s %11s %4s %12s %9s %11s %5s %5s' % (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7]))
            
    def select(self, pilotInstrID):
        id = pilotInstrID
        self.c.execute('SELECT * FROM vlogs WHERE Pilot=(SELECT lastName from pilots WHERE ID=%s)', (id))
        for row in self.c.fetchall():
            print('%10s %6s %12s %12s %11s %5s %5s' % (row[1], row[2], row[3], row[4], row[5], row[6], row[7]))    
            
    def delete(self):
        try:
            id = input('Wpisz ID lotu do usunięcia')
            self.c.execute('DELETE FROM logs WHERE id=%s;', (id))
            #polecenia wprowadzajace zmiany trzeba commitowac
            self.conn.commit()
            self.selectAll()
            print('Usunięto lot o ID=%s' % (id))
        except:
            print('Błędne ID')
            
    def insert(self):
        try:
            date = input("Podaj datę lotu (np. 2018-03-10)")
            
            flightTime = input("Podaj czas lotu w godzinach (np. 1.5)")
            
            self.c.execute('SELECT ID, firstName, lastName, birthday, totalTime FROM pilots')
            for row in self.c.fetchall():
                print('%3s %12s %12s %12s %6s' % (row[0], row[1], row[2], row[3], row[4]))
            pilotID = input("Podaj ID pilota")
            
            self.c.execute('SELECT ID, firstName, lastName, birthday, totalTime FROM instructors')
            for row in self.c.fetchall():
                print('%3s %12s %12s %12s %6s' % (row[0], row[1], row[2], row[3], row[4]))
            instrID = input("Podaj ID instruktora")            
            
            self.c.execute('SELECT ID, type, tailNumber FROM aircraft')
            for row in self.c.fetchall():
                print('%3s %18s %8s' % (row[0], row[1], row[2]))
            aircraftID = input("Podaj ID statku powietrznego")
            
            self.c.execute('SELECT ID, code, city, country FROM airports')
            for row in self.c.fetchall():
                print('%3s %5s %10s %10s' % (row[0], row[1], row[2], row[3]))
            takeOffID = input("Podaj ID lotniska startu")
            landingID = input("Podaj ID lotniska lądowania")
            
            self.c.execute('INSERT INTO logs (date, flightTime, pilotsID, instructorsID, aircraftID, takeOffAirportsID, landAirportsID) VALUES (%s, %s, %s, %s, %s, %s, %s);' ,(date, flightTime, pilotID, instrID, aircraftID, takeOffID, landingID))
            self.conn.commit()
            
            self.c.execute('SELECT MAX(ID) FROM logs')
            logID = self.c.fetchall()[0][0]
            
            self.c.execute('SELECT * FROM vlogs WHERE `Flight ID`=%s', (logID))
            for row in self.c.fetchall():
                print('%3s %11s %4s %12s %9s %11s %5s %5s' % (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7]))
                print("Dodano lot o ID = %s!" % (logID))
        except:
            print('Podałeś niepoprawne dane')
            
    def connClose(self):
        self.conn.close()
        
db = DBConn()

