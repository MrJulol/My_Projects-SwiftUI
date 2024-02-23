import customtkinter as ctk
import sqlite3
import hashlib

import Viewer


class User:
    def __init__(self, username):
        self.username = username

    def set_username(self, username):
        self.username = username

    def get_username(self):
        return self.username


user = User("")


class SampleApp(ctk.CTk):
    def __init__(self, *args, **kwargs):
        ctk.CTk.__init__(self, *args, **kwargs)

        # Container to hold frames
        container = ctk.CTkFrame(self)
        container.pack(side="top", fill="both", expand=True)
        container.grid_rowconfigure(0, weight=1)
        container.grid_columnconfigure(0, weight=1)

        self.frames = {}

        # Create and add frames to the dictionary
        for F in (LoginPage, MainPage):
            frame = F(container, self)
            self.frames[F] = frame
            frame.grid(row=0, column=0, sticky="nsew")

        # Show the first frame
        self.show_frame(LoginPage)

        # Close button
        close_button = ctk.CTkButton(self, text="Close", command=self.close_app)
        close_button.pack(side="bottom", anchor="ne", padx=10, pady=5)

    def close_app(self):
        self.destroy()

    def show_frame(self, cont):
        frame = self.frames[cont]
        frame.tkraise()


class LoginPage(ctk.CTkFrame):
    def __init__(self, parent, controller):
        ctk.CTkFrame.__init__(self, parent)
        label = ctk.CTkLabel(self, text="Login")
        label.pack(pady=12, padx=10)

        # UI components
        entry1 = ctk.CTkEntry(master=self, width=240, height=32, placeholder_text="Username")
        entry1.pack(pady=12, padx=10)

        entry2 = ctk.CTkEntry(master=self, width=240, height=32, placeholder_text="Password", show="*")
        entry2.pack(pady=12, padx=10)

        # Button to switch to logged In Frame
        button = ctk.CTkButton(master=self, width=240, height=32, text="Login",
                               command=lambda: login(controller, entry1.get(), entry2.get()))
        button.pack(pady=12, padx=10)


def save(entry):
    text = entry.get("1.0", "end-1c")
    conn = sqlite3.connect("MyData.db")
    cursor = conn.cursor()

    # Insert user data into the 'data' table
    cursor.execute("INSERT INTO data (madeby, Text) VALUES (?, ?)", (user.get_username(), text))

    conn.commit()
    cursor.close()


class MainPage(ctk.CTkFrame):
    def __init__(self, parent, controller):
        ctk.CTkFrame.__init__(self, parent)
        label = ctk.CTkLabel(self, text="MainPage")
        label.pack(pady=12, padx=10)

        entry = ctk.CTkTextbox(master=self, width=400, height=400)
        entry.pack(padx=10)

        # Logout button
        button = ctk.CTkButton(self, text="Logout", text_color="black", fg_color="orange",
                               command=lambda: logout(controller))
        button.pack(padx=10, side="left")

        # Save button
        saveButton = ctk.CTkButton(self, text="Save", text_color="black", fg_color="lightgreen",
                                   command=lambda: save(entry))
        saveButton.pack(padx=10, side="left")

        # View saved notes button
        viewSaved = ctk.CTkButton(self, text="See Saved Notes", text_color="black", fg_color="lightblue",
                                  command=lambda: Viewer.main())
        viewSaved.pack(padx=10, side="left")


def login(controller, username1, password1):

    conn = sqlite3.connect("MyData.db")
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM users WHERE username=?", (username1,))
    data = cursor.fetchone()

    conn.close()

    if data:
        hashedpass = data[2]
        if hashlib.sha256(password1.encode('utf-8')).hexdigest() == hashedpass:
            print("Logged in")
            user.set_username(username1)
            controller.show_frame(MainPage)
        else:
            print("Incorrect Password")
    else:
        print("User not found")


def logout(controller):
    print("Logged out")
    user.set_username("")
    controller.show_frame(LoginPage)


def database_init():
    conn = sqlite3.connect('MyData.db')
    cursor = conn.cursor()

    # Create the 'data' table
    cursor.execute('''CREATE TABLE IF NOT EXISTS data (
                        id INTEGER PRIMARY KEY AUTOINCREMENT, 
                        madeby int, 
                        Text string
                    )
                ''')
    conn.commit()
    conn.close()


def users_init():
    conn = sqlite3.connect('MyData.db')
    cursor = conn.cursor()

    # Drop existing 'users' table and create a new one
    cursor.execute("DROP TABLE IF EXISTS users")

    conn.commit()

    cursor.execute('''
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT NOT NULL,
            password TEXT NOT NULL
        )
    ''')
    conn.commit()
    user1 = "asd"
    pass1 = "asd"
    hashedpass1 = hashlib.sha256(pass1.encode('utf-8')).hexdigest()

    # Insert some sample users
    cursor.execute("INSERT INTO users (username, password) VALUES (?, ?)", (user1, hashedpass1))
    conn.commit()

    conn.close()


def main():
    database_init()
    users_init()
    app = SampleApp()
    app.geometry("500x700")
    app.title("Sample App")
    app.mainloop()


if __name__ == "__main__":
    main()
