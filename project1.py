import pymysql
# -*- coding: utf-8 -*-


class DBConn:
    
    
    def __init__(self):
        self.connString()
        print('    __!__')
        print('_____(_)_____')
        print('   !  !  !     \t\tWitaj, pilocie!\n')
        #logowanie uzytkownika
        id = str(self.login())
        perm = self.checkPerm(id)
        pilotInstrID = self.welcome(perm, id)
        if(perm == 1):
            while(True):
                dec = input('\n1. Pokaż wszystkie loty     ____       _\n2. Usuń lot \t\t  |__\_\_o,___/ \ \n3. Dodaj lot \t\t ([___\_\_____-\' \n4. Wyjdź \t\t  | o`\n')
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
                dec = input('\n1. Pokaż moje loty\t       __|__ \n2. Wyjdź \t\t--@--@--(_)--@--@-- \n')
                if(dec == '1'):
                    self.select(pilotInstrID)
                elif(dec == '2'):
                    self.connClose()
                else:
                    print('Nieprawidłowy wybór')
        else:
            print('Błąd logowania')
                 
    def login(self):
        try:
            mail = input('Podaj login: ')
            passwd = input('Podaj hasło: ')
            self.c.execute('SELECT ID FROM loginInfo WHERE email=%s AND password=%s', (mail, passwd))
            id = (self.c.fetchall()[0][0])
            return id
        except:
            print('Nieprawidłowe dane')
            self.__init__()
            
    
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
            print("\n\tZalogowano jako instruktor %s %s." % (firstName, lastName))
            self.c.execute('SELECT ID FROM instructors WHERE loginID=%s', (logID))
            pilotInstrID = self.c.fetchall()[0][0]
        else:
            self.c.execute('SELECT firstName, lastName FROM pilots WHERE loginID=%s', (logID))
            for row in self.c.fetchall():
                firstName = row[0]
                lastName = row[1]
            print("\n\tZalogowano jako pilot %s %s." % (firstName, lastName))
            self.c.execute('SELECT ID FROM pilots WHERE loginID=%s', (logID))
            pilotInstrID = self.c.fetchall()[0][0] 
        return pilotInstrID

    
    def connString(self):
        self.conn = pymysql.connect('localhost', 'testowy', 'password', 'airclub')
        self.c = self.conn.cursor()
        
    def selectAll(self):
        self.c.execute('SELECT * FROM vlogs ORDER BY `Flight ID`;')
        print('%3s %11s %5s %12s %12s %9s %7s %9s' % ("ID", "Data", "Czas", "Pilot", "Instruktor", "Samolot", "Start", "Lądowanie \n____________________________________________________________________________"))
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
            print('%3s %11s %5s %12s %12s %9s %7s %9s' % (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7]))
            
    def select(self, pilotInstrID):
        id = pilotInstrID
        self.c.execute('SELECT * FROM vlogs WHERE Pilot=(SELECT lastName from pilots WHERE ID=%s)', (id))
        print('%11s %5s %12s %12s %9s %7s %9s' % ("Data", "Czas", "Pilot", "Instruktor", "Samolot", "Start", "Lądowanie \n________________________________________________________________________"))
        for row in self.c.fetchall():
            print('%11s %5s %12s %12s %9s %7s %9s' % (row[1], row[2], row[3], row[4], row[5], row[6], row[7]))    
            
    def delete(self):
        try:
            id = input('\nWpisz ID lotu, który chcesz usunąć\n')
            self.c.execute('DELETE FROM logs WHERE id=%s;', (id))
            #polecenia wprowadzajace zmiany trzeba commitowac
            self.conn.commit()
            self.selectAll()
            print('\n░░░░░░░░░░░░░░░░░░ Usunięto lot o ID=%s ░░░░░░░░░░░░░░░░░░' % (id))
        except:
            print('Błędne ID')
            
    def insert(self):
        try:
            date = input("\nPodaj datę lotu, YYYY-MM-DD\t")
            
            flightTime = input("\nPodaj czas lotu w godzinach\t")
            
            self.c.execute('SELECT ID, firstName, lastName, birthday, totalTime FROM pilots')
            print('\n\t\t   PILOCI\n')
            print('%3s %12s %12s %12s %6s' % ("ID", "Imię", "Nazwisko", "Data ur.", "Nalot"))
            print('________________________________________________')
            for row in self.c.fetchall():
                print('%3s %12s %12s %12s %6s' % (row[0], row[1], row[2], row[3], row[4]))
            pilotID = input("\nPodaj ID pilota\t\t\t")
            
            self.c.execute('SELECT ID, firstName, lastName, birthday, totalTime FROM instructors')
            print('\n\t\tINSTRUKTORZY\n')
            print('%3s %12s %12s %12s %6s' % ("ID", "Imię", "Nazwisko", "Data ur.", "Nalot"))
            print('_________________________________________________')
            for row in self.c.fetchall():
                print('%3s %12s %12s %12s %6s' % (row[0], row[1], row[2], row[3], row[4]))
            instrID = input("\nPodaj ID instruktora\t\t")            
            
            self.c.execute('SELECT ID, type, tailNumber FROM aircraft')
            print('\n\t\tSTATKI POWIETRZNE\n')
            print('%3s %22s %14s' % ("ID", "Typ", "Numer"))
            print('__________________________________________')
            for row in self.c.fetchall():
                print('%3s %22s %14s' % (row[0], row[1], row[2]))
            aircraftID = input("\nPodaj ID statku powietrznego\t")
            
            self.c.execute('SELECT ID, code, city, country FROM airports')
            print('\n\t\tLOTNISKA\n')
            print('%3s %5s %20s %10s' % ("ID", "Kod", "Miasto", "Kraj"))
            print('__________________________________________')
            for row in self.c.fetchall():
                print('%3s %5s %20s %10s' % (row[0], row[1], row[2], row[3]))
            takeOffID = input("\nPodaj ID lotniska startu\t")
            landingID = input("\nPodaj ID lotniska lądowania\t")
            
            self.c.execute('INSERT INTO logs (date, flightTime, pilotsID, instructorsID, aircraftID, takeOffAirportsID, landAirportsID) VALUES (%s, %s, %s, %s, %s, %s, %s);' ,(date, flightTime, pilotID, instrID, aircraftID, takeOffID, landingID))
            self.conn.commit()
            
            self.c.execute('SELECT MAX(ID) FROM logs')
            logID = self.c.fetchall()[0][0]
            
            self.c.execute('SELECT * FROM vlogs WHERE `Flight ID`=%s', (logID))
            for row in self.c.fetchall():
                print("\n\n░░░░░░░░░░░░░░░░░░ Dodano lot o ID = %s! ░░░░░░░░░░░░░░░░░░" % (logID))
                print('%3s %11s %4s %12s %9s %11s %5s %5s' % (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7]))
        except:
            print('Podano niepoprawne dane')
            
    def connClose(self):
        self.conn.close()
        print("\n\t\tDziękuję! Połączenie zamknięte.")
        while(True):
            dec = input('\nNaciśnij 1, by się zalogować\n')
            if(dec == '1'):
                self.__init__()
             
db = DBConn()

