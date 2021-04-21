from flask import Flask, render_template, request, redirect, url_for, flash, render_template_string, send_file, session, make_response
from werkzeug.utils import secure_filename
import urllib.request as urllib2, urllib
import requests
import json
import datetime
import mysql.connector
import pyotp
import time
import pandas as pd

UPLOAD_FOLDER = '/static/zlogo/scripts'
ALLOWED_EXTENSIONS = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'])

app = Flask(__name__)
@app.errorhandler(404)
def not_found(e):
    return render_template("404error.html")

app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Zebu@99",
    database="zipo",
    auth_plugin='mysql_native_password'
)
mycursor = mydb.cursor()


def openissues():
    zebutrade_membercode = '6550'
    zebutrade_loginid = 'ZEBUIPO'
    zebutrade_password = 'BSe@26354667'
    zebutrade_ibbsid = 'FTXMB0Q947'
    USER_AGENT = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'

    url = 'https://ibbs.bseindia.com/ibbsmsgapi/iBBSWebBroadcastApi.svc/v1/login'
    body = {"membercode": zebutrade_membercode, "loginid": zebutrade_loginid,
            "password": zebutrade_password, "ibbsid": zebutrade_ibbsid}
    headers = {'content-type': 'application/json', "User-Agent": USER_AGENT}
    r = requests.post(url, data=json.dumps(body), headers=headers, verify=False)
    print(r.text)
    token = json.loads(r.text)['token']

    url = "https://ibbs.bseindia.com/ibbsmsgapi/iBBSWebBroadcastApi.svc/v1/openissue"
    payload = ""
    headers = {
        'Content-Type': "application/json",
        'Membercode': zebutrade_membercode,
        'Login': zebutrade_loginid,
        'Token': token,
        'cache-control': "no-cache",
        'Postman-Token': "be17f8b1-466c-4259-aad2-4622160a59ba", "User-Agent": USER_AGENT
    }

    response = requests.request("GET", url, data=payload, headers=headers, verify=False)

    act = json.loads(response.text)

def check_uid(uid):
    uid = uid
    urls = "http://bo.zebull.in:8505/staticdata/wsdl/JSON_KYC.cfm?Username=api&password=api@54321&Client_code=" + uid
    file = urllib.request.urlopen(urls)
    for line in file:
        decoded_line = line.decode("utf-8")
    if decoded_line == "no data found":
        result = False
    else:
        result = True
        responses = requests.get(urls)
        session["otname"] = responses.json()['DATA'][0][2]
        session["CLIENT_ID_MAIL"]=responses.json()['DATA'][0][7]

        session["MOBILE_NO"] = responses.json()['DATA'][0][6]
        session["address"] = responses.json()['DATA'][0][3]+' '+responses.json()['DATA'][0][4]+' '+responses.json()['DATA'][0][5]
        session["panop"] = responses.json()['DATA'][0][8]
        session["dematid"] = responses.json()['DATA'][0][12]
        session["dpid"] = responses.json()['DATA'][0][13]
        session["dpname"] = responses.json()['DATA'][0][14]
        print(responses.json()['DATA'][0][11])
    return (result)

def sendotp(a):
    clientcode = session["cid"]
    with urllib.request.urlopen(
            "http://bo.zebull.in:8505/staticdata/wsdl/JSON_KYC.cfm?Username=api&password=api@54321&Client_code=" + clientcode) as url:
        data = json.loads(url.read().decode())
    for i in data['DATA']:
        cdata = i
    # mob_no = cdata[6]
    # print(mob_no)
    mob_no = '9677945335'
    gotp = str(a)
    """
    url = "http://www.myvaluefirst.com/smpp/sendsms?username=abindia1&password=abindia1&to=91" + mob_no + "&text=" + gotp + "%20is%20your%20verification%20OTP%20for%20sign%20up,%20This%20OTP%20will%20be%20valid%20for%20next%2030%20mins&from=ZEBUTR"
    urllib.request.urlopen(url)

    email = cdata[7]
    mail_content = '''%s is your verification OTP for sign up, This OTP will be valid for next 30 mins''' % gotp
    # The mail addresses and password

    sender_address = 'communiques1@zebuetrade.com'
    sender_pass = '6fhA6EQoNOrqE9qxQeUztQ'
    receiver_address = email
    # Setup the MIME
    message = MIMEMultipart()
    message['From'] = sender_address
    message['To'] = receiver_address
    message['Subject'] = 'Zebu Pledge OTP.'  # The subject line
    # The body and the attachments for the mail
    message.attach(MIMEText(mail_content, 'plain'))
    # Create SMTP session for sending the mail
    sess = smtplib.SMTP('smtp.mandrillapp.com', 587)  # use gmail with port
    sess.starttls()  # enable security
    sess.login(sender_address, sender_pass)  # login with mail_id and password
    text = message.as_string()
    sess.sendmail(sender_address, receiver_address, text)
    sess.quit()
    print('Mail Sent')
    """



