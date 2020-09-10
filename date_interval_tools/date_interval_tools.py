#!/usr/bin/env python

import numpy as np
import pandas as pd

def date_from_filename(filename):
    return filename[20:22] + "/" + filename[22:25] + "/" + filename[25:29]

def change_date_format(date, format="GECI"):
    if format == "GECI":
        date = date.replace("Jan", "Ene").replace("Feb", "Feb").replace("Mar", "Mar").replace("Apr", "Abr").replace("May", "May").replace("Jun", "Jun").replace("Jul", "Jul").replace("Aug", "Ago").replace("Sep", "Sep").replace("Oct", "Oct").replace("Nov", "Nov").replace("Dec", "Dic")
    elif format == "EN":
        date = date.replace("ENE", "Jan").replace("FEB", "Feb").replace("MAR", "Mar").replace("ABR", "Apr").replace("MAY", "May").replace("JUN", "Jun").replace("JUL", "Jul").replace("AGO", "Aug").replace("SEP", "Sep").replace("OCT", "Oct").replace("NOV", "Nov").replace("DIC", "Dec")
    return date

def expected_date_interval(date_in_filename):
    date_in_dataframe = pd.DataFrame({"Fecha": [date_in_filename]})
    data_fechas = pd.to_datetime(date_in_dataframe["Fecha"], format='%d/%b/%Y')
    fecha_inicial = data_fechas - pd.Timedelta('6 days')
    lista_de_fechas = np.linspace(fecha_inicial[0].value, data_fechas[0].value, 7)
    return np.array(pd.to_datetime(lista_de_fechas).strftime('%d/%b/%Y'))

def obtained_date_interval(file_path,filename):
    columnas = [4,5,6,7,8,9,10]
    return np.loadtxt(file_path+"/"+filename+".csv",usecols=columnas,delimiter=',',dtype=str,max_rows=1)

def change_date_array_format(date_array, format="GECI"):
    for i in range(len(date_array)):
        date_array[i] = change_date_format(date_array[i], format=format)
    return date_array

def check_date_interval(file_path,filename):
    date_in_filename = date_from_filename(filename)
    date_in_filename = change_date_format(date_in_filename, format="EN")
    expected_dates = expected_date_interval(date_in_filename)
    expected_dates = change_date_array_format(expected_dates,format="GECI")
    obtained_dates = obtained_date_interval(file_path,filename)
    if (expected_dates == obtained_dates).all():
        print("Las fechas son correctas")
    else:
        print(f"Verificar fechas en {filename}")
        raise ValueError("El intervalo de fechas es incorrecto")
