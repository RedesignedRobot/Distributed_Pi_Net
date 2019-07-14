from flask import Flask
from flask import request

import time
import os
import decimal
import platform
import getpass
import socket
import getmac

app = Flask(__name__)
app.config['ENV'] = 'development'
app.config['DEBUG'] = True

execution_time = 0


def compute_pi(n):
    decimal.getcontext().prec = n + 1
    C = 426880 * decimal.Decimal(10005).sqrt()
    K = 6.
    M = 1.
    X = 1
    L = 13591409
    S = L
    for i in range(1, n):
        M = M * (K ** 3 - 16 * K) / ((i + 1) ** 3)
        L += 545140134
        X *= -262537412640768000
        S += decimal.Decimal(M * L) / X
    pi = C / S
    return pi


def build_report():
    red = '<font size="4" color="red">'
    blue = '<font size="3" color="blue">'
    text_end = '</font>'
    bold_start = '<strong>'
    bold_end = '</strong>'
    title = red + '>>>>>>>>>>>>>>>> REPORT <<<<<<<<<<<<<<<<' + text_end
    newline = '<br>'
    os_name = blue + 'OS Name :: ' + text_end + bold_start + os.name + bold_end
    platform_name = blue + 'Platform Name :: ' + text_end + bold_start + platform.system() + bold_end
    user_name = blue + 'User :: ' + text_end + bold_start + getpass.getuser() + bold_end
    host_name = blue + 'Hostname :: ' + text_end + bold_start + socket.gethostname() + bold_end
    mac_addr = blue + 'MAC Address :: ' + text_end + bold_start + getmac.get_mac_address() + bold_end
    exec_time = blue + 'Execution Time(sec) :: ' + text_end + bold_start + "{0:.2f}".format(execution_time) + bold_end
    final_string = newline \
                   + title \
                   + newline \
                   + os_name \
                   + newline \
                   + platform_name \
                   + newline \
                   + user_name \
                   + newline \
                   + host_name \
                   + newline \
                   + mac_addr \
                   + newline \
                   + exec_time

    return final_string


@app.route('/pi')
def process():
    global execution_time
    start = time.time();
    header = '<!DOCTYPE html><html><head><title>Calculate PI</title></head><body><h1>Numeric value of Pi up to Nth ' \
             'place</h1> '
    trailer = '</body></html>'
    digit_count = request.args.get('len', default = 100, type = int)
    pi_digits = compute_pi(int(digit_count))
    pi_long_string = str(pi_digits)
    pi_string = ''
    i = 0

    for d in pi_long_string:
        pi_string += str(d)
        i += 1
        if i == 50:
            pi_string += '<br>'
            i = 0

    end = time.time()
    execution_time = end - start
    final_string = header + pi_string + build_report() + trailer
    return str(final_string)


if __name__ == "__main__":
    app.run(host = "0.0.0.0")