@app.route('/', methods=['POST', 'GET'])
def index():
    session["login_check"] = 'None'
    return render_template('index.html')

@app.route('/removecookie', methods=['POST', 'GET'])
def removecookie():
    resp = make_response(redirect(url_for("login")))
    resp.set_cookie('userID', '', expires=0)
    return resp

@app.route('/logout', methods=['POST', 'GET'])
def logout():
    session["login_check"] = 'log_out'
    return redirect(url_for("ipo_index"))

@app.route('/login', methods=['POST', 'GET'])
def login():
    email = request.cookies.get('userID')
    login = session["login_check"]
    print("Login:", login)
    if login == 'log_in':
        name = session["otname"]
        code = email
    else:
        name = None
        code = None
    print(email)
    if email == None:
        pass
    else:
        check_uid(email)
        email = session["otname"]
    mycursor.execute("SELECT * FROM ipo")
    data = mycursor.fetchall()
    if data:
        df_data = pd.DataFrame(data)

        df_data_filter = df_data[(df_data[2] == 'IND') & (df_data[9] == '1')]
        BB = df_data_filter.loc[df_data_filter[3] == 'BB']
        DLST = df_data_filter.loc[df_data_filter[3] == 'DLST']
        TAKEOVER = df_data_filter.loc[df_data_filter[3] == 'TAKEOVER']
        ipo_up = BB.loc[BB[10] == 'open']
        ipo_close = BB.loc[BB[10] == 'closed']
        print(ipo_close)

        return render_template('ipo_index.html', BB=BB.values.tolist(), DLST=DLST.values.tolist(),
                               TAKEOVER=TAKEOVER.values.tolist(), ipo_up=len(ipo_up),
                               ipo_close=ipo_close.values.tolist(), clientcode=email, uid=None, login=login, name=name,
                               code=code,log='log')

@app.route('/forgotclientcode', methods=['POST', 'GET'])
def forgotclientcode():
    email = request.cookies.get('userID')
    login = session["login_check"]
    print("Login:", login)
    if login == 'log_in':
        name = session["otname"]
        code = email
    else:
        name = None
        code = None
    print(email)
    if email == None:
        pass
    else:
        check_uid(email)
        email = session["otname"]
    mycursor.execute("SELECT * FROM ipo")
    data = mycursor.fetchall()
    if data:
        df_data = pd.DataFrame(data)

        df_data_filter = df_data[(df_data[2] == 'IND') & (df_data[9] == '1')]
        BB = df_data_filter.loc[df_data_filter[3] == 'BB']
        DLST = df_data_filter.loc[df_data_filter[3] == 'DLST']
        TAKEOVER = df_data_filter.loc[df_data_filter[3] == 'TAKEOVER']
        ipo_up = BB.loc[BB[10] == 'open']
        ipo_close = BB.loc[BB[10] == 'closed']
        print(ipo_close)

        return render_template('ipo_index.html', BB=BB.values.tolist(), DLST=DLST.values.tolist(),
                               TAKEOVER=TAKEOVER.values.tolist(), ipo_up=len(ipo_up),
                               ipo_close=ipo_close.values.tolist(), clientcode=email, uid=None, login=login, name=name,
                               code=code, log=None,Forgotcc='Forgotcc')

