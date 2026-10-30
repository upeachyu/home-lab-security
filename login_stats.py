import os 
login_counts = {}
with open("real_auth.log", "r") as log_file:
    lines = log_file.readlines()
    for line in lines:
        if "Failed password" in line:
            words = line.split()
            login_index = words.index("for")
            hacker_login = words[login_index + 1]
            if hacker_login in login_counts:
                login_counts[hacker_login] += 1
            else:
                login_counts[hacker_login] = 1 
    print("Статистика по логинам")
    for login, count in login_counts.items():
        print(f"Логин: {login} | Попыток {count}")


 