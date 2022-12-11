import requests
import json
import smtplib
import random

def sendEmail(request, reciver, connect):

    if request != "":
        RECIVER = reciver
        print(reciver)
        EMAIL_ADRESS = 'edmund32muir43@gmail.com'
        EMAIL_PASSWORD = 'izagxewsfxutjvbx'
        try:
            with smtplib.SMTP('smtp.gmail.com', 587) as smtp:
                smtp.ehlo()
                smtp.starttls()
                smtp.ehlo()
                smtp.login(EMAIL_ADRESS, EMAIL_PASSWORD)
                subject = "Verification code"
                body = f"{request}: \n {connect}"
                msg = f'Subject: {subject}\n\n{body}'
                try:
                    smtp.sendmail(EMAIL_ADRESS, RECIVER, msg)
                except:
                    return 0
        except:
            return 0
    return 1

CNP = "5030728261306"

def getUserByCNP(CNP):
    response = requests.get(f"http://127.0.0.1:8000/api/v1/people/{CNP}")
    json_data = json.loads(response.text)
    newTag = random.randint(1000,9999)
    json_data['tag'] = newTag
    url = "http://127.0.0.1:8000/api/v1/people/{CNP}"
    response = requests.put(url, json=json_data)

    sendEmail("Connect with the following code:", json_data['contact'], newTag)
    return json_data

print(getUserByCNP(CNP)['name'])