@app.route('/forgot_clientcode_update', methods=['POST', 'GET'])
def forgot_clientcode_update():
    email = request.cookies.get('userID')
    login = session["login_check"]
    print("Login:", login)
    if login == 'log_in':
        name = session["otname"]
        code = email
    else:
        name = None
        code = None
    print(email)
    if email == None:
        pass
    else:
        check_uid(email)
        email = session["otname"]
    mycursor.execute("SELECT * FROM ipo")
    data = mycursor.fetchall()
    if data:
        df_data = pd.DataFrame(data)

        df_data_filter = df_data[(df_data[2] == 'IND') & (df_data[9] == '1')]
        BB = df_data_filter.loc[df_data_filter[3] == 'BB']
        DLST = df_data_filter.loc[df_data_filter[3] == 'DLST']
        TAKEOVER = df_data_filter.loc[df_data_filter[3] == 'TAKEOVER']
        ipo_up = BB.loc[BB[10] == 'open']
        ipo_close = BB.loc[BB[10] == 'closed']
        print(ipo_close)

        return render_template('ipo_index.html', BB=BB.values.tolist(), DLST=DLST.values.tolist(),
                               TAKEOVER=TAKEOVER.values.tolist(), ipo_up=len(ipo_up),
                               ipo_close=ipo_close.values.tolist(), clientcode=email, uid=None, login=login, name=name,
                               code=code, log=None,Forgotcc=None,forgotup='forgotup')

@app.route('/otp', methods=['POST', 'GET'])
def otp():
    if request.method == 'POST' or request.method == 'GET':
        # Getting Request From User
        e = request.cookies.get('userID')
        if e == None:
            uid = request.form["uid"].upper()
        else:
            uid = e
        session["cid"] = uid
        # Checking Function of Userid
        checkid = check_uid(uid)
        # If User id is Correct below function will run
        if checkid == True:
            hotp = pyotp.HOTP('base32secret3232', digits=4)
            # Lgtm is the first login time which record as cookie in user's system
            lgtm = datetime.datetime.now()
            session["slgtm"] = lgtm
            # Getting the last counter Value from DB
            mycursor.execute("SELECT counter FROM logger ORDER BY counter DESC LIMIT 1")
            myresult = mycursor.fetchall()
            if myresult:
                counter = myresult[0][0] + 1
            else:
                counter = 1
            hotp = hotp.at(counter)
            sendotp(hotp)
            print(hotp)
            mycursor.execute("""INSERT INTO logger (dtime,cid,counter)
                                VALUES ('%s','%s',%s)""" % (lgtm, uid, counter))
            mydb.commit()

            mycursor.execute("SELECT * FROM ipo")
            data = mycursor.fetchall()
            df_data = pd.DataFrame(data)

            df_data_filter = df_data[(df_data[2] == 'IND') & (df_data[9] == '1')]
            BB = df_data_filter.loc[df_data_filter[3] == 'BB']
            DLST = df_data_filter.loc[df_data_filter[3] == 'DLST']
            TAKEOVER = df_data_filter.loc[df_data_filter[3] == 'TAKEOVER']
            ipo_up = BB.loc[BB[10] == 'open']
            ipo_close = BB.loc[BB[10] == 'closed']
            return render_template('ipo_index.html',BB=BB.values.tolist(), DLST=DLST.values.tolist(),TAKEOVER=TAKEOVER.values.tolist(), ipo_up=len(ipo_up),ipo_close=ipo_close.values.tolist(),uid=session["otname"],clientcode=uid,name=session["otname"])
        # If User id is not correct the below function will run
        else:
            flash("Client Id not Found!")
            return redirect(url_for("index"))

@app.route('/resendotp', methods=['POST', 'GET'])
def resendotp():
    if request.method == 'POST' or request.method == 'GET':
            uid =session["cid"]
            hotp = pyotp.HOTP('base32secret3232', digits=4)
            # Lgtm is the first login time which record as cookie in user's system
            lgtm = datetime.datetime.now()
            session["slgtm"] = lgtm
            # Getting the last counter Value from DB
            mycursor.execute("SELECT counter FROM logger ORDER BY counter DESC LIMIT 1")
            myresult = mycursor.fetchall()
            if myresult:
                counter = myresult[0][0] + 1
            else:
                counter = 1
            hotp = hotp.at(counter)
            sendotp(hotp)
            print(hotp)
            mycursor.execute("""INSERT INTO logger (dtime,cid,counter)
                                VALUES ('%s','%s',%s)""" % (lgtm, uid, counter))
            mydb.commit()
            mycursor.execute("SELECT * FROM ipo")
            data = mycursor.fetchall()
            df_data = pd.DataFrame(data)

            df_data_filter = df_data[(df_data[2] == 'IND') & (df_data[9] == '1')]
            BB = df_data_filter.loc[df_data_filter[3] == 'BB']
            DLST = df_data_filter.loc[df_data_filter[3] == 'DLST']
            TAKEOVER = df_data_filter.loc[df_data_filter[3] == 'TAKEOVER']
            ipo_up = BB.loc[BB[10] == 'open']
            ipo_close = BB.loc[BB[10] == 'closed']
            return render_template('ipo_index.html',BB=BB.values.tolist(), DLST=DLST.values.tolist(),TAKEOVER=TAKEOVER.values.tolist(), ipo_up=len(ipo_up),ipo_close=ipo_close.values.tolist(),uid=session["otname"],clientcode=uid,name=session["otname"])

