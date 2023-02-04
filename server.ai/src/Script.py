from bs4 import BeautifulSoup
import requests
import pandas as pd
import re
import csv


baseUrl = "https://covid19.who.int/data/"
filePath = "WHO-COVID-19-global-table-data.csv"

baseUrl_response = requests.get(baseUrl)
dataHtml = baseUrl_response.content

datasoup = BeautifulSoup(dataHtml, "lxml")

dataset = datasoup.find('a', href=re.compile(baseUrl + filePath))


def globalCases():
    document_file = open(dataset, 'r')
    globalCases = open("../data/globalCases.csv", "w+")


guideUrl = "https://www.mohfw.gov.in/"

guide_response = requests.get(guideUrl)
guideHtml = guide_response.content

soup = BeautifulSoup(guideHtml, "lxml")

section = soup.find_all('div', {'class': 'update-box'})
dates = []
guidelines = []

header_texts = [element.text for element in section]
pattern = "\d{2}[.]\d{2}[.]\d{4}"


def guidelines():
    for section_index in range(len(section)):
        url = [a['href']
               for a in section[section_index].find_all('a', href=True)][0]
        guidelines.append(url)
        date = re.findall(pattern, header_texts[section_index])
        dates.append(date[0])
        df = pd.DataFrame(list(zip(dates, guidelines)))
        df.to_csv('dates_guidelines.csv', index=False)