@app.route('/wrong_otp', methods=['POST', 'GET'])
def wrong_otp():
    if request.method == 'POST' or request.method == 'GET':
            uid =session["cid"]

            # Lgtm is the first login time which record as cookie in user's system
            lgtm = datetime.datetime.now()
            session["slgtm"] = lgtm

            mycursor.execute("SELECT * FROM ipo")
            data = mycursor.fetchall()
            df_data = pd.DataFrame(data)

            df_data_filter = df_data[(df_data[2] == 'IND') & (df_data[9] == '1')]
            BB = df_data_filter.loc[df_data_filter[3] == 'BB']
            DLST = df_data_filter.loc[df_data_filter[3] == 'DLST']
            TAKEOVER = df_data_filter.loc[df_data_filter[3] == 'TAKEOVER']
            ipo_up = BB.loc[BB[10] == 'open']
            ipo_close = BB.loc[BB[10] == 'closed']
            return render_template('ipo_index.html',BB=BB.values.tolist(), DLST=DLST.values.tolist(),TAKEOVER=TAKEOVER.values.tolist(), ipo_up=len(ipo_up),ipo_close=ipo_close.values.tolist(),uid=session["otname"],clientcode=uid,name=session["otname"])

@app.route('/auth', methods=['POST', 'GET'])
def auth():
    if request.method == "POST" :
        # Var of this Function
        cid = session["cid"]
        u_otp1 = request.form["codeBox1"]
        u_otp2 = request.form["codeBox2"]
        u_otp3 = request.form["codeBox3"]
        u_otp4 = request.form["codeBox4"]
        u_otp= u_otp1 + u_otp2 + u_otp3+ u_otp4
        print("Entered OTP:",u_otp)
        hotp = pyotp.HOTP('base32secret3232', digits=4)
        # Fetching the user's counter Value from DB
        mycursor.execute("SELECT counter FROM logger WHERE cid='" + cid + "' ORDER BY counter DESC LIMIT 1 ;")
        cotp = mycursor.fetchall()
        # Check OTP Function
        hcheck_otp = hotp.at(cotp[0][0])
        if hcheck_otp == u_otp:
            time.sleep(2)
            #return render_template('index.html',cname=session["otname"],cid=cid,cmail=cmai,mob=mobil, address=session["address"],dematid=session["dematid"],dpid=session["dpid"],dpname=session["dpname"],pan=x)
            resp = make_response(redirect(url_for("ipo_index")))
            resp.set_cookie('userID', cid)
            session["login_check"] ='log_in'
            return resp
        else:
            result = "OTP is Wrong"
            print(result)
            flash("OTP is Wrong! Enter Valid OTP")
            return redirect(url_for("wrong_otp"))

@app.route('/ipo_index', methods=['POST', 'GET'])
def ipo_index():
    email = request.cookies.get('userID')
    login = session["login_check"]
    print("Login:",login)
    if login == 'log_in':
        name=session["otname"]
        code=email
    else:
        name= None
        code= None
    print(email)
    if email == None:
        pass
    else:
        check_uid(email)
        email = session["otname"]
    mycursor.execute("SELECT * FROM ipo")
    data = mycursor.fetchall()
    if data:

        df_data = pd.DataFrame(data)
        df_data_filter = df_data[(df_data[2] == 'IND') & (df_data[9] == '1')]
        BB = df_data_filter.loc[df_data_filter[3] == 'BB']
        DLST = df_data_filter.loc[df_data_filter[3] == 'DLST']
        TAKEOVER = df_data_filter.loc[df_data_filter[3] == 'TAKEOVER']
        ipo_up = BB.loc[BB[10] == 'open']
        ipo_close = BB.loc[BB[10] == 'closed']
        print(ipo_close)

        return render_template('ipo_index.html', BB=BB.values.tolist(), DLST=DLST.values.tolist(),TAKEOVER=TAKEOVER.values.tolist(), ipo_up=len(ipo_up),ipo_close=ipo_close.values.tolist(),clientcode=email,uid=None,login=login,name=name,code=code,log=None,forgotup=None,order=None,BBC=None)
    else:

        return render_template('ipo_index.html', BB=None, DLST=None, TAKEOVER=None, ipo_up=None, ipo_close=None,clientcode=email,uid=None)


@app.route('/scripts', methods=['POST', 'GET'])
def scripts():
    name = request.args.get('name')
    mycursor.execute("SELECT * FROM ipo where symbol='" + name + "'")
    data = mycursor.fetchall()
    print(data)
    return render_template('script_desc.html', data=data)

@app.route('/order', methods=['POST', 'GET'])
def order():

    script = request.args.get('invest_script')
    print(script)

    dt = datetime.datetime.now()
    d1 = datetime.datetime(2020, 5, 13, 10, 00, 00)
    d2 = datetime.datetime(2020, 5, 13, 17, 00, 00)

    x = dt.replace(microsecond=0)

    if (x.time() < d1.time()) or (x.time() > d2.time()):
        alow = "restrict"
    else:
        alow = "pass"
    print(alow)

    email = request.cookies.get('userID')
    login = session["login_check"]
    print("Login:",login)
    if login == 'log_in':
        name=session["otname"]
        code=email
        log=None
        order='order'
    else:
        name= None
        code= None
        log='login'
        order= None
    print(email)
    if email == None:
        pass
    else:
        check_uid(email)
        email = session["otname"]
    mycursor.execute("SELECT * FROM ipo")
    data = mycursor.fetchall()
    if data:
        print("hello")
        df_data = pd.DataFrame(data)
        df_data_filter = df_data[(df_data[2] == 'IND') & (df_data[9] == '1')]
        BB = df_data_filter.loc[df_data_filter[3] == 'BB']
        DLST = df_data_filter.loc[df_data_filter[3] == 'DLST']
        TAKEOVER = df_data_filter.loc[df_data_filter[3] == 'TAKEOVER']
        ipo_up = BB.loc[BB[10] == 'open']
        ipo_close = BB.loc[BB[10] == 'closed']
        BBC=BB.loc[BB[0] == script]
        print(BB)
    return render_template('ipo_index.html', BB=BB.values.tolist(), DLST=DLST.values.tolist(),
                           TAKEOVER=TAKEOVER.values.tolist(), ipo_up=len(ipo_up), ipo_close=ipo_close.values.tolist(),
                           clientcode=email, uid=None, login=login, name=name, code=code, log=log, forgotup=None,order=order,BBC=BBC.values.tolist(),alow=alow)


@app.route('/admin_login/', methods=['GET', 'POST'])
def admin_login():
    return render_template('ad_login.html')


@app.route('/ad_auth/', methods=['GET', 'POST'])
def ad_auth():
    if request.method == "POST":
        name = request.form["name"].upper()
        pasw = request.form["pass"].upper()
        print(name, pasw)
        if name == 'ZIPOAD' and pasw == 'ZIPO@2021':
            return redirect(url_for("admin_index"))
        else:
            return redirect(url_for("admin_login"))


@app.route('/admin_index/', methods=['GET', 'POST'])
def admin_index():
    mycursor.execute("SELECT * FROM ipo")
    data = mycursor.fetchall()
    df_data = pd.DataFrame(data)
    df_data_filter = df_data[(df_data[2] == 'IND') & (df_data[9] == '1')]
    BB = df_data_filter.loc[df_data_filter[3] == 'BB']
    return render_template('admin_index.html', df=df_data_filter.values.tolist())


@app.route('/admin_edit_scripts', methods=['POST', 'GET'])
def admin_edit_scripts():
    name = request.args.get('name')
    session["script_e"] = name
    print(name)

    mycursor.execute("SELECT * FROM ipo where symbol='" + name + "'")
    data = mycursor.fetchall()

    return render_template('admin_scrip_edit.html', symbol=name, data=data)


@app.route('/admin_update_scripts', methods=['POST', 'GET'])
def admin_update_scripts():
    if request.method == 'POST':
        # check if the post request has the file part
        # f = request.files['file']
        name = session["script_e"]
        print(name)
        descr = request.form['descr']
        rhpdoc = request.form['rhpdoc']
        # if f:
        #    print("Vanakam fa file")
        if descr:
            mycursor.execute("""UPDATE ipo SET descr='%s' WHERE symbol = '%s';""" % (descr,name))
            mydb.commit()
        if rhpdoc:
            mycursor.execute("""UPDATE ipo SET rhpdoc='%s' WHERE symbol = '%s';""" % (rhpdoc,name))
            mydb.commit()
        return redirect(url_for("admin_index"))




